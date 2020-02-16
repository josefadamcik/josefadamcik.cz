---
layout: post
title: Let me introduce you SofleKeyboard - a split keyboard based on Lily58 and Crkbd
categories: electronics
tags: [keyboards, electronics]
published: false
series: "SofleKeyboard"
image: /images/sofle/IMG_20200126_114622.jpg
---

In [the first article][layoutarticle] I explained my experience with custom keyboards and my requirements regarding a layout for my next DIY keyboard. I have also promised there will be another article featuring a custom keyboard with such layout. 

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

There's was also one key, just below the microcontroller, next to index finger which I didn't need. I decided to replace it with a rotary encoder. Why? QEM firmware supports rotary encoders even for split keyboards and you can map anything you wish to rotation in both direction and to press. Usually people use them for volume control. I just had nothing else to put in the empty space so I figured I might give it a try.

I also felt the inner side of the keyboard which contains the Pro Micro and TRRS jack could be smaller. So I moved things around and arranged them more in the way how Corne does it: TRRS jack and reset button below the microcontroller.

The last thing was to change the overall shape of the board. I used Inkscape and the tricks I learned when making PCB badges. 

{% responsive_image path: images/sofle/both_pcb_top.png alt:"Lily58 and SofleKeyboard PCBs next to each other."  figcaption:"Lily58 PCB on the left and SofleKeyboard on the right. Some layers are hidden in the pictures."%}

You can see how close are both to each other.

Next step was to create the top and the bottom plate. It took me some time to figure out how to place properly the cut-outs for switches in the top plate and the holes for screws. The critical part here is to have everything aligned on all three layers. To be honest I don't recall the exact process. I believe I combined Inkscape and exports from KiCad. The holes for switches are included in the `Eco2.User` layer. It's also possible to plot a drill file to SVG which allowed me to align drill holes (I believe [svg2shenzen][svg2shenzen] Inkscape plugin helped me there since it allows to specify a drill hole by placing a circle of desired diameter on a particular SVG layer).

I was worried I might have made some mistake so I did a cardboard prototype.

{% responsive_image path: images/sofle/cardobardproto.jpg alt:"Cardboard prototype of SofleKeyboard"  figcaption:"Cardboard prototype of SofleKeyboard" %}

And everything looked good. My girlfriend was so kind and drew a logo for the keyboard. Also the name was chosen at the time (my GF likes to call herself Sofie. Therefore Sofle is a little play with the name and the keyboard is named after her). This is how 3D renders in KiCad looked.

{% responsive_image path: images/sofle/render_pcb.png alt:"3D render of the PCB"  figcaption:"3D render of the PCB" %}
{% responsive_image path: images/sofle/SofleKeyboardTopPlate.png alt:"3D render of the top plate"  figcaption:"3D render of the top plate" %}
{% responsive_image path: images/sofle/SofleKeyboardBottomPlate.png alt:"3D render of the bottom plate"  figcaption:"3D render of the bottom" %}

## Manufactured boards

I had the boards manufactured at JLCPCB as I did for corne. 5 pieces of each (top, bottom, PCB) with white silkscreen, 1.6mm thickness and HASL finish. The price was 27$ for boards and 11$ for shipping (cheap and slow one as usual) which is 38$ for 2.5 keyboards. 

I ordered them 15.10. they were shipped 21.20. and delivered 4.11.2019. This makes 3 weeks total. And here they are.

{% responsive_image path: images/sofle/IMG_20191104_202743.jpg alt:"Final PCBs"  figcaption:"Final PCBs" %}

The result was perfect. No manufacturing problems, no mistakes on my side, everything aligned properly. 

## Building the first SofleKeyboard

This section is partly a build log and partly a build guide since there's no build guide for the keyboard yet and there are already people who would like to build SofleKeyboard.

### Bill of materials

Apart from PCBs and plates the following is needed to build the keyboard:

- **58 keyboard switch sockets by Kailh**. The PCB supports either sockets for traditional MX switches or sockets for Kailh Choc switches (low profile mechanical switches). They are available on Aliexpress, KBDFans and others.
- **58 keyboard switches** of your preference, either MX or [Kailh Choc][choc]. Just make sure you have matching sockets for them
- **58 keycaps**. You can use either all in `1u` size but it looks nicer with two `1.5u` for thumb keys.
- **58 diodes  1N4148W**. They are surface mount diodes in SOD123 package
- **2 TRRS connectors**. The same are used for Corne, Lily58 etc. Technically even TRS should work[^2] if you stick to (default) serial communication. I have [used those on AliExpress][trrs].
- **1 TRRS cable**. TRS should work[^2] if you stick with Serial. 
- **10 (+4) M2 spacers**. 10 are going to hold bottom and top together. Their height depends on which switches you use. A build guide Lily58 Pro suggests `4mm` for Choc and `7mm` for MX. I was not able to get `7mm`, but `6mm` worked well for me with MX switches. I used brass ones but you can also buy nicer from anodised aluminium. Another 4 would be needed to hold transparent OLED cover but even though there are mounting holes in the PCB there is no OLED cover designed yet. I used those [from AliExpress][spacers].
- **20 (+8) M2 screws**. 20 are going to hold the boards together (via spacers). I used some I had in my stock so I am not going to tell you exact length. But they need to be long enough to fix a `1.6mm` thick PCB to the spacer and short enough so two of them are able to fit in one spacer (might be trickier with 4mm spacers for Choc switches)
- **8 - 10 adhesive rubber feet** They are really important, trust me. I have [used those][rubberfeet].
- **2 ssd1306 128x32 OLED display module** Very common everywhere, [for example here][oled].
- **2 Rotary encoders EC11** optional. So far I have used only 1 but 2 are supported too.
- **2 Pro Micro** or clone. The [original is from SparkFun][promicroorig] or [clones everywhere][promicro] with 2x12 pins and ATmega32U4 microcontroller. Just make sure you **don't** buy something like Arduino Micro (a different pinout) or Arduino Mini (different microcontroller). You could also use Elite-C which bascially Pro Micro with USB-C or QMK Proton C[^6](32-bit Cortex-M4 processor and USB-C)
- **4x12 pin header (and optionally socket)** for Pro Micros. There are several ways how to mount Pro Micros to the board. Either the male PIN headers you most likely got with the board from supplier could be used to solder it directly to the board. Build guides for Helix, Corne and Lily58 suggest [those spring pin headers][springpinheader] which are very compact and give you non-permanent connection (you can remove or replace Pro Micros). But the link goes to a Japanese e-shop which is not shipping to Europe. I haven't found any other place where those are available. All I can find is Japanese datasheet and this e-shop. I ended up using low-profile round pin headers which take a bit more height but also allow me to remove Pro Micros and use them elsewhere. But for Corne I just soldered them permanently. But I would be interested in finding a better way.
- **2x4 pin header (and optionally socket)** for OLEDs. I have used the most common 1x4 female pin sockets which are quite tall but they also fit the height of ProMicro with the sockets I have used. Unfortunately the pin headers on my OLED modules (again those very common square male headers you would get with the modules) are loose in the sockets. It works but it's fiddly. I'll have to find better solution.
- **Micro USB Cable** to connect the keyboard to computer.

That's it. There are no RGB LDS on the board. But if you really need underglow it should be possible to connect RGB LED strip since there are 3 pads (VCC, GND and one signal for driving) on the board. You would need to figure out the particular parts in firmware on your own.

### Steps


### Firmware and programming

TODO:

## Cleaning the firmware

TODO:

## Links

TODO:

- Github with KiCad projects
- Github with a fork QMK firmware for SofleKeyboard (not yet in the upstream)

## Future plans

### Short term

- A proper build guide in the repository.
- Improve default layout to be more friendly - the default should be QWERTY and maybe a support for Dvorak could be added.
- Maybe add support for QMK configurator
- Push the firmware / layout to QMK upstream.
- Design a laser-cut acrylic case and OLED covers. Build one version using those.
- Build another version with Choc swiches.
- There could be a version of the PCB which would allow switches to be soldered directly on the board.

### Long term

- Maybe another version with improved layout. So far I am not sure what I would like to change, so this is not going to happen soon. Maybe I could move the bottom row a tiny bit more into the center.
- Some future version could have microcontroller directly on the PCB (I see Pro Micros as a temporary solution).
- I might even use some other microcontroller. Maybe STM32F303xC which is used by [QMK Proton-C][qmkprotonc] and supported by QMK firmware.


## Notes


[^1]: I used [Zilents V2][zilentsv2], silent tactile switches by ZealPC (and made by Gateron) which are very expensive. 
[^2]: Serial is the default behaviour. If serial is used, you don't need TRRS cable (4 contacts, used for headphones with microphone) but just TRS (stereo audio jack). 
[^3]: I2C requires additional pull up resistor at least on one half. You also need to cut a trace and change configuration of the firmware. At least that's how I understand it, I haven't tried it yet.
[^4]: That also means that sometimes you don't have to update firmware in both Pro Micros. If you, for example, do just changes to the mapping you can update just master half since the slave only scans the matrix and doesn't care what is going to be mapped where.
[^5]: I had to do some troubleshooting regarding footprints. There are some custom footprints included in the project on Github but they seemed to be incomplete or maybe outdated. 
[^6]: Well, you could. But I haven't tested it and have no idea if the firmware is going to work out of box or not. QMK does support the board but I don't have one and don't know what is needed to support it.


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
[choc]: http://www.kailh.com/en/Products/Ks/CS/ "low profile switches from Kailh"
{:target="_blank"}
[trrs]: <https://www.aliexpress.com/item/32869968774.html> "TRRS conectors on Aliexpress"
{:target="_blank"}
[buttons]: <https://www.aliexpress.com/item/32981768203.html> "Buttons on Aliexpress"
{:target="_blank"}
[spacers]: <https://www.aliexpress.com/item/32974970926.html> "Brass spacers on AliExpress"
{:target="_blank"}
[rubberfeet]: <https://www.aliexpress.com/item/32839661456.html> "Rubber feet on Aliexpress"
{:target="_blank"}
[oled]: <https://www.aliexpress.com/item/32712441521.html> "OLED on AliExpress"
{:target="_blank"}
[promicro]: <https://www.aliexpress.com/item/32849563958.html> "ProMicro clone on AliExpress"
{:target="_blank"}
[springpinheader]: <https://yushakobo.jp/shop/a01mc-00/> "Spring pin headers - Japaneese"
[qmkprotonc]: https://qmk.fm/proton-c/ "QMK Proton-C"