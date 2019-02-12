---
layout: post
title: Learning the hard way - simple DIY power measurement unit with INA219 and ATtiny85
categories: electronics
published: false
image: 
---

A story how I was reminded that impatience and impetuosity can backfire when dealing with hardware.

<!--more-->

When I play with electronics and those home made gizmos without purpose new ideas projects tend to popup everywhere. TODO: better formulation.

For example when I was working on the LED CUBE (TODO: link) I decided to use Attiny45 microcontroller to drive it. So I had to build a simple arduino shield to help with its programming. TODO: image.

When I was building a 8-bit comupeter (following the disign from Martin Maly) - TODO links. I needed to program EEPROM. I did it few times using bredboard and jumper wires but than I decided to build a simple EEPROM programmer shield for Adruino Mega.

### Idea and motivation - Room monitor

One of my ongoing prejects is a simple device which combines a few sensors (temperature, light, humidity) and an ESP8266 microcontroller (whith wifi capability) in order to measure indoor conditions and sent them to an internet dashboard. It's kind of preparation/trial for some outdoor meteo-station. It is battery powered (li-on) and part of the project is trying to make it run as long as long as possible without recharging. 

The microcontroller has several sleepmodes and other functions that are supposed to help with energy consumption. But there many possible combinations and some quirks so a lof of experimentation is required. But how to test this? How to compare different setups and solutions in order to choose the best one? Well, you cannot just compare momentary current consumption since it changes a lot when the device activates after sleep, when it communicates via WIFI etc.

I do not have any tools that would help me with it. But a simple device which would be able to measure voltage and current in regular intervals and store the result would do the job, wouldn't it?

### Building blocks

I found a neat breakout with INA219. INA219 is an IC which supports such measurement and can communicate via I2C bus. The breakout module also contains other componnents you need in order to make the IC work. Great!

Now I need just to connect some microcontroller and maybe display and a few buttons and write some firmware. And a neat little side project was born.

### Prototyping

I protopyted the solution quickly with Arduino, started working on the firmware. I must admint I went a bit crazy with the firmware. I overengineered things a lot, tried to capture all in classes and separate things properly. In then end I wrot a lot of code and got a bit bored before I finished the firmware. But the main functionality was complete. I just wanted a menu where I could change some settings in runtime. 

### Quick jump to the final hardware

I was impatient and started sketching the final cirquit which was supposed to be build using propotyping board. I decidid I would like to use Attiny85 for it. I need 2 pins for buttons and 2 for I2C and I had a good experience with Attiny84 which I used for my LCD cube (the only difference between those two is that Attiny84 has more pins).

Again, I was impatient. So I actually soldered the things together without building a prototype with Attiny85. And that was a mistake.

### Problem number 1) - program memory

Once I tried to upload my code to the Attiny85 I realized that my firmware is too big. Attiny85 has only 8 kilobytes of program memory and my firmware was maybe 200bytes bigger. What now? It took some experimentation but I have found out that if I omit String class from the Arduino SDK I can save 1kb. Great!

### Problem number 2) - interrupt pins

I have used 2 buttons to controll my propotype. Why two? Because Arduino UNO has 2 interrupt pins and therefore I could easily hook those buttons to them.

But oops, attiny85 has only one interrupt (TODO: or nono?). Fortunatelly there are also so called pin change interrups. Thery are not supported by Arduino SDK so you need to call the underlaying AVR sdk in order to use them. They are also a little bit harder to use since there is only one (todo: xyz) function for all pins you want to obserev for interrupts. 

But in the end i managed to make it work. Great!

### Problem number 3) - I2C

I2C is a serial bus. It's very simple, widely used and Arduino UNO has hardware support for it. Regarding the Arduino SKD the Wire library is the API for I2c. 

Well, guess what, Attiny85 does not support I2C natively. (TODO: specify) there is some more abstract support for seriall communicatin which can be utilised to implement I2C. 

There is some support in the Arduino core for Attiny85 but that didn't seem to work with my LCD. There were just random characters all over the place.

I tried to use other libraries, solder pull up resistors to I2C lines. Such resistors are required by I2C but you don't need to add them when you use Arduino UNO since they are already part of the microcontroller. But I have found that it's suggested to add them when you need to use I2c with Attiny85.

In the end I finally solved the problem by using the TinyWire library. I had to modify library for my LCD and INA219 so they actually used TinyWire instead of Wire.

Finally everything was working the same way as on the Arduino. Now it was time to finish the fimware.

### Problem number 4) - RAM

I continued work on the menu. As I added more strings Attiny85 started to do crazy things. Sometimes it just restarted. Semetimes it got into restart looop. Semtimes it kind of worked but LCD started again displaying random characters. 

This problem gave me the most trouble because I basically didn't have idea what's happening. I am honestly still not 100% sure if I undrestood the problem correctly.

During debugging I noticed that the probleam appers when I have more data in my array which contained strings (You know, C character arrays) fro my display. I was not using PERMGEN but my data size was still smaller than RAM and I could upload the firmware to the Attiny85. But the more data I added tho worse results I get.

In the end I found out that the behaviour I observed might be caused by TODO: proper name. TODO: explain.

So I did the extra work and moved as much data as I could into PERMGEN. That helped and I was able to finish my menu.


### Happy end 

Even though it was a bit frustrating in the end it was a great lesson for me. I should not be so impatient and I should be more carefull when working with hardwer. It' far more difficult to change things than when I do software develpoment.

TODO: pictures
TODO: schematic somewher.

TODO: images




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