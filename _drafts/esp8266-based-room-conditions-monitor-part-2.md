---
layout: post
title: ESP8266 based room-contidions monitor, part 2. - PCB
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

I wanted to move from rough protypes to something nicer and more final. But I still wanted to use those small PCB breakouts with sensor. I already owned them and also the sensors are very small and hard to solder. 

Freeforming would be one option. It would be possible to build something similar to [the client devices][roommonitorclient] and I might do it in the future. But I also wanted to have the ability to build more of those easily. Thefore I chose PCB. But I didn't like the idea of having just one plain and boring PCB. So I came up with idea to have 3 small boards soldered together to create a shell around battery holder. 

## Schematic

{% responsive_image path: images/roommonitor/full_schematic.png alt:"Schematic for all 3 parts"  figcaption:"Schematic for all 3 parts"%}

## Designing the PCB



## Build log

## BOM


----
## Footnotes

<!-- Links  -->
[roommonitorclient]: {{ site.baseurl }}{% post_url 2019-05-20-freeform-esp8266-based-mqtt-oled-client %}
[roommonitor1]: {{ site.baseurl }}{% post_url 2019-11-02-esp8266-based-room-conditions-monitor-part-1 %}