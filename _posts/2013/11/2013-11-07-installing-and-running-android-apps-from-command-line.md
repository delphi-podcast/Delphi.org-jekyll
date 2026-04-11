---
id: 1385
title: 'Installing and Running Android Apps From Command-Line'
date: '2013-11-07T09:19:00-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1385'
permalink: /2013/11/installing-and-running-android-apps-from-command-line/
categories:
    - News
tags:
    - News
---

Delphi automatically installs and runs your app for you, but sometimes it is nice to do manually from the command-line. Here are the commands you need. These all assume <a href="http://developer.android.com/tools/help/adb.html"><strong>adb</strong></a> (Android Debug Bridge) is on your system path and you only have one Android device (or emulator) attached. They should work on both Mac and Windows.

<em>See the end for notes on multiple devices or if you are running both an emulator and device.</em>

First to install your app:
<pre>adb install path\ProjectName.apk</pre>
In this example<em> path\ProjectName.apk</em> is the full relative path to the apk. The apk usually has the same name as the project. If your apk is already installed, then use the following command to "reinstall" it, leaving the data intact:
<pre>adb install -r path\ProjectName.apk</pre>
The great thing about the -r is it works even if it wasn't already installed.

Now if you want to uninstall your apk you can do that too:
<pre>adb shell pm uninstall -k com.embarcadero.ProjectName</pre>
Again, <em>com.embarcadero.ProjectName</em> is the default name of the package. If you changed it under Project Options -&gt; Version Info -&gt; Package, then use that value instead. BTW, the <a href="http://developer.android.com/tools/help/adb.html#pm"><strong>pm</strong></a> in there is the <a href="http://developer.android.com/tools/help/adb.html#pm">Android Package Manager</a>.

One note, when Delphi deploys your app to run it, it performs an uninstall first. This results in all the data being cleaned out, which can be useful during development to be sure you don't leave anything behind from the previous run. When a user updates an app from the App store, or installs it via most any other means, then it performs a reinstall, which leaves the data intact.

Now if you want to run it, things get a little more interesting. Now we use the <a href="http://developer.android.com/tools/help/adb.html#am">Android Activity Manager (AM)</a>.
<pre>adb shell am start -n com.embarcadero.ProjectName/com.embarcadero.firemonkey.FMXNativeActivity</pre>
There are two parts to this. Before the slash is the package name, just like for uninstalling it. After the slash is the name of the Main Activity, which unless you've edited your AndroidManifest.template.xml (and some other fundamentals of your app) is always <em>com.embarcadero.firemonkey.FMXNativeActivity</em>. If you are trying to start an app written with another tool, then consult the AndroidManifest, but it is common for most tools to use MainActivity, so you can launch it like:
<pre>adb shell am start -n com.other.ProjectName/.MainActivity</pre>
If you want to stop your app after it is running, you just need the name of the package and the following:
<pre>adb shell am force-stop com.embarcadero.ProjectName</pre>
This can be useful to test what your app behaves like from a fresh restart, vs. just returning from the background.

The Android adb tool is very powerful. Most of these are using the shell command which actually allow you to pass commands to the modified Linux shell that runs inside Android. You can actually use "adb shell" to open a shell prompt and navigate your device like a remote machine.

If you have both an emulator running and a device attached then you can use the switch <strong>-d</strong> like
<pre>adb -d shell</pre>
and it directs it to the only device. If you use <strong>-e</strong> then it goes to the emulator.

When you have multiple devices then use <strong>-s</strong> and the device ID which can be obtained via the <strong>adb devices</strong> command.

There are so many other useful things you can do with adb. <a href="http://developer.android.com/tools/help/adb.html">Check out the documentation</a>.
