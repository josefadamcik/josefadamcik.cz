---
layout: post
title: ESP8266 based room-conditions monitor, Part 1
categories: electronics
tags: [buildlog, electronics]
published: false
series: "Room Monitor"
image: 
---

When I built my [Freeform ESP8266 OLED MQTT client][roommonitorclient] and wrote about it I mentioned I have one long-running project which captures the data I wanted to display on the device. I call it Room Monitor and it is nothing special - a bunch of sensors connected to ESP8266 and powered with battery. I am going to briefly sum-up its hardware and software development in following two articles.

<!--more-->

{%- include post_series.html -%}

## Just because I can

When I started with all this tinkering with electronics and micro-controllers it was very similar to what many people do nowadays. I have got some Arduinos, bunch of basic THT components, a breadboard, jumper wires and few sensors. Obviously I connected all the sensors to Arduino, captured the data, displayed them as a graph and so on. 

When I had a bunch of sensors like temperature and humidity connected to a micro-controller I started thinking I could make a weather station one day. But you know, those have to be outside, protected from environment yet still able to capture the right values (access of air to sensors) which makes them a bit more difficult to put together. But you also need to have a way how to power them and how to send the measured data somewhere.

As with every complex project, I chose the battles I would like to fight first: powering and communication. So my weather station could stay in my room and measure values I don't really need to know. But as I like to say: This is a hobby. Hobbies are not supposed to be practical.

## The beginnings and the first prototype

The first prototype was obviously on a breadboard. 

- Wemos D1 Mini board (or clone) with ESP8266 programmed with Arduino IDE
- SHT

## Optimizing for battery life

## Second prototype

----
## Footnotes

<!-- Links  -->

[roommonitorclient]: {{ site.baseurl }}{% post_url 2019-05-20-freeform-esp8266-based-mqtt-oled-client%}