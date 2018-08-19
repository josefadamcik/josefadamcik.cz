---
layout: post
title: More blinking LEDs - KITT inspired gizmo version 1
categories: electronics
published: true
---

What could I do with couple of ICs (mainly shift registers), LEDs and basic components, but without a micro-controller?

## Challenge is fun

I wrote a little about my path to hobby electronics in [a previous post about LED cube]({{ site.baseurl }}{% post_url 2018-07-23-led-cube-4x4x4x-attiny84-74138 %}). I also mentioned that I ordered a bunch of components from AliExpress. They were mostly [items from a list](http://elektrokniha.cz/parts.html) provided in [the book I mentioned in the post too](http://elektrokniha.cz/parts.html). As a consequence I ended up with a pile of components and I began to think, what could I make with them. 

There were various ICs included and among them a few [shift registers][74595ds]. Hmm, maybe I can drive a row of LEDs with a shift register! And of course, you can connect a shift register to a micro-controller, add LEDs and then  program various behaviors. And it's fun, for a while.  But let's make it a bit more challenging. What about building something without any micro-controller?

## KITT


![KITT from KnigthRider]({{ "/images/kittblink1/knighriderkitt.gif" | absolute_url }} "KITT from KnigthRider"){:width="320" .left .mr2 .mb2}

Do&nbsp;you&nbsp;remember Knight Rider? A TV show from eighties staring David Hasselhoff and more importantly an intelligent car named [KITT](https://en.wikipedia.org/wiki/KITT). Take a moment and watch [an original intro for the show](https://www.youtube.com/watch?v=oNyXYPhnUIss){:target="_blank"}, it's worth it.

As you can see, the car's mask has this iconic swiping light effect. It should be easy to recreate it with a shift register, shouldn't it?

## Shift register


![74595 SIPO register pinout]({{ "/images/kittblink1/74595-pinout.png" | absolute_url }} "74595 SIPO register pinout"){:width="320" .left .mr2 .mb2}

If you know what a shift register is, you can skip to the next chapter. In other case, quick and simplified explanation follows. I am going to use the PIN names from this [74595 data sheet][74595ds] in the article.

SIPO (serial in parallel out) shift register is an IC, that allows control of several parallel outputs by a serial input. There are 8 outputs (<code>Q<sub>A</sub></code>,..., <code>Q<sub>H</sub></code>) in the case of `sn74hc595`.   The IC remembers a value for each input in a register. When you want to set some value on those outputs, you do it in a loop, bit by bit. 

1. Set serial input (`SER`) to `LOW` or `HIGH`, according desired value for this bit.
2. Send a pulse to clock input (`SRCLK`). 
3. IC will store the value in the first register, value that was previously in the first register will be shifted to the second register and so on. That's  why it's called shift register.
4. The value in the last register is forgotten, but there's a pin that allows for easy chaining. The last value is exposed on this PIN (<code>Q<sub>H'</sub></code>) until next clock cycle. You may notice backtick in PIN's name. That basically means, that the value to this pin is propagated as soon as shift happens and not when `RCLK` is triggered (see step 6).
5. You repeat steps 1-4 until you shift all desired bits.
6. All shifted values aren't propagated to parallel outputs automatically. You must tell the IC to send stored values to the outputs using another signal input (`RCLK`).

And that's it. As I mentioned, it's really easy to control one or more shift registers with a micro-controller. The Arduino SDK have a special function for it -- [`shiftOut()`][shiftout]. But as I already mentioned, let's do this gizmo without programming at all.

## Shifting one bit 

Let's say we have some clock circuit, that provides us with a stable clock signal. I am not going to cover details of such circuit, because it's easy to find plenty of ways how to build one of those. Then we can:

1. Connect the clock to `SRCLK` and `RCLK`. Each pulse will trigger both shifting and propagation to the outputs.
2. Connect the outputs to diodes, where each diode has a current limiting resistor.
3. Connect all other pins required for functionality according to the datasheet (`VCC`, `GND`, `OE`, `SRCLR`).
4. Create infinite loop by connecting <code>Q<sub>H'</sub></code> to `SER`.

Now it's possible to send a short `HIGH` pulse to `SER` (I used a button) and if the timing is correct, one `HIGH` bit will be sent into the register. This one `HIGH` bit will cycle there forever. 

{% responsive_image path: images/kittblink1/IMG_20180429_154628.jpg alt: "First part of the circuit" figcaption: "First part of the circuit" %}

But this gives us only a half of the desired effect. We can observe how the lit LED moves from left to right and than jumps back to the beginning and the cycle repeats. But we want it to return back by lighting the diodes in reverse order.

So what about adding another shift register? We can connect them in series and somehow pair their outputs in such configuration, that we achieve desired effect. Well, what "somehow" means? Simple OR gate would do. Unfortunately I didn't have any OR gates, so I used NOR gates and inverters. But for the sake of simplicity there are OR gates in the [schematic][schematic]. Another approach would be to use diodes. 

{% responsive_image path: images/kittblink1/Schematic_kitt-blink_KittBlinkV1_20180808150411.png alt: "Schematic" figcaption: "Schematic. It's a mess, isn't it?" %}

The schematic is a bit mess, though. But the trick is to connect outputs of ICs in reverse order. <code>U1Q<sub>X</sub></code> are outputs of the first IC and <code>U2Q<sub>X</sub></code> for the second.

- LED1 = <code>U1Q<sub>A</sub></code> OR <code>U2Q<sub>H</sub></code>
- LED2 = <code>U1Q<sub>B</sub></code> OR <code>U2Q<sub>G</sub></code>
- LED3 = <code>U1Q<sub>C</sub></code> OR <code>U2Q<sub>F</sub></code>
- LED4 = <code>U1Q<sub>D</sub></code> OR <code>U2Q<sub>E</sub></code>
- LED5 = <code>U1Q<sub>E</sub></code> OR <code>U2Q<sub>D</sub></code>
- LED6 = <code>U1Q<sub>F</sub></code> OR <code>U2Q<sub>C</sub></code>
- LED7 = <code>U1Q<sub>G</sub></code> OR <code>U2Q<sub>B</sub></code>
- LED8 = <code>U1Q<sub>H</sub></code> OR <code>U2Q<sub>A</sub></code>

And here we go:

<figure >
    {% video /images/kittblink1/kittblinkv1.mp4 /images/kittblink1/kittblinkv1_thumb.jpg %}
    <figcaption>Completed prototype version 1 (video). Longer version available on <a href="https://www.youtube.com/watch?v=hXiGiKb8M7k" target="_blank">youtube</a>.</figcaption>
</figure>


## Problems and ideas

This is actually just a really simple idea and circuit I already shared in [a reddit post][redditpost] few months ago. There are several problems and possible improvements.

- It requires a manual starting pulse. 
- The first and the last LEDs are turned on twice each time the direction is reversed.
- LEDs just blink. There's no cool fading trail effect. 

I already created a new version, that solves all those problems, but I am going to write a separate post about it. This one is meant to be an introduction and warm-up for the next article. Stay [tuned](https://josef-adamcik.cz/feed.xml).

[74595ds]: http://www.ti.com/lit/ds/symlink/sn74hc595.pdf "Datasheet for SN74HC59" 
{:target="_blank"}
[shiftout]: https://www.arduino.cc/reference/en/language/functions/advanced-io/shiftout/ "Arduino shiftout() documentation" 
[redditpost]: https://www.reddit.com/r/electronics/comments/8jka9c/i_made_a_thing_that_blinks_from_left_to_right_and/ "Reddit post - I made a thing that blinks from left to right and than from right to left (without micro controller)" 
[schematic]: https://easyeda.com/josefadamcik/kitt-blink "Shematic on EasyEDA"