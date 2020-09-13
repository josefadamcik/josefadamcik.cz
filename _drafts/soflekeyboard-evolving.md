---
layout: post
title: SofleKeyboard evolving but slowly
categories: electronics
tags: [keyboards, electronics]
published: true
series: "SofleKeyboard"
image: /images/sofle2/IMG_20200613_150327.jpg
---

It's been half a yer since I published my articles telling a story why and how I modified an existing desing for a split DIY keyboard (Lilly58) and created one tailored to my preferences - SofleKeyboard. I already started to experiment with more modifications.

{% responsive_image path: images/sofle2/IMG_20200613_150327.jpg alt: "SofleKeyboard" %}

<!--more--> 

{%- include post_series.html -%}

## Layout changes

You may have noticed it on the photo above already. The bottom row is moved slightly to the centre and the 3 outer keys are aligned in columns. This allowed me to move outer columns down up bit. The stagger of the main part is a bit more aggressive in general. 

{% responsive_image path: images/sofle2/Comparison1_2.png alt:""  figcaption:"Comparison of layouts - Sofle 1 in orange, Sofle 2(?) in blue" %}

Those are only slight changes, nothing revolutionary. But I have been using the new layout for few months already and I do like it a bit more. I don't feel like I would need to change it more, though.


## Experiments and simplifications

For the original version most of the layout and routing was taken from the Lilly58. I just modified a bottom row a bit and changed how Pro-Micro and other parts are connected.

For the second version, I had to redo the routing. Even the slight modifications I did made too much mess so I decided to do all from scratch. 

In order to make my live easier, I decided to drop support for Kailh Choc switches (for their sockets). It made routing simpler and I am confident I am not going to make another build with Chock switches. I did try the first Sofle version with Kailh Choc Browns (and with few oranges) and the switches are way to heavy for me. I also hate the transparent keycaps mainly how their surface feels. So unless they make tactile and lighter model I am not interested in them[^1].

It is possible I'll return the support in the future, but to be honest I am a bit sceptical if I am ever going to feel motivated to do so.

I also tried to use staggered pin holes for pro-micro. The idea is to layout the row of holes not in perfect line but to stagger them a bit. It is than possible to snap the pin header in without soldering. It's useful maybe to test if the microcontroller works, but I had to solder them in place otherwise some pins were not working.

{% responsive_image path: images/sofle2/SofleKeyboard2_render1.jpg alt:"Render of PCB in KiCad"  figcaption:"Render of the PCB in KiCad" %}

Also, the Pro-Micro has only one socket and needs to be mounted differently on each half. On the left side it's mounted bottom up (as on the original Sofle) and on the right side it's mounted with top up. This would make assembly more error prone and build guide more complex, but it is perfectly fine for a prototype and simplified the routing again.

## Current state and future development

So far I haven't started working on another iteration. There isn't anything I really need to change but also I haven't been feeling like working on the project lately. 

I do think that the current version is highly unfinished and unpolished prototype. It's still opensource, though. So it's technically possible to switch to a branch named "develop" in the git repository and try it out. If you don't know how to switch a branch in a git repository and generate your own gerber files, build rather the first version (or a different keyboard), please.


[^1]: Kailh also have new generation of low-profile  switches which sadly doesn't have compatible footprint and have a MX-like stem (sadly it seems they still don't support most of the MX keycaps). Cherry and Gateron are also going to produce (or maybe event are already) some low-profile switches. So maybe it would make sense to support something else.

