---
layout: post
title: "Self-balancing stories, EP 1: How to not start a project made from parts I already have"
categories: electronics
tags: [buildlog, electronics, robot, pid]
published: true
series: "Self-balancing-stories"
image: /images/selfbalancing/
---

It was early pandemic when my employer swiched to full work-from-home mode and I realized I have a bit more free time since I my commute times dropped to zero. Apart from keyboard stuff, I had no nice project in progress that wouldn't involve waiting for PCB manufacturing and parts. 

So, what could I build from things I have at home? What about those 2 cheap geared DC motors, those 2 wheels, some micro, IMU unit. Hmm. I see a 2-whelled self-balancing robot here. I always wanted to build one and learn how they work. 

<!--more-->


Idea sounded great. I had most of the important stuff, but what about the body of the robot? I had no 3d printer, not even a nice workshop, no materials like plywood or acrylic sheets. So the only solution apart from cardboard seemed to be to use prototyping PCB perfboards and M2 brass rods I had. 

And here it started to fall apart. My stock of spacers M2 was quite weak. M3 was better but too big for mounting holes in perfboards. I didn't have enough perfboards of the same size to make the whole robot. I tried to utilize some super cheap one-sided ones and cut different sizes and also tried to drill holes for M3 spacers. I failed horribly destroying most of my materials. I also didn't have any bracket to fix the motors to perfboards. And the wheels - oh my god, they were just too tiny and motor shaft too big for them.

I tried at least to prototype the electronic. Let's use a LIon cell heer, stup up to 6V (that's what the motors are rated for). ESP32 on some devboard as a micro, L298N h-bridge dual motor driver. Everything I had at my stock, just waiting to be used.

Well, the step up is terrible since it wasn't really possible to set a fixed output voltage. The regulating potentiometer needed to be adjusted when load was connected or changed. I ended up maxing it out in order to have desired 6V on the h-bridge during load. The L298N wan't any win either. It has quite big voltage drop so my motors weren't getting their 6V at all. 

All this made me quite sad and dissapointed at first. Until I gave up my "use just parts at home" idea and filled one virtual shopping basket with couple of robot wheels, brackets for motors, better fixed voltage stepup board, better motor driver. And yeah, let's also take a bunch of properly sized protoboards and I would also take this spacer assortment, please.






