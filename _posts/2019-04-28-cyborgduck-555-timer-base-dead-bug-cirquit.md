---
layout: post
title: Cyborgduck - a 555-timer-based dead bug cirquit
categories: electronics
published: true
image: /images/cyborgduck/IMG_20190428_191525.jpg
---

Behold, our cyborgduck overlords are coming!

<figure >
    {% video /images/cyborgduck/Cyborgduck.mp4 /images/cyborgduck/Cyborgduck.png %}
</figure>

<!--more-->

## Circuit

It's a basic 555-timer-based astable circuit with a LED driven by a transistor. All powered by a 3V coin battery cell.

<figure >
    {% video /images/cyborgduck/CyborgDuckWorkingInternals.mp4 /images/cyborgduck/CyborgDuckWorkingInternals.png %}
    <figcaption>Detail off internals (without battery).</figcaption>
</figure>

And a schematic - available [also on EasyEDA](https://easyeda.com/josefadamcik/CyborgDuck).

{% responsive_image path: images/cyborgduck/cyborgduckschematic.png alt: "" figcaption: ""  class: "imgmw600"  %}

### Update on transistor

This is, [as some people pointed out on Reddit](https://www.reddit.com/r/electronics/comments/bina57/behold_our_cyborgduck_masters_are_coming/), over-engineered - there is no need to use a transistor. Some people assumed that I was using a transistor because I had concerns about current limits. But that was not the case, I had problems with voltage levels. Let me elaborate.

The NE555 timer has (according to [the datasheet](http://www.ti.com/lit/ds/symlink/na555.pdf)) minimal supply voltage of 4.5 volts and I am powering it with a 3V battery. It still works, though.

But another important thing is, that the output square wave doesn't have the "full" supply voltage. According to the datasheet, the typical "High-level output voltage" is 3.3V for supply voltage 5V (and it would be even lower for 3V). Some voltage is needed to open the diode and the blue LED is rated to have a forward voltage of 3.2V - that's more than my supply voltage. Fortunately, it opens on a lower voltage level.

So, when I tried to power the blue LED with NE555's output - here I mean using the high level to open the LED, therefore connecting the anode to the output - it didn't work. You can see it [on video (I am lowering the voltage on the video, starting with 3.5 and going to 3.0)](https://imgur.com/a/vsOeh3).

So I almost automatically threw in a transistor and used it to control the LED. Even though this solution works, it's not necessary. The easier and smarter (well, not dumb) solution is to revert the diode -> use the low-output state to open it (bring cathode to the ground). That's what I actually did with the transistor, but you don't need the transistor to do it. [Another video illustrates how easy the fix is](https://imgur.com/a/i9dycd1). 

But sadly, I didn't realize it until I built and saw the discussion on Reddit. Yeah, that's a bit embarrassing. But there's a lesson hidden for me and maybe even for the dear reader.

## Build log

{% include gallery.html galleryname="cyborgduck" imgclass='imgmw600' %}


