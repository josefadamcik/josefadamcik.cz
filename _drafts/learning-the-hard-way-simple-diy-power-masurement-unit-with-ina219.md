---
layout: post
title: Learning the hard way - simple DIY power measurement unit with INA219 and ATtiny85
categories: electronics
published: false
image: 
---

A story how I was reminded that impatience and impetuosity can backfire when dealing with hardware.

<!--more-->

When I play with electronics and those home made gizmos with no purpose projects tend to appear from each other. TODO: better formulation.

For example when I was working on the LED CUBE (TODO: link) I decided to use Attiny45 to drive it. So I had to build a simple arduino shield to help with programming. TODO: image.

When I was building a 8-bit comupeter (following the disign of Martin Maly) - TODO links. I needed to promgram EEPROM. I did it few times using bredboard and jumper wires but than I decided to build an EEPROM programmer shield.

### Idea and motivation - Room monitor

One of my ongoing prejects is a simple device which combines a few sensors (temperature, light, humidity) and an ESP8266 microcontroller (whith wifi capability) in order to measure indoor conditions and sent them to some internet dashboard. It's kind of preparation for some outdoor meteo-station. It is battery powered (li-on) and part of the project is trying to make it last as long as possible without recharging. 

The microcontroller has several sleepmodes and other functions that are supposed to help with energy consumption. But there many possible combinations and some quirks so a lof of testing is required. But how to test this? How to compare different setups and solutions in order to choose the best one? Well, you cannot just compare momentary current consumption since it changes a lot when the device activates after spleep, when it communicates via WIFI and so on. 

I do not have any tools that would help me with it. But a simple device which would be able to measure voltage and current in regular intervals and store the result would do the job, wouldn't it?

### Building blocks

I found this neat breakouts with INA219. INA219 is an IC which supports such measurement and can communicate via I2C bus. Tne breakout also contains other componnents you need in order to make the IC work. Great!

Now I need just to connect some microcontroller and maybe displayd and a few buttons and write some firmware. And a neat little side project was born.

### Prototyping

I protopyted the solution quickly with arduione, started working on the firmware. 




TODO:

- [X] image _@done (2019-02-05 09:01)_
- [X] short video _@done (2019-02-05 09:01)_
- [ ] purpose, parts
- [X] schematic _@done (2019-02-05 09:01)_
- [ ] troubles
    - [ ] havent finished firmware and started soldering
    - [ ] havent tested on attiny and started soldering
    - [ ] pin interrupts
    - [ ] i2c
    - [ ] 
- [ ] firmware
- [ ] bom
- [ ] 

LINKS:

[ina datasheet]:http://www.ti.com/lit/ds/symlink/ina219.pdf INA219 datasheet
[breakout]:https://www.adafruit.com/product/904 INA219 breakout
[source]:https://github.com/josefadamcik/INA219PowerMeasurementUnit Source code
[easyeda]:https://easyeda.com/josefadamcik/ina219measurementunit EeasyEDA project