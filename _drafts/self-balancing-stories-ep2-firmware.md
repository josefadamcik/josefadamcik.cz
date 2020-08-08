---
layout: post
title: "Self-balancing stories, EP 2: Developin first firmwar"
categories: electronics
tags: [buildlog, electronics, robot, pid]
published: false
series: "Self-balancing-stories"
image: /images/selfbalancing/IMG_20200503_200754.jpg
---

TODO

{% responsive_image path: images/selfbalancing/IMG_20200503_200754.jpg alt:"Self-balancing robot - version 1" class: "imgmw600" %}

<!--more-->

{%- include post_series.html -%}


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


[selfbalancingalex]: <http://axelsdiy.brinkeby.se/?page_id=1447> "Mini balancing robot on Axel's DIY"




[^1]: With all the respect to authors of Arduino IDE and its purpose, I am not able to work with editor so basic when I am used to work with professional IDEs.
[^2]: To be honest, I am not sure if it's an actual HW-level support. It might be just a clever abstraction in the ESP-IDF framework utilizing some 





