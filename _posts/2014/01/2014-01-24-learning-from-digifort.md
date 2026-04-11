---
id: 1481
title: 'Learning from Digifort'
date: '2014-01-24T13:20:00-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1481'
permalink: /2014/01/learning-from-digifort/
tags:
    - 'Delphi Projects'
    - iOS
    - Mobile
---

You've probably seen Éric Fleming Bonilha videos showing off his <a href="http://digifort.com">Digifort</a> mobile applications developed with Delphi XE5. The videos don't mention it, but the back end server and client applications are all written in Delphi too. Just in case you haven't see the videos, here they are again:

https://www.youtube.com/watch?v=4lQGA8-sO9w

Earlier version, but on a lot of different devices:

https://www.youtube.com/watch?v=EmH3KWLAk8I

Embarcadero just completed a <a title="Digifort Case Study" href="http://www.embarcadero.com/products/digifort-case-study">case study with him too</a>, which is really informative. I spoke with him down in Brazil and he said they previously developed mobile clients with both Java and Objective-C, and found Delphi let them develop their projects much faster, and they get both Android and iOS from one project. Also, and perhaps more importantly he said the performance of the Delphi client was just as good, plus they found it more flexible for building a user interface that looks great and is easy to use.

<img class="aligncenter size-full wp-image-1482" src="/assets/images/2014/01/digifort-mobile-camera348x424.jpg" alt="Digifort Mobile Client" width="348" height="424" />

Digifort may be based in Brazil, but their clients are all over the world and are a mix of government agencies and business of various sizes. Eric arranged a trip to meet me in Scotts Valley this last week. He showed me some pictures of some of the walls of monitors his clients have, all powered by Digifort. Some really impressive installations.

A big part of his trip was to pick up a his very own Google Glass to start developing a Digifort mobile app for Google Glass. In just a couple short sessions he was capturing images from the built in camera, connecting to his remote server, and streaming live video from Brazil to the glass display. The use case for security personal to view cameras while on patrol, while sharing what they see with everyone else is a great one.

<img class="aligncenter size-full wp-image-1484" src="/assets/images/2014/01/David-Eric-and-Jim.jpg" alt="David, Eric and Jim" width="782" height="309" />

Eric also had a chance to visit with some people from R&amp;D and product management and share his experiences working with Delphi XE5 and FireMonkey. Here are some best practices he found for making a really smooth user interface.
<ul>
 	<li>FireMonkey handles PNG images really well. He makes a lot of use of transparent and semitransparent PNG images in <strong>TImage</strong> components. Layering, animating and zooming those images is what he uses to create some of those really great effects, like the joystick control for camera control.</li>
 	<li>The <strong>TFloatAnimation</strong> and other animation effects are really powerful. He uses those extensively for smooth animations.</li>
 	<li>He created the drawer interface using <strong>TFrames</strong> (he uses a lot of frames). The main (center screen) has a <strong>Pan Interactive Gesture</strong> on it. He looks at the gesture to see if it is horizontal (comparing the gesture start to a later gestsure event) and has traveled at least 10 pixels in that direction. Once that happens then he moves the edge of it with the current finger position from the gesture. He also tracks the speed of the movement, so if you let go then he uses another <strong>TFloatAnimation</strong> to smoothly finish the movement at the same speed.</li>
 	<li>When the drawer starts to open he pauses all the video and other animations. This really increases the performance of the drawer animation.</li>
 	<li>Anything that is not currently shown on the screen has its <strong>visibility</strong> set to false. So if the drawer is closed, then everything in the drawer is invisible (since it is in a frame he just sets the frame to invisible). This keeps it from rendering and gives what is visible all the processing power. This is a common suggested optimization with many mobile development tools.</li>
 	<li>It is important to think about a mobile app's interface as a mobile app. Don't try to squeeze a desktop app onto a mobile device. That will only frustrate you and your users.</li>
 	<li>In his lists of cameras he uses a <strong>TVertScrollBox</strong> and fills it with a custom component that contains <strong>TImages</strong> and <strong>TLabels</strong>. That gives him maximum flexibility for the drag to reorder (again a Pan Interactive Gesture). He did find that the <strong>TLabel</strong> has better performance than drawing the text manually inside his custom control.</li>
</ul>
There were a lot of things he shared where he spent a little extra time to get things just right, and that is what makes the difference for a really smooth user interface. When asked about the learning curve to move from Desktop VCL to FireMonkey Mobile he said there was just a little learning curve, but now he really likes FireMonkey better than VCL. There was talk about having him collaborate for a user interface webinar, which I'm sure will be very informative.

You can catch Eric's appearance in our Devices and Gadgets webinar on the <a href="http://www.embarcadero.com/rad-in-action/programming-devices-and-gadgets">webinar replay</a> (posting any day now). And download his <a href="http://cc.embarcadero.com/item/29699">sample code</a> (along with the rest of the code from the webinar).

https://www.youtube.com/watch?v=2VWoqsCmWRM

What are some tips and best practices you've found in your FireMonkey mobile development?
