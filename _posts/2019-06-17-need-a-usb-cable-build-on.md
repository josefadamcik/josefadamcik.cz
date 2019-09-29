---
layout: post
title: Need a USB cable? Build one!
categories: electronics
published: true
image: /images/usbcable/IMG_20190616_152807.jpg
---

When you have a [custom keyboard]({{ site.baseurl }}{% post_url  2019-02-02-buiding-a-custom-keyboard-katana60 %}) with some nice keycaps and case, you might start to think, what should I customize next? Let's start with the cable which connects my keyboard to my computer!

{% responsive_image path: images/usbcable/IMG_20190616_152807.jpg alt: "" %}

<!--more-->

Honestly, I am far from being original with this idea. There are services where you can order such cable, other people have been building them for ages. If you scroll [Reddit topic for mechanical keyboards](https://www.reddit.com/r/MechanicalKeyboards/) you'll see them all over the place. I have also already made one simple custom USB cable you can find at the end [the post about my custom keyboard]({{ site.baseurl }}{% post_url  2019-02-02-buiding-a-custom-keyboard-katana60 %}).

But since I like to make things I wanted to make another one. I took some photos in the process in order to create a short build log. As usual in my case, this is not meant to be a step-by-step guide, but a little insight into making and inspiration for the dear reader.


## Material

I have included links to Aliexpress. Most of them are the items I actually bought. Those are not affiliate links. They are an example of what you could buy if you wanted to make the same cable.

- 4 wire cable ([Aliexpress](https://www.aliexpress.com/item/5-metre-4-wire-white-black-data-cable-USB-cable-DIY-plug-the-power-for-Phone/32820575748.html)). You can also buy shielded if you want. Keep eye on insulation if you want to coil the cable later - it will most likely not work for silicon (since it is heat resistant), so go for good-old PVC. You can also recycle old USB cables.
- a piece of paracord for sleeving ([Aliexpress](https://www.aliexpress.com/item/250-Colors-Paracord-550-Rope-Type-III-7-Stand-100FT-50FT-25FT-Paracord-Parachute-Cord-Outdoor/32697322289.html))
- heat-shrink tubing
- USB connectors. In my case USB-Mini and USB-A but you can buy USB-Micro and USB-C too. 
    - USB mini connector ([Aliexpress](https://www.aliexpress.com/store/product/5sets-Mini-USB-5PIN-Welding-Type-Male-Plug-Gold-Plated-Connectors-4P-USB-Tail-Socket-3/1777255_32746767709.html))
    - USB-A connector ([Aliexpress](https://www.aliexpress.com/item/5sets-USB-2-0-Type-A-Welding-Type-Male-Plug-Gold-Plated-Connectors-usb-A-Tail/32745824214.html))
- GX12 or GX16 4-pin aviation connector ([Aliexpress](https://www.aliexpress.com/item/1-Set-12mm-Butt-joint-Connector-GX12-2-3-4-5-6-7Pin-Screw-Aviation-Connector/32969250233.html)) for decoration.

## Tools

- Soldering iron and some solder.
- A wood rod for coiling (mine has diameter 10 mm)
- A heat gun ( I have only a cheap DIY-craft one), some people use a hair dryer instead.

## Update: Quality and USB specification

Since the article was featured on [hackaday.com](https://hackaday.com/2019/09/04/the-ultimate-guide-to-artisan-usb-cables/) and posted to [hackernews](https://news.ycombinator.com/item?id=20867276) I feel a need to clarify some things.

This cable is not a high quality USB cable. It is, as many people pointed out in comments on both hackaday.com and hackernews, quite bad USB cable.

- The cable is not shielded.
- The Aviation connector has no function and shouldn't be on the cable. It will affect quality and can cause several kinds of problems. 

I wouldn't try to use such cable for high-speed USB communication nor for high-current charging of other devices. I use it for my [USB 2 (Atmega32u4 based) keyboard]({{ site.baseurl }}{% post_url  2019-02-02-buiding-a-custom-keyboard-katana60 %}) on daily basis and it works well. If you really want a high quality cable, go buy one, don't build it or at least not like I did - use shielded cable, skip Aviation connector and [read the spec](https://www.usb.org/sites/default/files/CabConn20.pdf). You can also go and read discussions under the articles above, some people actually share some information and not just the snarky "I-am-the-only-one-smart-here-and-you-all-are-stupid" kind of remarks.

## Build log

{% include gallery.html galleryname="usbcable" imgclass='imgmw600' %}

