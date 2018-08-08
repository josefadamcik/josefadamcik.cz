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


![74595 SIPO register pinout]({{ "/images/kittblink1/74595-pinout.png" | absolute_url }} "74595 SIPO register pinout"){:width="320" .left .mr2 .mb2}



If you know what a shift register is, you can skip to the next chapter. In other case, quick and simplified explanation follows. I am going to use PIN names from this [74595 data sheet][74595ds] in the article.

SIPO (serial in parallel out) shift register is an IC, that allows control of several parallel outputs by a serial input. There are 8 outputs (<code>Q<sub>A</sub></code>,..., <code>Q<sub>H</sub></code>) in the case of `sn74hc595`.   The IC remembers a value for each input in a register. When you want to set some value on those outputs, you do it in a loop, bit by bit. 

1. Set serial input (`SER`) to `LOW` or `HIGH`, it depends on desired value for this bit.
2. Send a pulse to clock input (`SRCLK`). 
3. IC will store the value in the first register, value that was previously in the first register will be shifted to the second register and so on. That's  why it's called shift register.
4. The value in the last register is forgotten, but there's usually a pin that allows for easy chaining. The last value is exposed on this PIN (<code>Q<sub>H'</sub></code>) until next clock cycle. You may notice backtick in PIN's name. That basically means, that the value to this pin is propagated as soon as shift happens and not when `RCLK` is triggered (see step 6).
5. You repeat steps 1-4 until you shift all desired bits.
6. All shifted values aren't propagated to parallel outputs automatically. You must tell the IC to send stored values to the outputs using another signal input (`RCLK`).

And that's it. As I mentioned, it's really easy to control one or more shift registers with a micro-controller. The Arduino SDK have a special function for it -- [`shiftOut()`][shiftout]. But as I already mentioned, let's do this gizmo without programming at all.

## Shifting one bit 

Let's say we have some clock circuit, that provides us with stable clock. I am not going to cover details of these, it's easy to find plenty of ways how to build one of those. Than we can:

1. Connect the clock to `SRCLK` and `RCLK`. Each pulse will trigger both shifting and propagation to outputs.
2. Connect outputs to diodes with current limiting resistors.
3. Connect all other pins required for functionality according to the datasheet (`VCC`, `GND`, `OE`, `SRCLR`).
4. Create infinite loop by connecting <code>Q<sub>H'</sub></code> to `SER`.

Now we can send a short `HIGH` pulse to `SER` (I used simple button) and if the timing is correct, we'll send one `HIGH` bit into the register, which will cycle there forever. 

{% responsive_image path: images/kittblink1/IMG_20180429_154628.jpg alt: "First part of the circuit" figcaption: "First part of the circuit" %}

But this gives us only a half of the desired effect. We can observe how lit LED moves from left to right and than jumps back to left and the cycle repeats.  But we don't want it to jump, but to return back by lighting the diodes in reverse order.

So what about adding another shift register? We can connect them in series and somehow pair their outputs in such configuration, that we achieve desired effect. Well, what "somehow" means? Simple OR gate would do. Unfortunately I didn't have any OR gates, so I used NOR gates and invertors. But for the sake of simplicity there are OR gates in the schematic.



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