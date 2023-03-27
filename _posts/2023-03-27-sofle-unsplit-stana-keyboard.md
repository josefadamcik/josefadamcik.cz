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

A year and a half ago, [I wrote][soflelast]: "I am finally starting to feel the itch to open KiCad, Fusion360, or Inkscape and start designing. We'll see if the itch stays for long enough to yield a result. I hope it does!". It didn't, at least not until now. 

{% responsive_image path: images/stana/Stana_v0_1_render1.png  alt:"" figcaption: "Stáňa v0.1" %}

I have been a happy user of [Sofle V2][sofleweb] for several years. Over time, I had some ideas about what to incorporate in the following design, but I didn't start working on anything. Recently one of my keyboards began falling apart. First, the switches started failing. Then the USB connector broke off the pro micro board on one of my boards. Of course, it happened on the one where I didn't bother to socket the microcontroller. It's not a big deal. I still have a spare PCB and some pro micro as well. But it did remind me that the keyboards can break.

And suddenly, I felt I wanted to design a new board again. 

Over time, I bought some new components:

- [Nice!Nano][nice] - a pro-micro compatible board with nRF52840. Wireless goodness!
- [Kailh Choc Sunset Tactile switches][sunset] I was not too fond of Kailh Choc Browns, which were too heavy for me. Those are supposed to be lighter and they are the reason why I felt I could give the low-profile switches another try.
- Raspberry Pi Pico, of course!
- [WaveShare RP2040-zero][waveshare] a tiny board with RP2040

The main ideas that were circling in my head were:

- Keep the layout I am used to (or make just minimal adjustments).
- One board. Easier to travel with, even if it is just my keyboard for traveling.
- Wireless.
- Try the low-profile again.
- Try RP2040-based microcontoller.
- Use a nicer display.
- Better case than sandwich case.
- Wague ideas about modular designs.
- If wired, then USB-C and preferably on the board so it is more durable.

Last week I upgraded my Kicad (there's version 7 already!) and started playing around. I decided to start with a very simple board for the first iteration to try a few things.

- Un-split ergo board. I have seen the term "monoblock split" used for those.
- The same layout as Sofle V2, 30-degree angle between halves.
- Try the Choc switches. Use the more compact spacing (18 x 17 mm), which makes the layout more compact than Sofle V2. 
- Switches must be socketed.
- Start with the wired version and use the cheap and cute WaveShare RP2040 Zero
- No rotary encoders. I never really got used to using them.
- No display.
- No RGB. I still have absolutely no interest in RGB lighting.

{% responsive_image path: images/stana/Stana_v0_1_render3.png  alt:"" figcaption: "Stáňa v0.1" %}

I managed to put the design together over the weekend. The working name was "Sofle Unsplit," while my partner noted it looked like the puppet of the bat we have. The puppet is called "Stáňa," and she is one of [the performers on our Tik-Tok][tiktok]. I immediately decided to call the board the same. Yes, the name that most of you will never know how to pronounce or write and might make the keyboard hard to google. That seems like a name I would pick for a new design (Sofle was also a joke). My [partner Anna][sofatko] quickly drew a logo, and here we go. The board is already being manufactured. 

{% responsive_image path: images/stana/Stana_v0_1_render2.png  alt:"" figcaption: "Stáňa v0.1" %}

The next step is to design a compact 3D-printed case. That'll take much more time than the design of the PCB. 

After that, I would like to make a wireless version of this design. I am also considering adding a nice display, even though I am not sure yet which one. The MX version might come as well. The board would have to be bigger to fit MX switches. It depends on how I like the Choc switches and the compact layout.

It'll take a couple of weeks for the boards to arrive. Let's see if my interest lasts.


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
[tiktok]: <https://www.tiktok.com/@alexejthepinguin> "Alexej The Penguin and Stáňa on TikTok"
{:target="_blank"}