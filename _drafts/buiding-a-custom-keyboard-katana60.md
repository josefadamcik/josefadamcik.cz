---
layout: post
title: Building a custom keyboard - Katana60
categories: electronics
published: false
image: 
---

I learned recently that there's a huge community around custom mechanical keyboard building. Even though building such keyboard is actually quite expensive I failed to resist and decided to build my first custom keyboard.

<!--more-->


TODO:

- [ ] preview image
- [ ] how I made it
- [ ] layout (link)
- [ ] next build, katana v2, split
- [ ] gallery


## Layout 

- [ ] goals
- [ ] result

Notes from repository 

Customized by Josef Adamcik with several basic layers (Colemak vs Qwerty, Mac OS vs Linux/Win)

Arrows at the bottom right have dual functionality: tap -> arrow, hold -> modifier.
Supports 4 default layers: Colemak Mac, Qwerty mac, Colemak Win/Linux, Qwerty Win/Linux. Switching between layers is persistent.

Mac versus Win/Linux layers:

modifiers are ordered differently. Mac version has (from middle to outer) CMD, ALT, CTRL, win/linux version has CTRL, ALT, CMD. It's meant to make switching between platforms easier. I'll still require some keymap changes in various software, but it does help with the biggest problem where main modifier for shortcuts on linux is usually ctrl but on mac it's cmd.
Extend layer is different, so keys for "previous/next word" and "copy", "paste", "cut", and "undo" work properly.

## What's next



[layout]: http://www.keyboard-layout-editor.com/#/gists/14d62ee67d36621c37888783fa29b107 My layout
[layout_image]:https://i.imgur.com/qQtYqPy.png Layout image
[layout_repository]:https://github.com/josefadamcik/qmk_firmware/tree/katana60_josefs_custom/keyboards/katana60/keymaps/josef Layout on github (QMK)
[qmkfirmware]:https://github.com/josefadamcik/qmk_firmware/tree/katana60_josefs_custom/keyboards/katana60/keymaps/josef QMK firmware fork with mmy repository
[katana60]:https://candykeys.com/search/katana60 Katana60 on CandyKeys
[katana60v2]:https://geekhack.org/index.php?topic=99136 Geekhack thread about Katana60 v2