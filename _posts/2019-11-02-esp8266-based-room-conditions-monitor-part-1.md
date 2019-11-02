---
layout: post
title: ESP8266 based room-conditions monitor, Part&nbsp;1
categories: electronics
tags: [buildlog, electronics]
published: true
series: "Room Monitor"
image: /images/roommonitor/IMG_20191027_142443.jpg
---

When I built my [Freeform ESP8266 OLED MQTT client][roommonitorclient] and wrote about it I mentioned I have one long-running project which captures the data I wanted to display on the device. I call it Room Monitor and it is nothing special - a bunch of sensors connected to ESP8266 and powered with battery. I am going to briefly sum-up its hardware and software development in following two articles. This one is going to cover prototyping and the next one the current (and semi-finished) PCB version.

{% responsive_image path: images/roommonitor/IMG_20191027_142443.jpg alt: "RoomMonitor - prototypes and the PCB version " %}

<!--more-->

{%- include post_series.html -%}

## Just because I can

When I started with all this tinkering with electronics and micro-controllers it was very similar to what many people do nowadays. I have got some Arduinos, bunch of basic THT components, a breadboard, jumper wires and a few sensors. Obviously I spent some time playing with all those things, connecting them to Arduino and together in a way anyone could imagine.

When I had a bunch of sensors like temperature and humidity connected to a micro-controller I started thinking I could make a weather station one day. But you know, those have to be outside, protected from the environment yet still be able to capture correct values (access of air to sensors) which makes them a bit more difficult to put together. But there also needs to be a way how to power them and how to send the measured data (and where).

As with every complex project, I had to choose the battles I would like to fight first: powering and communication. So my weather station could stay in my room and measure values I don't really need to know. But as I like to say: This is a hobby. Hobbies are not supposed to be practical.

## The first prototype - let's breadboard it

The first prototype was obviously on a breadboard and was build from things I had at home.

- [Wemos D1 Mini board][wemosd1] (or clone) with ESP8266
- [SHT30 breakout][sht30shield] a temperature and humidity sensor
- [BMP280 breakout][bmp280] a barometric pressure and temperature sensor  
- a photo resistor as a light sensor
- and a I2C LCD display which was showing the measured values. 

Both sensors were connected through I2C and powered by 5V (no battery yet). Data were sent using Adafruit MQTT library to [io.adafruit.com][ioadafruit] because it was easy to setup. This made the task one - communication - pretty sorted out. I spent some time writing the firmware and because [I learned a bit of C++][cpp] back then I hugely over-engineered the code. 

## The second prototype - battery powered

The second one was build on a piece of perfboard. The most of the components were connected to PIN headers. There was still the good old Wemos  D1 MINI. The photo resistor was replaced by a breakout with [BH1750 - a light intensity sensor][BH1750]. The display was discarded in order to save battery life.

{% responsive_image path: images/roommonitor/IMG_20191027_142323.jpg alt: "RoomMonitor - the second prototype" figcaption: "The second prototype" class: "imgmw600"%}

But the most important change was the power. I used one Li-On cell (18650) to power the device[^1]. The voltage on such cell ranges from 4.2V (fully charged) to 2.5V when the over-discharge protection circuit shuts off. ESP8226 itself is powered by 3.3V. There is a voltage regulator on the Wemos D1 Mini board to drop 5V (e.g. from USB) to 3.3V. But you can also power the board directly by 3.3V and bypass the regulator.

I had only the raw voltage from the cell which is too low for the voltage regulator. It's also too high for the ESP8226, at least when charged (the supported range for ESP8226 is from 3V to 3.6V). This prototype didn't solve this issue properly. Some voltage was dropped by a diode and other than that it was just keeping fingers crossed that ESP8266 survives working out of specification. 

It worked without bigger problems for a few months and then ESP8226 died. I am not really sure why. It might have been over-voltage but also under-voltage when the battery was too discharged, or something completely different.

## Optimizing for battery life in firmware

Nevertheless, I was able to experiment with the battery life and how it could be affected by firmware. I even made [a small device to help me with that][ina219].

The best way how to make ESP8226 last long time on battery is to use deep-sleep[^2] mode. In this mode only small part of the chip is running and the rest is completely turned off, even the content of RAM is lost during deep-sleep. For my case this was perfect - measure and send away the data, sleep for 5 minutes and wake up again. 

All that sounds easy enough, but there are is some complexity in the real world. The firmware for ESP8266 has some specific behaviour and some bugs which affect it's power consumption. Some people already did experiments and measurements and reported what they have found. 

Following articles are must read for anyone who wants to optimize deep-sleep mode for ESP8226:

- [Reducing WiFi power consumption on ESP8266, part 1][bakke1], [part2][bakke2], and [part3][bakke3] by Erik H. Bakke.
- series of articles about [Low Power Wifi by Thorsten von Eicken][voneicken] which covers not only ESP8226 but even ESP32, and RTL8710. It's very detailed and very well done.

One can learn a lot of tricks from following articles:

- Avoid WiFi scan. Store WiFi configuration (channel, BSSID) after connecting and restore it on next run. With a fall-back to scanning if the configuration changed meanwhile. ([explained here][bakkescan])
- Avoid DHCP resolution. Use fixed IP address, gateway and subnet.
- Turn off the WiFi just when the devices starts, do all the work needed and then connect and send the data.
- Use `ESP.deepSleepInstant()` instead of `ESP.deepSleep()` and use `WAKE_RF_DISABLED` flag to keep WiFi disabled when waking up.
- Disable network persistence `WiFi.persistent( false )` ([explained here][bakke3])

Just by applying those I was able to get **37 days** of battery life with 5 minutes between wake ups with this prototype. That is nice, but could be better. The original, naive, implementation was worse but unfortunately I don't remember how long it was. 

## The third prototype - improve battery life through hardware

The power consumption is not only about firmware. It's not only about ESP8266 either. There are other components on a DEV board[^3] which affect power consumption.

Mainly:

- USB to serial converter, which is powered all the time and affects. Some people just disable theirs on the DEV board.
- Voltage regulator (5V->3.3V) which also uses some power when used.
- Sometimes some LEDs or other components on the board.

The next step was to use ESP8266 without a DEV board to have better control over power consumption. I found cute [breakout boards for ESP8266 (link to Aliexpress, not an affiliate link)][espadapter] which allowed me to do some prototyping.

{% responsive_image path: images/roommonitor/IMG_20191027_142133.jpg alt: "RoomMonitor - the third prototype" figcaption: "The third prototype. Sorry for the dust everywhere."  class: "imgmw600"%}

This requires to use external FTDI board for programming and communication through serial (for example reading of messages used for debugging). ESP8226 has support for Over-The-Air updates so normally you would need to use FTDI only for the first flash and all the next ones can be done through OTA. You can see a PIN header with labels for FTDI on the image above.

## Powering properly

Another change for this prototype was an introduction of LDE to convert voltage from a battery to a stable voltage for ESP8226 and other components.

TODO:

- voltage drop on a regulator and what does it mean.
- picking the regulator
- going for 3V insetead of 3.3V

The final battery life jumped to **57 days** - 20 days (54%) more than the previous prototype. That is significant improvement.

## Next time

The next part will cover the current version which is a custom PCB build. 

----
## Footnotes

[^1]: Protected (and charged) through a TP4056-based module with over-discharge and over-current protection. Never use those cells without a proper protection circuit!
[^2]: ESP8226 has several sleep modes but the internet is full of articles about them so I am not going to explain them all.
[^3]: Wemos D1 Mini, in my case.

<!-- Links  -->

[roommonitorclient]: {{ site.baseurl }}{% post_url 2019-05-20-freeform-esp8266-based-mqtt-oled-client %}
[cpp]: {{ site.baseurl }}{% post_url 2018-09-06-its-never-too-late-to-learn-cpp-properly %}
[fimware]: https://github.com/josefadamcik/RoomMonitor "RoomMonitor firmware on github"
{:target="_blank"}
[wemosd1]: https://wiki.wemos.cc/products:retired:d1_mini_v2.2.0 "Wemos wiki for D1 Mini"
{:target="_blank"}
[sht30shield]: https://wiki.wemos.cc/products:retired:sht30_shield_v1.0.0 "Wemos wiki for SHT30 shield"
{:target="_blank"}
[bmp280]: https://www.google.com/search?&q=BMP280+breakout "Google search for BMP280 breakout"
{:target="_blank"}
[BH1750]: https://www.google.com/search?q=BH1750 "Google search for BH1750"
{:target="_blank"}
[ioadafruit]: https://io.adafruit.com "IO app from Adafruit"
{:target="_blank"}
[iotcontainer]: https://tinker.yeoman.com.au/2016/07/24/iot-container/ "IoT Container makes shopping easier at tinker.yeoman.com.au"
{:target="_blank"}
[esp8266lowpower]: https://tinker.yeoman.com.au/2016/05/29/running-nodemcu-on-a-battery-esp8266-low-power-consumption-revisited/ "Running NodeMCU on a battery: ESP8266 low power consumption revisited at tinker.yeoman.com.au"
{:target="_blank"}
[bakke1]: https://www.bakke.online/index.php/2017/05/21/reducing-wifi-power-consumption-on-esp8266-part-1/ "Reducing WiFi power consumption on ESP8266, part 1"
{:target="_blank"}
[bakke2]: https://www.bakke.online/index.php/2017/05/21/reducing-wifi-power-consumption-on-esp8266-part-2/ "Reducing WiFi power consumption on ESP8266, part 2"
{:target="_blank"}
[bakke3]: https://www.bakke.online/index.php/2017/05/22/reducing-wifi-power-consumption-on-esp8266-part-3/ "Reducing WiFi power consumption on ESP8266, part 3"
{:target="_blank"}
[bakkescan]: https://www.bakke.online/index.php/2017/06/24/esp8266-wifi-power-reduction-avoiding-network-scan/ 
"Reducing WiFi power consumption on ESP8266, avoiding network scan"
{:target="_blank"}
[voneicken]: https://blog.voneicken.com/projects/low-power-wifi-intro/ "Low Power Wifi series by Thorsten von Eicken"
{:target="_blank"}
[ina219]: {{ site.baseurl }}{% post_url 2019-02-20-learning-the-hard-way-simple-diy-power-masurement-unit-with-ina219 %}
[espadapter]: https://www.aliexpress.com/item/32649040259.html?spm=a2g0s.9042311.0.0.1ec64c4d5Yqfd7 "ESP8226 module adapter on Aliexpress"