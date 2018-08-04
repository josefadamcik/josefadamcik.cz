---
layout: post
title: More blinking LEDs - KITT inspired gizmo version 1
categories: electronics
published: true
---

What can I do with a couple of ICs (mainly shift registers), LEDs and basic components, but without a micro-controller?

## Challenge is fun

I wrote a little about my path to hobby electronics in [a previous post about LED cube]({{ site.baseurl }}{% post_url 2018-07-23-led-cube-4x4x4x-attiny84-74138 %}). I also mentioned that I ordered a bunch of components from AliExpress. They were mostly [items from a list](http://elektrokniha.cz/parts.html) provided in [the book I mentioned in the post too](http://elektrokniha.cz/parts.html). As a consequence I ended up with a pile of components and I began to think, what could I make with them. 

There were various ICs included and among them a few [shift registers][74595ds]. Maybe I can drive a row of LEDs with a shift register! And of course, you can connect a shift register to a micro-controller, add LEDs and then you can program various behaviors. And it's fun. For a while. But what about a little challenge? What about making something without any micro-controller?

## KITT


![KITT from KnigthRider]({{ "/images/kittblink1/knighriderkitt.gif" | absolute_url }} "KITT from KnigthRider"){:width="320" .left .mr2 .mb2}

Do&nbsp;you&nbsp;remember Knight Rider? A TV show from eighties staring David Hasselhoff and more importantly an intelligent car named [KITT](https://en.wikipedia.org/wiki/KITT). Take a moment and watch [an original intro for the show](https://www.youtube.com/watch?v=oNyXYPhnUIss){:target="_blank"}, it's worth it.

As you can see, the car's mask has this iconic swiping light effect. It should be easy to recreate it with a shift register, shouldn't it?

## Shift register

If you know what a shift register is, you can skip to next chapter. In other case here's a quick and simplified explanation.

SIPO (serial in parallel out) shift register is an IC, that allows you to control several parallel outputs by a serial input. There are 8 outputs in the case of [sn74hc595][74595ds]. The IC remembers a value for each input in one register. When you want to set some value on those outputs, you do it in a loop, bit by bit. 

1. Set serial input to `LOW` or `HIGH`, it depends on desired value for this bit.
2. Send a pulse to clock input. 
3. IC will store the value in the first register, value that was previously in the first register will be shifted to the second register and so on. That's  why we call it a shift register.
4. The value in the last register is forgotten, but there's usually a pin that allows for chaining of those ICs. The last value is exposed on this PIN until  next cycle. 
5. You repeat steps 1-4 until you shift all desired bits.
6. Tell the IC to send current values to parallel outputs using another signal input.

And that's it. As I mentioned, it's really easy to control one or more shift registers with a micro-controller. The Arduino SDK have a special function for it -- [`shiftOut()`][shiftout]. But as I already mentioned, let's do this gizmo without programming at all.

## Shifting One bit

- Shift one bit, that's easy. But what about another direction?
- Add another shift register and OR outputs.
- a clock

## Here we go

[a reddit post][redditpost]

- schematic
- image
- video 

## Problems and ideas

- start pulse
- idea with binary counters
- don't stop ad the end
- what about fadeout effect?

[74595ds]: http://www.ti.com/lit/ds/symlink/sn74hc595.pdf "Datasheet for SN74HC59" 
{:target="_blank"}
[shiftout]: https://www.arduino.cc/reference/en/language/functions/advanced-io/shiftout/ "Arduino shiftout() documentation" 
[redditpost]: https://www.reddit.com/r/electronics/comments/8jka9c/i_made_a_thing_that_blinks_from_left_to_right_and/ "Reddit post - I made a thing that blinks from left to right and than from right to left (without micro controller)" 