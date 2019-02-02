---
layout: post
title: Building a custom keyboard - Katana60
categories: electronics
published: false
image: /images/katana60/IMG_20190202_163514.jpg
---

I learned recently that there's a huge community around making of custom mechanical keyboards. Even though building such keyboard is actually quite expensive I failed to resist the temptation and decided to build my first one.

<!--more-->

{% responsive_image path: images/katana60/IMG_20190202_163514.jpg alt: "My Katana60" ficlass: "imgmw600" %}

And here I am, captured by a new and quite expensive hobby which seems to stick with people. I think it began when I somehow found [a subreddit about mechanical keyboards][rmk] and noticed that there is a big community of people who are designing and building custom (mostly) mechanical keyboards. You just order components you and put them together. 

## Build from what?

The main ingredient you need to build a mechanical keyboard are switches. There are many vendors of those. The most famous are German made Cherry MX switches. There are various types of switches - clicky with sound effect, tactile with nice bump you can feel when you pres them or so called linear which are... just linear without any bumps or clicks. You can choose many other parameters and there's also a lot of people who are modifying switches in various ways in order to create their desired perfect switch.

Apart from switches you'll need to connect them together. You may choose to go full DIY and use just wires an diodes or you can order a PCB (or even design your own PCB).

Next important part is micro-controller which will drive your board. Yes, board,  that's how they call keyboards in this community, since what other board could you possibly mean, you know?ß. There are open-source firmwares for such keyboards (for example [QMK firmware](https://qmk.fm/)) with huge community and many interesting functions. Your keyboard will be fully programmable, that's amazing, isn't it?

Of course, you may need or want more. Some kind of case, cables and so on. You can order an assembly-ready kit or source parts yourself. 

As you can see there are so many things you could do with those. Experiment with layouts, layers, switches. There are orthogonal keyboards, split keyboards, minimalistic keyboards. So big is, this keyboard universe!

## My first keyboard

After I lurked at the [r/mechanicalkeyboards][rmk] for some time a strong urge to build keyboard grew in me. In the end I chose design called Katana60 for several reasons:

- It has nontraditional layout which aims to be a bit more ergonomic. It is more appealing to me to build keyboard with layout that I cannot easily buy.
- There are PCB and plate available to order from [European eshop (Candykeys)][katana60candy]. The PCB has all components pre-soldered so it's a little bit less work. Not that much DIY, though. You need to solder on only the switches. 
- It's compatible with the most common cases for 60% keyboards therefore you can find really cheap ones.
- It has a small gap in the middle where you can see a Japanese symbol for katana. That's cool.

This keyboard is designed by RominRonin, here [is a thread on geekhack][katana60].

In the end I gathered the following parts:

- PCB and Plates
- 2 stabilizers - they are used to hold longer keys level when you press them, therefore you don't have to press them exactly in the middle. Katana60 has only two longer keys, so only two quite short stabilizers are needed.
- A super cheap semi-transparent plastic case from aliexpress
- Gateron Silent Black switches again from aliexpress. Those are linear, so no bumps or clicks.
- Key caps, super cheap from aliexpress too.

{% responsive_image path: images/katana60/IMG_20181201_135644.jpg alt: "Parts on a pile" figcaption: "Parts on a pile"  %}


And that was it. Wait for parts to arrive, one evening of soldering and it's done. Behold.

TODO: image of katana in plastic case.

## Layout

There is official layout for Katana60 included in the QMK Firmware repository. There are actually three variants. You can also check latest version [in RominRonin's fork][layout_ronin]. I played with the layout a lot and ended up with my variant which you can [find here][layout_repository]. 

The interesting part si that there are additional layers. You can press FN to activate layer gives access to Fx keys and better access to numbers an symbols. There's also another layer, activated by pressing key that is usually caps-lock, which contains keys for better movement in text and selection.

But since it's easy to customize the layout I took the original only as a base and played with it a bit.

### What do I actually want from my layout? 

1) I use Mac for work and Ubuntu at home. So I would like to to stay compatible with both systems. The main problem here is with modifiers. Firstly they tend to be ordered differently on Mac keyboards. Secondly the main modifier on mac is command (eq. to win/super on other keyboards). The same role is played by Ctrl on Windows and Linux. Most of IDE's or editors (Android Studio, VS Code, SublimeText) follow this habit.  
2) I use Colemak layout. But I would like to have ability to switch to qwerty. That would allow my girlfriend (or people in general) to use my keyboard to e.g. find music on spotify on my computer or something.
3) I am heavy keyboard shortcut user, former Vim user. So I need layout to support my needs.

### Modifiers

There are arrows mapped to the right side of the bottom row on Katana6O. I kept this mapping but modified it a bit - when you press and hold any of the first three arrow keys it acts as modifier (cmd, opt, ctrl). If you just tap it, it acts as arrow.

I also added two variants for basic layer. Both varinats are the same except the order of modifiers is different. Mac variant has CMD in the middle, than alt/opt and finally CTRL on the outside. Linux versin has CTRL in the middle, alt/opt on the same position and finally CMD on the outside.

I also added secondary to the left "spacebar" - which is actually backspace. When you press and hold it activates acts as FN and activates the symbol layer. I barely use it as backspace though so I may change the primary purpose in the future.

Also on the original katana layout the space on the right (which is actually space) activates another layer when pressed. I had to deactivate this because when I was typing it often happened that space was not registered and that really bothered me.

### Moar base layers!

I also wanted to have base layer with Colemak layout and alternative with QWERTLY layout. That means in the end 4 base layouts since I also want the aforementioned portability. 

Switching of the base layer is mapped to four keys on the extend layer (more about that later). Selected layer is stored in EEPROM so it survives powering off.

### Extend layer

It's almost the same as the default katana base layer. The most important are arrow keys mapped under the home position on the right. Nice are also shortcuts for previous and next word. Those are actually simulating two pressed keys (arrow and modifier). The problem of those that the modifier is also platform dependent here. 
In the end I had to create two extend layers again - one for Mac and one for linux. But usage is completely transparent, because the extend layer for mac is activated only from base layers for Mac and the same applies for Linux. The key for Ext layer is still only one.

You can check the layout here:
- link to repository
- link to the app with layout
- maybe image?

## What's next

I really like my new keyboard. It's cool, it's nice to type on. I like those layers. I got used to it quite quickly and (unfortunatelly) became incompatible with any other keyboard.

TODO:

- [X] preview image _@done (2019-02-02 17:13)_
- [X] how I made it _@done (2019-02-02 17:13)_
- [X] layout (link) _@done (2019-02-02 17:13)_
- [ ] next build, katana v2, split
- [ ] gallery


## What's next

[layout]: http://www.keyboard-layout-editor.com/#/gists/14d62ee67d36621c37888783fa29b107 "My layout"
[layout_image]:https://i.imgur.com/qQtYqPy.png "Layout image"
[layout_repository]:https://github.com/josefadamcik/qmk_firmware/tree/katana60_josefs_custom/keyboards/katana60/keymaps/josef "Layout on github (QMK)""
[layout_ronin]:https://github.com/rominronin/qmk_firmware/blob/katana60/keyboards/katana60/keymaps/rominronin/keymap.c "RominRonin's layout in his QMK fork"
[qmkfirmware]:https://github.com/josefadamcik/qmk_firmware/tree/katana60_josefs_custom/keyboards/katana60/keymaps/josef "QMK firmware fork with mmy repository"
[katana60]:https://geekhack.org/index.php?topic=88719.0 "Geekhack thread"
[katana60candy]:https://candykeys.com/search/katana60 "Katana60 on CandyKeys"
[katana60v2]:https://geekhack.org/index.php?topic=99136 "Geekhack thread about Katana60 v2"
[rmk]:https://www.reddit.com/r/mechanicalkeyboards "r/mechanicalkeyboards"