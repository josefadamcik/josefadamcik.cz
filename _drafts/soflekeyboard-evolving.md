---
layout: post
title: "Sofle Keyboard evolution: slow and not really steady"
categories: electronics
tags: [keyboards, electronics]
published: true
series: "SofleKeyboard"
image: /images/sofle2/IMG_20200613_150327.jpg
---

It's been half a year since I published my articles telling a story why and how I modified an existing design for a split DIY keyboard (Lilly58) and created one tailored to my preferences - [SofleKeyboard][sofleweb]. I already started to experiment with more modifications.

{% responsive_image path: images/sofle2/IMG_20200613_150327.jpg alt: "SofleKeyboard" %}

<!--more--> 

{%- include post_series.html -%}

## Sofle v1 in the world

SofleKeyboard got a bit of attention. There were few group buys organized (none of them by myself[^2]). MysticMechs even [designed 3D printed and acrylic cases][mysticsofle]. And [few][soflereddit1] [builds][soflereddit2] [popped][soflereddit3] out on Reddit already. Some people sent me their builds directly or even their modifications and ideas - which is all appreciated.

## Layout changes

You may have noticed it on the photo above already. The bottom row is moved slightly to the centre and the 3 outer keys are aligned in columns. This allowed me to move outer columns down up bit. The stagger of the main part is a bit more aggressive in general. 

{% responsive_image path: images/sofle2/Comparison1_2.png alt:""  figcaption:"Comparison of layouts - Sofle 1 in orange, Sofle 2(?) in blue" %}

Those are only slight changes, nothing revolutionary. But I have been using the new layout for a few months already and I do like it a bit more. I don't feel like I would need to change it more, though.


## Experiments and simplifications

For the original version, most of the layout and routing was taken from the Lilly58. I just modified a bottom row a bit and changed how Pro-Micro and other parts are connected.

For the second version, I had to redo the routing. Even the slight modifications I did make too much mess so I decided to do all from scratch. 

In order to make my life easier, I decided to drop support for Kailh Choc switches (respective their sockets). It made routing simpler and I am confident I am not going to make another build with Choc switches any time soon. I did try the first Sofle version with Kailh Choc Browns (and with few oranges) and the switches are way too heavy for me. I also hated the transparent keycaps I had, mainly how their surface feels. So unless they start making lighter (and still tactile) version, I am not interested in them[^1].

{% responsive_image path: images/sofle2/sofle2kicad.png alt:"Sofle v2 PCB in KiCad"  figcaption:"Sofle v2 PCB in KiCad" %}

I may return the support in the future, but to be honest I am a bit sceptical if I am ever going to feel motivated to do so.

I also tried to use staggered pin holes for pro-micro. The idea is to layout the row of holes not in perfect line but to stagger them a bit. It is then possible to snap the pin header in without soldering. I was hoping it could make it easier for me to iterate through prototypes without soldering or socketing my pro micros. But in the end, it was a failure. It's useful maybe to test the microcontroller. In the end, I had to solder ProMicors in place in order to have a reliable connection.

{% responsive_image path: images/sofle2/SofleKeyboard2_render1.jpg alt:"Render of PCB in KiCad"  figcaption:"Render of the PCB in KiCad" %}

Another slight change was that the Pro-Micro has only one socket and needs to be mounted differently on each half. On the left side, it's mounted bottom-up (as on the original Sofle) and on the right side, it's mounted top-up. This would make assembly more error-prone and build guide more complex, but it is perfectly fine for a prototype and made the routing simpler again.

## Current state and future

So far I haven't started working on another iteration. There isn't anything I would feel a strong urge to change right now. Also, I wasn't in the mood to work on the project lately.

I do think that the current revision of Sofle v2 is a highly unfinished and unpolished prototype. It's still opensource, though. So it's technically possible to switch to the branch named "develop" in the git repository and try it out. If you don't know how to switch a branch in a git repository and generate your own Gerber files, or need a build guide to build the keyboard then build rather the first version (or a [different keyboard][awesomesplit]), please.

I still plan to work on the project in the future but I have no idea when I am going to be in the mood to make further improvements. It can be in a month but also in a year[^3].

## Suggestions welcome, but...

Some people reached out to me and suggested some improvements. That's of course great, I am always interested in learning how people use their keyboards and it is indeed a great source of inspiration. 

However, Sofle was always primarily a keyboard for me, designed to suit my needs. It's opensource because it is heavily based on opensource and I assumed other people might appreciate the opportunity to see how it's made and make their own designs based on this one (in the same way as I used Lilly58, Corne and Helix keyboards). The blog posts I have written are not some marketing support for a product, but stories which might encourage others to dive into the world of DIY keyboards and make their own modifications and designs. Based on what some of you have written to me, it worked.

Nevertheless, SofleKeyboard was never supposed to be a product for others full-filling their needs and wishes. Even though, it makes me quite happy when people like the design and when it suits their needs, it's just a happy coincidence. Not the main reason why I invest my free time to work on the design.

There are designers who a lot of time and money to design great boards as products. They will always do a much better job than I could ever do in my free time. So if you want something well made with users in mind, go and support such designers - one of them is [Thomas Baart from splitkb.com, maker of Kyria][splitkb]. 

If you are ready to get your hands dirty, be my guest. But don't expect me to do the tweaks you dream about for you. 

## Footnotes

[^1]: Kailh also has a new generation of low-profile switches which sadly doesn't have a compatible footprint with version 1. They have an MX-like stem (sadly it seems they still don't support most of the MX keycaps). Cherry and Gateron are also going to produce (or maybe even are, already) some low-profile switches. So maybe it would make sense to support something else.
[^2]: I do not plan to organize any group buy on my own or sell the boards in any other way, except maybe selling the old builds I might stop using in the future.
[^3]: Or never, never is always an option. Keep that in mind.

[splitkb]: <https://splitkb.com/> "splitkb."
{:target="_blank"}
[awesomesplit]: <https://github.com/diimdeep/awesome-split-keyboards> "awesome split keyboards"
{:target="_blank"}
[mysticsofle]: <https://mysticmechs.com/collections/sofle> "MysticMechs sofle"
{:target="_blank"}
[soflereddit1]: <https://www.reddit.com/r/MechanicalKeyboards/comments/ir6gx7/wip_sofle_cyberpunk_build_im_so_stoked_i_got_the/> "Sofle on reddit "
{:target="_blank"}
[soflereddit2]: <https://www.reddit.com/r/MechanicalKeyboards/comments/ieb977/my_red_sun_sofle_samurai/> "Sofle on reddit"
{:target="_blank"}
[soflereddit3]: <https://www.reddit.com/r/MechanicalKeyboards/comments/ie1c22/blackout_sofle/> "Sofle on reddit"
{:target="_blank"}
[sofleweb]: <https://josefadamcik.github.io/SofleKeyboard/> "SofleKeyboard website"
{:target="_blank"}



