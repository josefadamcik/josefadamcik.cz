---
layout: post
title: "Another year of Sofle keyboard"
categories: electronics
tags: [keyboards, electronics]
published: true
series: "SofleKeyboard"
image: /images/sofleupd/PXL_20210814_142056542.jpg 
---

It's been almost a year since I wrote [my last update about Sofle Keyboard][sofleevolution]. At that time, I had one prototype of Sofle V2 on my table and was happy with the state of the design. My attention moved onto other projects and hobbies and I didn't really feel like evolving the design at all. Recently I have built my second (only!) Sofle V2 build and realized a lot has happened for [Sofle][sofleweb] since the last time and it might be nice to write an update.

{% responsive_image path: images/sofleupd/PXL_20210814_142056542.jpg alt: "SofleKeyboard V2 two times." %}

<!--more--> 

{%- include post_series.html -%}

## V2 released in an unpolished state

When I wrote the article mentioned above, the V2 version was unreleased and hidden in a `evelop` branch. There were some minor problems with the design and some changes I planned to revert. The development was not moving forward for several months and people were asking about the new version. Some people even built it or started organizing group buys. 

I decided to release it in the state it was at that time (January 2021). Only one detail was fixed (too small size of a cut-out for the encoder in the top plate). I believe was a good decision to prevent confusion about versions. I did update the build guide for Version 1 to cover even Version 2 since I didn't have the pictures, time or will to actually write a dedicated build guide for it.

All the details about how it changed since V1 are in [the previous article][sofleevolution].

{% responsive_image path: images/sofle2/Comparison1_2.png alt:""  figcaption:"Comparison of layouts - Sofle V1 in orange, Sofle V2 in blue" %}

## RGB version contributed to the repository

Support for RGB LEDs was the most frequently requested feature for Sofle. I am personally not interested in having a glowing keyboard so I didn't want to invest time into required changes. Keep in mind, this would be not just about doing the PCB design. I would have also needed to build the keyboard, test it (and possibly go through few iterations to make sure it works), and write a build guide. I would end up with a board that is more complex and therefore harder to maintain, change and support. 

I also always tried to encourage people to do their own modifications and create their own keyboards which will suit their needs rather than trying to convince me to change the design.

One of the community members, [Dane Evans][daneevans] did exactly that: took V2 design, added support for RGB, changed the layout slightly to his liking and fixed some design issues I introduced in version 2. I believe he basically redid the whole board and routing. He was kind enough to contribute his changes to the main repository, he wrote a build guide and he even joined me as a maintainer of the repository and invested a lot of time and effort into supporting the build and helping people. He shall be praised for that.

{% responsive_image path: images/sofleupd/SofleRGB_1.png figcaption: "Sofle RGB (photo by Dane Evans)" %}

Keep in mind please, that even though the RGB is based on V2, it has a slightly different layout and different shape. See the image below for an illustration. The consequence is that a case designed for RGB is not compatible with V2 and vice-versa. Keep this in mind when choosing the case design. Sometimes people mistakenly mix up V2 and RGB which can cause some confusion.

{% responsive_image path: images/sofleupd/Sofle_RGB_v2_comparison.png figcaption: "Sofle V2 is red and Sofle RGB blue. Notice the difference in stagger and the shape." %}


## Alternative LEDs for RGB

One of the common issues when building the RGB version is the fact that the chosen RGB LEDs are hard to solder and are easy to break by heat. This is quite a common problem among RGB boards using the same model of LEDs. 

There is another LED model (`SK6812 mini-e`) which should be easier to solder and less likely to break. Another nice community member, [tiadobatima][tiadobatima] updated the Sofle RGB to use them. The current state is that the work is basically done, design is reviewed, but nobody has actually built the design. If anyone is interested in trying that out (and knows what they are doing) [the related Github issue is here. Just read and follow the links to find the actual design][soflergbminipr]. Once we know it actually works, we can merge it and release it as another alternative. 


## Kailh Choc version 

Another requested feature for Sofle V2 is support for low-profile switches. Sofle V2 did have support for both Kailh Chock and Cherry MX switches (resp. sockets for them) but I decided to drop it for V2 to make my life easier.

And you might already guess what happened. Another nice person ([Brian Low][brianlow]) decided to do the changes themselves and created another fork of the Sofle RGB. [You can find the corresponding Github pull request here][soflekailh]. His version  uses the `SK6812 mini-e` LEDs as well. 

{% responsive_image path: images/sofleupd/129313355-4c8f2cd4-8c3b-4c7f-b1cc-613ccd24adf9.jpeg figcaption: "Sofle RGB Choc (photo by Brian Low)" %}

## More goodies 

SVG files for laser-cut sandwich cases (e.f. from acrylic) are available for both [Sofle V2][soflev2case] and [Sofle RGB][rgbcase] in the repository (contributions again!).

I added some engraved logos to it and had one made recently and it's pretty nice. The file I submitted to the manufacturer can [be downloaded here][solfev2formulor]. It's in a template provided by the manufacturer and all done to their specification. You'll have to change it according to the requirements of your manufacturer.

{% responsive_image path: images/sofleupd/PXL_20210812_175341910.jpg class: 'imgmw600' figcaption: "Sofle V2 and acrylic sandwich case" %}

[More designs for 3D printed cases are available on Thingiverse][soflething]. Always double-check what version it actually is. Some claim to be for V2 while they are for RGB.

## Just a design, not a product

I had to repeat the following disclaimer in variations dozens of times over the last year. 

Keep in mind please, that Sofle is still just an open-source design for a couple of DIY keyboards. It's not a product made for profit and production. All people selling the board do this on their behalf and I am we are not affiliated with them. Usually, I don't even know the board is being sold somewhere and that's perfectly fine with me. It's an open-source design, anyone can do whatever they want.

But remember this, please, when you come to the Github repository and ask us to help with a problem you have while building the board. We are just a few guys who made a keyboard for their personal use as part of their hobby and shared the design with you. We have jobs, families and life. We try to help when we have the time and knowledge, but you can't expect that we will take your hand and guide you through a debugging process of the problem you are having.

There are plenty of active communities (e.g. QMK Discord, MechKeyboards Discord, KeebTalk, some subreddits and others) where you can find active people who have experience with building and debugging keyboards and might be willing to help you. If you bought a kit from some vendor, such vendor (if it's a good one) has a Discord or a forum where they might be providing some support or have some community that might help you. You are more likely to find effective help in those places rather than in the official Github repository. 

## Kimiko by keycapsss.com

Somewhere during the last year, Ben from [keycapsss.com](https://keycapsss.com) approached me and asked about Sofle V2 and that he is considering selling the keyboard. I shared my concerns about the design (not production-ready, problems here and there) and he said he'll look into it see if he can help to fix them. Well, later he got back to me and shared, that he ended up re-designing the whole board from scratch. We both agreed he should name it differently and keep it his own design so he can fully support it as he would like to.

Later he released the design as [Kimiko][kimiko].

I am very happy he created the design. It's almost the same layout as Sofle V2, it has RGB support, alternative encoder placement (also a highly requested feature) and I am quite sure the overall quality of the design is much higher than if I did it. And mainly he is a person who has a DIY keyboard centered business and invests his time into making many DIY keyboard designs accessible to other people by selling kits, components, and even by making his own hardware. His e-shop is my go-to place for keyboard stuff here in Germany and I was always happy with the service. 

And no, this is not a paid advertisement. I am just a happy customer and I believe that anyone interested in Sofle should know that [Kimiko][kimiko] exists and might be an interesting alternative.

## What about Sofle V3?

You might have noticed one thing. I did only two things since the last article:

- released the V2 without any significant work,
- built my second V2 build with a laser-cut acrylic case which happened a week ago.

The rest was the work of others and I merely contributed by responding to some emails and merging few pull requests. 

I just wasn't in a keyboard design mood. That's why there also wasn't any work done on V3. 

I have some ideas about what I would like my next keyboard to be. It would be quite a different design than Sofle and yet very similar. And I am finally starting to feel the itch to open KiCad, Fusion360 or Inkscape and start designing. We'll see if the itch stays for long enough to yield a result. I hope it does!


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

[soflekailh]: <https://github.com/josefadamcik/SofleKeyboard/pull/104> "Sofle Choc"
{:target="_blank"}

[soflergbbg]: <https://josefadamcik.github.io/SofleKeyboard/build_guide_rgb.html> "Build guide for Sofle RGB"
{:target="_blank"}

[sofleevolution]: <{{ site.baseurl }}{% post_url  2020-09-15-soflekeyboard-evolving %}> "Sofle Keyboard evolution: slow and not really steady"

[kimiko]: <https://keycapsss.com/search?sSearch=kimiko> "Kimiko"
{:target="_blank"}

[rgbcase]: <https://github.com/josefadamcik/SofleKeyboard/tree/master/Sofle_RGB/Case> "Sofle RGB case files"
{:target="_blank"}

[soflev2case]: <https://github.com/josefadamcik/SofleKeyboard/tree/master/Sofle_v2/Case> "Sofle V2 case files"
{:target="_blank"}

[solfev2formulor]: <{{ site.baseurl }}/images/sofleupd/formulorde_P2_Soflev2.svg> "Sofle V2 laser cut case file formulor."
{:target="_blank"}
