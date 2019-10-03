---
layout: post
title: In search of the best custom keyboard layout
categories: electronics
tags: [keyboards, electronics]
published: false
image: 
---

I [built my first custom keyboard (katana60)][katana60] back at the beginning of this year and [the second one (corne)][crkbd] a few months ago, but I am already designing another one. Apart from the fun I have as I build, customize those keyboards, it is about looking for more effective keyboard layout for my daily work. This article sums up my journey which lead to the decision to design my own keyboard.

<!--more--> 

# Motivation

I work as software developer so typing is very important part of my daily work. But not just typing. There are plenty of other tasks I need to do quickly - navigating trough the source code, editing, using various tools available in editor or IDE. The most effective way how to do such task is to use keyboard shortcuts.

A long time before I started building [custom keyboards][keyboardstag], I was already trying to find ways how to be more effective when working with my computer and more specifically with keyboard. I have been using [Colemak layout][colemak] for quite some time. I invested the time necessary to learn and practice touch-typing. And I had been a long time Vim addict and I had to use Vim plug-in in every editor I had been using. That's no longer true, but it did affect how I use a keyboard.

# Vim

I am not going to dive into reasons why I no longer use Vim, but I am going to mention what I like about vim.

Vim allows you to use keys which are easy to reach to do the most useful stuff - navigation through the text and basic manipulation are done by letter keys you have just under your fingers, without any modifiers. This is achieved by using multiple modes. The default mode (called command mode) is for movement and manipulation and you need to switch to insert mode in which you actually type. This feels weird at the beginning but it is very addictive once you get used to it. 

You can just keep your hands on the keyboard and most of the time even in the basic position and achieve a lot. No mouse, not much moving around the keyboard. One example: instead of the arrow keys, four letters under the right hand are used: h,j,k,l.

In other editors you need to either move your hand to a special key (arrows, home/end etc.) or use some shortcut which involves one or more modifiers (shift, alt, ctrl or cmd).

# Size of keyboard

The above has one important consequence - you don't need a full feature keyboard. It's a waste of time to move your hand away from the basic position. So you stop using num-pad, home/end/page cluster and arrows. So it makes sense to have a smaller keyboard, doesn't it? 

In the world of keyboards [a per-cent notation is used to classify keyboards][keyboardsize] according to they keyboard. A 100% keyboard is the old good big one with everything. The [katana60 I use right now][katana60] is 60% keyboard. [Corne, my second keyboard][crkbd], is only 40% which is really minimalistic.

# What are my expectations?

Let's sum up my requirements from my keyboard setup.

- [Colemak layout][colemak] for basic typing.
- Have an easy way how to move around the text: arrows, home, end, next/previous word, page up, page down. Have the ability to hold shift while using those to select text.
- Have easy access to special characters - all the brackets, semicolons, dollar signs and others are important when programming.
- Easy and effective way how to use shortcuts. I need to be able to combine letters with one or two modifiers and other keys (symbols, F-keys) with one modifier. There is one important detail in this regard: I need modifiers to be mirrored on both sides of the keyboard, because I hold them with the opposite hand to the one which presses the main key. For example, if for shortcut "CTRL+SHIFT+a"  I would press CTRL and SHIFT with right hand because A is on the left side of the keyboard.

# Layers

What is a layer when we talk about keyboard layouts? It's alternative mapping for keys on the keyboard which can be activated either temporarily, while you hold some key, or toggled permanently, when you press some key. Imagine how FN key works on laptops: when you hold the key some other keys have different function. Another example is the num-lock key on a keyboard which toggles meaning of keys in the numpad cluster.

Usage of layers is very common in the custom keyboard community and [firmwares like QMK support layers out of the box][qmklayers]. But you don't need a programmable keyboard to have layers. There's a way how to make them work on all operating systems.

There's one [very detailed and very important post about layers on the Colemak forum][extendlayerdreymar]. This post is written by DreymarR and he explains there his concept of extend layer. The post [influenced the original layout of the Katana60 keyboard][katana60extend] quite bit and since my personal layout is heavily based on the default one it affected mine too.


# Katana60

I have already [described my layout for my Katana60 keyboard][katana60layout]. But I am going to revisit the important details here too.

Katana60 have 4 layers and my configuration is very close to the default one.

- **the default layer** - contains all the basic keys you know. There are also arrow keys in the bottom row. The first three arrows act as modifiers when held so my need to have modifiers mirrored on both sides is fulfilled. Notice that there are no F1-F12 keys because there's not enough rows for them. 
- **Symbol/FN layer** - activated by holding one of FN keys in both bottom corners or by holding backspace in the middle. This layer is green on the animation below. I have never used the FN keys in corners, only the middle one (which acts as backspace when taped but activates the layer when held). This layer is the only way how to access F1-F12 keys. It also moves numbers and symbols closer to the home position and adds an easy access to other symbols. Very useful when programming.
- **Extend layer** - activated by holding a dedicated key which replaces caps-lock. This is very important layer for movement and text editing. Blue one on the animation. I have quickly become addicted to this layer and cannot imagine not having it available.
- **Num-lock layer** - this one contains mainly numpad and is toggled by pressing a dedicated num-lock key. Red on the animation. The important detail here is that it is activated permanently when you press the key and deactivated when you press it again. I rarely used this one. The red one on the animation.

<figure>
<img src="{{site.baseurl}}/images/keyblayout/katanalayout_animation.gif">
<figcaption>Layers in my layout for Katana60. The keys used to activate the actual layer are filled with solid color (<a href="{{site.baseurl}}/images/keyblayout/katanalayout_animation.gif" target="_blank">open gif in new window</a>)</figcaption>
</figure>

[The whole layout without any animation can be viewed in kebyoard layou editor][katana60layouteditor].

# Moving to split

I wanted to build a split keyboard from the beginning. I chose Katana60 as first build because it was kind of step in that direction and seemed to be a good place to start with custom keyboards.

Recently I build a [CRKBD (Corne keyboard)][crkbd]. I admit the decision to build the keyboard was a little bit impulsive. I love how it looks and as soon as I learned I could have PCBs and case manufactured very cheaply I just went for it. But once I built it and started using it I quickly realised it is too minimalistic for me.

Let's look at the default layout.

<img src="{{site.baseurl}}/images/keyblayout/crkbd_default.png"/>

# Sofle 


----
## Footnotes


[colemak]: https://colemak.com/ "Colmak Layout"
{:target="_blank"} 
[katana60]: {{ site.baseurl }}{% post_url 2019-02-02-buiding-a-custom-keyboard-katana60 %} "My build of Katana60"
[katana60layout]: {{ site.baseurl }}{% post_url 2019-02-02-buiding-a-custom-keyboard-katana60 %}#layout "My build of Katana60 - details about layout"
[crkbd]:{{ site.baseurl }}{% post_url  2019-07-10-corne-keyboard-build-log %} "My build of Crkbd"
[keyboardstag]: {{ site.baseurl }}/tag/keyboards "Tag: keyboards on my web"
[keyboardsize]: https://www.keebtalk.com/t/standard-keyboard-sizes-layouts/60 "Keyboard sizes and layouts"
{:target="_blank"} 
[qmklayers]: https://docs.qmk.fm/#/feature_advanced_keycodes?id=switching-and-toggling-layers "Switchin and toggling layers in QMK"
{:target="_blank"} 
[extendlayerdreymar]: https://forum.colemak.com/topic/2014-extend-extra-extreme/ "Extend Extra Extreme! by DreymarR"
{:target="_blank"} 
{:target="_blank"} 
[katana60extend]: https://forum.colemak.com/topic/2327-developing-an-extend-layer-for-the-katana60/ "Developing an extend layer for katana60"
{:target="_blank"} 
[plancklayers]: https://github.com/qmk/qmk_firmware/releases/download/planck-4.0/planck-keymap-v4.pdf "Planck layers (pdf)"
{:target="_blank"} 
[katana60layouteditor]: http://www.keyboard-layout-editor.com/#/gists/14d62ee67d36621c37888783fa29b107 "My layout for Katana60 in keyboard-layout-editor"
{:target="_blank"} 