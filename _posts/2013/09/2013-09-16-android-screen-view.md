---
id: 1262
title: 'Android Screen View'
date: '2013-09-16T12:24:50-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1262'
permalink: /2013/09/android-screen-view/
categories:
    - News
tags:
    - 'Delphi Projects'
    - News
    - 'Source Code'
    - Utility
---

<img style="margin-left: 10px;" alt="Android Screen View UI" src="http://i.imgur.com/AmdSSHV.png" width="193" height="401" align="right" />

People have asked for a copy of the utility I wrote to view the attached Android device on the screen. It uses the built in <em>screencap</em> functionality of Android and the ADB (Android Debug Bridge) to grab and display a series of screenshots. It requires the Android SDK installed and does not require a rooted device.

The speed of update has to do with the screen resolution and image complexity. Simple screens (text and controls) update about twice a second. More complex screens (pictures, graphics, etc.) are slower than that.

For best results, turn on "Show Touches" under debug options.

It also supports saving a PNG to file.

Get the source: <a href="https://code.google.com/p/android-screenview/">https://code.google.com/p/android-screenview/</a>

Download the build: <a href="http://delphi.org/downloads/AndroidScreenView.7z">http://delphi.org/downloads/AndroidScreenView.7z</a>

There are a few pending features that I just haven't gotten to. If you'd like to contribute let me know. Thanks to Stephen Ball for all his contributions already!
