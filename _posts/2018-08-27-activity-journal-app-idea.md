---
layout: post
title: Activity journal - mobile application idea and personal project kickoff
categories: programming
published: true
---

I have got an idea for an Android application during my vocation. In this article I am elaborating about the idea and my motivation to build it.

<!--more-->

## My use case

I tend to track some of my daily activities in different ways. 

- I use [a  mobile application (Sportractive)](http://sportractive.com) that tracks my runs and sends data to [smashrun.com](https://smashrun.com)
- Google fit also tracks my running and adds other episodes of movement it detects.
- I use toggle.com in order to track remaining activities:
    - yoga exercises
    - study and self-improvement
    - work on personal projects
- And of course I always track tasks done during work, but let's put those aside for now.
- Recently I tried to create a journal but at the moment I only track my yoga sessions and keep some information about exercises I did.

I want still use specialised application for the tracking of my runs, but It would be nice to have a place to keep track of all my activities so I can analyze and study how I spend my time. It would be nice to have a mobile application for it, wouldn't it? 

There are a lot of applications that try to solve similar use cases. I checked a few and nothing was exactly what I was looking for and I gave up quickly and stayed with my current solutions. I believe I would be able to find something that's good enough to cover my needs, but I don't really want to. 

As an Android developer I can write the application myself. That's a great idea, isn't it? Well, it's a terrible idea. If I wanted to enter saturated market with a new application and attempted to make money, I would be naive. But... that's actually not my goal!

## Personal projects and why to write an app that's not likely to be released

It's always good to have some application as a reference and it's always good to have some project where I can try new approaches and technologies. 

Those were main reasons why I created [TrackOnTrakt](https://github.com/josefadamcik/TrackOnTrakt) - an application that acts as simple client for the [trakt.tv](https://trakt.tv) service. Trakt.tv is similar to [last.fm](https://last.fm), but for video. You can track movies and shows you watched. There are integrations for various media players and online services, but not for all of them. TrackOnTrakt covers a use case, where user watches something in a situation, when this activity is not tracked automatically (e.g. in cinema) and he needs to "check-in" manually. 

I have never released the application, and I am going to leave it unfinished. Don't take me wrong, the application works and the aforementioned use case is covered. I just had more plans with it and I still have a long TODO list containing many tasks and ideas, but I don't have any motivation to continue. I don't use the app myself. I don't believe that somebody would want to use it. You can do the same just with the trakt.tv website or with any other trakt.tv client. It's also very thin client over Trakt's API, so that the application has simple architecture and it's not as challenging to implement as I would like it to be. 

I have learned a bit while working on it, but I feel that now it's the time to move on and start another project, which would allow me to try other new technologies and approaches. I don't really expect that I would finish or publish this new project either, but that doesn't matter because that's not my goal. 

The primary goals are: 

1. training. It's always good to train your skills, 
2. experimenting with new technologies and approaches without risk that I would create some future problem for some "real" application.

With TrackOnTrakt, the new technologies and concepts I tried were:

- Kotlin
- MVP 
- Bigger emphasis on testing than I was used to in my previous Android projects, including continuous integration and Espresso tests.
- I started [a quick rewrite in Flutter](https://github.com/josefadamcik/trackontracktfltr) and learned some basics of Flutter and Dart. But this version is heavily work in progress and doesn't do much yet. I might do some more work on in in the future, but I think it's more likely, that I would leave it abandoned.

For this new project, I would like to:

- continue with Kotlin and deepen my knowledge of the language,
- use Android Components (they came out after I started TrackOnTrakt),
- avoid RxJava, focus more on Android Components and maybe try to use coroutines from Kotlin,
- use MVVM, maybe with DataBinding (I am actually bit afraid to use DataBinding, but I'll see),
- Clean Architecture, perhaps,
- even better approach to testing, I want to go for TDD and finally figure out, how to do it properly in Android projects. 

TDD is big reason for me, because I fell in love with TDD in the beginning of my career, but repeatedly failed to use it in practice. Later I gave up and put it on a shelf labeled "hopes & dreams". But lately I have been reevaluating everything I learned during my career, looking for ways how to improve myself and how to become a better professional. I have been reading (or watching) more material about development from R.C.Martin, M.Fowler and others and decided that I want to be the developer who puts things from the "hopes & dreams" shelf to practice, who doesn't give up easily and finds way how to make those things work. The latest inspiration for my return to TDD was this [great talk by Ian Cooper - TDD, Where Did it go all wrong](https://www.youtube.com/watch?v=EZ05e7EMOLM).
 
## Outline of the project

**Name**: Private activity journal

**App statement**: Helps you to keep record of various daily activities.

**Use cases - basic features**:

1. User chooses an activity to track, starts tracking and when the activity ends, he stops tracking. The activity is added to his timeline. Activities have category. There can be multiple activities tracked simultaneously (e.g. commuting and listening to podcast).
2. User adds an activity that happened in the past.
3. User manages (edit/remove) activities on his timeline.
4. User can add notes and sentiment (mood picked) to his activities at any time.
5. User can explore daily, weekly and monthly statistics of his activities. He can filter activities by categories.

**More features**

- Activity templates: user can add templates for activities, that would allow to track them easier.
- Activity fields: user can add a field with name and numerical value to every activity or template. There can be more of those in every activity. It's possible to display those values in graphs (trends). Those can be used for tracking of counts of particular exercises in workout.
- Backup up / sync - data are backed up and / or synchronized via Gdrive or Dropbox
- Auto activities - there might by automatically tracked activities based on various information sources. 
    - APPs and APIs, the application can fetch data from others applications and APIs, where possible and reasonable. It may, for example, get activity info from Google Fit.
    - geofencing -> e.g. the application detects that user is present in his office, it will add activity "in work"
    - observing notifications -> listening to podcasts
- export: CSV, JSON, ...

**Constraints**

Application stores data only in the device. There is no API, no backend, no webapp. The only exception will be Dropbox backup/sync mentioned above. But all data are completely controlled by the user.

## Next steps

I am going to continue with some basic design steps (flow diagrams, wire frames) until I have a good idea what I actually want to build. I will share results, so stay tuned. 


