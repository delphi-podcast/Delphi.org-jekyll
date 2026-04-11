---
id: 1467
title: 'Buffering Sensor Data'
date: '2014-01-16T15:33:41-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1467'
permalink: /2014/01/buffering-sensor-data/
tags:
    - iOS
    - Mobile
    - webinar
---

Working with sensors on devices can often lead to large amounts of data coming to you really fast. For example the TMotionSensor's OnDataChange event fires 100 times a second on my Nexus 5. When I was building my <a href="http://delphi.org/2014/01/launching-a-delphi-xe5-app-via-voice-on-google-glass/">level app for Google Glass</a> the level bar was bouncing all over the place because of the sensitivity and sample rate.

My first thought was to only take every 10th sample, but I wasn't happy with that either because the specific sample it pulled could be the one when there was a jitter.

<em>Example</em>: <strong>1</strong>,2,1,1,2,1,2,3,1,3,<strong>12</strong>,2,3,1

If I just looked at sample 1 and 11 then I would see a lot of movement, but in reality it was relatively stable most of the time.

What I ended up doing was buffering the data and taking an average. I just created a generic <strong>TList</strong> of the appropriate type, and during the <strong>OnDataChange</strong> event I would simply store the sample data. When it came time to update the display I took an average sample, which I found gave a much smoother and more representational display.

Although it was still possible the line could jump erratically if I really moved a lot. So I decided to use an animation for the movement. This keeps the line movement smooth, even if there is a lot of movement (it interpolates the positions between the current line position and the new position). I used a <strong>TFloatAnimation</strong> and set the <strong>StartFromCurrent</strong> property to true.

When the animation is finished I set the <strong>StopValue</strong> to the the average of the values, then enable again. It is important to always clear the sample values after taking an average. Otherwise the movement will continue to get slower and slower as it becomes more and more stable (averaging a large enough sample of numbers results in a smaller range of results.)

I was really pleased with how smooth things looked with a 0.1 second duration on the animation. With 100 samples a second, this translates into each animation covering the average of 10 samples. The built in animations made it really easy, and the final display looked great.

I'll include the source code with the downloads from the <a href="http://forms.embarcadero.com/DevicesWebinar1-22"><strong>Making the Connection: Programming Devices and Gadgets with RAD Studio</strong></a> webinar coming up next week!

<a href="http://forms.embarcadero.com/DevicesWebinar1-22"><img class="alignnone" alt="RAD-in-Action Webinar Making the Connection: Programming Devices and Gadgets with RAD Studio Wednesday, January 22, 2014" src="http://img.en25.com/EloquaImages/clients/Embarcadero/%7Bbdf8dda7-28a8-449b-9a5a-23cf781bd523%7D_RADInAction_Devices_680x150.jpg" width="680" height="150" /></a>
