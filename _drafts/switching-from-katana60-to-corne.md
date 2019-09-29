---
layout: post
title: In search of the best custom keyboard layout (for me)
categories: electronics
tags: [keyboards, electronics]
published: false
image: 
---

I have [build my first custom keyboard (katana60)][katana60] back at the beginning of this year and [the second one (corne)][crkbd] few months ago, but I am already designing another one. Apart from the fun I have as I build, customize and design those keyboards, it is about looking for more effective keyboard layout for my daily work. This article sums up my journey which lead to the decision to design my own keyboard.

<!--more--> 

# Motivation

I work as software developer so typing is very important part of my daily work. But not just typing. There are plenty of other tasks I need to do quickly - navigating trough the source code, editing, using various tools available in editor or IDE. The most effective way how to do such task is to use keyboard short cuts.

A long time before I started building [custom keyboards][keyboardstag], I was already trying to find ways how to be more effective when working with my computer and more specifically with keyboard. I have been using [Colemak layout][colemak] for quite some time. I invested the time necessary to learn and practice touch-typing. And I had been a long time Vim addict and I had to use Vim plug-in in every editor I had been using. That's no longer true, but it did affect how I use keyboard a lot.

# Vim

I am not going to dive into reasons why I no longer use Vim, but I am going to mention what I like about vim.

Vim allows you to use keys which are easy to reach to do the most useful stuff - navigation through the text and basic manipulation are done by letter keys you have just under your fingers, without any modifiers. This is achieved by using multiple modes. The default mode (called command mode) is for movement and manipulation and you need to switch to insert mode in which you actually type. This feels weird at the beginning but it is very addictive once you get used to it. 

You can just keep your hands on the keyboard and most of the time even in the basic position and achieve a lot. No mouse, not much moving around the keyboard. One example: instead of arrow keys, four letters under your right hand are used: h,j,k,l.

In other editors you need to either move your hand to a speacial key (arrows, home/end etc.) or use some shortcut which involves one or more modifiers (shift, alt, ctrl or cmd).

# Size of keyboard

The above has one important consequence - you don't need a full feature keyboard. It's a waste of time to move your hand away from the basic position. So you stop using numpad, home/end/page cluster and arrows on a big keyboard. So it makes sense to have a smaller keyboard, doesn't it? 

In the world of keyboards [a per-cent notation is used to classify keyboards][keyboardsize] according to they keyboard. A 100% keyboard is the old good big one with everything. The [katana60 I use right now][katana60] is 60% keyboard. [Corne, my second keyboard][crkbd], is only 40% which is really minimalistic.

# What are my needs

Let's sum up my requirements (or expectations) from my keyboard setup.

- Colemak layout for basic typing.
- Somehow have easy way how to move around the text - arrows, home, end, next/previous word, page up, page down. Have the ability to hold shift while using those in order to select text.
- Have easy access to special characters - all the brackets, semicolons, dollar signs and others are important when programming.
- Easy and effective way how to use short-cuts. I need to be able to combine letters with one or two modifiers and other keys (symbols, F-keys) with one modifier easily. There is one important detail in this regard: I need modifiers to be mirrored on both sides of the keyboard, because I hold them with the hand opposite to the one which presses the main key. For example, if for shortcut "CTRL+SHIFT+a"  I would press CTRL and SHIFT with right hand because A is on the left side of the keyboard.

# Layers

# Katana

# Moving to split keyboard

# Sofle 




## Layout - Work in progress

Corne has much less keys than my Katana60. I am still curious if I will be able to get used to it. The plan is to create a layout which is kind of close to my current Katana60. I have already started using it at home. For work I am going to keep using Katana60. My [Katana60
layout](https://github.com/qmk/qmk_firmware/tree/master/keyboards/katana60/keymaps/josefadamcik) has, at the moment, 4 configurations I can switch in runtime - Colemak Mac, Colemak Win, QWERTY Mac and QWERTY Win. I am going to add another configuration which will mimick my Corne layout - all keys which are not present on Corne will be deactivated and the remaining will do exactly the same. This will allow me to start getting used to the layout in work too while still having the ability to switch to the old layout and stay productive. As soon as (and if) it flips and I am more productive with Corne I'll take it to work and build another one for home.

So far [my layout (qmk source) can be found here](https://github.com/josefadamcik/qmk_firmware/tree/wip_crkbd/keyboards/crkbd/keymaps/josefadamcik).




[colemak]: https://colemak.com/ "Colmak Layout"
{:target="_blank"} 
[katana60]: {{ site.baseurl }}{% post_url 2019-02-02-buiding-a-custom-keyboard-katana60 %} "My build of Katana60"
[crkbd]:{{ site.baseurl }}{% post_url  2019-07-10-corne-keyboard-build-log %} "My build of Crkbd"
[keyboardstag]: {{ site.baseurl }}tag/keyboards "Tag: keyboards on my web"
[keyboardsize]: https://www.keebtalk.com/t/standard-keyboard-sizes-layouts/60 "Keyboard sizes and layouts"