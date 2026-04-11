---
id: 1770
title: 'What About Blackberry?'
date: '2014-08-13T11:08:03-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1770'
permalink: /2014/08/what-about-blackberry/
categories:
    - News
tags:
    - Mobile
    - News
---

One of the most common questions we get when we talk about new features in Delphi, C++Builder and RAD Studio is "What about Blackberry?" which is almost as common as similar questions about Windows Phone or Linux. iOS and especially Android rule the smartphone OS market, but Blackberry still has a place on most charts (unlike Symbian and some others).

<a href="http://www.idc.com/prodserv/smartphone-os-market-share.jsp"><img class="aligncenter" src="http://www.idc.com/prodserv/smartphone-ms-img/chart-ww-smartphone-os-market-share.png" alt="IDC: Smartphone OS Market Share 2013, 2012, and 2011 Chart" width="979" height="599" /></a>Well, now RAD Studio XE6, Delphi, C++Builder and Appmethod support 96.8% of the shipping platforms thanks to the latest update to Blackberry 10 (10.2.1 or later), it now supports running Native Android APK apps without needing to port. I tested on a Z10 developer device, but it should work on Q10, Q5, Z30, or others. To be clear, Blackberry still runs their own OS, but that OS is able to run Native Android Apps.

Our IDE doesn't recognize the Blackberry device, again because it is not running Android. But once you build your APK you can transfer it to the Blackberry device using whatever method is most convenient for you. I used Dropbox. Once you have the APK on the Blackberry you simply need to install it.

I built a few samples, including one that takes a picture, and they all more or less worked as expected. When the ShareSheet came up, the usual suspects like Facebook and Twitter were not there, but I didn't have those set up yet on my test device, so that is to be expected.

You can take things a step further and repackage and sign your app to distribute through the Blackberry store, but that isn't necessary. You can deploy your APK directly to the Blackberry, or distribute it through the <a href="https://developer.amazon.com/appsandservices">Amazon App Store</a>. <a href="http://crackberry.com/">Crackberry</a> has a <a href="http://crackberry.com/how-install-android-app-apk-blackberry">guide on installing APKs</a> too, with a little more detail.

The <a href="http://developer.blackberry.com/">Blackberry Developer</a> site has useful pages:
<ul>
	<li><a href="http://developer.blackberry.com/native/documentation/core/porting_from_android_ndk.html">Porting Apps from Android</a> - an introduction</li>
	<li><a href="http://developer.blackberry.com/android/tools/">Android Tools</a> where you can download their command line tools to sign and bundle your app for the Blackberry store.</li>
</ul>
