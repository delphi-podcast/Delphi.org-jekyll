---
id: 1800
title: 'Fire UI and the Multi-Device Designer'
date: '2014-10-28T08:18:36-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1800'
permalink: /2014/10/fire-ui-and-the-multi-device-designer/
tags:
    - design
    - Mobile
---

During CodeRage 9 I had a session on Fire UI and the Multi-Device Designer. You can also check out my previous post on <a title="Hello Moto 360 from Delphi XE7" href="http://delphi.org/2014/09/hello-moto-360-from-delphi-xe7/">creating a custom FireUI view</a> for the Moto 360.

<strong>Fire UI is made up of three parts:</strong>
<ol>
	<li class="p1"><span class="s1">Behavior Services - </span><span class="s1">Runtime &amp; design time platform design information </span></li>
	<li class="p1"><span class="s1">Multi-Device Designer - </span>Unified project - Tweak UI for platforms</li>
	<li class="p1">TMultiView Component - Adaptive layout</li>
</ol>
<strong>Behavior Services at Design Time</strong>
<ul>
	<li class="p1"><span class="s1">Examples:</span>
<ul>
	<li class="p1">TTabControl.TabPosition
<ul>
	<li class="p1">Bottom on iOS, top otherwise</li>
</ul>
</li>
	<li class="p1">Font.Size &amp; Font.Family</li>
	<li class="p1"><span class="s2">Many controls have </span><span class="s1">Size.PlatformDefault = True</span></li>
	<li class="p1"><span class="s1">TMultiView</span><span class="s2"> mode</span></li>
</ul>
</li>
</ul>
<p class="p1"><span class="s1"><b>Behavior Services at Runtime</b></span></p>

<ul>
	<li class="p1">TBehaviorServices class in FMX.BehaviorManager.pas</li>
	<li class="p1">IDeviceBehavior defines
<ul>
	<li class="p1">GetDeviceClass: TDeviceInfo.TDeviceClass;</li>
	<li class="p1">GetOSPlatform: TOSPlatform; // Windows, OSX, iOS, Android</li>
	<li class="p1">GetDisplayMetrics: TDeviceDisplayMetrics;</li>
</ul>
</li>
	<li class="p1">IFontBehavior defines
<ul>
	<li class="p1">GetDefaultFontFamily &amp; GetDefaultFontSize</li>
</ul>
</li>
</ul>
<strong>OS Specific example</strong>

[pascal] var
  DeviceBehavior: IDeviceBehavior;
begin
  if TBehaviorServices.Current.SupportsBehaviorService(?
    IDeviceBehavior, DeviceBehavior, Self) and
    (DeviceBehavior.GetOSPlatform = TOSPlatform.iOS) then
    // behavior specific to iOS
end;[/pascal]

<strong>Display metrics example</strong>

[pascal]var
  DisplayMetrics: TDeviceDisplayMetrics;
begin                        // self is a form in this case
  DisplayMetrics := DeviceBehavior.GetDisplayMetrics(Self);
  if DisplayMetrics.AspectRatio &gt; x then
    // AspectRatio specific behavior
end;[/pascal]


[pascal]type
TDeviceDisplayMetrics = record
    PhysicalScreenSize: TSize;
    LogicalScreenSize: TSize;
    AspectRatio: Single;
    PixelsPerInch: Integer;
    ScreenScale: Single;
    FontScale: Single;
end;[/pascal]

<strong>More Information</strong>
<ul>
	<li><a href="http://embt.co/using-tab-components">Using PlatformDefault for Tab Components</a></li>
	<li><a href="http://embt.co/form-designer">Using Master views in the Form Designer</a></li>
	<li><a href="http://embt.co/mdd-custom-view">Adding a Custom View</a></li>
	<li><a href="http://embt.co/multiview-tutorial">MultiView Tutorial</a></li>
	<li><a href="http://delphi.org/2014/09/hello-moto-360-from-delphi-xe7/">Moto 360 &amp; Galaxy Gear Live Views</a></li>
</ul>
<em>Check back later and I'll have the video replay available too.</em>

<a href="https://downloads.embarcadero.com/free/delphi">Download the XE7 Trial</a> today and <a href="http://www.embarcadero.com/radoffer">check out the special offers</a>.
