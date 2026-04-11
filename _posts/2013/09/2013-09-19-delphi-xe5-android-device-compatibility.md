---
id: 1289
title: 'Delphi XE5 Android Device Compatibility'
date: '2013-09-19T22:14:55-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1289'
permalink: /2013/09/delphi-xe5-android-device-compatibility/
categories:
    - News
tags:
    - Mobile
    - News
---

Unlike iOS, there are are a huge variety of Android devices. Delphi XE5 supports the large majority of those devices. The official page for <a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Android_Devices_Supported_for_Application_Development">Android Devices Supported for Application Development</a> spells out the requirements of Gingerbread, Ice Cream Sandwich or Jelly Bean on an ARMv7 processor (with <a href="http://en.wikipedia.org/wiki/ARM_architecture#Advanced_SIMD_.28NEON.29">NEON instructions</a>). The NEON instruction requirement excludes the <a href="http://en.wikipedia.org/wiki/Tegra#Tegra_2">TEGRA 2</a> processor which was apparently popular in some tablets (mostly) a few years back. Also excluded is the <a href="http://en.wikipedia.org/wiki/Intel_Atom">Intel Atom processor</a>, which I hear is showing up in Android devices in Japan.

If you look at the <a href="http://developer.android.com/about/dashboards/index.html">Android Dashboard</a> we see those versions of Android make up 87.5% of the Android devices accessing the Android store. What that doesn't tell us is how many of those devices have ARMv7 with NEON instructions. The <a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Android_Devices_Supported_for_Application_Development#Results_of_Our_Android_Device_Testing">DocWiki page</a> also includes a number of devices that were tested for various functions, but really in the grand scope of possible Android devices it is a rather small sample.
<p style="text-align: center;"><a href="http://developer.android.com/about/dashboards/index.html"><img class="aligncenter" alt="Android versions pie chart" src="http://i.imgur.com/HA0fzX8.png" width="500" height="250" /></a></p>
So I had the idea of using <a href="https://www.apkudo.com/">Apkudo</a>. They provide an online service where you upload your Android app APK and they run it on a wide variety of devices and tell you how it did. Currently I've only done a "hello world" type app test, but it gives a good guide for devices that support XE5 at a minimum level.

They have 118 devices that run Android 2.3.3 (Gingerbread) or better (no Honeycomb). Our of those devices, my APK failed to install on 10 devices. Looking at the log it either timed out, or was out of storage space, so that may be more related to the state of the device before the test than any issues with the actual app.  Out of the 108 devices that loaded and ran the app, it only failed (ANR = Application Not Responding) on 3.
<ul>
	<li>Devices tested: 118</li>
	<li>Failed to install: 10</li>
	<li>Locked up: 3</li>
	<li>Successfully ran: 105</li>
	<li>Success rate: 89%</li>
</ul>
From what I hear it isn't uncommon for an app to fail for no reason on some of these devices, due to other influences (like no storage space). <em><strong>So that rate may actually be higher</strong>. </em>I've shared the <a href="https://docs.google.com/spreadsheet/ccc?key=0AoEN2CEsVvJ0dGhVaWJEdWRJTVYzZ1NKT2NoQkF4N3c&amp;usp=sharing">full spreadsheet report</a> here for you to look for your favorite devices. (They don't provided a download of the report, so I had to transcribe it to the spreadsheet. There may be typos.)

I plan to modify some of our existing test apps and upload them. Since the test system just uses <a href="http://developer.android.com/tools/help/monkey.html">monkey</a> it isn't guaranteed to actually perform the specific actions of the test apps, so I need to automate that part of the app. When I do I will update that spreadsheet and provide an updated post.

I'm sure some people will point out that you could use Java and reached more devices. Instead of focusing on the small percentage of Android devices you are missing with Delphi XE5, I'd instead invite you to consider the millions of iOS devices you can target from the same code base. Including <a href="http://blogs.embarcadero.com/sarinadupont/2013/09/19/start-building-ios-7-apps-today/">iOS 7</a>!

You can get started now by downloading the <a href="http://www.embarcadero.com/products/delphi/downloads">Delphi XE5 trial</a>.
