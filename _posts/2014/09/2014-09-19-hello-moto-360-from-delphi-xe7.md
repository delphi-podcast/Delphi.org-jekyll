---
id: 1776
title: 'Hello Moto 360 from Delphi XE7'
date: '2014-09-19T10:40:04-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1776'
permalink: /2014/09/hello-moto-360-from-delphi-xe7/
tags:
    - 'Source Code'
---

<a href="https://moto360.motorola.com/"><img class="alignright size-medium wp-image-1777" src="/assets/images/2014/09/hero-moto-360-210x300.png" alt="Moto 360" width="210" height="300" /></a>I really like my <a href="https://moto360.motorola.com/">Moto 360</a> watch. It looks fabulous, and does great as an extension of my Android phone, but of course the most important question is how to make an app for it. Turns out it just works with <a href="http://www.embarcadero.com/products/rad-studio">RAD Studio X7</a>, Delphi or C++. Thanks to the new FireUI Multi-Device designer I can actually create a custom view in the UI to make designing the perfect user interface a breeze. Here are some of the details of what I discovered along the way, followed by a download of my sample and the custom view.

The bottom line is it just works, which really isn't a surprise. Most new Android devices use <a href="http://www.arm.com/products/processors/technologies/neon.php">ARMv7 and the NEON instruction set</a>. (NEON is kind of like the MMX standard on the Intel platform. At first not everyone used those instructions, but once they caught on, everyone did.) So it is no surprise that the Moto 360 does too. Unlike some of the other watches, the Moto 360 does not have a micro USB port. So you have to use <a href="https://developer.android.com/training/wearables/apps/bt-debugging.html">ADB over BlueTooth</a>. This requires a few extra steps to setup, and is <em>really slow</em> to deploy over. So slow I canceled the first two deployments because I thought I set something up wrong.

First of all, the Moto 360 display is not perfectly round. It has a flat area on the bottom. If you look closely you can see the light sensor there. Not sure if that was why it wasn't round, or if there was another design reason. In any case, the screen resolution is <strong>320 x 290 pixels at 213 Pixels Per Inch</strong>. This means at design time you have a usable area of <strong>240 x 218 pixels</strong>. This is the information we need to create a <strong><a href="http://docwiki.embarcadero.com/RADStudio/XE7/en/Adding_a_Customized_View_to_the_View_Selector">custom view</a></strong>. Just put the following code in a package.

[delphi]  TDeviceinfo.AddDevice(TDeviceinfo.TDeviceClass.Tablet, ViewName,
    // The Moto360 is 320x290 phyiscal and 240x218 logical with 213 PPI
    TSize.Create(320, 290), TSize.Create(240, 218),
    TOSVersion.TPlatform.pfAndroid, 213,
    True); // Exclusive
[/delphi]

The Device class enumeration actually has a Watch class, but looking in the code that detects the class at runtime and it doesn't know how to detect a watch yet. So it defaults to Tablet. It makes sense if you think about the fact that XE7 was released before the Moto 360. I imagine an update will address this.

The requirement to get the custom view to show up in the IDE is you need to update the XML file found at <em>%AppData%\Roaming\Embarcadero\BDS\15.0\MobileDevices.xml</em> to reference the new view. Inside the <strong>MobileDevices</strong> element, add the following:

[xml]
  &lt;MobileDevice&gt;
    &lt;Displayname&gt;Moto360&lt;/Displayname&gt;
    &lt;Name&gt;Moto360&lt;/Name&gt;
    &lt;DevicePlatform&gt;3&lt;/DevicePlatform&gt;
    &lt;FormFactor&gt;2&lt;/FormFactor&gt;
    &lt;Portrait Enabled=&quot;True&quot; Width=&quot;240&quot; Height=&quot;218&quot; Top=&quot;102&quot; Left=&quot;29&quot; StatusbarHeight=&quot;0&quot; StatusBarPos=&quot;0&quot; Artwork=&quot;C:\Users\jim\Documents\Embarcadero\Studio\Projects\HelloMoto360\Moto360.png&quot; /&gt;
    &lt;UpsideDown Enabled=&quot;False&quot; Width=&quot;240&quot; Height=&quot;218&quot; Top=&quot;0&quot; Left=&quot;0&quot; StatusbarHeight=&quot;0&quot; StatusBarPos=&quot;0&quot; Artwork=&quot;&quot; /&gt;
    &lt;LandscapeLeft Enabled=&quot;False&quot; Width=&quot;240&quot; Height=&quot;218&quot; Top=&quot;0&quot; Left=&quot;0&quot; StatusbarHeight=&quot;0&quot; StatusBarPos=&quot;0&quot; Artwork=&quot;&quot; /&gt;
    &lt;LandscapeRight Enabled=&quot;False&quot; Width=&quot;240&quot; Height=&quot;218&quot; Top=&quot;0&quot; Left=&quot;0&quot; StatusbarHeight=&quot;0&quot; StatusBarPos=&quot;0&quot; Artwork=&quot;&quot; /&gt;
  &lt;/MobileDevice&gt;
[/xml]

You'll need to update the path to that Artwork to point to the correct location of the PNG on your system. Or you can just leave it blank. Here is what it all looks like when setup in the IDE.

<a href="/assets/images/2014/09/HelloMoto360-IDE.png"><img class="alignnone size-large wp-image-1781" src="/assets/images/2014/09/HelloMoto360-IDE-1024x703.png" alt="Hello Moto 360 in the XE7 IDE" width="620" height="425" /></a>

You'll notice a red circle on the design surface. I added this to see where the corners are (since the display is round). At runtime you can just barely see the red if you hold the watch right. In production I'd hide this at runtime. I placed the TCircle at -1, -1 and set the size to 242 x 242. This way the circle follows the bezel and not the display area of the screen. I suppose if I bumped it out another pixel it would disappear completely at runtime.

To get the Moto 360 to show up as a target device you first need to enable Bluetooth debugging.
<ol>
	<li>Hold the side button in until <strong>Settings</strong> appears</li>
	<li>Swipe down to <strong>About </strong>and tap it<strong>.</strong></li>
	<li>Tap on<strong> build number</strong> until it tells you that you are a developer.</li>
	<li>Swipe back to settings and then tap on Developer options.</li>
	<li>Tap on <strong>ADB Debugging</strong> until it says <em>Enabled</em>.</li>
	<li>Tap on <strong>Debug over Bluetooth</strong> until it says <em>Enabled</em>.</li>
	<li>On your paired phone, go into Android Wear settings (gears in the upper right)</li>
	<li>Enable <strong>Debugging over Bluetooth</strong>.
<ol>
	<li>It should show
<ul>
	<li>Host: disconnected</li>
	<li>Target: connected</li>
</ul>
</li>
	<li>Target is the watch, Host is your computer.</li>
</ol>
</li>
</ol>
Then you connect your phone that is connected to the Moto 360 via USB and run the following commands (assuming ADB is on your system path) to connect <a href="https://developer.android.com/training/wearables/apps/bt-debugging.html">via Bluetooth</a>. I made a batch file.
<pre> @echo off
 REM optional cleaning up
 adb disconnect localhost:4444
 adb -d forward --remove-all
 REM this is the connection
 adb -d forward tcp:4444 localabstract:/adb-hub
 adb -d connect localhost:4444
 REM these lines are to see if it worked
 echo Here is the forwarded ports . . . .
 adb forward --list
 echo.
 echo Wait a second for it to connect . . . .
 pause
 adb devices</pre>
The ADB Devices list should show something like
<pre>List of devices attached 
123456abcd device 
localhost:4444 device</pre>
Now the Android Wear app on your phone should show
<ul>
	<li>Host: connected</li>
	<li>Target: connected</li>
</ul>
Be sure that your Moto 360 app uses the unit that defines the Moto 360 device (from your package). This way your app can select it at runtime. If you do all that, you'll see something similar to this with it running on the Moto 360:

<img class="alignnone size-full wp-image-1782" src="/assets/images/2014/09/20140918_180154.jpg" alt="Hello Moto 360 from Delphi XE7" width="746" height="600" />

My camera had a hard time focusing on it, but rest assured it looks fabulous! I tried C++ too, and no surprises, it works as well. More experimenting to do, but it is nice to know I have a tool that will take me everywhere I want to go.

If you don't have a Moto 360, you can setup an Android emulator (AVD) instead. I did that before mine showed up. You need to download the Android 4.4W (API20) SDK Platform and ARM System image.

<img class="alignnone size-full wp-image-1784" src="/assets/images/2014/09/SDK.png" alt="Android Wear SDK Download" width="738" height="610" />

Then create an AVD with the new Emulator.

<img class="alignnone size-full wp-image-1785" src="/assets/images/2014/09/AVD-Settings.png" alt="Android Wear AVD Settings" width="482" height="696" />

It actually gives you the rectangle screen with a round bezel. Also it is 320 x 320 (so completely round) and 240 PPI. This means the view I created (since it was exclusive) won't work on the emulator. You'll need to create a new custom view for the emulator, but I'll leave that up to to.

you can download all of my code for the custom view, Bluetooth ADB batch file, and sample apps from <a href="https://github.com/jimmckeeth/Hello-Moto-360/">Github</a>. (<strong>Update</strong>: Added a view for <a href="http://delphi.org/2014/11/developing-on-the-samsung-gear-live-smart-watch/">Galaxy Gear Live &amp; LG-G</a>) BTW, XE7 adds local Git support, which is <a href="http://docwiki.embarcadero.com/RADStudio/XE7/en/What's_New_in_Delphi_and_C%2B%2BBuilder_XE7">another great new feature</a>. <a href="http://www.embarcadero.com/products/rad-studio">Download the trial</a> and check it out.
