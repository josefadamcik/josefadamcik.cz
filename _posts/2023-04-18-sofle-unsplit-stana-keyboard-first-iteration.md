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

The PCBs have arrived over a week since I wrote [the last post][stanalast].


{% responsive_image path: images/stana/PXL_20230406_120606340.jpg  alt:"" figcaption: "Stáňa the Bat with v0.1 PCB prototypes" %}

I soldered together one PCB. It was a quick job. Putting together a QMK firmware and porting my current keymap from Sofle was faster than I anticipated. QMK is truly an awesome project. Adding a new keyboard is almost no work. You can see the commit on [my fork of QMK][stanafw]. 

{% responsive_image path: images/stana/PXL_20230408_141640426.jpg  alt:"" figcaption: "Assembling the keyboard" %}

## Sunset Chocs and LDSA keycaps

Both [the switches][sunset] and the [keycaps][ldsa] are produced by [lowprokb.ca][lowprokb]. I got them some time ago in a group buy, and they were one of the reasons why I wanted to try the low profile again.

I must mention that my main keyboards have Zilents, silent tactile switches from Zeal, 62g (the lightest) variant. They are quiet and, their tactility is very crisp. I am used to them a lot. The keycaps I use are Oblotzky GMK Oblivion and KAT Milkshake, both very nice premium sets from group buys. 

Sunsets seem rather loud compared to Zilents, which is no surprise since they are not designed to be silent. But it certainly took some getting used to. They feel heavier than the Zilents, and the tactility doesn't have as lovely feel as Zilents. That said, they are certainly way better than Choc Browns which I tried years ago. I am pretty happy with them now since I got used to them.

{% responsive_image path: images/stana/PXL_20230408_144509922.jpg  alt:"" figcaption: "The bare keyboard assembled." %}

The LSDA keycaps are pretty nice. They don't feel as good as my Oblivion and Milkshake (the plastic does feel different), but I like the profile, and after some time, I ended up enjoying them. I haven't tried MBK keycaps yet, but I ordered a set to try them out.

Overall it's a huge win. Those products together opened the world of low-profile keyboards for me, which I am very intrigued to explore. My original experience with Choc Browns and the original keycaps from Kailh was so terrible I gave up on low profile completely, so I am glad I can change my mind.  


## Layout 

The layout is tighter (so-called Choc spacing, 18mm x 17mm). Surprisingly my fingers adjusted quite quickly, and I don't have any issues with mistyping (not more than I had on Sofle). 

I am thinking about trying to do a more aggressive pinkie stagger. One of the things people often mentioned they would like to see for Sofle as well. Also, a bigger gap between hands and maybe a wider angle as well.

{% responsive_image path: images/stana/PXL_20230408_144737583.jpg  alt:"" figcaption: "Stáňa with Stáňa v0.1" %}

The interesting thing is that I do miss one of the encoders. My left rotary encoder on Sofle is mapped to volume control and apparently, I had been using it more often than I realized. My hand keeps reaching for it when I need to quickly adjust the volume, but there's nothing on the board. That's something that's not that hard to unlearn, but I might add a footprint for a rotary encoder to the next iteration.


## 3D printed case

{% responsive_image path: images/stana/case_fusion1.png  alt:"" figcaption: "Design in Fusion360" %}

I spent some time designing an enclosure for the keyboard. I already had some experience with Fusion360, but this was my first attempt to design a keyboard case. The thing with CADs is that you have to spend time with them to be able to design things in a reasonably efficient way. This first attempt was full of struggle, and the source file is messy. But I am happy with the result. I learned a lot, and I have a much better idea of how to approach the design next time. I plan to have the possibility to add mods (display, trackpad, etc.) to the middle so the middle cover can be easily redesigned and replaced as needed. 

{% responsive_image path: images/stana/PXL_20230418_123235387.jpg  alt:"" figcaption: "Simple black case from 5 parts" %}

It's been a long time since I used my Prusa MINI. I had some trouble with getting the parts to print without warping and lifting from the bed and still haven't fully figured out how to deal with shrinking (how to compensate or how to design the parts so they have a good fit).

{% responsive_image path: images/stana/PXL_20230418_123305561.jpg  alt:"" figcaption: "The fit at the bottom could be better." %}

I also tried "manual" multi-material extrusion to have the logo on the front. I messed up so many times that I lost count. I don't think I am going to try this again. 

{% responsive_image path: images/stana/PXL_20230418_124630105.jpg  alt:"" figcaption: "Variant with logo" %}

I would like to try out some 3D printing service and have the case printed with a different technology than FDM (SLS maybe?) but I think I will keep this for one of the future iterations. 

## Plans for v0.2

There are plenty of things I would like to try. Some of them might be reversed in the future.

- Add 10-15 mm between the halves, just to have the hands a little bit farther away and have more room for components/mods in the middle.
- Try to angle the halves a bit more.
- Try a more aggressive pinkie stagger.
- Add the possibility of mounting a rotary encoder in the middle of the board.
- Switch the matrix from 12x5 to 10x6 (saves one pin).
- Add connectors for Cirque Trackpad and some display to the board.
- Different placement for the mounting holes.

For now, I am going to stay with RP2040. The wireless iteration is going to come later once I am sure about the layout. 

{% responsive_image path: images/stana/PXL_20230418_123254737.jpg  alt:"" figcaption: "Stáňa and Sofle" %}


## Is Stáňa open source? 

Not yet, but it will be. Right now, the design exists only in my private repository. I'll publish it once it gets through a few iterations. So far, there's nothing special about it, and I would prefer to publish it in some reasonable state (pick some open hardware license, document it, make sure design files are not a terrible mess, etc.).


[sofleweb]: <https://josefadamcik.github.io/SofleKeyboard/> "SofleKeyboard website"
{:target="_blank"}

[stanalast]: <{{ site.baseurl }}{% post_url 2023-03-27-sofle-unsplit-stana-keyboard %}> "Stana keyboard"

[stanafw]: <https://github.com/josefadamcik/qmk_firmware/commit/bd14f6d558c5f23b3fb6766a8f91fb45a46b304a> "Commit with stana firmware to QMK"
{:target="_blank"}

[sunset]: <https://lowprokb.ca/products/sunset-tactile-choc-switches> "Sunset switches"
{:target="_blank"}

[ldsa]: <https://lowprokb.ca/collections/keyboards/products/ldsa-low-profile-blank-keycaps> "LDSA keycaps"
{:target="_blank"}

[lowprokb]: <https://lowprokb.ca/> "lowprokb.ca"
{:target="_blank"}


[nice]: <https://nicekeyboards.com/nice-nano/> "Nice!Nano"
{:target="_blank"}
[waveshare]: <https://www.waveshare.com/rp2040-zero.htm> "WaveShare RP2040 zero"
{:target="_blank"}
[sofatko]: <https://www.instagram.com/sophiehardy5/> "Anna Marklová (Instagram)"
{:target="_blank"}
[tiktok]: <https://www.tiktok.com/@alexejthepinguin> "Alexej The Penguin and Stáňa on TikTok"
{:target="_blank"}