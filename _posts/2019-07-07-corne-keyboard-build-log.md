---
layout: post
title: Corne keyboard build log
categories: electronics
published: false
image: /images/crkbd/IMG_20190623_110940.jpg
---

I have already build 
[katana60]({{ site.baseurl }}{% post_url 2019-02-02-buiding-a-custom-keyboard-katana60 %}) - a custom mechanical kebyboard and I use it on daily basis. But there are so many interesting keyboard designs out there. It just too tempting not to build another one.

This time I chose the [Corne Keyboard - or ckrbd](https://github.com/foostan/crkbd) if you want. This one is designed by a guy from Japan who calls himself [foostan](https://twitter.com/foostan).

{% responsive_image path: images/crkbd/IMG_20190623_110940.jpg alt: "" %}

<!--more-->

It's a split keyboard, with staggered layout and 3 rows and 6 columns only. It uses Arduino Pro Micros, has OLED displays and even RGB LED backlight and underglow. I am not really into backlight keyboards, but the support is there.

It's possible to buy PCBs or kits around interned and there are also some [very fancy cases](https://imkulio.com/) for the keyboard. But I was not happy to pay the crazy postage fees I have seen on some websites and I was also interested in getting some experience with manufacturing of PCBs and so on. The keyboard is opensource and there are [KiCad files available for PCB](https://github.com/foostan/crkbd) (there are even several variants). There are 
also some source files for laser cut acrylic case.

## PCBs 

The PCB design is very clever - there's only one PCB which can act as the left side or the right side. You just flip it and solder components properly. There's also a minimalistic case build from PCB - a top plate and bottom plate.

## Other components

The complete list of components is available in [the build guide](https://github.com/foostan/crkbd/blob/master/corne-classic/doc/buildguide_en.md).

But to sum it up:

- A bunch of diodes, one for every switch. The PCB supports both through-hole and SMD. 
- Switches, of course. Either traditional cherry-like or there's also an option to use [low profile swithes from Kailh](http://www.kailh.com/en/Products/Ks/CS/). 
- 2x Arduino Pro Micro or a clone. I think such Arduino (really made by Arduino) actually doesn't exist and the original is actually [made by Sparkfun and is called just Pro Micro](https://www.sparkfun.com/products/12640). Make sure you have 5V variant and when you shop for clones, make sure you are not buying something slightly different. You need ATmega32U4 and build in USB.
- 2x ssd1306 128x32 OLED display module, i2c variant. Check the pictures, but this is the most common one.
- Some M2 spacers and screws
- Rubber feet. Those are very important, I am still waiting for mine and the keyboard is unusable without them. I use a piece of cloth under the keyboard to hot-fix that.)

https://github.com/josefadamcik/qmk_firmware/tree/wip_crkbd/keyboards/crkbd/keymaps/josefadamcik

## Build log

{% include gallery.html galleryname="crkbd" imgclass='imgmw600' %}