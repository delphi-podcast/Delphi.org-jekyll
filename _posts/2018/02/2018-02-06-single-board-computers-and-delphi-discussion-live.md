---
id: 2996
title: 'Single Board Computers and Delphi Discussion LIVE!'
date: '2018-02-06T20:47:33-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2996'
permalink: /2018/02/single-board-computers-and-delphi-discussion-live/
tags:
    - podcast
    - 'Video podCast'
---

Craig and Jim discussed Single Board Computers (SBC) and Delphi in this <a href="https://youtu.be/N7d7F1UpUcc">Live Episode of The Podcast at Delphi.org</a>

[embed]https://youtu.be/N7d7F1UpUcc?rel=0[/embed]

If you are wanting to target these boards from Delphi remember if it is an ARM processor you will want to run Android, and if it is an x86 then you will want to run Windows or Linux. Here are some links to some of the single board computers we discussed:
<ul>
 	<li><a href="https://minnowboard.org/"><strong>MinnowBoard</strong> <img class="alignright wp-image-2997" src="/assets/images/2018/02/MinnowBoard_logo_colour_darktext.png" alt="MinnowBoard" width="300" height="65" /></a>by NetGate is an x86 based SBC that includes configurations with Dual Ethernet, which is great for creating network appliances. It includes support for both Linux and Windows. I've yet to test it, but I expect it will work fine.</li>
 	<li><a href="https://www.udoo.org/udoo-x86/"><strong>Udoo x86</strong><img class="alignright wp-image-2998" src="/assets/images/2018/02/Udoo-300x113.png" alt="Udoo x86" width="265" height="100" /></a> is another x86 based SBC (thus the name - but be aware they have non-x86 boards with different names) it supports both Windows and Linux operating systems, and your Delphi apps will run swimmingly under both operating systems. There are 4 different variations of the x86 with different configurations. It includes both a Intel Braswell SOC as the main OS CPU that runs Linux and Windows, and also an Intel Curie Microcontroller that is Arduino compatible. There are GPIO pins for both boards, and the Curie pins are compatible with most Arduino shields. You have a dedicated serial connection between the two so you can create an Arduino app with <a href="https://www.visuino.com/">Visuino</a> that runs on the Curie, talking to various sensors and it will run independently of your Delphi app running on the Braswell.</li>
 	<li><a href="http://www.lattepanda.com/"><strong>LattePanda<img class="alignright wp-image-2999" src="/assets/images/2018/02/LattePanda-300x300.png" alt="LattePanda" width="200" height="200" /></strong></a> is a Windows 10 specific SBC and comes with Windows 10 preinstalled. There are two different hardware configurations, and you can choose for it to have Windows 10 activated or use your own license. It also includes a separate Arduino compatible ATmega32u4 microprocessor, again with the dedicated serial connection between the two processors and GPIO pins for both processos. I was able to get Linux installed, but I wouldn't recommend it as it was a lot of effort and the WiFi wasn't compatible. You could technically install Delphi IDE on both the LattePanda and Udoo x86, but more likely you would want to use a dedicated development computer and then use the remote debugger/platform assist server on the SBC. They have a new <a href="https://www.kickstarter.com/projects/139108638/lattepanda-alpha-soul-of-a-macbook-in-a-pocket-siz">LattePanda Alpha</a> they recently launched on Kickstarter which significantly upgraded stats.</li>
 	<li><strong><a href="https://beagleboard.org/black">BeagleBone Black</a><a href="https://beagleboard.org/black"><img class="alignright wp-image-3001 " src="/assets/images/2018/02/beaglebone.png" alt="BeagleBone" width="120" height="120" /></a></strong> is an older ARM SBC that has its own Android distro. This works better than trying to shoehorn Android onto the Raspberry Pi - while you can get it installed, the BeagleBone Black's Android distro is much more reliable. It has the GPIO pins like a Raspberry Pi. It is a little older and but might still be a good solution for your projects.</li>
 	<li><a href="http://www.orangepi.org/"><strong>Orange Pi<img class="alignright wp-image-3002" src="/assets/images/2018/02/orange-pi-300x158.png" alt="orange-pi" width="171" height="90" /></strong></a> is another Raspberry Pi type ARM device that is cheaper and designed to run Android. They have a lot of different models to choose from, and just released a new one at CES. I've ordered a few to test, but they should run Delphi Android apps great. I have a <a href="https://docs.google.com/spreadsheets/d/e/2PACX-1vTNjOtifI1fwz8J7yPSee-2MZOzMz3-t-rQRwfW_0Qx9aV3AVPwp4Zce1QznkPeMQ-7IiQ0Bn_yUoB0/pubhtml?gid=0&amp;single=true">spreadsheet of all the different Orange Pi boards</a> and some basic specs for easy comparison. No guarantees it is 100% correct though.</li>
</ul>
