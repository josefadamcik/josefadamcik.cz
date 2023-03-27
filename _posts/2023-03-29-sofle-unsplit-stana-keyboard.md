---
layout: post
title: "Stáňa AKA Sofle Unsplit - a monoblock split keyboard"
categories: electronics
tags: [keyboards, electronics]
published: true
series: "SofleKeyboard"
image: images/stana/Stana_v0_1_render1.png
summary: "The itch is back. The one that makes me design another keyboard. Let me sum up my thoughts and plans about Stáňa keyboard."
---

Year and a half ago, [I wrote][soflelast]: "... I am finally starting to feel the itch to open KiCad, Fusion360 or Inkscape and start designing. We'll see if the itch stays for long enough to yield a result. I hope it does!". It didn't at least not until now. 

{% responsive_image path: images/stana/Stana_v0_1_render1.png  alt:"" figcaption: "Stáňa v0.1" %}

I have been happy user of [Sofle V2][sofleweb] for several years. Over the time, I had a couple of ideas about what I would like to incorporate in the next desing but I didn't start working on anything. Recently one of my keyboards started falling apart. First the switches started failing. Then the USB connector broke off the pro micro board on one of my boards. Of course it happened on the one where I didn't bother to socket the microcontroller. It's not a big deal, I still have a spare PCB and some pro micro as well. But it did remind me that the keyboard is not going to stay here forewer. 

And suddenly, I had the feeling I really want to design a new board again. Over the time, I bought some new components:

- [Nice!Nano][nice] - a pro-micro compatible board with nRF52840. A wireless goodness!
- [Kailh Choc Sunset Tactile switches][sunset] I hated Kailh Choc Browns which were way too heavy for me. Those are supposed to be lighter and are a reason why I felt I could try low-profile switches againn.
- Raspberry Pi Pico, of course!
- [WaveShare RP2040-zero][waveshare] a tiny board with RP2040

The main ideas that were cyrcling in my head were:

- Keep the layout I am used to (or do just minimal adjustments).
- One board. Easier to travel with, even if it was just my keyboard for travelling.
- Wireless.
- Try the lowprofile again.
- Try RP2040 based microcontoller.
- Use nicer display.
- Better case than sandwich case.
- Wague ideas about modular designs.
- If wired, then USB-C and preferably on the board.

Last week I upgraded my Kicad (there's version 7 already!) and started playing around. I decided to start with very simple board for the first iteration to try ou few things.

- Un-split ergo board. I have seen the term "monoblock split" used for those.
- The same layout as Sofle V2, 30 degree angle between halves.
- Try the Choc switches, use the more compact spacing (18 x 17 mm) which makes the layout more compact then Sofle V2. 
- Switches must be socketed for sure.
- Start with wired version and use the cheap and cute WaveShare RP2040 Zero
- No rotary encoders, I never really got used to using them.
- No display.
- No RGB. I still have absolutely no interest in RGB lighting.


{% responsive_image path: images/stana/Stana_v0_1_render3.png  alt:"" figcaption: "Stáňa v0.1" %}

I managed to put the desing together over the weekend. The working name was "Sofle Unsplit" while my partner noted it looks like our puppet of bat we call. We call the puppet Stáňa and I immeditatelly decided to call the board the same. Yes, the name most of you will never know how to pronounce and write and might be un-googleable. That's exactly the name I would pick for a new design. My [partner Anna][sofatko] quickly drew a logo and here we go, the board is already being manufactured. 

{% responsive_image path: images/stana/Stana_v0_1_render2.png  alt:"" figcaption: "Stáňa v0.1" %}

The next step is to desing nice, compact 3d printed case. I suppose this'll take much more time than desing of the PCB. 

After that, I would like to put together a wireless version of this desing. I am also considering to add a nice display, even though I am not sure yet which one. The MX version might come as well. The board woul have to be a bit bigger to fit MX switches. It think it depends on how I like the Choc switches an the compact layout.

It'll take couple of weeks for the boards to arrive. Let's see if my interest lasts...



[sofleweb]: <https://josefadamcik.github.io/SofleKeyboard/> "SofleKeyboard website"
{:target="_blank"}

[soflelast]: <{{ site.baseurl }}{% post_url  2021-08-16-another_year_for_sofle %}> "Another year of Sofle keyboard"


[sunset]: <https://lowprokb.ca/products/sunset-tactile-choc-switches> "Sunset switches"
{:target="_blank"}
[nice]: <https://nicekeyboards.com/nice-nano/> "Nice!Nano"
{:target="_blank"}
[waveshare]: <https://www.waveshare.com/rp2040-zero.htm> "WaveShare RP2040 zero"
{:target="_blank"}
[sofatko]: <https://www.instagram.com/sophiehardy5/> "Anna Marklová (Instagram)"
{:target="_blank"}