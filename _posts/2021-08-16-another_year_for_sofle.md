---
layout: post
title: "Another year of Sofle keyboard"
categories: electronics
tags: [keyboards, electronics]
published: false
series: "SofleKeyboard"
image: /images/sofleupd/PXL_20210814_142056542.jpg 
---

It's been almost a year since I wrote [my last update about Sofle Keyboard][sofleevolution]. At that time, I had one prototype of Sofle V2 on my table and was happy with the state of the design. My attention moved onto other projects and hobbies and I didn't really feel like evolving the design at all. Recently I have build my second (only!) Sofle V2 build and realized a lot happened for [Sofle][sofleweb] since the last time and it might be nice to write an update.

{% responsive_image path: images/sofleupd/PXL_20210814_142056542.jpg alt: "SofleKeyboard V2 two times." %}

<!--more--> 

{%- include post_series.html -%}

## V2 released in unpolished state

When I wrote the article mentioned above, the V2 version was unreleased and hidden in a develop branch. There were some minor problems with the design and some changes I planned to revert. The development was not moving forward for several months and there were people asking about the new version. Some people even built it or started organizing group buys. 

I decided to release it state it was at that time (January 2021). Only one detail was fixed (a too small size of a cut-out for encoder in the top plate). I believe was a good decision to prevent confusion about versions. I did update the build guide for Version 1 to cover even Version 2 since I didn't have the pictures, time or will to actually write a dedicated build guide it.

All the details about how it changed since V1 are in [the previous article][sofleevolution].

{% responsive_image path: images/sofle2/Comparison1_2.png alt:""  figcaption:"Comparison of layouts - Sofle V1 in orange, Sofle V2 in blue" %}

## RGB version contributed to the repository

Support for RGB LEDs was the top most requested feature for Sofle. I am personally not interested in having a glowing keyboard so I didn't want to invest time into required changes. Keep in mind, this would be not just about doing the PCB design. I would have also needed to build the keyboard, test it (and possibly go through few iterations to make sure it works), and write a build guide. I would end up with a board that is more complex and therefore harder to maintain, change and support. 

I also always tried to encourage people to do their own modifications and create their own keyboards which will suit their needs rather than trying to convince me to change the design.

One of the community members, [Dane Evans][daneevans] did exactly that: took V2 design, added support for RGB, changed the layout slightly to his liking and fixed some design issues I introduced in version 2. I believe he basically redid the whole board and routing. He was kind enough to contribute his changes to the main repository, he wrote a build guide and he even joined me as a maintainer of the repository and invested a lot of time and effort into supporting the build and helping people. He shall be praised for that.

{% responsive_image path: images/sofleupd/SofleRGB_1.png figcaption: "Sofle RGB (photo by Dane Evans)" %}

Keep in mind please, that even though the RGB is based on V2, it has slightly different layout and different shape. See the image below for illustration. A The consequence is that a case designed for RGB is not compatible with V2 and vice-versa. Keep this mind when picking the case design. Sometimes people mistakenly mix-up V2 and RGB which can cause some confusion.

{% responsive_image path: images/sofleupd/Sofle_RGB_v2_comparison.png figcaption: "Sofle V2 is red and Sofle RGB blue. Notice the difference in stagger and the shape." imgclass='imgmw600'%}


## More work by community

### Alternative LEDs for RGB

One of the common issues when building the RGB version is the fact that the chosen RGB LEDs are hard to solder and are easy to break by heat. This is quite common problem among RGB boards using the same model of LEDs. 

There is another LED model (`SK6812 mini-e`) which should be easier to solder and less likely to break. Another nice community member, [tiadobatima][tiadobatima] updated the Sofle RGB to use them. The current state is that the work is done, design reviewed, but AFAIK nobody actually build the design. If anyone is interested in trying that out (and knows what they are doing) [the related Github issue is here. Just read and follow the links to find the actual design.][soflergbminipr]. Once we know it actually works, we can merge it and release it as another alternative. 


### Kailh Choc

Another requested feature for Sofle V2 is support for low-profile switches. Sofle V2 did have support for both Kailh Chock and Cherry MX switches (resp. sockets for them) but I decided to drop it for V2 to make my life easier.

And you might already guess what happened. Another nice person ([Brian Low][brianlow]) decided to do the changes themselves and created another fork of the Sofle RGB. [You can find the corresponding Github issue here and follow the links to his design][soflekailh]. His version  uses the `SK6812 mini-e` LEDs as well.

{% responsive_image path: images/sofleupd/129313355-4c8f2cd4-8c3b-4c7f-b1cc-613ccd24adf9.jpeg figcaption: "Sofle RGB Choc (photo by Brian Low)" %}



- we have design for laser cut sandwich case in the repository
- more things on thingiverse 
- 



## Kimiko by keycapsss.com


## Just a design, not a product.

I had to repeat the following disclaimer dozens of times over the last year. So once again.

Keep in mind please, that Sofle is still just an open source design for a group of DIY keyboards. It's not a product made for profit and production. All people selling the board do this on their behalf and I am not affiliated with them. Usually, I don't even know the board is being sold somewhere and that's perfectly fine with me: it's an open-source design, anyone can do whatever they want.

But remember this, please, when you come the the Github repository and ask us to help with a problem you have while building the board. We are just few guys who made a keyboard for their personal use as part of their hobby and shared the design with you. We have jobs, families and life. We try to help when we have the time and know how, but you can't expect that we will take your hand and guide you through debugging process of the problem you might be having. 

There are plenty of active communities (e.g. QMK Discord, MechKeyboards Discord, KeebTalk, some subbredits on reddit etc) where you can find active people who have experience with building and debugging keyboards. If you bought a kit from a vendor, such vendor (if it's a good one) has a Discord where they might provide some support or have some community which might help you. You are more likely to find effective help in those places rather than in the official Github repository.



## What about Sofle V3?

- ideas about the version 3cxrwZ


<!--more--> 

{%- include post_series.html -%}

[soflething]: <https://www.thingiverse.com/search?q=sofle&type=things&sort=relevant> "Thingiverse Sofle"
{:target="_blank"} 

[sofleweb]: <https://josefadamcik.github.io/SofleKeyboard/> "SofleKeyboard website"
{:target="_blank"}

[soflegithub]: <https://github.com/josefadamcik/SofleKeyboard> "Sofle github"
{:target="_blank"}

[daneevans]: <https://github.com/DaneEvans> "Github profile of DaneEvans"
{:target="_blank"}

[tiadobatima]: <https://github.com/tiadobatima> "tiadobatima"
{:target="_blank"}

[brianlow]: <https://github.com/brianlow> "brianlow"
{:target="_blank"}    

[soflergbminipr]: <https://github.com/josefadamcik/SofleKeyboard/issues/45> "Sofle SK6812-MINI-E PR"
{:target="_blank"}

[soflekailh]: <https://github.com/josefadamcik/SofleKeyboard/issues/40> "Sofle Kailh"
{:target="_blank"}

[soflergbbg]: <https://josefadamcik.github.io/SofleKeyboard/build_guide_rgb.html> "Build guide for Sofle RGB"
{:target="_blank"}

[sofleevolution]: <{{ site.baseurl }}{% post_url  2020-09-15-soflekeyboard-evolving %}> "Sofle Keyboard evolution: slow and not really steady"




