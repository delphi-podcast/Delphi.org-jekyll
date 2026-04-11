---
id: 2003
title: 'Google’s Project Brillo, Weave, and Delphi'
date: '2015-06-29T20:10:08-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2003'
permalink: /2015/06/googles-project-brillo-weave-and-delphi/
categories:
    - News
tags:
    - devices
    - 'Internet of Things'
    - News
---

If you followed <a href="https://events.google.com/io2015/">Google I/O</a> then you no doubt heard about Google’s announcements in the Internet of Things space: <a href="https://developers.google.com/brillo/">Project Brillo and Weave</a>. Brillo is Google’s new operating system for Internet of Things devices, and Weave is the language for how the devices will communicate. Right now Brillo and Weave are just product announcements. You can sign up for more information, but there is no preview release or developer build available. A lot may change before they are released, so it is tough to talk about them, but you sill may wonder how they will play with Delphi and RAD Studio XE8.

<em>Disclaimer: This is based on public information released by Embarcadero and Google as interpreted by me. I'm not announcing anything, nor sharing any internal secrets. Just connecting the dots. If you connect the dots and get a different picture then let me know.</em>

Neither Brillo or Weave are on <a href="http://community.embarcadero.com/index.php/blogs/entry/rad-studio-2015-roadmap">our official roadmap</a> because they were just announced. But we do have a good record lately of supporting new platforms quickly with new releases when those platforms are in our area of focus: iOS, Android, Windows and OS X. Just with XE8 we added iOS 64-bit to meet Apple’s new requirement, and it was added in such a way that most projects just need a recompile (which is much better option than the other native tools out there)

Besides wishful thinking, lets look at what they are and what we already support with XE8.

Project Brillo is a modified (or scrubbed down) version of Android. There have already been a few new devices come out that are powered by Android beyond the traditional tablet and phone. This is because Android is an open platform that comes with a rich development and app ecosystem. Brillo is Google’s attempt to make Android more flexible for more new devices in the future. It is a great idea.

Project Brillo may be in response to Microsoft’s announcement of <a href="https://dev.windows.com/en-us/iot">Windows 10 for Devices</a>, specifically targeting <a href="https://www.raspberrypi.org/products/raspberry-pi-2-model-b/">Raspberry Pi 2</a>. These devices are going to be huge in the Internet of Things (IoT). That is why Microsoft is targeting the Raspberry Pi 2, and why Google is releasing Project Brillo. They all want to be the operating system of the Internet of Things. This is one place in the IoT where Apple is behind the pack, since they are a hardware company, they don’t want to sell an OS without hardware.

What about Delphi support for Brillo? We can look at the last 3 big modified versions of Android: Amazon’s Fire OS, Google Glass and Android Wear. All three of these we supported “out of the box” with our current release at the time, and some of them we added features in future releases to enhance that support. This is because we have great support of the Android OS directly. So I would suspect we will support Brillo when it is released.

That being said, one of the goals of Brillo is to run on “broad silicon” beyond the common ARVv7 processors that most Android devices run on.  We only currently support ARMv7 and ARMv8 (with NEON being part of the ARM standard going forward, so isn't hardly worth mentioning). We've seen some recent success with Intel ATOM processor support thanks to libHoudini updates in KitKat. Now if a Brillo device is running a processors meeting these specs, it is likely to be supported “out of the box.” But if Brillo is running on an ARMv5 or “Bill and Ted’s Excellent CPU” then support is less likely.

Now it is possible that Brillo will be scrubbed down so much that it is no longer compatible with an Android app. Remember that Android is based on Linux, and Linux console apps are on our official roadmap for a future release, so support is still possible.

That brings us to Google Weave: a common library of terms for how devices will communicate. Its objective is to expose the developer API in a cross-platform way. It is based on JSON and REST from what I can tell. So it will be an agreed standard within REST and JSON. We already have great JSON and REST support, and there are 3<sup>rd</sup> party libraries that extend that as well. Combine the REST client library and the EMS server REST support and I suspect we will be in a good place to support Weave.

Weave is the protocol, but the channel will most likely be WiFi via HTTPS or Bluetooth LE. Also already covered great in XE8.

Naturally once Brillo and Weave are more than just vague product announcements we may have specific support for them that would make them easier to work with and unlock more features of those platforms beyond the stuff you already get with XE8. The moral of the story is to start developing your IoT solutions with XE8 today and make sure you have <a href="https://www.embarcadero.com/products/rad-studio/update-subscription">Update Subscription</a> so you are ready for the future.
