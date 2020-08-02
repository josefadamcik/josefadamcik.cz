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

Idea sounded great. I had all the electronics, but what about the body of the robot? I had no 3D printer, not even a nice workshop, no materials like plywood or acrylic sheets. So the only solution apart from cardboard seemed to be to use prototyping PCB perfboards and M2 brass rods I had. 

And here it started to fall apart. My stock of spacers M2 was quite weak. M3 was better but too big for mounting holes in perfboards. I didn't have enough perfboards of the same size to make the whole robot. I tried to utilize some super cheap one-sided ones and cut different sizes and also tried to drill holes for M3 spacers. I failed horribly destroying most of my materials. I also didn't have any bracket to fix the motors to perfboards. And the wheels - oh my god, they were just too tiny and motor shaft too big for them.

I tried at least to prototype the electronic. Let's use a LIon cell here, step-up voltage to 6V (that's what the motors are rated for). ESP32 on some devboard as a micro, L298N h-bridge dual motor driver. Everything I had at my stock, just waiting to be used.

Well, the step up is terrible since it wasn't really possible to set a fixed output voltage. The regulating potentiometer needed to be adjusted when load was connected or changed. I ended up maxing it out in order to have desired 6V on the h-bridge during load. The L298N wasn't any win either. It has quite big voltage drop so my motors weren't getting their 6V at all. 

All this made me quite sad and disappointed at first. Until I gave up my "use just parts at home" idea and filled one virtual shopping basket with couple of robot wheels, brackets for motors, better fixed voltage step-up board, better motor driver. And yeah, let's also take a bunch of properly sized protoboards and I would also take this spacer assortment, please. Everything ordered from Germany to minimize shipping times.

{% responsive_image path: images/selfbalancing/IMG_20200425_144846.jpg alt:"Parts! Most of them new and shiny." figcaption:"Parts! Most of them new and shiny."%}

## Version 1, construction

Now I could finally start constructing my robot!


{% responsive_image path: images/selfbalancing/construction.jpg alt:"Construction." %}

And this is how the first version looked with the smaller couple of wheels (I bought 2 kinds just to have more options.)

{% responsive_image path: images/selfbalancing/IMG_20200426_195609.jpg alt:"First version" %}

You can see it's lying on its back, partly because no firmware was written at the time of taking the picture and partly... Well, let's leave that for later.

## Firmware

This was my first project with ESP32, so far I have only had an experience with ESP8266. I still decided to use Arduino Core for ESP32 even though I was tempted to use the [ESP-IDF SDK from Espressif directly][espidf] (AFAIK Arduino Core for ESP32 just wraps around it). I started writing firmware in VS Code + Platform IO. I cannot use the original Arduino editor since it is.. well, painful for me to use[^1].

In general, the minimal firmware has to:

1) be able to get data from IMU (Inertial measurement) unit and compute the lean angle of the robot,
2) use that value to compute desired motor speed which would help to stabilise the robot,
3) control the motor (or more precisely the motor driver).


But there is more it could do:

- WiFi support and OTA (over the air) updates of firmware
- Bluetooth support and some ability to control and debug the robot remotely 
- Use waffle iron and bake waffles.

### 1) IMU - MPU6050

I have used very common IMU breakout module with MPU6050 which is so called "six-axis" IMU which contains gyroscope and accelerometer.

### 3) Control the motor

In order to control a DC motor, or more precisely the H-Bridge motor driver, we need to apply PWM signal to one of 2 inputs for each motor. One of the inputs is for forward movement the second for reverse. When duty cycle of PWM is adjusted the power give to the motor changes proportionally.

Nice hidden Gem of ESP32 is that there's a [HW-level support for control of motors through PWM][mcmpw][^2] which helps you to generate and control the PWM signals for motors but has also support for failure detection and sensing.

Using MPCWM was quite trivial.



[mcmpw]: <https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/mcpwm.html> "ESP32 MCPWM documentation"
{:target="_blank"}

[firmware]: <https://github.com/josefadamcik/ESP32SelfBalancingRobot> "Self-balancing robot firmware at Github"
{:target="_blank"}

[espidf]: <https://github.com/espressif/esp-idf> "ESP-IDF by Espressif"

[espidfdoc]: <https://docs.espressif.com/projects/esp-idf/en/stable/> "ESP-IDF documentation"

[i2cdevlib]: <https://github.com/jrowberg/i2cdevlib> "i2cdevlib"

[i2cdevlibmpu6050]: <https://github.com/jrowberg/i2cdevlib/tree/master/Arduino/MPU6050> "i2cdevlib's Arduino support MPU6050"

[i2cdevlibpr]: <https://github.com/jrowberg/i2cdevlib/pull/530> "Pull request to allow compilation on ESP32"

[poloplumotordriver]: <https://www.pololu.com/product/2130> "DRV8833 dual h-bridge"



[^1]: With all the respect to authors of Arduino IDE and its purpose, I am not able to work with editor so basic when I am used to work with professional IDEs.
[^2]: To be honest, I am not sure if it's an actual HW-level support. It might be just a clever abstraction in the ESP-IDF framework utilizing some 





