---
layout: post
title: Let me introduce you SofleKeyboard - a split keyboard based on Lily58 and Crkbd
categories: electronics
tags: [keyboards, electronics]
published: false
series: "SofleKeyboard"
image: /images/sofle/IMG_20200126_114622.jpg
---

In [the first article][layoutarticle] I explained my experience with custom keyboards and my requirements regarding desired layout for a DIY keyboard. I have also promised there will be another article featuring a custom keyboard with such layout. 

Behold, this is SofleKeyboard - a 6×4+5 keys column-staggered split keyboard with encoder support. Based on Lily58, Corne and Helix keyboards.

{% responsive_image path: images/sofle/IMG_20200126_114622.jpg alt: "SofleKeyboard" %}

<!--more--> 

{%- include post_series.html -%}

## Standing on the shoulders of giants

How hard is to design your own keyboard, you may ask? It depends, is the answer. In may case it was quite easy because I was not starting from the scratch. Is I explained in the previous article, [Lily58][lily58] was almost exactly what I needed. The keyboard is designed in KiCad and the design files are available under MIT licence. Thankfully I learned how to use KiCad and design [simple][squidarticle] [PCBs][roommonitor] recently. 

Neither Lily58 was built from scratch. It is obvious (and written in its licence file) it's derived from [Helix][helix], [Ergo42][ergo42] and [Corne AKA crkbd][crkbd] (which is was also called Helidox and is based on Helix).

{% responsive_image path: images/crkbd/IMG_20190623_114216.jpg alt:"Corne Keyboard AKA crkbd"  figcaption:"Corne Keyboard AKA crkbd, my first split keyboard" %}

All those keyboards have a lot in common:

- They are split keyboards.
- They use [QMK firmware][qmk_firmware]. If you check their firmwares you can see they are copying the custom firmware parts from each other. More about this later.
- They don't have a microcontroller on the PCB directly but they rather use a board with ATmega32U4 microcontroller originally made by [SparkFun and called Pro Micro][promicroorig]. Cheaper clones are available from AliExpress (and similar). This makes PCBs and assembly simpler and also allows to use pin sockets for microcontroller so it's not permanently soldered to the PCB giving an option to remove Pro Micros and use them in another iteration of the design.
- Each keyboard uses 2 Pro Micros. They communicate with each other through a TRRS cable (a cable with audio jack connectors). They can either communicate via serial[^2] or via I2C[^3]. One of them is master, it's connected to USB and al the decisions are made there[^4]. The other one is called slave and only scans the matrix and informs the master about what is pressed.
- The same PCB can be used for both sides. Just flip one of them and solder components on the other side. When you manufacture 10 PCBs of the same design you can have 5 keyboards. Or two and a half for 5 PCBs which is common minimal quantity. This approach reduces cost.
- They usually have support for OLED displays connected via I2C. Usually they can display a keyboard's logo and some debugging info. The displays are always optional.
- They usually have a design files for sandwich case. The basic variant is a laser-cut acrylic. There's a bottom plate and top plate (with holes for switches). Some stand-offs and screws are used to sandwich plates around the PCB. This is very nice option if you have access to a laser cutter. It's also possible to find a laser-cutting service online. 
- Usually there's another option for sandwich case. The plates can be made using standard PCB manufacturing process which may be cheaper than laser-cut acrylic. It does depend on insanely cheap PCBs from some manufactures, though. For me it worked for both Corne and SofleKeyboard very well. But there [can be problems][manufacturingproblems].


## Changing the design

It was not difficult[^5] to get the files from Github and start playing with the design in KiCad. I chose [Lily58 Pro][lily58pro] variant where switches are not soldered directly on the PCB but sockets are used instead. I didn't know how many iterations I am going to go through and good switches[^1] are quite expensive to be wasted just to try a layout.

Adding one more switch to the bottom row was pretty straightforward. I added it to the matrix in the schematic, updated the PCB and placed new footprint and traces. 

There's was also one key, just below the microcontroller, next to index finger which I didn't want. I decided to replace it with rotary encoder. Why? Well I am still not sure. QEM firmware supports them and you can map anything you wish to them. Usually people use them for volume control. I just had nothing else to put there so I figured I might give it a try.

I also felt the inner side of the keyboard which contains the Pro Micro and TRRS jack could be smaller. So I moved things around and arranged them more in the way how Corne does it. TRRS jack and reset button below the microcontroller.

The last thing was to change the overall shape of the board. I used Inkscape and the tricks I learned when making PCB badges. 

{% responsive_image path: images/sofle/both_pcb_top.png alt:"Lily58 and SofleKeyboard PCBs next to each other."  figcaption:"Lily58 PCB on the left and SofleKeyboard on the right"%}

You can see how close are both to each other.

Next step was to create top and the bottom plate. It took me some time to figure out how to do correctly the cut-outs for switches in the top plate and holes for screws. The critical part here is to have everything aligned on all three layers. To be honest I don't recall exact process. I believe I combined Inkscape and export from KiCad. The holes for switches are actually included in the `Eco2.User` layer. It's also possible to plot drill file to SVG which allowed me to align holes properly (I believe [svg2shenzen][svg2shenzen] Inkscape plugin helped me there since it allows to specify a drill hole by placing a circle of desired diameter on a particular SVG layer).

I was worried I might have made some mistake so I did a cardboard prototype.

{% responsive_image path: images/sofle/cardobardproto.jpg alt:"Cardboard prototype of SofleKeyboard"  figcaption:"Cardboard prototype of SofleKeyboard" %}


[^1]: I used [Zilents V2][zilentsv2], silent tactile switches by ZealPC (and made by Gateron) which are very expensive. 
[^2]: Serial is the default behaviour. If serial is used, you don't need TRRS cable (4 contacts, used for headphones with microphone) but just TRS (stereo audio jack). 
[^3]: I2C requires additional pull up resistor at least on one half. You also need to cut a trace and change configuration of the firmware. At least that's how I understand it, I haven't tried it yet.
[^4]: That also means that sometimes you don't have to update firmware in both Pro Micros. If you, for example, do just changes to the mapping you can update just master half since the slave only scans the matrix and doesn't care what is going to be mapped where.
[^5]: I had to do some troubleshooting regarding footprints. There are some custom footprints included in the project on Github but they seemed to be incomplete or maybe outdated. 


[layoutarticle]: {{ site.baseurl }}{% post_url 2019-10-13-in-search-of-the-best-custom-keyboard-layout %} "In search of the best custom keyboard layout"
[lily58]: https://github.com/kata0510/Lily58 "Lily58 - a split keyboard design on github"
{:target="_blank"} 
[lily58pro]: https://github.com/kata0510/Lily58/blob/master/Pro/ "Lily58 Pro"
{:target="_blank"} 
[soflegithub]: https://github.com/josefadamcik/SofleKeyboard "SofleKeyboard - KiCad project on Github.com"
[soflelayout]: http://www.keyboard-layout-editor.com/#/gists/76efb423a46cbbea75465cb468eef7ff "Sofle Keyboard layout at keyboard-layout-editor.com"
[sofleqmk]: https://github.com/josefadamcik/qmk_firmware/tree/soflekeyboard/keyboards/sofle
[qmk_firmware]: https://github.com/qmk/qmk_firmware/ "QMK firmware"
{:target="_blank"}
[squidarticle]: {{ site.baseurl }}{% post_url 2019-07-21-squid-badge-my-first-pcb-design %} "Squid PCB badge"
[roommonitor]: {{ site.baseurl }}{% post_url 2020-01-05-esp8266-based-room-conditions-monitor-part-2 %} "ESP8266 based room-conditions monitor, part&nbsp;2: PCB"
[zilentsv2]: https://zealpc.net/products/zilents "Zilent V2 silent taktile switches by ZealPC"
{:target="_blank"}
[helix]: https://github.com/MakotoKurauchi/helix "Helix keyboard"
{:target="_blank"}
[crkbd]: https://github.com/foostan/crkbd "Corne Keyboard AKA crkbd"
{:target="_blank"}
[ergo42]: https://github.com/Biacco42/Ergo42 "Ergo42 keyboard"
{:target="_blank"}
[lestsplitqmk]: https://github.com/qmk/qmk_firmware/tree/master/keyboards/lets_split
{:target="_blank"}
[promicroorig]: https://www.sparkfun.com/products/12640 "Pro Micro by SparkFun"
{:target="_blank"}
[manufacturingproblems]: https://josef-adamcik.cz/electronics/corne-keyboard-build-log.html#manufacturing-at-jlcpcb---update-27112019 "Possible problems when manufacturing top plate for Corne"
[sofledesign]: https://github.com/josefadamcik/SofleKeyboard/blob/master/Design/ "Sofle SVG design"
{:target="_blank"}
[svg2shenzen]: https://github.com/badgeek/svg2shenzhen "SVG2Shenzen inkscape plugin"
{:target="_blank"}