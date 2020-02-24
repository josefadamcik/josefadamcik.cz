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

## Bill of materials

Apart from PCBs and plates the following is needed to build the keyboard. For most of the components there are links to the AliExpress (just click on the small number which will lead you to the corresponding footnote).

- **58 keyboard switch sockets by Kailh**. The PCB supports either sockets for traditional MX switches[^3] or sockets for Kailh Choc switches[^4] (low profile mechanical switches). They are available on Aliexpress, KBDFans and others.
- **58 keyboard switches** of your preference[^1], either MX or [Kailh Choc][choc]. Just make sure you have matching sockets for them.
- **58 keycaps**. You can use either all in `1u` size but it looks nicer with two `1.5u` for thumb keys.
- **58 diodes  1N4148W**. They are surface mount diodes in SOD123 package.[^5]
- **2 TRRS connectors**. The same are used for Corne, Lily58 etc. Technically even TRS should work[^2] if you stick to (default) serial communication. [^6]
- **1 TRRS cable**. TRS should work[^2] if you stick with Serial. 
- **10 (+4) M2 spacers**. 10 are going to hold bottom and top together. Their height depends on which switches you use. A build guide Lily58 Pro suggests `4mm` for Choc and `7mm` for MX. I was not able to get `7mm`, but `6mm` worked well for me with MX switches. I used brass ones but you can also buy nicer from anodised aluminium. Another 4 would be needed to hold transparent OLED cover but even though there are mounting holes in the PCB there is no OLED cover designed yet.[^7]
- **20 (+8) M2 screws**. 20 are going to hold the boards together (via spacers). I used some I had in my stock so I am not going to tell you exact length. But they need to be long enough to fix a `1.6mm` thick PCB to the spacer and short enough so two of them are able to fit in one spacer (might be trickier with 4mm spacers for Choc switches)
- **8 - 10 adhesive rubber feet** They are really important, trust me. .[^8]
- **2 ssd1306 128x32 OLED display module** Very common everywhere. [^9]
- **2 Rotary encoders EC11** optional. So far I have used only 1 but 2 are supported too. A matching knob for each encoder. [^10]
- **2 Pro Micro** or clone. With 2x12 pins and ATmega32U4 microcontroller. Just make sure you **don't** buy something like Arduino Micro (a different pinout) or Arduino Mini (different microcontroller). You could also use Elite-C which bascially Pro Micro with USB-C or QMK Proton C(32-bit Cortex-M4 processor and USB-C). [^11]
- **4x12 pin header (and optionally socket)** for Pro Micros. There are several ways how to mount Pro Micros to the board. Either the male PIN headers you most likely got with the board from supplier could be used to solder it directly to the board. Build guides for Helix, Corne and Lily58 suggest [those spring pin headers][springpinheader] which are very compact and give you non-permanent connection (you can remove or replace Pro Micros). But the link goes to a Japanese e-shop which is not shipping to Europe. I haven't found any other place where those are available. All I can find is Japanese datasheet and this e-shop. I ended up using low-profile round pin headers which take a bit more height but also allow me to remove Pro Micros and use them elsewhere. But for Corne I just soldered them permanently. Another possible approach [is described at splitkb.com][promicrosocketing].
- **2x4 pin header (and optionally socket)** for OLEDs. I have used the most common 1x4 female pin sockets which are quite tall but they also fit the height of ProMicro with the sockets I have used. Unfortunately the pin headers on my OLED modules (again those very common square male headers you would get with the modules) are loose in the sockets. It works but it's fiddly. I'll have to find better solution.
- **Micro USB Cable** to connect the keyboard to computer.

That's it. There are no RGB LDS on the board. But if you really need underglow it should be possible to connect RGB LED strip since there are 3 pads (VCC, GND and one signal for driving) on the board. You would need to figure out the particular parts in firmware on your own.

## Steps

This is partly build log and partly build guide (until there's a proper one [on Github][soflegithub]).

{% responsive_image path: images/sofle/IMG_20191106_185738.jpg alt:"Step 1"  figcaption:"Both sides of the keyboard ready. The front sides marked by pieces of tape in order to remember which side is which. " %}

{% responsive_image path: images/sofle/IMG_20191106_193937.jpg alt:""  figcaption:"Starting with the diodes. They belong the the back side of the PCB. Make sure you have orientation right - they are all oriented to the same side. The end with thin line is Cathode (-) and it should go in the direction of the "arrow" symbol on the PCB." %}

{% responsive_image path: images/sofle/IMG_20191106_203953.jpg alt:""  figcaption:"Sockets for switches belong again on the back side, the same side as diodes. Make sure they are flush with PCB." %}

{% responsive_image path: images/sofle/IMG_20191106_204348.jpg alt:""  figcaption:"Button and TRRS sockets belong to the top. Use a piece of tape to fix them and apply solder from the bottom side." %}

{% responsive_image path: images/sofle/IMG_20191106_204324.jpg alt:""  figcaption:"This is how the right half should look from the top. "%}

{% responsive_image path: images/sofle/IMG_20191106_205330.jpg alt:""  figcaption:"Bridge 4 jumper pads on the top side. You can skip this step if you are sure you don't want to use OLED displays." %}

{% responsive_image path: images/sofle/promicro.jpg alt:""  figcaption:"Prepre the Pro Micro. There are several ways how to do it. I have used rounded pin headers." %}

{% responsive_image path: images/sofle/IMG_20191106_210048.jpg alt:""  figcaption:"And corresponding sockets on the front side of the board. Make sure you insert them into holes which are marked by rectangle." %}

{% responsive_image path: images/sofle/IMG_20191106_211040.jpg alt:""  figcaption:"Another socket for OLED display." %}

{% responsive_image path: images/sofle/IMG_20191106_211048.jpg alt:""  figcaption:"A look on the back side." %}

{% responsive_image path: images/sofle/IMG_20191106_212042.jpg alt:""  figcaption:"Now it is already possible to connect the ProMicro and OLED display to the board, flash the firmware and check if all keys work using a piece of wire or tweezers." %}

{% responsive_image path: images/sofle/IMG_20191109_153340.jpg alt:""  figcaption:"Both halves assembled, a rotary encoder can be added on both, one or none. I have also cleaned flux residue from the back side using some isopropylalcohol, cotton buds and paper towels." %}

{% responsive_image path: images/sofle/IMG_20191109_154009.jpg alt:""  figcaption:"Snap first switches into corners." %}

{% responsive_image path: images/sofle/IMG_20191109_160157.jpg alt:""  figcaption:"Mount the stand-offs to the top plate." %}

{% responsive_image path: images/sofle/IMG_20191109_160519.jpg alt:""  figcaption:"Carefully snap the first switches to the sockets. Be careful so you don't bend their contacts. Add more." %}

{% responsive_image path: images/sofle/IMG_20191109_160802.jpg alt:""  figcaption:"Until they are all in place." %}

{% responsive_image path: images/sofle/IMG_20191109_160811.jpg alt:""  figcaption:"Double check the bottom. You should see all the contacts in sockets. "%}

{% responsive_image path: images/sofle/IMG_20191109_161014.jpg alt:""  figcaption:"And mount the bottom plate. "%}

{% responsive_image path: images/sofle/IMG_20191109_161224.jpg alt:""  figcaption:"Finished half of the keyboard waiting for keycaps." %}

{% responsive_image path: images/sofle/IMG_20191109_163910.jpg alt:""  figcaption:"Put at least 4 adhesive rubber feet in corner so the keyboard is not moving when you type. "%}

{% responsive_image path: images/sofle/IMG_20191201_184929_1.jpg alt:""  figcaption:"The first set of keycaps I used was this cheap DSA set. I didn't like them much but they are affordable. The set on the photo at the beginning of the article is GMK.Oblivion and that's very nice but also very expensive." %}

## Firmware and programming

TODO:


## Links for components

Most of the links are to AliExpress and usually are the same I have ordered and used. They are meant for illustration. They are not affiliate links.

[^3]: [Kailh MX Socket (AliExpress)][kailhsocketmx]
[^4]: [Kailh Choc Socket (AliExpress)][kailhsocketchoc]
[^5]: [1N4148W Diodes in SOD123 package (AliExpress))][diodes]
[^6]: [TRRS connectors (AliExpress)][trrs]
[^7]: [M2 brass spacers kit (AliExpress)][spacers] 
[^8]: [Adhesive rubberfeet (AliExpress)][rubberfeet]
[^9]: [OLED display breakout (AliExpress)][oled]
[^10]: [EC11 rotary encoder (AliExpress)][encoder]
[^11]: [Original Pro Micro by SparkFun][promicroorig]. [Clone from AliExpress][promicro]

## Footnotes

[^1]: I used [Zilents V2][zilentsv2], silent tactile switches by ZealPC (and made by Gateron) which are very expensive. 
[^2]: Serial is the default behaviour. If serial is used, you don't need TRRS cable (4 contacts, used for headphones with microphone) but just TRS (stereo audio jack). 


<!--more--> 

{%- include post_series.html -%}

[layoutarticle]: {{ site.baseurl }}{% post_url 2019-10-13-in-search-of-the-best-custom-keyboard-layout %} "In search of the best custom keyboard layout"
[introductionarticle]: {{ site.baseurl }}{% post_url 2020-02-25-let-me-introduce-you-sofle-keyboard-split-keyboard-based-on-lily58 %} "Let me introduce you SofleKeyboard - a split keyboard based on Lily58 and Crkbd"
[soflelayout]: http://www.keyboard-layout-editor.com/#/gists/76efb423a46cbbea75465cb468eef7ff "Sofle Keyboard layout at keyboard-layout-editor.com"
[sofleqmk]: https://github.com/josefadamcik/qmk_firmware/tree/soflekeyboard/keyboards/sofle
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
[qmkprotonc]: https://qmk.fm/proton-c/ "QMK Proton-C"
[promicrosocketing]: <https://docs.splitkb.com/hc/en-us/articles/360011263059> "How do I socket a microcontroller? by splitkb.com"
{:target="_blank"}
[kailhsocketmx]: <https://www.aliexpress.com/item/32951252318.html> "Kailh MX sockets"
[kailhsocketchoc]: <https://www.aliexpress.com/item/33023283633.html> "Kailh Choc Sockets"
[diodes]: <https://www.aliexpress.com/item/32334222067.html> "1N4148W SOD123"
[encoder]: <https://www.aliexpress.com/item/32382989585.html> "Encoder"
[encoderknob]: <https://www.aliexpress.com/item/32222859399.html> "Encoder Knob"


