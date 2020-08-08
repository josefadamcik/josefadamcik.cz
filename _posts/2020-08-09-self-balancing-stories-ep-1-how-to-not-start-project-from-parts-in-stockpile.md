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

{% responsive_image path: images/selfbalancing/IMG_20200426_195609.jpg alt:"First version" class: "imgmw600" %}

You can see it's lying on its back, partly because no firmware was written at the time the picture was taken and partly... Well, let's leave that for later.

## Problems and another order

I did spend some time writing firmware since there's quite a lot to do there. But I'll leave the details for the next article. Once I had some basic version ready and started testing the robot I very quickly realized that my motors are too weak. Like crazy weak. So I had to buy new ones. 

The thing is it's not really easy to pick a motor for such robot. I wanted to stay with this size/format of the motor which is usually called "micro gear motor". 

But still, there are several questions:

- Which voltage? they are made in 3V, 5V, 6V but 12V versions. 
- Which Gear ratio?
- Which speed RPM would be the best?
- Which stall torque is enough? And what "stall torque" actually is?

As you may guess those things are connected. 

Higher voltage would usually mean more powerful motor. And more powerful means either higher speed and/or higher torque. Gear ratio allows you to exchange speed for torque. Apart from rated voltage the power of motor is also affected by it's construction - for example [Pololu offers][pololumotors] for every voltage rating several types: LP (low power), MP (medium power) and HP(high power). The more powerful a motor is the more current it's going to consume.
speed is going to be lower.

The motor needs enough torque to move robot's body into upright position so the amount of torque required is depends on the construction but also on the starting angle. Balancing in the position would require much less than getting the robot to stand up when it is lying on the ground. You could actually compute the torque needed if you knew parameters of the body that's going to be moved. 

The speed you see in the datasheet (or in the table above) is a speed the motor runs without any load. The more load it needs to carry (that's our torque, actually!) the slower it moves. Stall torque is the torque the motor reaches when its speed reaches zero. We could say it's the maximal torque the motor can handle. Each motor has also "stall current" which is the current consumed in the stall state and you need keep it in mind when picking your motor driver and setting up the power (step up, protection circuit and battery).

I did plenty of research but in the end I still picked motors mostly by guessing and I am still not sure if I made a good decision or not. In the end I chose a [6V HP variant, 150:1 Gear ratio][pololumymotor]. This one is rated for 210 RPM when not under load (consuming 70 mA) and stall torque 2.4 kg⋅cm (consuming 1.6 A in stall state).

Since I already knew that it might be handy to measure the real speed of the motor I chose version with extended motor shaft which would allow me to connect magnetic encoders and I also [ordered few of them][pololuencoders].

{% responsive_image path: images/selfbalancing/IMG_20200429_084520.jpg alt:"Motors and encoders"  figcaption:"Motors and encoders" %}

## Next steps

This started as an small project made from parts I had at home. But I quickly ended up buying quite a lot new components. Only the MPU6050 breakout, ESP32 controller board, battery and holder and of course, jumper wires and cables and similar are from my storage. I think I spent 80-90 Euro for the rest (all shipped from Germany). 

Thankfully, the motors seem to be powerful enough to balance the robot but I run into power issues. My ESP32 was restarting due to brownout quite often and it was impossible to actually balance the robot.

But let me take a break from the hardware side.In the next article I'll focus on firmware and after that I'll return back to HW.


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

[pololumotors]: <https://www.pololu.com/category/60/micro-metal-gearmotors> "Sortiment of micro-gear-motors from Pololu"
{:target="_blank"}

[pololumymotor]: <https://www.pololu.com/product/2386> "150:1 Micro Metal Gearmotor HP 6V with Extended Motor Shaft"
{:target="_blank"}

[pololuencoders]: <https://www.pololu.com/product/4760> "Magnetic encoders"
{:target="_blank"}

[esp32datasheet]: <https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf> "ESP32-WROOM-32D datasheet"
{:target="_blank"}

[selfbalancinginstructable]: <https://www.instructables.com/id/Arduino-Self-Balancing-Robot-1/> "Arduino-Self-Balancing-Robot-1"
{:target="_blank"}

[selfbalancinginstructablepid]: <https://www.instructables.com/id/Arduino-Self-Balancing-Robot-1/#step6> "Arduino-Self-Balancing-Robot-1 PID"
{:target="_blank"}

[selfbalancingalex]: <http://axelsdiy.brinkeby.se/?page_id=1447> "Mini balancing robot on Axel's DIY"
{:target="_blank"}


[^1]: With all the respect to authors of Arduino IDE and its purpose, I am not able to work with editor so basic when I am used to work with professional IDEs.
[^2]: To be honest, I am not sure if it's an actual HW-level support. It might be just a clever abstraction in the ESP-IDF framework utilizing some 





