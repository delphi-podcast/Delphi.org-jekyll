---
id: 2811
title: 'Keep Threading in Mind'
date: '2017-04-21T18:18:23-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2811'
permalink: /2017/04/keep-threading-in-mind/
categories:
    - News
tags:
    - News
    - 'Parallel Programming'
    - PPL
    - threading
---

In my <a href="http://delphi.org/2017/04/the-niagara-falls-lighting-episode/">interview with Martin</a> he talked a lot about the importance of performance, which is one of the reasons he uses Delphi for his real-time lighting control systems. He said something along the lines that if you are not programming with threading in mind then you are never going to get good performance. That is good advice. Even cell phones have quad-core processors in them these days.

<a href="/assets/images/2017/04/keep-threading-in-mind.jpg"><img class="aligncenter size-large wp-image-2813" src="/assets/images/2017/04/keep-threading-in-mind-1024x683.jpg" alt="Keep Threading in Mind" width="640" height="427" /></a>

&nbsp;

Delphi includes a great <a href="http://docwiki.embarcadero.com/RADStudio/en/Using_the_Parallel_Programming_Library">Parallel Programming Library</a> which I really like. There is also the ever popular <a href="http://www.omnithreadlibrary.com/">OmniThreadLibrary</a>. They both make parallel programming much easier. I just learned about a new helper library to make parallel programming even easier.
<h2><a href="https://bitbucket.org/sivv/cocinasync">CocinAsync</a>: A Delphi library to simplify coding and improve performance of asynchronous and multithreaded applications.</h2>
It includes a number of different units and helpers. According to Jason Southwell, the developer, he has found a "<em>100 to 150% improvement in performance over equivalent generic container wrapped in a critical section.</em>" So how does it do this? If you look at the page the first thing you see is a brilliant couple helpers: <strong>QueueIfInThread &amp; SynchronizeIfInThread</strong>.

We all know it is important to make sure certain code is synchronized into the main thread, unfortunately we end up with multiple code paths some and some code could be executed in the main thread via one call, and a background thread in another call. Using this helper only performs the synchronization if the code was called from a background thread.

That is just one of the helper classes included in <a href="https://bitbucket.org/sivv/cocinasync">CocinAsync</a>. Take a look at it and <em>keep threading in mind</em>.
