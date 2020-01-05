---
layout: post
title: "ESP8266 based room-contidions monitor, part&nbsp;2: PCB"
categories: electronics
tags: [buildlog, electronics]
published: false
series: "Room Monitor"
image: images/roommonitor/IMG_20191006_103723.jpg
---

In [the previous post in this series][roommonitor1] I wrote about several prototyping steps for this project. In this article I am going to describe the final version.

{% responsive_image path: images/roommonitor/IMG_20191006_103723.jpg alt:"RoomMotnitor"%}

<!--more-->

{%- include post_series.html -%}

## Idea for the final form

I wanted to move from prototypes to something nicer and more final. But I still wanted to utilise those small sensor breakouts and the charging module. I already owned them (and the sensors are very small and would be difficult to solder).

Free-forming and building something similar to [the client device][roommonitorclient] would be also an option and I might still do it in the future. But I also wanted to have the ability to build more copies of the device. Since [I recently begun to learn how to make PCBs][squidarticle], I thought this might be another opportunity to gather some experience. But I didn't like the idea of having just one plain and boring PCB. So I tried to come up with something a little bit more interestig. The final design has 3 small boards soldered together to create a shell around a battery holder. 

The circuit is basically the same as for the last prototype, only the components are going to be distributed across the three PCB panels. 

The bottom panel acts as a base and contains the TP4056-based charging breakout and a switch. 

The middle panel creates a wall and contains battery holder, and power connection to the top panel.

The top panel contains ESP8266 with supporting components, power source, programming header, buttons and also headers for sensors.

## Schematic

You can find [schematic for all three panels in KiCad projects on Github][githubkicad] (there are 3 KiCad projects). I have also combined all of them on the following image.

{% responsive_image path: images/roommonitor/full_schematic.png alt:"Schematic for all 3 parts"  figcaption:"Schematic for all 3 parts"%}

The first block (top left) is the power source with [LT1763 LDO][lt1763datasheet] almost exactly as in the datasheet. Resistors `R3` and `R4` form a voltage divider for ADC in ESP8266 so that a voltage on the battery can be maesured.

On the top right, the connection for the charging breakout is depicted. I decided to put the on-off switch between the module and the rest of the cirquit. This allows me to turn the main circuit off during charging. But it also means that the TP4056 charging module is connected to the battery all the time.

The middle part shows connection for ESP8266. This is heavily inspired by [a schematic in the documentation for Arduion core for ESP8266][esp8266serial]. Let me go through the important bits:

- `GPIO15` is pulled down all the time, `EN` is pulled up.
- `RST` is pulled up by `R6`, it is also connected to a RST pin on the FTDI header. `SW1` allows me to restart the ESP8266 manually. And finally, the jumper `J2` can be used to connect `RST` to `GIPIO16` which is required for deep sleep to work.
- `GPIO0` allows to choose between boot modes (`UART` for programming and `FLASH` for normal operation). Normally it is pulled high (`FLASH`). The button `SW2` can be used to activate the programming mode (hold `SW2` and press `SW1`). It's also connected to `DTR` pin on the FTDI header.
- Serial: `RXD`, `TXD` goes directly to the FTDI header.
- I2C: `SDA`, `SDL` connect ESP8266 to sensors.
- `ADC` is connected to the voltage divider mentioned above.
- There are some capacitors to improve stability.

## Designing the PCB

I started by creating the basic shape - a rectangle with rounded corners - in Inkscape. I created 3 copies and added notches which should allow me to fasten the panels together.

{% responsive_image path: images/roommonitor/shapes.png alt:"Panel shapes next to each other."  figcaption:"Panel shapes next to each other."%}

I didn't know how to ensure they would fit each other as I wanted. I was afraid they might be either too lose or too tight. I also realized manufacturing tolerances would play a role. In the end, I decided I should start with the simplest solution and not overthink it. 

I split the shapes into separate files and extracted them to DXF so they can be improted in the KiCad. The basic steps are:

- Flatten the curves (`Extensions` -> `Modify path` -> `Flatten Beziers`)
- Save as DXF file 
- In KiCad, choose `Import Graphics` and select the DXF file. Make sure the Edge.Cuts layer is selected as "Graphics layer"

Or you could use [the SVG2Shenzen Inkscape plugin][svg2shenzen].

## PCB 

As I mentinoed above, there are 3 PCBs, threfore [3 KiCad projects][githubkicad]. Every project has its own schematic. I am not going to dive into the detials, since everything should be quite straight forward, if you are familir with kicad. If not, there are plenty of tutorials online to learn it.

{% responsive_image path: images/roommonitor/pcbtop2.png alt:"Top (main) PCB in KiCad"  figcaption:"Top (main) PCB in KiCad"%}

The wide pads on all the boards are where the connections between individual boards are going to be made. The plan is to use plenty of solder to connect every two boards together and create electrical and structural connection. Of course, the regular solder is used so the mechanical connection is not going to be perfect.

{% responsive_image path: images/roommonitor/pcbmid2.png alt:"Middle PCB with battery holder. It acts as a wall."  figcaption:"Middle PCB with battery holder. It acts as a wall supporting the top part."%}

The holes in the corners of the bottom PCB are for legs made from brass stand-offs.

{% responsive_image path: images/roommonitor/pcbbottom2.png alt:"Bottom PCB with contains a charging module and a switch. The holes in the corners are for legs made from brass stand-offs."  figcaption:"Bottom PCB with contains a charging module and a switch. "%}

In order to make sure I put everythin on the correct side and didn't use wrong footprints, I printed all the boards and created a cardboard prototype.

{% responsive_image path: images/roommonitor/IMG_20190908_155302.jpg alt:"Rough cardboard prototype."  figcaption:"Rough cardboard prototype."%}

After triple checking everything I finally ordered prototypes. It would be possible to join all three boards into one design using mouse-bites but since the prices for prototypes up to 100 x 100 mm are crazy low, I have just ordered PCBs as 3 designs. It took 2 or three weeks and they arrived.

{% responsive_image path: images/roommonitor/IMG_20191003_120528.jpg alt:"Shiny new PCBs."  figcaption:"Shiny new PCBs."%}

## Construction

I am not going to list a detailed bill of materials here. All can be extracted from the KiCad project. 

In general the following is needed:

- [SHT21 breakout][SHT21] and [BH1750 breakout][BH1750]
- ESP-12F module
- [TP4056 charging and protection module for 18650][tp4056module] Make sure you buy the one with the protection chip, there are also models which have only the charging part and not the protection. You should never connect a Li-On cell without protection circuit.
- bunch of 1206 resistors (see the schematic for values)
- a few 1206 capacitors (see the schematic for values)
- 2 THT electrolytic capacitors (10uF)
- few pin headers (female) or you could solder the sensor boards directly to the board
- a [switch][switchali] and 2 [buttons][buttonali]
- cell holder for 18650
- a Li-On cell (18650)

{% responsive_image path: images/roommonitor/IMG_20191005_111300.jpg alt:"The top part with most of the parts soldered on."  figcaption:"The top part with most of the parts soldered on."%}

{% responsive_image path: images/roommonitor/IMG_20191124_101825.jpg alt:"Test run and programming."  figcaption:"Test run and programming."%}

{% responsive_image path: images/roommonitor/IMG_20191005_180911.jpg alt:"Ready for final assembly."  figcaption:"Ready for final assembly."%}

{% responsive_image path: images/roommonitor/IMG_20191124_144139.jpg alt:"Soldering two parts together. Used big fat soldering tip and a lot of solder. Took some time to make good enough joint." figcaption:"Soldering two parts together. Used big fat soldering tip and a lot of solder. It took some time to make good enough joint, keep the right angle and having no ugly gap between boards."%}  

{% responsive_image path: images/roommonitor/IMG_20191005_182812.jpg alt:"And the last board added." figcaption:"And the last board added."%}

{% responsive_image path: images/roommonitor/IMG_20191006_103325.jpg alt:"And finally the cell holder and legs."  figcaption:"And finally the cell holder and legs."%}

{% responsive_image path: images/roommonitor/IMG_20191006_103430.jpg alt:"Another angle."  figcaption:"Another angle."%}

{% responsive_image path: images/roommonitor/IMG_20191006_103723.jpg alt:"Including the sensors."  figcaption:"Including the sensors."%}

## Firmware and infrastructure.

[The firmware][firmware] is basically the same as described [in the previous article][roommonitor1]. 

The device measures the values from sensors and sends them using MQTT to another device (a Raspberry Pi) in my home which propagates them to [io.adafruit.com](https://io.adafruit.com). The [client device][roommonitorclient] is on my desk and I recently updated its firmware so I can switch the information I want to display (currently it can display only temperature, but it is possible to switch between rooms).

## Future ideas

Right now I don't have any further plans for this project. But it is possible I might build a freeform variant in the future and there is always something to improve in the firmware.

<!-- Links  -->
[roommonitorclient]: {{ site.baseurl }}{% post_url 2019-05-20-freeform-esp8266-based-mqtt-oled-client %}
[roommonitor1]: {{ site.baseurl }}{% post_url 2019-11-02-esp8266-based-room-conditions-monitor-part-1 %}
[githubkicad]: <https://github.com/josefadamcik/RoomMonitorPcb> "KiCad project (Github)"
{:target="_blank"}
[firmware]: https://github.com/josefadamcik/RoomMonitor "RoomMonitor firmware on github"
{:target="_blank"}
[lt1763datasheet]: https://www.analog.com/media/en/technical-documentation/data-sheets/1763fh.pdf "LT1763 Datasheet"
{:target="_blank"}
[esp8266serial]: <https://arduino-esp8266.readthedocs.io/en/latest/boards.html#esp-to-serial> "ESP8266 to serial schematic"
[svg2shenzen]: https://github.com/badgeek/svg2shenzhen "SVG2Shenzen inkscape plugin"
{:target="_blank"}
[BH1750]: https://www.google.com/search?q=BH1750 "Google search for BH1750"
{:target="_blank"}
[SHT21]: https://www.google.com/search?q=sht21+breakout&ie=utf-8&oe=utf-8
{:target="_blank"}
[lt1763datasheet]: https://www.analog.com/media/en/technical-documentation/data-sheets/1763fh.pdf "LT1763 Datasheet"
{:target="_blank"}
[tp4056module]: <https://www.aliexpress.com/item/32728720869.html?spm=a2g0s.9042311.0.0.27424c4dB0colw> "TP4056 charging and protection module for 18650"
{:target="_blank"}
[switchali]: https://www.aliexpress.com/item/32928171024.html?spm=a2g0s.9042311.0.0.27424c4dPWVO1i "Switch (Aliexpress)"
{:target="_blank"}
[buttonali]: <https://www.aliexpress.com/item/32802382507.html?spm=a2g0s.9042311.0.0.27424c4dEmj3hq> "Button (Aliexpress)"
[squidarticle]: {{ site.baseurl }}{% post_url 2019-07-21-squid-badge-my-first-pcb-design %} "Squid PCB badge"

