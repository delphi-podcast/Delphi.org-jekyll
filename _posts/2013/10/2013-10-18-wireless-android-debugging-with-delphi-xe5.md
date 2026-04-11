---
id: 1359
title: 'Wireless Android Debugging with Delphi xE5'
date: '2013-10-18T11:37:31-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1359'
permalink: /2013/10/wireless-android-debugging-with-delphi-xe5/
categories:
    - News
tags:
    - 'abd wireless'
    - News
---

Previously I blogged about how to <a href="http://delphi.org/2013/09/debugging-against-a-remote-android-emulator/">connect to an emulator on a remote (or the host) machine</a>. That also works for hardware connected to remote machines. But sometimes you want to work with hardware that isn't even connected at all. Not to worry, here is how to wirelessly connect and debug with your <a href="http://www.embarcadero.com/products/delphi">favorite development tool</a>. One note though, WiFi slower than a USB connection, so you will see a little delay sometimes.

<strong>Requirements:</strong>
<ul>
	<li>A machine (Mac or PC) you can connect the Android device to that has ADB (Android Debug Bridge) installed. This is part of the Android SDK. As well as necessary ADB USB Drivers (required on Windows). This can be your development machine, or another machine.</li>
	<li>A non-segmented wireless network that both your development machine and Android device are connected. (Segmenting prevents two connected devices from connecting to each other).</li>
</ul>
These commands work with ADB (Android Debug Bridge). It is easiest if you add it to your path. By default it is found in the following location, but you can <a href="http://developer.android.com/sdk/">install it anywhere on your system</a> (Select the "Use An Existing IDE" option when downloading).
<pre>C:\Users\Public\Documents\RAD Studio\12.0\PlatformSDKs\adt-bundle-windows-x86-20130522\sdk\platform-tools</pre>
First you need to connect your Android device to any computer. With USB debugging turned on, verify you have access to the device via ADB with the following command:

<strong>Command:</strong>
<pre>adb devices</pre>
<strong>Output:</strong>
<pre>List of devices attached 
8605fa72        device</pre>
If the list is empty, then you need to enable USB debugging and make sure you have the USB ADB Bridge driver for your device installed.

Once ADB is setup, you can get the IP address with the following command:
<pre>adb shell netcfg|grep wlan0</pre>
Which should give you output like:
<pre>wlan0  UP     10.20.5.88/24  0x00001043 2a:32:11:42:aa:3c</pre>
Then put the device in TCPIP mode with the command:
<pre>adb kill-server
adb tcpip 5555</pre>
Then on your machine that is running Delphi XE5 go to the command window and type (with the IP address from above):
<pre>adb connect 10.20.5.88</pre>
Then you can verify it worked from that same command prompt

<strong>Command:</strong>
<pre>adb devices</pre>
<strong>Output:</strong>
<pre>List of devices attached
10.20.5.88:5555   device</pre>
And now you can connect to that device wirelessly from Delphi. Like I mentioned before, this is slower, so expect some delays on deploy and responding to breakpoints.

There is some <a href="http://stackoverflow.com/q/2604727/255">more information on Stack Overflow</a>, including some different options if you have a rooted Android device.
