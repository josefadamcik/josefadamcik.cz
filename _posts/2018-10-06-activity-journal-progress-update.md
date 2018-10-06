---
layout: post
title: Activity journal - progress update
categories: programming
published: true
series: "Activity Journal"
image: /images/activityjournal/wf_timeline1_p.jpeg
---


Progress update about the Activity journal project.

<!--more-->

{%- include post_series.html -%}


## Going full on TDD

In the end, I decided to do an experiment and to start with almost no libraries and no architecture at all. I would like to discover a need for dependencies and architecture during TDD cycles. This is the hard way and not really a production-time way, at least when development for Android is considered. But it's an interesting exercise. 

I am still biased by my ideas about the technologies and architecture I want to use therefore I may steer my way into them a bit. I also decided to consider only a single activity application (with navigation using fragments) for this project, even though I am not convinced that it actually is the correct approach.


## How it goes?

Here is [a Github repository](https://github.com/josefadamcik/activityjournal). Keep in mind, it's heavy work in progress.

What I did so far:

- Wrote [the first test](https://github.com/josefadamcik/activityjournal/commit/fc4caa175774359877da0cda55449c407fa1a71a#diff-b41961406f96e9d990d19b21db8fc53a) and then generated first activity, because TDD!
- Prepared a setup for Circle CI, a code coverage report generation and a [Codecov integration](https://codecov.io/gh/josefadamcik/activityjournal). It took more time than I anticipated, but it's a one-time investment. [Working Circle CI setup without any functionality is available here](https://github.com/josefadamcik/activityjournal/tree/36ab365d3a2a460e4fec3a1394d29db7e0e83239).
- Did a few sessions and managed to implement some basic functionality for timeline and a simplified add activity flow. 


{% include gallery.html galleryname="activityjournal_screenshots_01" imgclass='imgmw400' %}


The application is now in a very strange state. 

There is no persistence yet. I started just with an in-memory List for ActivityRecords. The idea is that as I implement various requirements and write tests for them, I will get to adding a persistence. 

There is almost no architecture yet. But the need for a better structure is already showing itself. I introduced a [repository for ActivityRecords](https://github.com/josefadamcik/activityjournal/commit/c347765a8be844790613b3087ea3249af0237129#diff-1e747f0c66e8ea3b863938f214ceb9cb) when I was implementing sorting and there is a small backing object that helps to manage state during the add activity flow. I want to add a little bit more functionality and than I will try to "refactor some architecture out".


So far I was writing mostly espresso tests. It's not as bad as I expected, but it does really make sense to move as much testing as you can to unit tests.

I was able to keep my quite strict TDD approach for most of the time. I recall only one situation where I had to take a bigger leap because I wasn't able to figure out a small step.

But I must admit this approach is definitely slower than throwing in MVVM and Android architecture components and starting from there. I believe that it's a valid approach (considering TDD) to use your knowledge of the platform/domain and start with some architecture and libraries. You should just see them as a temporary scaffolding that may change.

In the end, I must also say that it's fun and a really interesting exercise.

## Ehm, streaming, really? 

Since this is my training and exercise project I want to exercise as much as I can. And I had this silly idea I might do some live coding, streaming on [twitch.tv](https://www.twitch.tv/josefadmc). The idea is, that during streaming there are 2 additional aspects I am training:

- I am forcing myself to overcome some fears about coding when watched. Similar emotion can influence pair programming or coding challenges during interviews.
- I am practising my active English when I am trying to explain what am I doing and why.

I still feel quite embarrassed about it. I am quite nervous for most of the time and I feel that I struggle with things I would be normally able to solve quicker. Also, I feel this strange guilt every time I run into something I don't know and need to figure out (Google, StackOverflow) and somebody is watching. But those are exactly the emotions I want to overcome. And slowly I am getting used to it.

Feel free to [subscribe and there are also recordings available](https://www.twitch.tv/josefadmc). But huge disclaimer: I am awful at it, it's boring, most of the time I just struggle with Espresso or something. You should know better ways how to spend your time. 


