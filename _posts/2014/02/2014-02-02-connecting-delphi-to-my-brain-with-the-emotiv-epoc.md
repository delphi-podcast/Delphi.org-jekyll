---
id: 1510
title: 'Connecting Delphi to my Brain with the Emotiv EPOC'
date: '2014-02-02T12:43:29-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1510'
permalink: /2014/02/connecting-delphi-to-my-brain-with-the-emotiv-epoc/
tags:
    - 'Brain Computer Interface'
    - brain-computer-interface
    - delphi
    - devices
    - emotiv
    - gadgets
    - webinar
---

<a href="http://www.emotiv.com/epoc/"><img class=" wp-image-1513 alignright" src="/assets/images/2014/02/Emotiv-EPOC-1080-1024x791.jpeg" alt="Emotiv EPOC Neuroheadset" width="372" height="287" /></a>The Emotiv EPOC might seem more Sci-Fi than practical technology. It is designed to pick up on brain waves through its 14 brain wave sensors (plus 2 reference receivers) and convert them into a usable signal for your computer. For head tracking it also includes a head mounted gyroscope.

The sensor input comes in 4 different categories:
<ul>
	<li><strong>Head rotation:</strong> The gyroscope returns acceleration information about the movement of your head.</li>
	<li><strong>Facial Expressions:</strong> Referred to as the Expressiv Suite, it processes the signals to detect facial expressions in real time. This includes winks, smiles, and eye movement.</li>
	<li><strong>Emotions:</strong> The Affectiv Suite<strong> </strong>provides real time emotional feedback including frustration, distraction, etc.</li>
	<li><strong>Direct Thought Control</strong>: The Cognitiv Suite lets you define trained brain patterns that you associate with different outcomes. When you repeat the brain pattern the system responds appropriately.</li>
</ul>
If you want to play with the Emotiv EPOC it is $500 for the developer set. The normal consumer set only works with official licensed software. It comes with a nice control panel that lets you play with the different inputs.

Thanks to the work of Simon J. Stuart (aka LaKraven) the SDK has a full Delphi translation. I have a short demo using the gyroscope. The brain access systems were giving me a handshake error, but that may be a commentary on my brain power.

https://www.youtube.com/watch?v=GgVg1Z3749s

My next objective is to unlock the brain interface and combine that with the <a href="http://delphi.org/2014/02/connecting-to-the-parrot-ar-drone-2-0-from-delphi-xe5/">Parrot AR.Drone api</a> so I can fly the quadricopter with my mind.

That was part of the 11 demos in our <a href="http://www.embarcadero.com/rad-in-action/programming-devices-and-gadgets">Devices and Gadgets webinar</a>. You can access the full replay on demand, which includes access to most all the drivers, wrappers, apis and source code. The only missing source code is to <a href="http://blogs.embarcadero.com/abauer">Allen Bauer</a>'s bluetooth infrared velocity screen system. He'll have a blog post about that one.
