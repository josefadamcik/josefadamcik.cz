---
layout: post
title: Freeform 555 timer based breathing diode bug
categories: electronics
published: true
image: /images/bug1/IMG_20190407_210103.jpg
---

I have been watching those amazing freeform creations by people like [@MohitBhoite](https://twitter.com/MohitBhoite) and [@jipraus](https://twitter.com/jipraus) for some time. I examined many entries for [the recent Circuit Sculpture Contest on hackaday.com](https://hackaday.io/contest/162559-circuit-sculpture-contest) and have been thinking, that I would love to build something like that, but I had been convinced that my skills are not good enough.

But skills can be trained and learned. So I finally ordered a few brass rods and tried my first freeform sculpture. Here's the result.

<figure >
    {% video /images/bug1/Bug1.mp4 /images/bug1/Bug1.png %}
</figure>

<!--more-->

## Circuit

The circuit is based on [this one](http://www.555-timer-circuits.com/up-down-fading-led.html) (it's possible to find this schematic all over the internet). My version is powered by 5v, uses only 100&#8486; current limiting resistor for two yellow LEDs. Also the R1 resistor is 20K&#8486; in my case. I used transistor BC337.

## Build log

{% include gallery.html galleryname="bug1" imgclass='imgmw600' %}

Do you like it? You can [upvote or comment on reddit](https://www.reddit.com/r/electronics/comments/bare66/my_first_freeform_circuit_creation_simple/) or [share on twiter](https://twitter.com/josefadamcik/status/1115173648283983872).

## Next plans

I want to build few more small things in order to get better at this. Once I improve my skills and learn some tricks, I would like to build [my shift register-based larson scanner]({{ site.baseurl }}{% post_url 2018-10-7-kittblink2-kitt-inspired-gizmo-v2 %}) in this style.