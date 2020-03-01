---
layout: post
title: SofleKeyboard build log/guide
categories: electronics
tags: [keyboards, electronics]
published: true
series: "SofleKeyboard"
image: /images/sofle/IMG_20191109_161224.jpg
---

This article is partly a build log and partly a build guide for [SofleKeyboard (introduced in the previous article)][introductionarticle] since there's no build guide for the keyboard yet and there are already people who would like to build it. 

{% responsive_image path: images/sofle/IMG_20191109_161224.jpg alt: "SofleKeyboard" %}

<!--more--> 

{%- include post_series.html -%}

## Getting the PCBs

I currently don't have any spare PCBs left. I also do not plan to organize a group by or to sell the boards. There might be others who would do that in the future. Some were already in touch with me.

If you decide that you wish to go through the PCB manufacturing process, you can. I think it's easy even for people who don't know much about PCB manufacturing process. But keep in mind, nobody can guarantee that there are not going to be some problems and if you have no idea what are you doing it might be more difficult for you to deal with them. 

You can get source [KiCad projects on Github][soflegithub]. Open them in KiCad, plot Gerber files and drill files, compress them into a zip file. The instructions how the extract Gerber files from KiCad are everywhere and you can find them e.g. at the website of your chosen manufacturer. If you don't want to install KiCad, you can find the Gerber files exported as I used them to order the first build here: [Gerber files for SofleKeyboard][soflegerber].

You should have 3 zip files which you need to upload/send to your manufacturer and have them made. There should be nothing special about the parameters you pick for manufacturing: 2-sided PCB, thickness 1.6 mm. Surface finish (keep in mind that the cheapest HASL contains lead. Lead is toxic.) and solder-mask color according to your taste. Other parameters could stay in their default values. You are going to need at least 2 pieces of PCB made from each zip file. Most likely the minimal quantity is going to be either 5 or 10 boards.

Also, keep in mind that [Some vendors can have problems with the top plate][manufacturingproblems]. I had no issues yet, but I can't guarantee that you will not.

## Bill of materials

The following is needed to build the keyboard. For most of the components there are links to the AliExpress (just click on the small number which will lead you to the corresponding footnote).

- **2 PCBs**, **2 top plates**, **2 bottom plates** see above.
- **58 keyboard switch sockets by Kailh**. The PCB supports either sockets for traditional MX switches[^3] or sockets for Kailh Choc switches[^4] (low profile mechanical switches). They are available on Aliexpress, KBDFans and others.
- **58 keyboard switches** of your preference[^1], either MX or [Kailh Choc][choc]. Just make sure you have matching sockets for them.
- **58 keycaps**. You can use either all in `1u` size but it looks nicer with two `1.5u` for the thumb keys.
- **58 diodes  1N4148W**[^5]. They are surface mount diodes in SOD123 package.
- **2 TRRS connectors**. The same type which is used for Corne, Lily58 etc. Technically even TRS should work[^2] if you stick to (default) serial communication[^6]. 
- **1 TRRS cable**. TRS should work[^2] if you stick with Serial. 
- **10 (+4) M2 spacers**[^7]. 10 are going to hold the bottom and the top together. Their height depends on which switches you use. A build guide Lily58 Pro suggests `4mm` for Choc and `7mm` for MX. I was not able to get `7mm`, but `6mm` worked well for me with MX switches. I used brass ones but you can also buy nicer from anodised aluminium. Another 4 would be needed to hold transparent OLED cover but even though there are mounting holes in the PCB there is no OLED cover designed yet.
- **20 (+8) M2 screws**. 20 are going to hold the boards together (via spacers). I used some I had in my stock so I am not going to tell you exact length. But they need to be long enough to fix a `1.6mm` thick PCB to the spacer and short enough so two of them can fit in one spacer (might be trickier with 4mm spacers for Choc switches)
- **8 - 10 adhesive rubber feet**[^8]. They are really important, trust me.
- **2 ssd1306 128x32 OLED display module**[^9]. Very common everywhere. 
- **2 Rotary encoders EC11**[^10], optional. So far I have used only one but 2 are supported.  
- **A matching knob**[^11] for each encoder. 
- **2 Pro Micro**board or clone[^12]. With 2x12 pins and ATmega32U4 microcontroller. Just make sure you **don't** buy something like Arduino Micro (a different pinout) or Arduino Mini (different microcontroller). You could also use Elite-C which basically Pro Micro with USB-C.
- **4x12 pin header (and optionally socket)** for Pro Micros. There are several ways how to mount Pro Micros to the board. Either the male PIN headers you most likely got with the board from the supplier could be used to solder it directly to the board. Build guides for Helix, Corne and Lily58 suggest [those spring pin headers][springpinheader] which are very compact and give you non-permanent connection (you can remove or replace Pro Micros). But the link goes to a Japanese e-shop which is not shipping to Europe. I haven't found any other place where those are available. All I can find is Japanese datasheet and this e-shop. I ended up using low-profile round pin headers which take a bit more height but also allow me to remove Pro Micros and use them elsewhere. But for Corne, I just soldered them permanently. Another possible approach [is described at splitkb.com][promicrosocketing].
- **2x4 pin header (and optionally socket)** for OLEDs. I have used the most common 1x4 female pin sockets which are quite tall but they also fit the height of ProMicro with the sockets I have used. Unfortunately, the pin headers on my OLED modules (again those very common square male headers you would get with the modules) are loose in the sockets. It works but it's fiddly. I'll have to find a better solution.
- **Micro USB Cable** to connect the keyboard to a computer.

That's it. There are no RGB LEDs on the board. But if you really need underglow it should be possible to connect RGB LED strip since there are 3 pads (VCC, GND and data) on the board. You would need to figure out support in the firmware on your own.

## Steps

{% responsive_image path: images/sofle/IMG_20191106_185738.jpg alt:"Step 1"  figcaption:"Both sides of the keyboard ready. The front sides marked by pieces of tape in order to remember which side is which. " %}

{% responsive_image path: images/sofle/IMG_20191106_193937.jpg alt:""  figcaption:"Starting with the diodes. They belong to the backside of the PCB. Make sure you have orientation right - they are all oriented to the same side. The end with the thin line is Cathode (-) and it should go in the direction of the "arrow" symbol on the PCB." %}

{% responsive_image path: images/sofle/IMG_20191106_203953.jpg alt:""  figcaption:"Sockets for switches belong again on the back side, the same side as diodes. Make sure they are flush with PCB." %}

{% responsive_image path: images/sofle/IMG_20191106_204348.jpg alt:""  figcaption:"Button and TRRS sockets belong to the top. Use a piece of tape to fix them and apply solder from the bottom side." %}

{% responsive_image path: images/sofle/IMG_20191106_204324.jpg alt:""  figcaption:"This is how the right half should look from the top. "%}

{% responsive_image path: images/sofle/IMG_20191106_205330.jpg alt:""  figcaption:"Bridge 4 jumper pads on the top side. You can skip this step if you are sure you don't want to use OLED displays." %}

{% responsive_image path: images/sofle/promicro.jpg alt:""  figcaption:"Prepare the Pro Micro. There are several ways how to do it. I have used rounded pin headers." %}

{% responsive_image path: images/sofle/IMG_20191106_210048.jpg alt:""  figcaption:"And corresponding sockets on the front side of the board. Make sure you insert them into the holes which are marked by the rectangles." %}

{% responsive_image path: images/sofle/IMG_20191106_211040.jpg alt:""  figcaption:"Another socket for OLED display." %}

{% responsive_image path: images/sofle/IMG_20191106_211048.jpg alt:""  figcaption:"A look on the backside." %}

{% responsive_image path: images/sofle/IMG_20191106_212042.jpg alt:""  figcaption:"Now it is already possible to connect the ProMicro and OLED display to the board, flash the firmware and check if all keys work using a piece of wire or tweezers." %}

{% responsive_image path: images/sofle/IMG_20191109_153340.jpg alt:""  figcaption:"Both halves assembled, a rotary encoder can be added on both, one or none. I have also cleaned flux residue from the back side using some isopropyl alcohol, cotton buds and paper towels." %}

{% responsive_image path: images/sofle/IMG_20191109_154009.jpg alt:""  figcaption:"Snap first switches into corners." %}

{% responsive_image path: images/sofle/IMG_20191109_160157.jpg alt:""  figcaption:"Mount the stand-offs to the top plate." %}

{% responsive_image path: images/sofle/IMG_20191109_160519.jpg alt:""  figcaption:"Carefully snap the first switches to the sockets. Be careful so you don't bend their contacts. Add more." %}

{% responsive_image path: images/sofle/IMG_20191109_160802.jpg alt:""  figcaption:"Until they are all in place." %}

{% responsive_image path: images/sofle/IMG_20191109_160811.jpg alt:""  figcaption:"Double-check the bottom. You should see all the contacts in sockets. "%}

{% responsive_image path: images/sofle/IMG_20191109_161014.jpg alt:""  figcaption:"And mount the bottom plate. "%}

{% responsive_image path: images/sofle/IMG_20191109_161224.jpg alt:""  figcaption:"Completed half of the keyboard waiting for keycaps." %}

{% responsive_image path: images/sofle/IMG_20191109_163910.jpg alt:""  figcaption:"Put at least 4 adhesive rubber feet in the corners so the keyboard is not moving when you type. "%}

{% responsive_image path: images/sofle/IMG_20191201_184929_1.jpg alt:""  figcaption:"The first set of keycaps I used was this cheap DSA set. I didn't like them much but they are affordable. The set on the photo at the beginning of the article is GMK.Oblivion and that's very nice but also very expensive." %}

## Warnings and disclaimers

- Don't connect or disconnect the TRRS cable when the keyboard is powered. It may short out. Always disconnect the USB cable first.
- Be gentle with micro USB ports on your microcontrollers. They are easy to break.
- Keep in mind that this is a prototype of a DIY keyboard. It's not a polished product.

## Firmware and programming

So far the firmware is not part of the QMK Firmware repository. There's also no support for QMK Configurator. Keep also in mind that the layout is tailored to my needs (e.g. default layout is Colemak even though QWERTY is supported) and you'll most likely need to adjust it.

You should be familiar with QMK and be able to make it work on your local environment. If not, please [follow the instructions in the documentation][qmkintro].

- Check out my [fork of QMK repository][sofleqmkroot]: `git clone git@github.com:josefadamcik/qmk_firmware.git`
- Switch to branch `soflekeyboard`: `git checkout soflekeyboard`
- Make sure your QMK environment [is setup][qmkintro].
- Make sure halves are not connected together with TRRS cable.
- Connect one half to USB, flash the firmware: `make sofle:default:avrdude` (you may need to use `sudo` depending on your setup). Use the reset button to reset the keyboard when you are asked to in console.
- Connect the second half and flash it in the same way as the previous one.
- Disconnect the USB cable. Connect both halves together with TRRS cable.
- Connect USB cable to the **left** side[^13]. 
- Enjoy SofleKeyboard!

## Feedback welcome

I would be thrilled to hear when anyone actually decides to build the keyboard and I am also happy to help with any problems you may encounter. I would also welcome any feedback regarding the layout and so on. What do you think? What could be changed? Feel free to contact me through any channel: icons for email, twitter etc. are in both header and footer of this website.

Just keep in mind, please, that this is just a hobby and SofleKeyboard is only an opensource project rather than a commercial product. Therefore, I am not providing anything like commercial customer support.

## Links

- [Github with KiCad projects][soflegithub]
- [Github with a fork QMK firmware for SofleKeyboard][sofleqmk] (not yet in the upstream) (make sure you checkout `soflekeyboard` branch)
- [Layout in KeyboardLayout editor][soflelayout]

## Footnotes and links to components 

Most of the links are to AliExpress and usually are the same I have ordered and used. They are meant for illustration. They are not affiliate links. It seems AliExpress is going to require you to be registered and logged in to see the detail of the product. I discovered that when putting this together and I am sorry for that but it's out of my control.

[^1]: I used [Zilents V2][zilentsv2], silent tactile switches by ZealPC (and made by Gateron) which are very expensive. 
[^2]: Serial is the default behaviour. If serial is used, you don't need TRRS cable (4 contacts, used for headphones with a microphone) but just TRS (stereo audio jack). 
[^3]: [Kailh MX Socket (AliExpress)][kailhsocketmx]
[^4]: [Kailh Choc Socket (AliExpress)][kailhsocketchoc]
[^5]: [1N4148W Diodes in SOD123 package (AliExpress)][diodes]
[^6]: [TRRS connectors (AliExpress)][trrs]
[^7]: [M2 brass spacers kit (AliExpress)][spacers] 
[^8]: [Adhesive rubber feet (AliExpress)][rubberfeet]
[^9]: [OLED display breakout (AliExpress)][oled]
[^10]: [EC11 rotary encoder (AliExpress)][encoder]
[^11]: [Encoder knob (AliExpress)][encoderknob]
[^12]: [Original Pro Micro by SparkFun][promicroorig]. [Clone from AliExpress][promicro]
[^13]: This can be changed, look for [setting handednesss][qmkhandedness] in QMK documentation

[layoutarticle]: {{ site.baseurl }}{% post_url 2019-10-13-in-search-of-the-best-custom-keyboard-layout %} "In search of the best custom keyboard layout"
[introductionarticle]: {{ site.baseurl }}{% post_url 2020-02-25-let-me-introduce-you-sofle-keyboard-split-keyboard-based-on-lily58 %} "Let me introduce you SofleKeyboard - a split keyboard based on Lily58 and Crkbd"
[soflelayout]: http://www.keyboard-layout-editor.com/#/gists/76efb423a46cbbea75465cb468eef7ff "Sofle Keyboard layout at keyboard-layout-editor.com"
[sofleqmk]: https://github.com/josefadamcik/qmk_firmware/tree/soflekeyboard/keyboards/sofle
[soflegithub]: https://github.com/josefadamcik/SofleKeyboard "SofleKeyboard - KiCad project on Github.com"
[soflegerber]: https://github.com/josefadamcik/SofleKeyboard/tree/master/Gerbers "SofleKeyboard - gerber files"
[sofleqmkroot]: https://github.com/josefadamcik/qmk_firmware/ "QMK fork root"
[qmk_firmware]: https://github.com/qmk/qmk_firmware/ "QMK firmware"
{:target="_blank"}
[zilentsv2]: https://zealpc.net/products/zilents "Zilent V2 silent taktile switches by ZealPC"
{:target="_blank"}
[promicroorig]: https://www.sparkfun.com/products/12640 "Pro Micro by SparkFun"
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
{:target="_blank"}
[qmkprotonc]: https://qmk.fm/proton-c/ "QMK Proton-C"
{:target="_blank"}
[promicrosocketing]: <https://docs.splitkb.com/hc/en-us/articles/360011263059> "How do I socket a microcontroller? by splitkb.com"
{:target="_blank"}
[kailhsocketmx]: <https://www.aliexpress.com/item/32951252318.html> "Kailh MX sockets"
{:target="_blank"}
[kailhsocketchoc]: <https://www.aliexpress.com/item/33023283633.html> "Kailh Choc Sockets"
{:target="_blank"}
[diodes]: <https://www.aliexpress.com/item/32334222067.html> "1N4148W SOD123"
{:target="_blank"}
[encoder]: <https://www.aliexpress.com/item/32382989585.html> "Encoder"
{:target="_blank"}
[encoderknob]: <https://www.aliexpress.com/item/32222859399.html> "Encoder Knob"
{:target="_blank"}
[qmkintro]: <https://beta.docs.qmk.fm/newbs/newbs_getting_started> "QMK getting started"
{:target="_blank"}
[qmkhandedness]: <https://beta.docs.qmk.fm/features/feature_split_keyboard#setting-handedness> "QMK firmware - setting handedness"
{:target="_blank"}
[manufacturingproblems]: https://josef-adamcik.cz/electronics/corne-keyboard-build-log.html#manufacturing-at-jlcpcb---update-27112019 "Possible problems when manufacturing top plate for Corne"

