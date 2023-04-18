---
layout: post
title: "Stáňa - a monoblock split keyboard, part 2"
categories: electronics
tags: [keyboards, electronics]
published: true
series: "SofleKeyboard"
image: images/stana/PXL_20230408_144509922.jpg
summary: "The first version is assembled and it has a 3D printed case already, what is next?"
---

The PCBs arrived in a little bit over a week since I wrote [the last post][stanalast].


{% responsive_image path: images/stana/PXL_20230406_120606340.jpg  alt:"" figcaption: "Stáňa the Bat with v0.1 PCB prototypes" %}

I soldered together one PCB, it was a quick job. Whipping together a QMK firmware and porting my actuall keymap from Sofle was quicker then I anticipated. QMK is truly an awesome project. Adding new keyboard is really almost no work nowadays. You can see the commit on [my QMK fork][stanafw]. It's obviously too soon to push this to upstream.


{% responsive_image path: images/stana/PXL_20230408_141640426.jpg  alt:"" figcaption: "Assembling the keyboard" %}

## Sunset Chocs and LDSA keycaps

Both [the switches][sunset] and the [keycaps][ldsas] are  produced by [lowprokb.ca](https://lowprokb.ca/). I got them some time ago in a group buy and they were one of the reasons why I wanted to try the low profile again.

I must mention that my main keyboards had Zilents, silent tactile switches from Zeal, 62g (the lightest) variant. The are far from cheapest and I am very used to them. They are quiet and the tactility is very crisp. The keycaps I am used to are Oblotzky GMK Oblivion and KAT Milkshake, both very nice premium sets from group buys. 

Sunsets seem rather loud when compared to zilents, which is no surprise since they are not designed to be silent. But it certainly takes some using to. They feel heavier than the Zilents and the tactility doesn't have as nice feel as Zilents.  That said, they are certainly way better than Coch Browns which I tried years ago. I have spent some time typing on them and I got used to it and I like them.


{% responsive_image path: images/stana/PXL_20230408_144509922.jpg  alt:"" figcaption: "The bare keyboard assembled" %}

The LSDA keycaps are very nice. They don't feel as nice as my Oblivion and Milkshake (the plastic does feel "cheaper") but they are nicely sculpted and after some time I ended up enjoying them. I haven't tried MBK keypas yet, but I ordered a set to try it out. 

Overall it's a huge win. Those products together opened for me the world of low profile keyboards which I am very intriqued to explore. A I already wrote last time, my original experience with Choc Browns and the original keycaps from Kailh was so terrible I dropped support for Chocs when working on Sofle V2. 


## Layout 

The layout is tighter. Suprisingly my fingers adjusted quite quickly and I don't have any issues with misstyping (not more than I had on Sofle). 

I am thinking about trying to do more aggresive pinkie stagger. One of the things people often mentioned they would like to see for Sofle as well. Also a little bit bigger gap between hands and maybe a little bit bigger angle.

{% responsive_image path: images/stana/PXL_20230408_144737583.jpg  alt:"" figcaption: "Stáňa with Stáňa v0.1" %}

Interesting thing is that I do miss one of the encoders. My left rotary encoder on Sofle is mapped to volume controll and aparently I had been using it more often than I realized. My hand keeps reaching for it when I need to quickly adjust volumu, but there's nothing on the board. That's certainl something that's not that hard to unlearn, but I might add the footprint to the next iteration.


## 3D printed Case

{% responsive_image path: images/stana/case_fusion1.png  alt:"" figcaption: "Design in Fusion360" %}

I spent some time desinging an enclosure for the keyboard. I had some experience with Fusion360 already but this was my first attempt to design a keyboard case. The thing with CADs is that you really have to spend time with them to be able to design things in a reasonably efficient way. This first attempt was full of struggle and the source file is a mess. But I am happy with the result. I learned a lot and I have much better idea how to approach the design next time. I plan to have a possibility to add mods (display, trackpad, etc) to the middle so the middle cover can be eaisly redesigned and replaced as needed. 

{% responsive_image path: images/stana/PXL_20230418_123235387.jpg  alt:"" figcaption: "Simple black case from 5 pices" %}

It's been a long time since I used my Prusa MINI. I had some trouble with getting the parts to print without warping and lifting from bed and still haven't fully figured out how to deal with shrinking (how to compensate or desing parts so they have good fit).

{% responsive_image path: images/stana/PXL_20230418_123305561.jpg  alt:"" figcaption: "The fit at the bottom is not perfect." %}

I also tried "manual" multimaterial extrussion to have a logo on the fron. Not really fun, I messud up so many times that I lost count. I don't think I am going to try this again. 

{% responsive_image path: images/stana/PXL_20230418_124630105.jpg  alt:"" figcaption: "Variant with logo" %}

I am looking forward to trying out some 3D printing service and having the case printed with a different technology than FDM (SLS maybe?) but I think I'll will keep this for one of the future iterations. 

## Plans for v0.2

There's plenty of things I would like to try. Some of them might be reversed in the future.

- Add 10-15 mm between the halves, just to have the hands a little bit more far away and have more room for components / mods in the middle.
- Try to angle the halves a bit more.
- Try more aggressive pinkie stagger (the two outer columns)
- Add possibility to mount a rotary encoder in the middle of the board.
- Switch the matrix from 12x5 to 10x6 (saves one pin).
- Add connectors for Cirque Trackpad and some display on the board.

For now I am going to stay with RP2040. The wireless iteration is going to come later, once I am sure about the layout. 

{% responsive_image path: images/stana/PXL_20230418_123254737.jpg  alt:"" figcaption: "Stáňa and Sofle" %}


## Is Stáňa open source? 

Not yet, but it will be. Rigt now the design exists only in my private repository. I'll publish it once it gets through few iterations. So far there's nothing special that special about it and I would prefert to publish it in some reasonable state (pick some actually open hardware licence, do somedocumentation, make sure design files are not a terrible mess, etc).


[sofleweb]: <https://josefadamcik.github.io/SofleKeyboard/> "SofleKeyboard website"
{:target="_blank"}

[stanalast]: <{{ site.baseurl }}{% post_url 2023-03-27-sofle-unsplit-stana-keyboard %}> "Stana keyboard"

[stanafw]: <https://github.com/josefadamcik/qmk_firmware/commit/bd14f6d558c5f23b3fb6766a8f91fb45a46b304a> "Commit with stana firmware to QMK"
{:target="_blank"}

[sunset]: <https://lowprokb.ca/products/sunset-tactile-choc-switches> "Sunset switches"
{:target="_blank"}

[ldsa]: <https://lowprokb.ca/collections/keyboards/products/ldsa-low-profile-blank-keycaps> "LDSA keycaps"
{:target="_blank"}

[nice]: <https://nicekeyboards.com/nice-nano/> "Nice!Nano"
{:target="_blank"}
[waveshare]: <https://www.waveshare.com/rp2040-zero.htm> "WaveShare RP2040 zero"
{:target="_blank"}
[sofatko]: <https://www.instagram.com/sophiehardy5/> "Anna Marklová (Instagram)"
{:target="_blank"}
[tiktok]: <https://www.tiktok.com/@alexejthepinguin> "Alexej The Penguin and Stáňa on TikTok"
{:target="_blank"}