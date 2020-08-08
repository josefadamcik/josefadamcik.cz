---
layout: post
title: "Self-balancing stories, EP 1: How to not start a project made from parts I already have"
categories: electronics
tags: [buildlog, electronics, robot, pid]
published: true
series: "Self-balancing-stories"
image: /images/selfbalancing/IMG_20200503_200754.jpg
---

It was early pandemic when my employer switched to full work-from-home mode and I realized I have a bit more free time since my commute times dropped to zero. Apart from keyboard stuff, I had no nice project in progress that wouldn't involve waiting for PCB manufacturing or parts. So, what could I build from things I have at home? What about those 2 cheap geared DC motors, those 2 wheels, some micro, IMU unit. Hmm. I see a 2-wheeled self-balancing robot here. I always wanted to build one and learn how they work. 

{% responsive_image path: images/selfbalancing/IMG_20200503_200754.jpg alt:"Self-balancing robot - version 1" class: "imgmw600" %}

<!--more-->

{%- include post_series.html -%}

## Gathering parts

Idea sounded great. I had all the electronics, but what about the body of the robot? I had no 3D printer, not even a nice workshop, no materials like plywood or acrylic sheets. So the only solution apart from cardboard seemed to be to use prototyping PCB perfboards and some standoffs I had I had. 

And that was when the idea started to fall apart. My stock of spacers M2 was quite weak. I had plenty of nylon M3 but those are too big for mounting holes in the perfboards. Also, I didn't have enough perfboards of the same size to make the whole robot. I tried to utilize some super cheap one-sided ones and and tried to drill holes for M3 spacers. I failed horribly destroying most of my materials. I also didn't have any bracket to fix the motors to perfboards. And the wheels - oh my god, they were just too tiny and motor shaft too big for them.

I tried at least to prototype the electronic. Let's use a LIon cell here, step-up voltage to 6V (that's what the motors are rated for). ESP32 on a devboard as a micro-controller, L298N h-bridge dual motor driver. Everything I had at my storage, just waiting to be used.

Well, the step up was terrible since it wasn't really possible to set a fixed output voltage. The regulating potentiometer needed to be adjusted when load was connected or changed. I ended up maxing it out in order to have desired 6V on the h-bridge during load. 

The L298N wasn't any win either. It has quite big voltage drop so my motors weren't getting their 6V, but rather something like 4.5V.

All this made me quite sad and disappointed at first. Until I gave up my "use just parts at home" idea and filled one virtual shopping basket with [couple][polo40mmwheel] of [robot wheels][polomultihubwheel], [brackets for attaching them to the frame][polobracket], [better step-up board (fixed voltage 6V)][poloregulator] , better [motor driver][poloregulator]. And yeah, let's also take a bunch of properly sized protoboards and I would also take this M2 spacer assortment, please. Everything ordered from Germany to minimize shipping times.

{% responsive_image path: images/selfbalancing/IMG_20200425_144846.jpg alt:"Parts! Most of them new and shiny." figcaption:"Parts! Most of them new and shiny."%}

## Version 1, construction

Now I could finally start constructing my robot!


{% responsive_image path: images/selfbalancing/construction.jpg alt:"Construction." %}

You can see overall it's quite simple. One board contains motors attached using brackets at the bottom and [DRV8833 dual h-bridge motor driver][poloplumotordriver]

The second level is dedicated to the controller board. I believe it's one of early versions of Wemos Lolin32 or a clone. I bought it on Aliexpress quite some time ago. It uses the [ESP32-WROOM-32D module][esp32datasheet] with Bluetooth an WiFi support and 4 MB of flash memory. I think it's possible is actually the first silicon version which was a bit buggy but shouldn't be that big deal for my purposes.

The third level contains the [6V step-up][poloregulator] and [MPU6050][mpu6050] breakout board. 

The top one has a holder for one LiOn cell. This one cell powers directly (through some protection circuit) the controller board (which has an on-board regulator) and the step-up regulator for motors - both are technically in parallel with the battery. Yes, that does sound like I am asking for power issues and the will come later, don't worry.

This is how the first version looked with the smaller couple of wheels (40 mm). I bought also 80 mm ones which I ended up using and you can see them on the title image.

{% responsive_image path: images/selfbalancing/IMG_20200426_195609.jpg alt:"First version" %}

You can see it's lying on its back, partly because no firmware was written at the time the picture was taken and partly... Well, let's leave that for later.

## Firmware

This was my first project with ESP32, so far I have only had an experience with ESP8266. I still decided to use Arduino Core for ESP32 even though I was tempted to use the [ESP-IDF SDK from Espressif directly][espidf] (AFAIK Arduino Core for ESP32 just wraps around it). I started writing firmware in VS Code + Platform IO. I cannot use the original Arduino editor since it is.. well, painful for me to use[^1].

In general, the minimal firmware has to:

1. be able to get data from IMU (Inertial measurement unit) and compute the lean angle of the robot,
2. control the motor (or more precisely the motor driver).
3. use that value to compute desired motor speed which would help to stabilise the robot,

But there is more it could do:

- WiFi support and OTA (over the air) updates of firmware
- Bluetooth support and some ability to control and debug the robot remotely 
- Use waffle iron and bake waffles.

### 1) IMU - MPU6050

I have used very common IMU breakout module with MPU6050 which is so called "six-axis" IMU which contains gyroscope and accelerometer. It uses I2C for communication. 

MPU6050 contains 3-axis gyroscope and 3-axis accelerometer. If you check [some articles][selfbalancinginstructable] explaining how to use it, they usually use a combination of values (using complementary filter) from both sensors in order to get nice and stable estimation of inclination of the robot.

But there's a better way, since MPU6050 contains DMP - Digital Motion Processor which can do such computation for you and provide already filtered values. Sadly it's not something that would be easy to use. My knowledge of details of limited but it seems like some undocumented feature and requires you to upload some kind of firmware to DMP.

Thankfully there's an amazing [I2C Device Library][i2cdevlib] which contains Arduino support many I2C devices including MPU6050 and DMP.

TODO: problems on ESP32, PR with fix.

### 2) Control the motor

In order to control a DC motor, or more precisely the H-Bridge motor driver, we need to apply PWM signal to one of 2 inputs for each motor. One of the inputs is for forward movement the second for reverse. When duty cycle of PWM is adjusted the power given to the motor changes proportionally.

Nice hidden Gem of ESP32 is that there's a [HW-level support for control of motors through PWM][mcmpw][^2] which helps you to generate and control the PWM signals for motors but has also support for failure detection and sensing.

Using MPCWM was quite trivial but I had to dive into the documentation for ESP-IDF. This is one of the things that made me thing I could consider getting rid of Arduino core and try to use it directly.

I am not going to explain details. You can check the [current implementation in my Github][firmware] (look for `motor.cpp`) and [documentation][mcmpw].

### 3) Drive the motor based on angle

Even though there are other options, the most common approach is to use PID (proportional–integral–derivative) controller. There's a lot one could learn  about PID controllers and about system control theory in general. As many hobbyists I chose the naive "let's try it like other and hope it works" approach. I might learn a bit more about the math behind it in the future.

As usually, I don't want dive into explanation of details about PID controllers. There are plenty of resource around the internet, for example in [this tutorial][selfbalancinginstructablepid].

Let me just say that it's a system which takes an error in some value as an input and spits another value for you. Error, in my case is the difference between the desired angle of inclination and the measured value. The output value is "speed" for the motor - the duty cycle for PWM signal in the simplest case. The PID controller has 3 parameters which correspond to the 3 letters (proportional, integral, derivative) and they are often called gains. 
Each of them controls how much one of aspects considered by PID controller affects the output.

- The proportional part just uses the error value and ignores time or history. - The integral part integrates error over time.
- The derivative part takes into account size of change in error from the last measurement in proportion to time (ehm, the derivative they call it in math, remember?)

Those 3 parameters have to be found experimentally. Of course, system control theory actually explores how to compute them. But let's be a proper tinkerer and just wing it.


[mcmpw]: <https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/mcpwm.html> "ESP32 MCPWM documentation"
{:target="_blank"}

[firmware]: <https://github.com/josefadamcik/ESP32SelfBalancingRobot> "Self-balancing robot firmware at Github"
{:target="_blank"}

[espidf]: <https://github.com/espressif/esp-idf> "ESP-IDF by Espressif"
{:target="_blank"}

[espidfdoc]: <https://docs.espressif.com/projects/esp-idf/en/stable/> "ESP-IDF documentation"
{:target="_blank"}

[i2cdevlib]: <http://www.i2cdevlib.com/> "I2C devlib website"

[i2cdevlibgithub]: <https://github.com/jrowberg/i2cdevlib> "I2C devlib Github"
{:target="_blank"}

[i2cdevlibmpu6050]: <https://github.com/jrowberg/i2cdevlib/tree/master/Arduino/MPU6050> "i2cdevlib's Arduino support MPU6050"
{:target="_blank"}

[mpu6050]: <https://invensense.tdk.com/products/motion-tracking/6-axis/mpu-6050/> "MPU6050"


[i2cdevlibpr]: <https://github.com/jrowberg/i2cdevlib/pull/530> "Pull request to allow compilation on ESP32"
{:target="_blank"}

[poloplumotordriver]: <https://www.pololu.com/product/2130> "DRV8833 dual h-bridge"
{:target="_blank"}

[poloregulator]: <https://www.pololu.com/product/2892> "6V Step-Up Voltage Regulator "
{:target="_blank"}

[polobracket]: <https://www.pololu.com/product/1089> "motor bracket"
{:target="_blank"}

[polo40mmwheel]: <https://www.pololu.com/product/1452> "40mm wheel"
{:target="_blank"}

[polomultihubwheel]: <https://www.pololu.com/product/3691> "80mm mult-ihub wheel"
{:target="_blank"}

[esp32datasheet]: <https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf> "ESP32-WROOM-32D datasheet"
{:target="_blank"}

[selfbalancinginstructable]: <https://www.instructables.com/id/Arduino-Self-Balancing-Robot-1/> "Arduino-Self-Balancing-Robot-1"
{:target="_blank"}

[selfbalancinginstructablepid]: <https://www.instructables.com/id/Arduino-Self-Balancing-Robot-1/#step6> "Arduino-Self-Balancing-Robot-1 PID"
{:target="_blank"}




[^1]: With all the respect to authors of Arduino IDE and its purpose, I am not able to work with editor so basic when I am used to work with professional IDEs.
[^2]: To be honest, I am not sure if it's an actual HW-level support. It might be just a clever abstraction in the ESP-IDF framework utilizing some 





