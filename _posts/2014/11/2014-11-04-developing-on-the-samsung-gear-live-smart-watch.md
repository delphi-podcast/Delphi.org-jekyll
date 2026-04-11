---
id: 1815
title: 'Developing on the Samsung Gear Live Smart Watch'
date: '2014-11-04T17:03:43-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1815'
permalink: /2014/11/developing-on-the-samsung-gear-live-smart-watch/
categories:
    - News
tags:
    - devices
    - News
---

Previously I created a blog post about using Delphi and RAD Studio XE7 to develop for the <a title="Hello Moto 360 from Delphi XE7" href="http://delphi.org/2014/09/hello-moto-360-from-delphi-xe7/">Moto 360</a>. The new FireUI Multi Device Designer (MDD) makes is a breeze to design for the new smaller UI. I've since updated the <a href="https://github.com/jimmckeeth/FireUI-Devices">FireUI Devices project on GitHub</a> to cover the Samsung Gear Live &amp; LG-G watches in addition to the Moto 360.

I thought I would walk through the steps for developing with the Samsung Gear Live. One advantage it has over the Moto 360 is that it has a physical USB cable connection, so you don't need to deploy via BlueTooth. This makes for a much faster deploy cycles. With a USB cable though, you need to install the ADB USB Drivers.
<ol>
	<li>Put the device in USB Debugging Mode
<ol>
	<li>Hold the home / side button until the settings menu appears (couple seconds)</li>
	<li>Select About and tap Build Number until it notifies you that developer options are enabled.</li>
	<li>Swipe left to right to go back</li>
	<li>Select Developer Options and enable USB Debugging.</li>
</ol>
</li>
	<li>You still need to have the watch paired with a phone via the Android Wear app since the confirmation dialog is displayed there.</li>
	<li>Run the SDK Manager / Android Tools and Make sure you have Android SDK Tools, Platform-tools and Build tools updated (this moves the ZipAlign.exe, so you need to tell the IDE where to find it.)</li>
	<li>Install the <a href="http://developer.samsung.com/technical-doc/view.do?v=T000000117">Samsung Android USB Driver for Windows</a></li>
	<li>Gear Live should appear as an Other Device in device manager once you connect it to windows via USB.</li>
	<li>Select Update Driver Software</li>
	<li>Browse my computer for Driver software</li>
	<li>Let me pick from a list of device drivers on my computer</li>
	<li>Then select ADB Interface</li>
	<li>Select SAMSUNG Android ADB Interface</li>
	<li>On your phone you will see a dialog "Allow Wear Debugging" Check "Always allow .. . " and then select OK.</li>
</ol>
<img class="aligncenter size-full wp-image-1819" src="/assets/images/2014/11/GearLive-Update.gif" alt="Gear Live - Device Manager Driver Update" width="628" height="466" />

&nbsp;

Once you have done all of that, it will show up in your IDE as a target, and when you load the <a href="https://github.com/jimmckeeth/FireUI-Devices">FireUI custom device</a> for it, then you will have a great design surface for it too.

<a href="/assets/images/2014/11/GearLive.png"><img class="aligncenter size-large wp-image-1818" src="/assets/images/2014/11/GearLive-1024x775.png" alt="GearLive in XE7 IDE" width="620" height="469" /></a>

&nbsp;

And you are ready to build your Gear Live app with Delphi XE7.

<img class="aligncenter size-full wp-image-1820" src="/assets/images/2014/11/GearLive.jpg" alt="Delphi XE7 on the Samsung Gear Live" width="576" height="1024" />

I'm sure I'll have more coverage on Android Wear in the coming months too.
