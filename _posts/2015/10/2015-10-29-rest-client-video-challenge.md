---
id: 2090
title: 'REST Client Video Challenge'
date: '2015-10-29T15:29:23-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2090'
permalink: /2015/10/rest-client-video-challenge/
categories:
    - News
tags:
    - iOS
    - Mobile
    - News
---

<a href="http://delphi.org/2015/10/delphi-and-rest-client-development/">Yesterday</a>, I mentioned I built a <a href="http://embt.co/tutorial_rest_client">REST client</a> and deployed it to iOS and Android inside 5 minutes. Someone asked me to make a video actually showing how it was done. So here it is showing a simple REST client built and deployed to iOS 9.1 and Android 6.0 Marshmallow.

https://youtu.be/Rnuwgrt151g

Since I am using <a href="http://www.spitcast.com/api/docs/">SpitCast</a>, and it doesn't offer an encrypted endpoint for its REST service, I had to <a href="https://community.embarcadero.com/blogs/blog-menu/entry/how-to-use-custom-info-plist-xml-to-support-ios-9-s-new-app-transport-security-feature">modify the Info.plist</a> to allow that on iOS 9.

Could I do it faster without the video recording and explanation? Yes, but I think you get the idea. Delphi makes building multiplatform REST clients really, really easy.

I'm curious to see someone create a client app using other general purpose development tools to connect to a REST service and too see how long that takes.

If I wanted to connect to a different end point to pull down more information on an individual surf spot I could that by handling the OnItemClick event for the List View.

If there is interest I'm happy to share my Sync-Timer source code.
