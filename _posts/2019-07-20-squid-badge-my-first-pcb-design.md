---
layout: post
title: Squid badge - my first PCB design
categories: electronics
published: true
image: /images/squid/squidfinal.jpg
---

I designed my first PCB in KiCad. It's not useful at all and very primitive electrically. But I have learned a lot.

{% responsive_image path: images/squid/squidfinal.jpg alt: "Squid PCB badge" %}

<!--more-->

## Starting with PCBs

All my projects are on breadboard and some of them are later transferred to a prototyping board (perfboard). Recently I realized I might give them some more interesting and [fancy look in a form of a free-form sculpture or whatever you want to call those][freeform].  I had no experience with PCBs and I have considered them to be a bit overkill for my projects.

As I was ordering a fabrication of PCBs for my [Corne Kyboard][crkbd] build I realized how cheap the manufacturing of a small set of boards is nowadays. I was also working on a third prototype for my room-conditions-monitor project (no blogpost for this one yet, but there will be one soon) around that time and spent a few hours connecting components on a perfboard.  I realized it would make much more sense to quickly design a simple PCB and order it from China. The shipping time is not that bad - between 2-3 weeks for me. That might be problem for someone but given the low amount of time I am able to invest to my projects and also the fact that I often order components on Aliexpress and I have to wait for those, the long-ish shipping times are not so big problem for me.

So I decided to learn how to make PCBs. I know there's plenty to learn and my experience with KiCad was: open a project made by someone else, play with layer visibility and pretend I am trying to understand what's going on, give up, export Gerber files and order PCBs and hope everything is correct. Therefore I wonted something simple but also something fun. Maybe I could make a simple funny shaped PCB badge with a coin cell and some LEDs. Nothing original, but originality is overrated.

## Squid

Since my girlfriend likes to draw and paint and she is a big octopus and squid fan, I asked her to draw a few sketches for me. The results were super cute.

{% responsive_image path: images/squid/sketches.jpg alt: "Original sketch"  figcaption: "Original sketch. A squid and an octopus"%}

## The circuit

As I mentioned I wanted to go for something super simple. So it's composed just from:
- a coin cell
- 2 surface mounted LEDs
- 2 THT FLEDs (flashing LEDs, they contain small chip and flash on they own)
- a on-off switch

That's it. There are no current limiting resistors for LEDs since they are not really needed (a coin cell battery has some internal resistance and will not provide enough current to destroy LEDs).


{% responsive_image path: images/squid/schematic.png alt: "Schema"  figcaption: "Schema. D1 represents THT FLEDs which will act as tentacles. The reason why I used a double LED symbol will be explained later."%}

## Designing the PCB in KiCad

I took me some time to figure out how to transfer the sketch to KiCad. I had to learn general basics of PCB design, learn some basic KiCad usage and also figure out how to make an unusually shaped PCB. 

Those three articles helped me a lot to find a way to go:

- [A Practical Guide to Designing PCB Art by Uri Shaked][designing-pcb-art]
- [Creating Custom Footprints For KiCad by Gabe][kicad-custom-footprint]
- [The Turbo Badge PCB Design Experience in KiCad][the-turbo-badge-pcb-design-experience-in-kicad]

The first step was to scan sketched image into a computer and recreate it in vectors in Inkscape. I already had some experience with Inkscape so that was not hard for me. I fixed some details and created several layers with various features (body, silk, other details). [The resulting SVG image is available on Github][githubsvg].


{% responsive_image path: images/squid/sepiasvg.png alt: "Vector image of Squid"  figcaption: "SVG version of Squid"%}

As the next step I utilized an [svg2kicad][Inksape plugin svg2shenzhen] to create a custom footprint for the whole squid including the pads for tentacles.



## Build log 

[freeform]: {{ site.baseurl }}{% post_url 2019-05-20-freeform-esp8266-based-mqtt-oled-client %} "A Freeform ESP8266 OLED MQTT client"

[crkbd]: {{ site.baseurl }}{% post_url 2019-07-10-corne-keyboard-build-log %} "A build-log post about my Corne Keyboard"

[github]: https://github.com/josefadamcik/squid_badge_pcb "Github repository with SVG and KiCad files"

[githubsvg]: https://github.com/josefadamcik/squid_badge_pcb/blob/master/sepia.svg "Squid SVG"

[svg2kicad]: https://github.com/badgeek/svg2shenzhen "svg2shenzhen Inkscape plugin"

[designing-pcb-art]: https://medium.com/@urish/a-practical-guide-to-designing-pcb-art-b5aa22926a5c "A Practical Guide to Designing PCB Art by Uri Shaked"

[the-turbo-badge-pcb-design-experience-in-kicad]: https://blog.digilentinc.com/the-turbo-badge-pcb-design-experience-in-kicad/ "The Turbo Badge PCB Design Experience in KiCad" 

[kicad-custom-footprint]: https://www.gabetaubman.com/blog/posts/kicad-custom-footprint/ "Creating Custom Footprints For KiCad by Gabe" 