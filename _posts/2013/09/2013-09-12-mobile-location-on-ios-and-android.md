---
id: 1248
title: 'Mobile Location on iOS and Android'
date: '2013-09-12T18:23:01-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1248'
permalink: /2013/09/mobile-location-on-ios-and-android/
tags:
    - 'Source Code'
---

Most Android and iOS devices either include a GPS antenna, the ability to triangulate off cellular or wireless access points, or some combination. Accessing the location is different when using the platform APIs for iOS and Android. Luckily Delphi XE5 includes the <a href="http://docwiki.embarcadero.com/Libraries/XE5/en/FMX.Sensors.TLocationSensor">TLocationSensor</a> component. When activated it has a OnLocationChanged event which fired when the location changes more than the specified distance. In there simply examine the NewLocation.Latitude and NewLocation.Longitude to know the current location.

[youtube=http://www.youtube.com/watch?v=b4lgDXx5jAE&amp;w=640&amp;h=385]

Learn more about <a href="http://embt.co/MultiDevice">multi-device, true-native app development with Delphi XE5</a> and check out other <a href="http://www.embarcadero.com/snippets">Mobile Code Snippets</a>.
