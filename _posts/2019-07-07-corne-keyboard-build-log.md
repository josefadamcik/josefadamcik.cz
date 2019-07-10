---
layout: post
title: Corne keyboard
categories: electronics
published: false
image: /images/crkbd/IMG_20190623_110940.jpg
---

I have build 
[katana60]({{ site.baseurl }}{% post_url 2019-02-02-buiding-a-custom-keyboard-katana60 %}) - a custom mechanical keyboard - a few months ago and I use it on a daily basis. But there are so many interesting keyboard designs out there. It just too tempting not to build another one.

This time I chose the [Corne Keyboard - or ckrbd](https://github.com/foostan/crkbd) if you want. This one is designed by a guy from Japan who calls himself [foostan](https://twitter.com/foostan).

{% responsive_image path: images/crkbd/IMG_20190623_110940.jpg alt: "" %}

<!--more-->

It's a split keyboard, with a staggered layout and 3 rows and 6 columns only. It uses Arduino Pro Micros, has OLED displays and even RGB LED backlight and underglow. I am not really into backlit keyboards, but the support is there.

It's possible to buy PCBs or kits on the internet and there are also some [very fancy cases](https://imkulio.com/) for the keyboard. But I was not happy to pay the crazy postage fees I have seen on some websites and I was also interested in getting some experience with manufacturing of PCBs and so on. The keyboard is open-source and there are [KiCad files available for PCB](https://github.com/foostan/crkbd) (there are even several variants). There are 
also some source files for a laser-cut acrylic case.

## PCBs 

The PCB design is very clever - there's only one PCB which can act as the left side or the right side. You just flip it and solder components properly. 

{% responsive_image path: images/crkbd/crkbdpcb.png alt: "Double sided PCB." figcaption: "Double-sided PCB." %}

There's also a minimalistic case build from PCB - a top plate and bottom plate.

{% responsive_image path: images/crkbd/crkbdpcbtop.png alt: "The top plate." figcaption: "The top plate."%}

This helps a lot with manufacturing. There are many vendors which offer cheap PCB prototypes starting at 5 pieces. For example, [JLCPCB](https://jlcpcb.com/) offers 5 PCBs up to 10x10 cm for 2$ plus shipping. Crkbd is a bit bigger than 10 cm but the PCBs cost still less than 8€. The whole order - 5 PCBs, 5 top plates and 5 bottom plates - was 31€ including slow shipping to Germany. Manufacturing was very quick and the shipping took 2 weeks. This is insanely cheap and I have enough parts for 2.5 keyboards.

{% responsive_image path: images/crkbd/IMG_20190614_195434.jpg alt: "PCBs as they arrived." figcaption: "PCBs as they arrived." %}

## Other components

The complete list of components is available in [the build guide](https://github.com/foostan/crkbd/blob/master/corne-classic/doc/buildguide_en.md).

But to sum it up:

- A bunch of diodes, one for every switch. The PCB supports both through-hole and SMD. 
- Switches, of course. Either traditional cherry-like or there's also an option to use [low profile switches from Kailh](http://www.kailh.com/en/Products/Ks/CS/). I have used [Aliaz silent tactile switches](https://kbdfans.com/products/pre-orderaliaz-silent-switch-tactile) this time. I think I like their tactility much more than the boring linearity of Gateron Silent Blacks which I have on my Katana60.
- RGB LEDs if you want some lighting. See below for my failure regarding those.
- 2x Arduino Pro Micro or a clone. I think such Arduino (really made by Arduino) actually doesn't exist and the original is actually [made by Sparkfun and is called just Pro Micro](https://www.sparkfun.com/products/12640). Make sure you have 5V variant and if you shop for clones, make sure you are not buying something different. You need ATmega32U4 and a build in USB connector.
- 2x ssd1306 128x32 OLED display module, i2c variant. Check the pictures, but this is the most common you'll find.
- Some M2 spacers and screws.
- Rubber feet. Those are very important, I am still waiting for mine and the keyboard is hard to use without them. I use a piece of cloth under the keyboard in order to hot-fix tilting on the screw-heads in the bottom when I press a key in the top row.
- The rest: TRRS connectors, TRRS cable, some pin headers, some pin sockets if you want to, tactile buttons, keycaps.


## RGB LEDs

Even though, I am not really into RGB backlit keyboards I decided to give it a try. 

The documentation says you need [SK6812MINI RGB LEDs](https://cdn-shop.adafruit.com/product-files/2686/SK6812MINI_REV.01-1-2.pdf). Those are very similar to the famous WS2812 LEDs but they are in a smaller package (3535) and use a different IC. But the way how one use them is the same.

But as I was trying to find them on Aliexpress I stumbled upon LEDs which were presented as "SK6812 WS2812B IC Bulit in 5050 3535 RGB SMD Addressable Digital RGB Full Color LED Chip Pixels Bead DC5V". I assumed that the 3535 variant is the SK6812MINI I was looking for and ordered them.

I was wrong. What I've got is [WS2812B-mini or some clone](http://www.normandled.com/upload/201607/WS2812B%20Mini%203535%20LED%20Datasheet.pdf). Unfortunately, the pinout is different and therefore they cannot be used with Corne. Therefore my build is without any lighting. 

Another thing to note is that many people report that those are hard to solder and are easily damaged by heat. WS2812B-mini are supposed to be actually better in this regard. So maybe I'll try to change Corne's PCB design to utilize WS2812B-mini.

## Plans

I need to figure out and learn the new layout. I will most likely write another post about that soon.

If the keyboard becomes my daily driver and I really like it, I am going to build a second one. I'll (most likely) go for [an acrylic case with tilting support](https://github.com/foostan/crkbd/tree/master/corne-classic/acrylic_plate). I think it'll bee a good opportunity to gather some experience with laser cutting services.

## Build log

{% include gallery.html galleryname="crkbd" imgclass='imgmw600' %}