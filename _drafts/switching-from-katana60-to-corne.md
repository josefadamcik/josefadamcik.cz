---
layout: post
title: In search of the best custom keyboard layout
categories: electronics
tags: [keyboards, electronics]
published: false
image: 
---

I [built my first custom keyboard (Katana60)][katana60] back at the beginning of this year and [the second one (Corne)][crkbd] a few months ago, but I am already designing another one. Apart from the fun I have as I build and customize those keyboards, it is about looking for more effective keyboard layout for my daily work. This article sums up my journey which lead to the decision to design my own keyboard.

TODO: a shot of both keyboards

<!--more--> 

## Motivation

I work as software developer so typing is very important part of my daily work. But not just typing. There are plenty of other tasks I need to do quickly - navigating trough the source code, editing, using various tools available in editor or IDE. The most effective way how to do such task is to use keyboard shortcuts.

A long time before I started building [custom keyboards][keyboardstag], I was already trying to find ways how to be more effective when working with my computer and more specifically with keyboard. I have been using [Colemak layout][colemak] for quite some time. I invested the time necessary to learn and practice touch-typing. And I had been a long time Vim addict and I had to use Vim plug-in in every editor I had been using. That's no longer true, but it did affect how I use a keyboard.

## Vim

I am not going to dive into reasons why I no longer use Vim, but I am going to mention what I like about vim.

Vim allows you to use keys which are easy to reach to do the most useful stuff - navigation through the text and basic manipulation are done by letter keys you have just under your fingers, without any modifiers. This is achieved by using multiple modes. The default mode (called command mode) is for movement and manipulation and you need to switch to insert mode in which you actually type. This feels weird at the beginning but it is very addictive once you get used to it. 

You can just keep your hands on the keyboard and most of the time even in the basic position and achieve a lot. No mouse, not much moving around the keyboard. One example: instead of the arrow keys, four letters under the right hand are used: `h`,`j`,`k`,`l`.

{% responsive_image path: images/keyblayout/vi-vim-cheat-sheet.gif alt: "" figcaption: "Cheat sheet for VIM from <a href='http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html' target='_blank'>viemu.com</a>"  class: "imgmw600"  %}

In other editors you need to either move your hand to a special key (arrows, `Home`, `End` etc.) or use some shortcut which involves one or more modifiers (`Shift`, `Alt`, `Ctrl`, or `Cmd`).

## Keyboard size

The above has one important consequence - you don't need a full feature keyboard. It's a waste of time to move your hand away from the basic position. So you stop using num-pad, `home`/`end`/`page up/down` cluster and arrows. So it makes sense to have a smaller keyboard, doesn't it? 

In the world of keyboards [a per-cent notation is used to classify keyboards][keyboardsize] according to they keyboard. A 100% keyboard is the old good big one with everything. The [katana60 I use right now][katana60] is 60% keyboard. [Corne, my second keyboard][crkbd], is only 40% which is really minimalistic.

## What are my expectations?

Let's sum up my requirements from my keyboard setup.

- [Colemak layout][colemak] for basic typing[^1].
- Have an easy way how to move around the text: arrows, `home`, `end`, next/previous word, `page up`, `page down`. Have the ability to hold shift while using those to select text.
- Have easy access to special characters - all the brackets, semicolons, dollar signs and others are important when writing code.
- Easy and effective way how to use shortcuts. I need to be able to combine letters with one or two modifiers and other keys (symbols, `F-`keys) with one modifier. There is one important detail in this regard: I need modifiers to be mirrored on both sides of the keyboard, because I hold them with the opposite hand to the one which presses the main key. For example, if for shortcut "`Ctrl+Shift+a`"  I would press `Ctrl` and `Shift` with right hand because A is on the left side of the keyboard.

## Layers

What is a layer when we talk about keyboard layouts? It's alternative mapping for keys on the keyboard which can be activated either temporarily, while you hold some key, or toggled permanently, when you press some key. Imagine how `FN` key works on laptops: when you hold the key some other keys have different function. Another example is the num lock key on a keyboard which toggles meaning of keys in the numpad cluster.

Usage of layers is very common in the custom keyboard community and [firmwares like QMK support layers out of the box][qmklayers]. But you don't need a programmable keyboard to have layers. There's a way how to make them work on all operating systems.

There's one [very detailed and very important post about layers on the Colemak forum][extendlayerdreymar]. This post is written by DreymarR and he explains there his concept of extend layer. The post [influenced the original layout of the Katana60 keyboard][katana60extend] quite bit and since my personal layout is heavily based on the default one it affected mine too.

## Katana60

I have already [described my layout for my Katana60 keyboard][katana60layout]. But I am going to revisit the important details here too.

Katana60 have 4 layers and my configuration is very close to the default one.

- **the default layer** - contains all the basic keys you know. There are also arrow keys in the bottom row. The first three arrows act as modifiers when held so my need to have modifiers mirrored on both sides is fulfilled. Notice that there are no `F1`-`F12` keys because there's not enough rows for them. 
- **Symbol/FN layer** - activated by holding one of `FN` keys in both bottom corners or by holding backspace in the middle. This layer is green on the animation below. I have never used the FN keys in corners, only the middle one (which acts as backspace when taped but activates the layer when held). This layer is the only way how to access `F1`-`F12` keys. It also moves numbers and symbols closer to the home position and adds an easy access to other symbols. Very useful when programming.
- **Extend layer** - activated by holding a dedicated key which replaces caps-lock. This is very important layer for movement and text editing. Blue one on the animation. I have quickly become addicted to this layer and cannot imagine not having it available.
- **Num-lock layer** - this one contains mainly numpad and is toggled by pressing a dedicated num-lock key. Red on the animation. The important detail here is that it is activated permanently when you press the key and deactivated when you press it again. I rarely used this one. The red one on the animation.

<figure>
<img src="{{site.baseurl}}/images/keyblayout/katanalayout_animation.gif">
<figcaption>Layers in my layout for Katana60. The keys used to activate the actual layer are filled with solid color (<a href="{{site.baseurl}}/images/keyblayout/katanalayout_animation.gif" target="_blank">open gif in new window</a>)</figcaption>
</figure>

[The whole layout without any animation can be viewed in kebyoard layou editor][katana60layouteditor].

## Moving to split

I wanted to build a split keyboard from the beginning. I chose Katana60 as first build because it was kind of step in that direction and seemed to be a good place to start with custom keyboards.

Recently I build a [CRKBD (Corne keyboard)][crkbd]. I admit the decision to build the keyboard was a little bit impulsive. I love how it looks and as soon as I learned I could have PCBs and case manufactured very cheaply I just went for it. But once I built it and started using it I quickly realised it is too minimalistic for me.

Let's look at the default layout.

<figure>
<img src="{{site.baseurl}}/images/keyblayout/crkbd_animation.gif"/>
<figcaption>
    The default layout for Corne keyboard.
</figcaption>
</figure>

The default layout is not that much interesting. Let's focus attention on keys which we have available.

We sacrificed the number row (the top one) on this keyboard. We have also only 3 keys in outer columns and 3 keys in the bottom row. There are also some additional keys in the middle cluster on Katana60, but since I was barely using them I'll ignore them. 

And we need to fit somewhere:

- `Ctrl`, `Alt`, `Cmd`,
- `Shift`
- `Tab`
- `Enter`
- `Space`
- `Backspace`
- `Esc`
- 2 keys for switching to other layers

That is 11 keys so it is possible cover to fit them into both outer columns and bottom rows (12 keys in total).

But such solution creates problems:

- I cannot have modifiers on both sides in a symmetric way - this would require 4 more keys. 
- I would also like to keep shift keys in normal position and the remaining modifiers in the bottom row. But I would also like to have space and enter under my thumbs in the bottom row. That is at least 4 keys in the bottom row on each side. If we add layer switching keys we would need 5.

What would be possible workarounds?

1) Join layer switching keys with space/enter - each key would act as normal key when tapped or select another layer when held. [QMK firmware supports that][qmklayers]. I have tried that, but it has it's own problems. Mainly it creates a lag when typing. It is just a few hundreds of milliseconds, but it is noticeable and very annoying. I was also having problems with errors where I wanted modifier but got the character. Those we most likely caused by my mistakes, but they were still too common and annoying. And as the last and the biggest issue: this gives me only 2 more keys, that's still not enough.

2) Use keys in the bottom letter row as multifunctional. For example "`Z`" - `Ctrl`, "`X`" - `Alt`, "`C`" - `Cmd` and the same for "`,`", "`.`" and "`/`" on the other side. Using the same trick when tapping the key sends a character and holding the key sends the modifier. This has similar problems as above, only worse.

I have also found it is difficult to fit all the keys I wanted in the remaining layers. I had to use the 4th layer (activated by holding both layer switching keys) for `F1`-`F12` keys. But such arrangement didn't work because I need to have the ability to press one modifier with any F key and that is very difficult when the layer you press two keys in the bottom row already.

After some time I gave up. I just need a less minimalistic keyboard. 

## Lily58

[Lily58 is another design ][lily58] very similar to (and partly based on) Crkbd.

<figure>
<img src="{{site.baseurl}}/images/keyblayout/lily58.png"/>
<figcaption>
    Lily58
</figcaption>
</figure>

It is almost perfect:

- There's one additional row at the top so I get back the number row and a place for `Esc`. `F1`-`F12` keys could be placed there on another layer too in the same way I have them on Katana60. 
- We have one additional key in the bottom row on each side. That's almost perfect but having 2 would have been better. 

Lily58 would work nicely for me but I would have to either:

- Use workaround 1) from above. I actually change my Katana60 layout and tried to use this for few weeks hoping I could get used to it. But it was not getting better.
- Move layer switching to outer columns. But I like the idea having those under my thumbs. I switch layers often and that might put too much strain on my pinkies. 


## So let's design a keyboard, why not?

Lily58 is almost perfect and also opensource with KiCad files available. So I decided to modify them and add desired keys. I chose the [Lily58 Pro][lily58pro] version[^1] as basis for my changes. 

Originally I just forked the repository and wanted to add only the 2 keys, name the keyboard Lily60 or something like that and send it for manufacture. But I got a bit carried away[^2] but I am going to describe that in another article. This one is about layouts, so let's see how it would look.

<figure>
<img src="{{site.baseurl}}/images/keyblayout/soflekeyboard.png"/>
<figcaption>
    Desired layout - the basic layer.
</figcaption>
</figure>





----
## Footnotes
[^1]: Examples below show traditional QWERTY layout so the dear reader is not confused by COLEMAK.
[^1]: The Pro version uses hot-swap sockets ([on aliexpress][hotswapali]) for keyboard switches. That would allow me to use nice (and expensive) switches and If I don't like the board I would be able to use them in another one. Socket's are much cheaper than switches. 
[^2]: I moved some keys in the bottom row and rotated them a bit. I realized I don't need the middle keys above thumb keys but maybe I could add a rotary encoder which is also supported by QMK firmware and can be used to... well, to emit any keystrokes I would desire. And finally I started moving things around the micro-controller. The resulting design is still very close to the Lily58 and most of the routing for keys is the same. But If I like where the board is going I am planning to do further improvements. One of them would be to integrate micro-controller directly on the board which would be a bit nicer than using Pro Micro boards. I would also like to use USB-C connector and maybe figure out a better way how to connect the halves than audio cable.

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
[lily58]: https://github.com/kata0510/Lily58 "Lily58 - a split keyboard design on github"
{:target="_blank"} 
[lily58pro]: https://github.com/kata0510/Lily58/blob/master/Pro/ "Lily58 Pro"
{:target="_blank"} 
[hotswapali]: https://www.aliexpress.com/item/32951252318.html "Kailh hot-swap sockets for MX switch"
{:target="_blank"} 

