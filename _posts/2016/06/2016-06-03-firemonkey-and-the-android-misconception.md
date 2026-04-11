---
id: 2459
title: 'FireMonkey and the Android Misconception'
date: '2016-06-03T12:41:41-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2459'
permalink: /2016/06/firemonkey-and-the-android-misconception/
image: /assets/images/2016/02/FireMonkey300px-300x198.png
categories:
    - News
tags:
    - Article
    - Mobile
    - News
---

<img class="alignright size-full wp-image-2269" src="/assets/images/2016/02/FireMonkey300px.png" alt="FireMonkey(300px)" width="300" height="300" />When it comes to <a href="http://docwiki.embarcadero.com/RADStudio/Berlin/en/Android_Devices_Supported_for_Application_Development">Delphi, C++Builder and FireMonkey's</a> support for Android, there are 5 caveats.:
<ol>
 	<li>ARM Cortex-A series CPU (not Intel Atom)</li>
 	<li>ARMv7 Instructions</li>
 	<li>NEON Technology</li>
 	<li>GPU</li>
 	<li>Specific versions of Android</li>
</ol>
At one point there was some attempts made to make a list of devices that were supported either completely or partially, but new devices were coming to quick to track. This lead to the misconception that FireMonkey apps only run on a very small subset of Android devices.

Since that time there have been a number of improvements to the compiler and the FireMonkey framework. Also the landscape of Android devices continues to evolve and change. Yet I still run into people who believe that FireMonkey still only runs on a small subset of devices. I thought I would provide an update and set the record straight.
<h1>Tegra 2 and NEON</h1>
Shortly before Android support was added, the Tegra 2 processor was in use. It was ARMv7 and Cortex-A, but lacked the NEON SIMD extension. So what is <a href="http://www.arm.com/products/processors/technologies/neon.php">NEON</a>? NEON is a <a href="https://en.wikipedia.org/wiki/SIMD">SIMD (Single Instruction Multiple Data)</a> instruction set. When it was introduced it was an option that some ARMv7 processors included to improve performance. Since it was optional, the Tegra 2 excluded it.

<a href="https://commons.wikimedia.org/wiki/File:KL_Intel_i487SX.jpg"><img class="alignright wp-image-2462" src="/assets/images/2016/06/Intel_i487SX.jpg" alt="Intel i487 SX" width="264" height="289" /></a>It seems kind of uncertain to have some processors with some features, and others missing them, especially if you require them for your application to run. This isn't some crazy thing that only happened with Android and ARM. Back in the time of the Intel 486 CPU (right before things went Pentium) some systems had an optional 487 math co-processor. This co-processor introduced some additional <strong><a href="https://en.wikipedia.org/wiki/X87">x87 instructions</a></strong> that accelerated some floating point operations. Some programs would be faster on a machine with x87 support, and others required it. When the Pentium came out, it incorporated the x87 instructions into most of the CPUs (there are always exceptions).

<a href="https://en.wikipedia.org/wiki/MMX_(instruction_set)"><img class="alignleft size-full wp-image-2463" src="/assets/images/2016/06/PentiumMMX-presslogo.jpg" alt="Pentium MMX" width="230" height="222" /></a>The Pentium didn't end up being the<em> "One CPU to rule them all"</em> though. Along came <strong><a href="https://en.wikipedia.org/wiki/MMX_(instruction_set)">MMX Instructions</a></strong>. MMX is a is a <a href="https://en.wikipedia.org/wiki/SIMD">single instruction, multiple data (SIMD)</a> instruction set that was optional for some CPUs (where have I heard that before?) Some programs were faster on an MMX enabled CPU, and others required it to run at all. After a few years, most all CPUs, even those made by AMD included MMX instructions. It didn't end there. New CPU instruction sets are introduced all the time, but it is rare that they get the same publicity that MMX or the x87 set did.

What does all of this have to do with NEON, besides perspective? Well, Neon is now part of the ARM standard. The <em><strong>new ARM chips in modern Android devices include Neon</strong></em>. They don't even both listing it as a feature because it is assumed. The R&amp;D team bet on NEON and they won. Since the compiler takes advantage of Neon instructions it is faster than it would be if they hedged their bets and ignored Neon.
<h1>Enter the GPU</h1>
<a href="https://commons.wikimedia.org/wiki/File:6600GT_GPU.jpg"><img class="alignright wp-image-2465" src="/assets/images/2016/06/6600GT_GPU.jpg" alt="NVidia 6600GT GPU" width="233" height="224" /></a>Much like the x87 was a separate processor that augmented the system performance, there are many other processors in your computer, specifically around audio and graphics. The big thing about the <a href="https://en.wikipedia.org/wiki/Graphics_processing_unit">GPU</a> is that it not only beefed up the existing graphics co-processors, but it took on the 3D and texture operations and ran them through a massively parallel architecture. The original GPU that I had was actually a separate board in addition to my graphics card. Today they are mostly integrated.

On Android they typically go with a <a href="https://en.wikipedia.org/wiki/System_on_a_chip">System on a Chip (SOC)</a> that includes the CPU, GPU and a number of the other electronics.
<h1>The Rise and Fall of Intel Atom</h1>
<img class="alignright wp-image-2466" src="/assets/images/2016/06/ARM_logo.svg_.png" alt="ARM logo" width="259" height="77" />ARM is an open standard CPU manufactured by many different chip makers, often times under their own brand. A few manufactures include Qualcomm, Texas Instruments, Samsung and even Apple (for their mobile devices). <img class="alignleft wp-image-2467" src="/assets/images/2016/06/Intel_Atom.png" alt="ARM logo" width="146" height="175" />Intel wanted a piece of the mobile processor action, but instead of just implementing ARM they introduced the Atom processor. It still used the x86 instruction set of the desktop CPUs, but was designed to be more energy efficient. They put them in Windows tablets and Android devices.

This introduced another division in the Android landscape. There were two different processor architectures. Since most Android apps were written with Java and ran in a virtual machine, it wasn't a huge deal. Except for games. Most games use native code for performance reasons, so that required either the game to include both ARM and Atom code and libraries, or the game just wouldn't work on Atom.

<img class="alignleft wp-image-2468" src="/assets/images/2016/06/HarryHoudini1899.jpg" alt="Harry Houdini 1899" width="169" height="286" />Enter libHoudini. Intel realized that mobile gaming was a big part of Android, and the fact that you couldn't play a lot of popular games on Atom devices wasn't good. So they created libHoudini, a proprietary ARM translation layer that translates ARM instructions into x86 instructions for the Atom processor.

libHoudini was around for a while, but around Jelly Bean or KitKat it became standard on Atom based Android devices. This resulted in ARM native apps just working on Atom devices.

Embarcadero was actually in discussions with Intel. There was talk of making an Atom targeted compiler for Android, but work was also done to improve compatibility with libHoudini. Atom was never officially supported (mostly because the market share was too small) so the Android app packager includes a check to say it didn't work with Atom processors. But you can remove that checker and your app will probably run great on most Atom devices.

While Atom never had a huge share of the market, it looks like it is going to have even less as <a href="http://www.anandtech.com/show/10288/intel-broxton-sofia-smartphone-socs-cancelled">Intel has cancelled their next Atom processor line</a>.
<h1>Android Versions</h1>
Unlike Apple, new version updates don't tend to roll out as fast on Android devices. This means you typically encounter a few different versions of Android running in the wild. It isn't all that bad though. In my opinion, Ice Cream Sandwich (API 15) was really when Android came into its own. It was Honeycomb (API 14) that finally gave tablets some serious love, and ICS merged those new features back to phones. Anything before ICS is really legacy at this point (at least in my opinion). Android tracks the popularity of Android versions on their <a href="https://developer.android.com/about/dashboards/index.html">Developer Dashboard</a>.

<a href="https://developer.android.com/about/dashboards/index.html"><img class="wp-image-2470 size-full" src="/assets/images/2016/06/AndroidChart.png" alt="Android Platform Versions Chart" width="500" height="250" /></a> As of May 2, 2016

Ice Cream Sandwich and <em>older</em> only account for a total of 4.3% of Android devices. While there are feature differences between the top 3, nothing is too revolutionary as to make the others obsolete yet.
<h1>A Thousand Flowers</h1>
Unlike iOS, where Apple is the only company to make devices that run it, Android is <em>EVERYWHERE</em>! I guess I'm kind of a collector of Android devices. I owned the first Android powered watch by WIMM and even created a 6 sided dice app for it. Now that Delphi supports Android I love testing it on different Android devices. Here is a list of my findings
<ol>
 	<li><strong>Android Wear</strong> - I've tested 4 or 5 different Android wear devices, including the Moto 360, and they all worked flawlessly with FireMonkey.</li>
 	<li><strong>Google Glass</strong> - Again, worked out of the box with FireMonkey. We even later added official support. Unfortunately Google is <em>reimagining</em> Glass right now, but I suspect when then new version comes out it will work great.</li>
 	<li><strong>Epson Moverio BT-200 </strong> - Similar to Google Glass, but has two independent translucent lenses so it can do 3D. Runs Android Jelly Bean and works with FireMonkey right out of the box. There is a BT-300 coming soon.</li>
 	<li><strong>Ouya</strong> - This was the Android gaming console that was going to change the world. It ended up under delivering, and then not evolving fast enough. It does however run FireMonkey just fine, and I know a few developers who used it for creative projects.</li>
 	<li><strong>Amazon FireTV </strong>and<strong> Fire TV Stick</strong> -  Designed to work with your TV and running Amazon's own version of Android. Again worked like a charm with FireMonkey.</li>
 	<li><strong>Amazon </strong><span style="color: #000000;"><b>Fire Phone</b></span> - I think this is a pretty cool device, a shame it didn't catch on. Also runs FireMonkey apps fine.</li>
 	<li><strong>Amazon Kindle Tablets</strong> - I've not tested these, but I know people who have. Again it runs a different flavor of Android. From what I hear some people had to update their OS to get it to work with FireMonkey, but it did work.</li>
 	<li><strong>BlackBerry Phone</strong> - Yeah, I went there, and so did FireMonkey. It worked too, although there are some idiosyncrasies about the OS that show up when you invoke the share sheet. I originally tested it on the BlackBerry OS, which supports Android apps, but now they've gone full Android.</li>
 	<li><strong>Windows Phone 10</strong> - My Windows Phone wouldn't install the right preview of Windows 10, but <a href="http://www.marcocantu.com/">Marco</a> had better luck than I and got <a href="http://community.embarcadero.com/blogs/entry/running-delphi-android-applications-on-windows-phone-via-astoria-bridge">FireMonkey apps running on Windows 10 Phone</a> under the Astoria bridge. Then Microsoft discontinued it. Windows Phone never had much market share, and continues to dwindle.</li>
 	<li>Huge collection of <strong>tablets</strong> and <strong>phones</strong>, including one with an <em>Atom</em> processor - they all worked (except that one old Tegra 2 tablet that ran Gingerbread).</li>
</ol>
Since Android is everywhere I'd wager that there is no Android app that actually runs on every single Android device out there, I don't care what you wrote it with. Now if someone wants to prove me wrong, that is fine, I suspect different Android devices will be released faster than we can test them.
<h1>Conclusion</h1>
Let's run through those requirements again and see how big of an impact they really represent.
<ol>
 	<li><strong>ARM Cortex-A series CPU</strong> - Atom was never big, and is on its way out. Most everything else is ARM Cortex-A (or newer / compatible).</li>
 	<li><strong>ARMv7 Instructions</strong> - ARMv6 is either really old, or used in a micro device like a beacon or some other IoT device. Not in any Android devices. Oh, and <a href="http://www.arm.com/products/processors/armv8-architecture.php">ARMv8</a> is the big thing now. It is 64-bit and runs FireMonkey apps fine.</li>
 	<li><strong>NEON Technology</strong> - Like I said, it is part of the standard now, so unless you have an old Tegra 2 tablet (I still have one) then nothing to worry about.</li>
 	<li><strong>GPU</strong> - All of the GPU compatibility and performance issues I know of have been fixed, and GPUs are standard on Android devices (at least ones with a screen).</li>
 	<li><strong>Specific versions of Android</strong> - Only 2.3% of devices have an unsupported version of Android.</li>
</ol>
So while FireMonkey apps may not run on every single Android device in existence, most apps don't and no app needs to. FireMonkey apps to run on the vast majority of them, and that is what matters.
