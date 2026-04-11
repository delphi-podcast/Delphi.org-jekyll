---
id: 2088
title: 'Delphi and REST Client Development'
date: '2015-10-27T15:14:44-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2088'
permalink: /2015/10/delphi-and-rest-client-development/
categories:
    - News
tags:
    - News
    - REST
---

I really don't like to make comparison between different development tools. In my opinion most tools have their strengths for certain tasks. So I try not to criticize other tools by name. Delphi is my favorite, and I believe it is the best all around tool for more projects I face. Occasionally I have someone ask me how Delphi compares to another tool they are evaluating. I thought I would share one such experience.

When I was in Brazil I went to meet with a guy who was in charge of software development for a large, international company. They were all standardized on a different development tool, but it didn't really have a mobile solution. They were looking at some tools that claimed to make it really easy to do mobile development, but once he got past the marketing he found it wasn't all it was cracked up to be.

To evaluate the tool he decided he would develop a simple little app for iPhone and Android that connected to a REST server to pull down a list of countries, cities, etc. to help people find offices for his company. He thought that a week should be more then enough time to develop this simple application.

What he found was that while he expected it to be cross platform, it was actually only shared code. So he had to create a project for each platform, and then he could share part of the code (not as much as he would like) between each project. Also there was significant overhead in consuming a REST service. After a couple days he realized a week wasn't enough time for even one platform.

To top it all off he discovered that the cost was actually way more then it was initially made out to be when you actually got down to doing something serious.

So I showed him Delphi and told him that the app he was describing could be done inside a day, probably with a prototype within an hour. He found that a little hard to believe, so I created a simple REST client displaying the result of a REST service and deployed it to my Android phone. It took about 5 minutes, including the time it took to connect to his WiFi.

He was so impressed he actually got his phone out to make a video of it just so he could show his boss, who he was sure wouldn't believe him.

That is what I love about Delphi. It makes the simple things that you need to do all the time so simple and so quick, and it makes everything else still pretty simple. Need an API that isn't wrapped in a component or the RTL, no problem, you can still access it.
