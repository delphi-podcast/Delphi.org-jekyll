---
id: 2804
title: 'The Niagara Falls Lighting Episode'
date: '2017-04-20T19:49:04-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2804'
permalink: /2017/04/the-niagara-falls-lighting-episode/
tags:
    - 'Audio podCast'
    - 'Cool Apps'
    - FireMonkey
    - 'LED Lights'
    - 'Niagara Falls'
    - podcast
    - TMS
    - VCL
---

<img class="alignright  wp-image-2809" src="/assets/images/2017/04/Martin.jpg" alt="Martin Searancke" width="134" height="134" />This episode is extra special in that it include a case study of the software behind the lights for Niagara Falls. Nick and I spoke with Martin Searancke of <a href="http://lightfactory.net/">Dream Solutions, Ltd</a>. in New Zealand, who is the architect of the Light Factory software used by the <a href="https://www.niagaraparks.com/niagara-falls-attractions/niagara-falls-illumination.html">Niagara Falls Illumination Board</a> to illuminate Niagara Falls.  After you <a href="https://soundcloud.com/delphi-podcast/the-niagara-falls-episode">listen to the podcast</a> you can read the case study write up here.

[soundcloud url="https://api.soundcloud.com/tracks/318732822" params="color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false" width="100%" height="166" iframe="true" /]

The software uses both VCL and FireMonkey. The backend control software is written in VCL and the frontend user interface side is written in FireMonkey. It also uses components by <a href="http://www.mitov.com/">Mitov Software</a>, <a href="https://www.tmssoftware.com/site/">TMS Software</a>, and <a href="https://www.lmdinnovative.com/">LMD Innovative</a>.

A few links we mentioned
<ul>
 	<li><a href="https://parnassus.co/delphi-tools/parnassus-navigator/">Navigator by Parnassus</a> - A fantastic IDE add-in</li>
 	<li><a href="http://www.neocontrol.net/">The NEO Phillips Strand Lighting console</a> - The software in the console is by Martin</li>
 	<li><a href="http://lightfactory.net/">Light Factory</a> - Martin's web site</li>
</ul>
Here is a little <a href="https://www.youtube.com/watch?v=IcWbpJOVArw">documentary about the new lights at Niagara Falls</a>. It mostly focuses on the hardware side of things, but you can watch it knowing the software comes from your favorite development tools.

https://www.youtube.com/watch?v=IcWbpJOVArw
<h1>Niagara Falls Lighting Software Case Study</h1>
<h2>Introduction</h2>
The decision to upgrade the lighting that illuminates Niagara Falls seems as though it should be the main story but, it’s not. The part of the project we are interested in is the one where the Niagara Falls Illumination Board (NFI) added a requirement to build a more flexible color illumination scheme to replace the old guillotine color-changing scheme that had been in place since 1974. The guillotine color-changing synchro-server mechanical system was to be replaced by a digital color control system and the twenty-one 4000w Xenon lights were to be replaced by 1400 digital-friendly nine-light LED modules in which the LED’s would be multi-color rather than having to place a filter in front of the white light of the Xenons. The LED system of lights would be software controlled from a 22-inch touch screen from over a 2000 foot distance from the falls.

<a href="https://www.niagaraparks.com/niagara-falls-attractions/niagara-falls-illumination.html"><img class="aligncenter size-full wp-image-2806" src="/assets/images/2017/04/NIAGARA-FALLS-LEDs.jpg" alt="Niagara Falls LEDs Powered by Delphi" width="570" height="380" /></a>
<h2>The Solution</h2>
The technical and engineering challenges to a project of this scope and magnitude were significant right down to the last task of choosing the lighting controller and connecting it with the 1400 LED light modules. The software that drives the system is housed in the controller and is built using <a href="https://www.embarcadero.com/products/delphi">Embarcadero’s Delphi</a> <a href="https://www.embarcadero.com/products/delphi"><img class="alignright " src="http://delphi.org/mvp/logo/PoweredBy/Delphi/Powered_by_Delphi.png" alt="Powered by Embarcadero Delphi" width="317" height="129" /></a>Integrated Development Environment (IDE). The FireMonkey (FMX) application development platform is used to create the front end functionality, and the Visual Component Library (VCL) is used for the back-end services. FireMonkey and VCL are both integrated elements of the Delphi IDE.

The lighting controller was a commercially available machine marketed by Philips Strand Lighting as part of their NEO line of lighting consoles.

<img class="aligncenter size-large wp-image-2807" src="/assets/images/2017/04/neo1large-1024x620.png" alt="NEO Console running Martain's software" width="640" height="388" />

The existing software code in the NEO lighting console dated back a few years given that the console had been sold commercially before the Niagara Falls lighting project was even considered. The first challenge to overcome was to review the technical and performance requirements needed to accomplish the vision of the NFI and update the FireMonkey and VCL code to meet the required functionality. Then, came the customization of the code to accommodate all the connecting equipment that would drive the LED modules and the end user interface, the 22-inch touchscreen.

The overall objective of the new control console and software code within was not to try and upstage the majestic beauty of the falls but rather to organically enhance visual images of the falls at night when it couldn’t be seen otherwise. So, special effects such as strobing and other awe and wow factors were ignored in favor of techniques such as backlighting the falls to reveal hidden beauty in addition to a penetrating forward color-changing illumination. The results were nothing less than magnificent requiring new software profiles due to the color changing properties of the LED modules. The final result was ten preset modes for each side of the Falls (American and Canadian) encompassing color schemes to match naturally occurring, organic events such as the aurora borealis, sunset, sunrise, waves, and color gradients.

One unique capability that was requested to be programmed into the FireMonkey and VCL code was a user interface the allowed operators to use a touch-sensitive color-picker button on the screen to change scenes instantaneously. The LED lighting modules instantly responsive making these color changes dramatic and inspiring. A mobile interface module and application was created using FireMonkey to allow visitors and tourists to be able to manipulate the solid color palette and see the changes appear right before their eyes.
<h2>Conclusion</h2>
The Niagara Falls Lighting Project brought to light one of the real values of Embarcadero software. In this case, the Delphi IDE and its integrated parts (FireMonkey and VCL) is life-cycle engineered so that code developed years ago can be updated and reused to create an entirely new, cutting edge capability for new technologies such as LED lighting modules. This fit the Niagara Falls Illumination Board (NFI) requirements perfectly. The design of the system was mandated to done such that in the future, changes and additions can be easily accommodated. Embarcadero and its Delphi IDE proved its worth and was demonstrated to be able to meet future requirements as the Niagara Falls lighting system evolves and new technologies come online.

<a href="https://www.niagaraparks.com/niagara-falls-attractions/niagara-falls-illumination.html"><img class="aligncenter size-full wp-image-2805" src="/assets/images/2017/04/NIAGARA-FALLS-570.jpg" alt="Niagara Falls Lit by Delphi" width="570" height="380" /></a>
