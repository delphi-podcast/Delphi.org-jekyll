---
id: 1660
title: 'BlueTooth Remote Control Car'
date: '2014-05-05T05:56:04-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1660'
permalink: /2014/05/bluetooth-remote-control-car/
categories:
    - News
tags:
    - gadgets
    - Mobile
    - News
---

How to use BlueTooth is one of the most common requests with Delphi. During our <a href="http://www.embarcadero.com/rad-in-action/programming-devices-and-gadgets">Devices and Gadgets webinar</a> David I. showed how to browse paired BlueTooth devices and connect to them.

https://www.youtube.com/watch?v=rlU1LC7_ytQ

But wait, there's more! <a style="color: #4183c4;" title="while true do;" href="http://www.danieleteti.it/">Daniele Teti</a> &amp; <a style="color: #4183c4;" title="Where is the WOW" href="http://www.danielespinetti.it/">Daniele Spinetti</a> of <a style="color: #4183c4;" title="bit Time Software's home page" href="http://www.bittime.it/">bit Time Software</a> created an Android client app to control a <a style="color: #4183c4;" title="BBZ201 - Mini Cooper S Bluetooth Car" href="http://www.bee-wi.com/bluetooth-controlled-car-bbz201-beewi,us,4,BBZ201-A0.cfm">BeeWi - BBZ201 - Mini Cooper S Bluetooth Car.</a> It may work with other BeeWi Bluetooth remote control vehicles, but has not been tested with any (that I know of).

https://www.youtube.com/watch?v=rn-9_OOGMmE

The Multitouch code is Copyright (c) 2006-2014 <a style="color: #4183c4;" title="From Zero To One" href="http://www.cromis.net/blog/">Iztok Kacin, Cromis</a> and used under the BSD license.

It currently doesn't have BlueTooth discovery, so once you pair your device you need to update the source code with the MAC address of your car.

I've created a <a href="https://github.com/jimmckeeth/BeeMiniCtrl/tree/XE5/AppMethod">GitHub repository for the project</a>. It should work with XE5 or AppMethod just fine. I've got a version updated to XE6 that exposes the controls via App Tethering too, which I will upload later.
