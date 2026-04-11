---
id: 1871
title: 'Looking at Radiant Shapes'
date: '2015-01-22T15:30:20-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1871'
permalink: /2015/01/radiant-shapes/
categories:
    - News
tags:
    - design
    - iOS
    - News
---

<img class=" size-full wp-image-1872 alignright" src="/assets/images/2015/01/RadiantShapes_Logo.png" alt="RadiantShapes_Logo" width="251" height="55" />
I've been playing with <a href="http://www.raize.com/DevTools/Products.asp">Raize Software</a>'s new <a href="http://www.raize.com/DevTools/RadiantShapes/Default.asp">Radiant Shapes components</a> this week. These are the brand new primitive shape component set for FireMonkey on all platforms: Windows, OS X, iOS and Android. I've been a long time fan of Raize Components because of their attention to detail and high quality. Radiant Shapes continues this tradition.

<img class="alignleft size-full wp-image-1873" src="/assets/images/2015/01/RadiantShapesPalette.png" alt="Radiant Shapes Palette" width="288" height="211" />Radiant Shapes is made up of 35 reusable shape controls that are all pretty flexible. If you caught Ray Konopka's <a href="http://www.embarcadero.com/rad-in-action/data-visualization">RAD In Action: Seeing is Believing</a> on Data Visualization then you have a pretty good idea the importance of using primitive shapes like these to communicate useful information to your users, especially in mobile development.

All of the shapes include useful design time menus to make common changes quickly and easily. You can probably get away without using the Object Inspector for a lot of your common tasks. They also have various customizations that make them very flexible.

One thing that is interesting is they introduce the idea of a <a href="http://www.raize.com/DevTools/RadiantShapes/Features.asp">TRadiantDimension</a> they allows you to specify some of the sizes as either absolute pixels, or as a scale factor. This gives great flexibility in how they behave when resized.

Ray Konopka introduced the Radiant Shapes during CodeRage 9 with a couple great sessions. You can catch the replay for both <a href="https://www.youtube.com/watch?v=9DdgPrrFsG4">Object Pascal</a> and <a href="https://www.youtube.com/watch?v=9DdgPrrFsG4">C++</a>.

https://www.youtube.com/watch?v=9DdgPrrFsG4

I really like the TRadiantGear component, so I decided to play with it in detail. You can specify the number of cogs (teeth), their size (as a Radiant Dimension) and the size and visibility of the hole. Just like all the other shapes, they handle hit tests correctly, so at runtime, you can click between the cogs of the gear and it doesn't produce an onClick event.

<img class="aligncenter size-full wp-image-1874" src="/assets/images/2015/01/Gears.png" alt="Gears" width="286" height="163" />

Just for fun I put down three gears and used LiveBindings to connect a TTrackBar.Value to their rotation. A little math in the OnAssigningValue event and I had all the gears rotating in unison. The fact that the gears stayed synced up, and the teeth meshed perfectly was really impressive.

[delphi]
procedure TForm4.RotateGearBigAssigningValue(Sender: TObject;
  AssignValueRec: TBindingAssignValueRec; var Value: TValue;
  var Handled: Boolean);
begin
  Value := TValue.From(-1 * (Value.AsExtended / 2 + 18));
end;

procedure TForm4.RotateGearRightAssigningValue(Sender: TObject;
  AssignValueRec: TBindingAssignValueRec; var Value: TValue;
  var Handled: Boolean);
begin
  Value := TValue.From(-1 * (Value.AsExtended + 18));
end;
[/delphi]

18 is the offset for the gears (360° / 10 cogs / 2 (half offset) = 18) and the 2 comes from the big gear being twice as big (20 cogs), then the -1 is so they rotate the opposite direction.

Overall I am impressed with the Radiant Shapes. Something I would like to see include a polygon component where I can specify the number of sizes. You can do that with the star and gear, but a flexible polygon would be nice. Also, the shapes can be rotated with the rotation property, but it would be cool if there was a way to rotate it in the designer too. That might be a big undertaking though.

You can <a href="http://www.raize.com/DevTools/Ordering/Default.asp">buy the Radiant Shapes from Raize Software for $49</a>, which gives you a 1 year subscription for updates. I did get a complimentary copy from Raize Software to review them.

Be sure to join Ray on Friday the 23rd as he is featured in <a href="http://forms.embarcadero.com/14Q1TechPartnerSpotlights">the Embarcadero Technology Partner Spotlight</a>.
