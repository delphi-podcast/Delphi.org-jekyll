---
id: 1371
title: 'Hello Google Glass from Delphi XE5'
date: '2013-11-05T16:32:02-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1371'
permalink: /2013/11/hello-google-glass-from-delphi-xe5/
categories:
    - News
tags:
    - 'Delphi Projects'
    - Mobile
    - News
---

Google's new Glass platform is a very revolutionary Android device, but the question I really wanted to know is if I could develop for it with Delphi XE5. Turns out the answer is Yes.

There are actually two different options for developing Glassware: Mirror API and GDK.

The first is the <a href="https://developers.google.com/glass/about">Google Mirror API</a>, which allows you to build services, called Glassware, that interact with Google Glass. It provides this functionality over a cloud-based API and does not require running code on Glass. This is accomplished through a REST and JSON based API. Thanks to the new TRESTClient components in Delphi XE5 this should be easy enough to do.

The <a href="https://developers.google.com/glass/gdk">GDK</a> on the other hand is the avenue where you build an actual APK that runs on the Google Glass device itself. This gives you the most access to the device, its sensors and features. Turns out this is also easy enough to do with Delphi XE5.

The actual GDK builds on top of the Android SDK. You can develop apps to run on Glass with either the Android SDK or GDK, but the GDK is necessary to take advantage of some of the Glass specific features.

If you run <a href="http://delphi.org/2013/09/syscheck-for-xe5-compatibility/">SysCheck</a> on Glass (which takes some effort) you discover it has an ARMv7 PRocessor rev 3 (v71) with Android OS Version 4.0.4 and NEON support. Those meet the main requirements for <a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Android_Devices_Supported_for_Application_Development">Delphi XE5 development</a>. So I created a simple Hello World app and ran it.

This first screenshot shows Glass appearing in the Project Manager as a valid target (once the required USB drivers were installed, which was tricky for glass).

<a href="/assets/images/2013/11/HelloGlassProjectManager.png"><img class="aligncenter size-full wp-image-1372" alt="HelloGlassProjectManager" src="/assets/images/2013/11/HelloGlassProjectManager.png" width="385" height="414" /></a>

Here is a screenshot of the app running on Glass
<p style="text-align: center;"><img class="aligncenter  wp-image-1373" alt="Delphi XE5 App running on Google Glass" src="/assets/images/2013/11/HelloGlassScreen.png" width="640" height="360" /></p>
I didn't hide the status bar, which most Glassware does, and it does nothing other than serve the purpose of showing a Delphi XE5 app running on Google Glass. There were no special settings (other than the dark theme, which is a matter of taste) to make the app run on Glass. It just works.

And lastly a quick selfie of me and Glass, taken through glass.
<p style="text-align: center;"><img class="aligncenter  wp-image-1374" alt="JimWithGlass" src="/assets/images/2013/11/JimWithGlass.png" width="640" height="470" /></p>
<p style="text-align: left;">I was hoping it would look more red than orange, but should have known Tangerine would be orange.</p>
<p style="text-align: left;">Rest assured, there will be more coverage of Delphi and Glass. We are just getting warmed up. This app was not using the GDK (which is still in Beta) but it is an actual Delphi app running on Glass. What an exciting day!</p>
