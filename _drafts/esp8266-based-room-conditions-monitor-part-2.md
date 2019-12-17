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

## Idea

I wanted to move from rough protypes to something nicer and more final. But I still wanted to utilise those small PCB breakouts with sensors and charging module. I already owned them and also the sensors are very small and hard to solder. 

Freeforming would be one option. It would be possible to build something similar to [the client devices][roommonitorclient] and I might do it in the future. But I also wanted to have the ability to build more of those easily. Thefore I chose PCB. But I didn't like the idea of having just one plain and boring PCB. So I came up with idea to have 3 small boards soldered together to create a shell around a battery holder. 

The cirquit is bascially the same as for the last prototype, only the components are going to be distributed across three PCB panels. 

The bottom panel acts as a base and contains the TP4056-based charging breakout and on-off switch. 

The middle panel creates a wall and contains only the battery holder, and power connection to the top panel.

The top panel contains ESP8266 with supporting components, power source, programming header, buttons and alse headers for sensors.

## Schematic

You can find [schematic for all three panels in KiCad projects on Github][githubkicad] (there are 3 projects). I have also combined all of them on the following image.

{% responsive_image path: images/roommonitor/full_schematic.png alt:"Schematic for all 3 parts"  figcaption:"Schematic for all 3 parts"%}

The first block (top left) is the power source with [LT1763 LDO][lt1763datasheet] almost exactly as in the datasheet. Resistors `R3` and `R4` form a voltage divider for ADC in ESP8266 so that it can measure voltage on the battery.

On the top right, the connection for the charging breakout is shown. It is possible to notice that I decided to put the on-off switch between the module and the rest of the cirquit. This allows me to turn the main cirquit off during charging. But it also means that the TP4056 charging module is powered all the time.

The biggest part shows connection for ESP8266. This is heavily inspired by [a schematic in the documentation for Arduion core for ESP8266][esp8266serial]. Let me go through the important bits:

- `GPIO15` is pulled down all the time, `EN` is pulled up.
- `RST` is pulled up by `R6`, it is also connected to a RST pin on the FTDI header. `SW1` allows me to restart the ESP8266 manually. And finally, the jumper `J2` can be used to connect `RST` to `GIPIO16` which is required for deep sleep to work.
- `GPIO0` allows to choose between boot modes (`UART` for programming and `FLASH` for normal operation). Normally it is pulled high (`FLASH`). The button `SW2` can be used to activate the programming mode (hold `SW2` and pres `SW1`). It's also connected to `DTR` pin on the FTDI header.
- Serial: `RXD`, `TXD` goes directly to the FTDI header.
- I2C: `SDA`, `SDL` connect ESP8266 to sensors.
- `ADC` is connected to the voltage divider mentioned above.
- There are some capacitors to improve stability.

## Designing the PCB

I started by creating the basic shape - a rectangle with rounded corners - in Inkscape. I created 3 copies and added notches which should allow me to fasten the panels together.

{% responsive_image path: images/roommonitor/shapes.png alt:"Panel shapes next to each other."  figcaption:"Panel shapes next to each other."%}

I didn't know how to ensure they would fit each other as I wanted. I was afraid they might be either too lose or too tight. I also realized manufacturing tolerancies would play a role. In the end, I decided I should start with the simplest solution and not overthing it. 

I split the shapes into separate files and extracted them to DXF so they can be improted in the KiCad. The basic steps are:

- Flatten the curves (`Extensions` -> `Modify path` -> `Flatten Beziers`)
- Save as DXF file 
- In KiCad, choose `Import Graphics` and select the DXF file. Make sure the Edge.Cuts layer is selected as "Graphics layer"

Or you could use [the SVG2Shenzen plugin][svg2shenzen] Inkscape plugin.


## PCB 

## BOM

## Build log




----
## Footnotes

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
