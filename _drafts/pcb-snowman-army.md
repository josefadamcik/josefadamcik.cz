---
layout: post
title: PCB Snowman Christmas decoration
categories: electronics
tags: [buildlog,pcb, electronics]
published: false
image: /images/snowman/IMG_20191208_124030.jpg
---

I have enjoyed designing and making [a Squid PCB badge][squidarticle] some time ago and I have some plans for more complex PCB badges and creations. But Christmas are coming and I realized it might be fun to create some simple gift for friends and family. I was also a good opportunity to try another PCB manufacturer - Seed Studio. 

{% responsive_image path: images/snowman/IMG_20191208_124030.jpg alt: "Snowman Christmas decoration"%}


<!--more--> 

## PCB design

The schematic is similar to [the Squid badge][squidarticle]. No logic, no micro controller. Just a few LEDs, a coin-cell and a switch. There are no resistors since the internal resistance of the battery is enough to limit the current drawn by LEDs.

{% responsive_image path: images/snowman/schematic.png alt: "Schematic"  figcaption: "Schematic"%}


My girlfriend was so kind and sketched an image of snowman for me. She even converted it into a vector image in Illustrator. Sadly the export from Illustrator to SVG was not exactly what I needed so I still had to do some work in order to convert the source image to a simple set of paths I could use. 

As soon as I had simple shapes available, I used the [Svg2Shenzen][svg2shenzen] Inkscape plugin to help with export from SVG to KiCad. This plugin is very easy to use. In the first step you initiate an empty document - the plugin will create empty layers for you. Than you draw into layers what you need and finally you export them to either KiCad  project or KiCad footprint.

I wanted LEDs to shine through the PCB material in few places: eyes, nose, mouth and buttons on snowman's chest. This required ensuring there is going to be no solder mask nor copper on either side of the PCB. I included the front copper layer (F.Cu layer in Inkscape, red on the image below) for head and chest in the SVG with holes in all places. 

{% responsive_image path: images/snowman/inkscape.png alt: "Snowman PCB design in Inkscape"%}


I have also included holes in solder mask for the front (F.Mask in Inkscape). Keep in mind that in the case of solder-mask we are choosing where we **don't* *want the solder mask to be (it's kind of solder-mask mask). So black areas are those without solder-mask.

{% responsive_image path: images/snowman/inkscapesoldermaskonly.png alt: "Snowman PCB design in Inkscape - only F.Mask and Edge.Cuts"%}


The [SVG file for Inkscape][githubsvg] is available at Github for anyone interested in examining the result.  




The PCB would obviously use white solder mask and black silkscreen. I have also incorporated bare copper with HASL finish[^1] for snowman's scarf. 

{% responsive_image path: images/snowman/kicadpcb.png alt: "PCB in KiCad"  figcaption: "PCB in KiCad"%}


{% responsive_image path: images/snowman/snomanpcbrender.jpg alt: "PCB render"  figcaption: "PCB render"%}


## PCB Manufacturing at Seed Studio


## Notes

[^1]: Lead free, of course. They are going to be gifts for people.


<!-- links --> 

[githubkicad]: https://github.com/josefadamcik/SnowmanPCB "Repository with KiCad files (Github)"
{:target="_blank"}
[squidarticle]: {{ site.baseurl }}{% post_url _posts/2019-07-21-squid-badge-my-first-pcb-design %} "Squid PCB badge"
[seedstudio]: https://www.seeedstudio.com/fusion.html "Seed Studio Fusion PCB services"
{:target="_blank"}
[svg2shenzen]: https://github.com/badgeek/svg2shenzhen "SVG2Shenzen inkscape plugin"
{:target="_blank"}
[githubsvg]: https://github.com/josefadamcik/SnowmanPCB/blob/master/Design/snowman_pcb.svg "SVG file with PCB design for Svg2Shenzen"
{:target="_blank"}