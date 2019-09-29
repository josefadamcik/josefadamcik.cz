---
layout: post
title: It's never too late to learn C++ properly.
categories: programming
tag: [cpp, programming]
published: true
image: /images/cpp/cpp_logo.png
---

If you asked me a year ago to learn C++, I would politely refuse. Now I am (re)learning it. 

<!--more-->

## Languages, languages, languages

My first experiences with programming, when I was a young boy, were Basic on my father's ZX Spectrum+, later Quick Basic on his laptop and finally Borland Turbo Pascal, which I managed to obtain somehow. And then it escalated quickly: C/C++, a tiny bit of Assembler, and a lot of Visual Basic on the secondary school, Java in my free time and finally at the university: Pascal, C/C++, Java, C#, Python and maybe more.

I have been working as software developer for circa 12 years and I have met several languages. Java is my daily bread, but I have significant experience with ECMAScript (AKA JavaScript) and PHP and at least brief experience with many others: Kotlin, Python, Dart, TypeScript, Ruby and so on.  

## C++

As you can see, I had met C and C++ during my studies, I had even passed at least two exams in those languages. I must admit I wasn't fan of C/C++ back than so I had learned only as much as was required and nothing more. Java was the language of my choice. I haven't used C++ since than so the little amount of knowledge I had melted away. Only few vague ideas and emotions remained:

- it's a low-level language, not as low-level as assembler, but still
- pointers and references, stars and ampersands, confusion!,
- no garbage collection, so there will be leaks everywhere,
- you can overload operators, that's fun!, but it also leads to unintuitive interfaces made by developers who considered overloaded operators to be... well, fun!, yep I am talking about you, `iostream`!
- it's overall annoying to work with

If you have similar amount of experience with C++ as I do, you might have similar view. I you really know C++, you would probably consider it at best naive, funny, or maybe even stupid. 

## But why C++? Isn't it dead or something?

I recently got into [hobby electronics](https://josef-adamcik.cz/electronics/more-blinking-leds-kitt-insipred-gizmo-v1.html), playing with [Arduino and micro-controllers](https://josef-adamcik.cz/electronics/led-cube-4x4x4x-attiny84-74138.html). Arduino SDK uses C++ compiler. It attempts to hide this as sort of implementation detail, but there's still mix of C and C++ hidden in there. When I began, it didn't matter. I just found some example, copy pasted a snippet, modified it, and made it work, and was happy that it blinks a LED or something. And the [code](https://github.com/josefadamcik/ledcube_4x4_double74138) was [not nice](https://github.com/josefadamcik/bscar). But I am still a programmer and therefore an urge to refactor my code, to make it better organized and optimized, came. That was the first time I realized, that I should learn C++.

The second impulse was professional. I am looking for a new professional opportunity, some interesting company that I would love to work for. [My current situation is a bit special](https://josef-adamcik.cz#quick), so it isn't as easy as it would be normally. I am interested preferably in Android developer roles, and I have recently noticed that there is significant amount of job postings that require both Android and C++ knowledge. Sometimes it's because of Android NDK, sometimes the team shares some C++ code between Android and iOs, sometimes they just need somebody with an overlap to embedded. I realized, that C++ is not dead and there's still a place for it in my skill set.


I know there are other modern languages that are trying to replace C++ in many areas (for example [Rust](https://www.rust-lang.org/)). But a C++ compiler exists for almost every platform, there are code bases written in C++ that have to be maintained. C++ is not dead and won't die soon. And everybody can learn a lot by writing code that's a bit more low-level than with modern languages. 

## Thinking in C++

So I bought a book.

{% responsive_image path: images/cpp/cppbook.jpg alt: "Thinking in C++ by Bruce Eckel" figcaption: "Thinking in C++ by Bruce Eckel" %}

I know it's a bit old, but I bought it because It was a cheap second hand buy on Amazon and I wanted to avoid decision paralysis. I mean spending several hours reading reviews, Quora answers, and Reddit posts about "What book about C++ should I buy".

Of course, the book have its flaws.

It's quite old and C++ is still evolving. I suppose that the book is based on the 1998/2003 Standard, but there are two more versions: C++11 and C++14. Modern C++ is different and some statements in the book may be outdated now. I actually cannot say how big problem this is, because I have just finished the book and I still don't know anything about the new versions. 

Another issue is, that it's written for developers who don't have any knowledge of OOP and therefore the book slowly introduces all the basic concepts which already I know.

But the book helped me to clarify many things and I learned a lot about C++. Obviously mainly about syntax and ways how C++ handles different constructs. But there are several concerns I wont to emphasize: 

- It helped to clarify a boundary between C and C++.
- I learned that the "low-levelness" isn't just about being closer to memory, hardware, and having to take care of more things, but also about being closer to the compiler. Many oddities in the language are there because the compiler needs help to figure something out. I suspect that this might have changed a lot in newer versions.
- As a professional doing some kind of OOP for your whole career, you are surrounded by SOLID, GRASP, patterns, architectures. There's a lot to think about when designing and developing object oriented program. But the book nicely illustrates how huge improvement was just the introduction of basic OOP concepts (classes, access control, inheritance etc.) over procedural code in C.
- I can see Java and some of its imperfections and specifics in a slightly different light now. It's easier to imagine problems that the original Java authors attempted to solve. 


## Next steps

I will continue to learn C++. [There's Volume 2 of the book available freely online](https://archive.org/details/TICPP2ndEdVolTwo). There are those new things introduced in C++11 and newer. And I am going to write more C++ code, because without writing code you cannot learn a language.

## Update - feedback

I've received some feedback in [comments on reddit](https://www.reddit.com/r/programming/comments/9e2a1f/how_and_why_i_decided_to_learn_c_after_12_years/) and through e-mail. I appreciate all advice and suggestions.

Many people emphasized that I should definitely learn modern C++ and start at least with C++11. I am going to take this advice seriously and I will continue with modern C++. There was [a little dispute whether should I learn things in sequence as the time went or whether should I jump the newest version](https://www.reddit.com/r/programming/comments/9e2a1f/how_and_why_i_decided_to_learn_c_after_12_years/e5m3xln). But I think I will be able to find my way. The argument itself helps me to understand the world of C++ versions a little bit better.

It was also suggested that I should look into [RAII](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization). That is a great tip. I haven't heard about that concept before, but as I was reading the book, it came to my mind, that it might be possible to manage memory using some similar approach. Related advice mentioned, that it's possible to write code completely without usage of new, delete and bare pointers. Instead, templates from the standard library like `std::array`, `std::unique_ptr`, `std::shared_ptr` may be used. 


