---
layout: post
title: Corne keyboard build log
categories: electronics
published: false
image: /images/crkbd/IMG_20190623_110940.jpg
---

I have already build 
[katana60]({{ site.baseurl }}{% post_url 2019-02-02-buiding-a-custom-keyboard-katana60 %}) - a custom mechanical keyboard and I use it on daily basis. But there are so many interesting keyboard designs out there. It just too tempting not to build another one.

This time I chose the [Corne Keyboard - or ckrbd](https://github.com/foostan/crkbd) if you want. This one is designed by a guy from Japan who calls himself [foostan](https://twitter.com/foostan).

{% responsive_image path: images/crkbd/IMG_20190623_110940.jpg alt: "" %}

<!--more-->

It's a split keyboard, with staggered layout and 3 rows and 6 columns only. It uses Arduino Pro Micros, has OLED displays and even RGB LED back-light and under-glow. I am not really into back-light keyboards, but the support is there.

It's possible to buy PCBs or kits on internet and there are also some [very fancy cases](https://imkulio.com/) for the keyboard. But I was not happy to pay the crazy postage fees I have seen on some websites and I was also interested in getting some experience with manufacturing of PCBs and so on. The keyboard is open-source and there are [KiCad files available for PCB](https://github.com/foostan/crkbd) (there are even several variants). There are 
also some source files for laser cut acrylic case.

## PCBs 

The PCB design is very clever - there's only one PCB which can act as the left side or the right side. You just flip it and solder components properly. 

{% responsive_image path: images/crkbd/crkbdpcb.png alt: "Double sided PCB." figcaption: "Double sided PCB." %}

There's also a minimalistic case build from PCB - a top plate and bottom plate.

{% responsive_image path: images/crkbd/crkbdpcbtop.png alt: "The top plate." figcaption: "The top plate."%}

This helps a lot with manufacturing. There are many vendors which offer cheap PCB prototypes starting at 5 pieces. For example [JLCPCB](https://jlcpcb.com/) offers 5 PCBs up to 10x10 cm for 2$ plus shipping. Crkbd is still a bit bigger than 10 cm but the PCBs costed still less than 8€. The whole order - 5 PCBs, 5 top plates and 5 bottom plates - was 31€ including slow shipping to Germany. Manufacturing was very quick and the shipping took 2 weeks. This is insanely cheap and I have enough for 2.5 keyboards.

{% responsive_image path: images/crkbd/IMG_20190614_195434.jpg alt: "PCBs as they arrived." figcaption: "PCBs as they arrived." %}

## Other components

The complete list of components is available in [the build guide](https://github.com/foostan/crkbd/blob/master/corne-classic/doc/buildguide_en.md).

But to sum it up:

- A bunch of diodes, one for every switch. The PCB supports both through-hole and SMD. 
- Switches, of course. Either traditional cherry-like or there's also an option to use [low profile swithes from Kailh](http://www.kailh.com/en/Products/Ks/CS/). I have used [Aliaz silent tactile switches](https://kbdfans.com/products/pre-orderaliaz-silent-switch-tactile) this time. I think I like their tactility much more than boring linarity of Gateron Silent Blacks I have on my Katana60.
- RGB LEDs if you want some lighting. See below for my failure regarding those.
- 2x Arduino Pro Micro or a clone. I think such Arduino (really made by Arduino) actually doesn't exist and the original is actually [made by Sparkfun and is called just Pro Micro](https://www.sparkfun.com/products/12640). Make sure you have 5V variant and when you shop for clones, make sure you are not buying something slightly different. You need ATmega32U4 and build in USB connetors.
- 2x ssd1306 128x32 OLED display module, i2c variant. Check the pictures, but this is the most common you'll find.
- Some M2 spacers and screws.
- Rubber feet. Those are very important, I am still waiting for mine and the keyboard is hard to use without them. I use a piece of cloth under the keyboard in order to hot-fix that.
- The rest: TRRS connectors, TRRS cable, some pin headers, some pin sockets if you want to, tactile buttons, keycaps.


## RGB LEDs

Even though, I am not really into RGB backlit keyboards I decided to give it a try. 

The documentation says you need [SK6812MINI RGB LEDs](https://cdn-shop.adafruit.com/product-files/2686/SK6812MINI_REV.01-1-2.pdf). Those are very similar to famous WS2812 LEDs but they are in a smaller package (3535) and use a different IC internally. But the way how you use them is the same.

But as I was trying to find the on Aliexpress I stumbled upon LEDs which were presented as "SK6812 WS2812B IC Bulit in 5050 3535 RGB SMD Addressable Digital RGB Full Color LED Chip Pixels Bead DC5V". I assumed that the 3535 variant is the SK6812MINI I was looking for and ordered them.

I was wrong. What I've got is [WS2812B-mini or some clone](http://www.normandled.com/upload/201607/WS2812B%20Mini%203535%20LED%20Datasheet.pdf). Unfortunatelly the pinout is different and therefore they cannot be used with Corne. Therefore my build is without any lighting. 

Another thing to note is that many people report that those are hard to solder and are easily damaged by heat. WS2812B-mini are supposed to be actually better in this regard. So maybe I'll try to change Corne's PCB design to utilise WS2812B-mini.

## Layout - Work in progress

Corne has much less keys than my Katana60. I am still curious if I will be able to get used to it. The plan is to create a layout which is kind of close to my current Katana60. I have already started using it at home. For work I am going to keep using Katana60. My [Katana60
layout](https://github.com/qmk/qmk_firmware/tree/master/keyboards/katana60/keymaps/josefadamcik) has, at the moment, 4 configurations I can switch in runtime - Colemak Mac, Colemak Win, QWERTY Mac and QWERTY Win. I am going to add another configuration which will mimick my Corne layout - all keys which are not present on Corne will be deactivated and the remaining will do exactly the same. This will allow me to start getting used to the layout in work too while still having the ability to switch to the old layout and stay productive. As soon as (and if) it flips and I am more productive with Corne I'll take it to work and build another one for home.

So far [my layout (qmk source) can be found here](https://github.com/josefadamcik/qmk_firmware/tree/wip_crkbd/keyboards/crkbd/keymaps/josefadamcik). 



## Build log

{% include gallery.html galleryname="crkbd" imgclass='imgmw600' %}