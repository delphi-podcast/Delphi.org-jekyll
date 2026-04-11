---
id: 1683
title: 'Delphi Sensors on Windows 8 Tablet'
date: '2014-05-22T09:26:47-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1683'
permalink: /2014/05/delphi-sensors-on-windows-8-tablet/
tags:
    - devices
---

New in XE6 is support for VCL Sensors. What better way to show these off then on the <a title="Dell Venue 8 Pro" href="http://www.dell.com/us/p/dell-venue-8-pro/pd">8" Dell Venue 8 Pro Windows 8.1 Tablet</a>. The <strong>VCLSensors</strong> sample ships with <a href="http://www.embarcadero.com/products/rad-studio">RAD Studio XE6</a>. I simply deployed it to the Dell Venue 8 Pro and it runs great.

<a href="/assets/images/2014/05/VCL-Sensors-on-Dell-Venue-8-Pro.jpg"><img class="aligncenter size-large wp-image-1691" src="/assets/images/2014/05/VCL-Sensors-on-Dell-Venue-8-Pro-1024x576.jpg" alt="VCL Sensors on Dell Venue 8 Pro" width="620" height="348" /></a>

&nbsp;

I added one of the VCL Styles to it as well. You can see it running here with my favorite wallpaper. It shows the Latitude &amp; Longitude from the GPS via the <strong>TLocationSensor</strong>, the motion from the accelerometer via the <strong>TMotionSensor</strong> and the compass heading + tilt from the compass and gyroscope via the <strong>TOrientationSensor</strong>.

These sensors behave exactly the same way as the FireMonkey mobile ones do on Android and iOS, but now you can take advantage of them with your desktop applications.

You can also use the Metropolis UI and the tablet optimized styles for a full screen tablet experience on the Dell tablet. Both with VCL and FireMonkey.

&nbsp;
