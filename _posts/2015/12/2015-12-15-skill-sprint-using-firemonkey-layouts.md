---
id: 2171
title: 'Skill Sprint: Using FireMonkey Layouts'
date: '2015-12-15T05:42:31-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2171'
permalink: /2015/12/skill-sprint-using-firemonkey-layouts/
tags:
    - FireMonkey
    - Layouts
    - 'Skill Sprint'
    - webinar
---

FireMonkey has many layout controls to choose from. Come learn the differences and how to use them to create dynamic, multi-platform user interfaces.
<h1>FireMonkey Layouts with Delphi</h1>
https://youtu.be/XBRACAW_sAc
<h1>FireMonkey Layouts with C++Builder</h1>
https://youtu.be/oIimgJAlJDM

&nbsp;
<h1>Understanding and using FireMonkey Layouts</h1>
FireMonkey and the FireUI makes it easy to build one form to rule all the platforms. Combining layout controls and making use of Anchors, Alignment, Padding and Margins it is easy to make one form that looks and works great on all platforms.
<h2><a href="http://embt.co/fmxanchors">Anchors</a></h2>
<ul>
	<li>Position relative to one or more edge(s) of parent:<a href="http://embt.co/fmxanchors" rel="attachment wp-att-2179"><img class="wp-image-2179 alignright" src="/assets/images/2015/12/Anchor-242x300.png" alt="Anchor" width="162" height="201" /></a>
<ul>
	<li>Top</li>
	<li>Bottom</li>
	<li>Left</li>
	<li>Right</li>
</ul>
</li>
	<li>Default is Top, Left</li>
	<li>Moves with parent resize</li>
	<li>Each control has 0 to 4 anchors</li>
</ul>
<h2><a href="http://embt.co/fmxalignlayout">Alignment</a></h2>
<ul>
	<li>Aligns control within parent, setting anchors, size and position.</li>
	<li>Default is None.</li>
	<li>Anchor and fill along edge:
<ul>
	<li>Top, Bottom, Left, Right</li>
</ul>
</li>
	<li>Fill parent, but preserve aspect ratio:
<ul>
	<li>Fit, FitLeft, FitRight</li>
</ul>
</li>
	<li>Fill along one side of the parent (priority over other edge alignments):
<ul>
	<li>MostBottom, MostTop, MostLeft, MostRight</li>
</ul>
</li>
	<li>Resize only on one axis (width or height)
<ul>
	<li>Vertical, VertCenter, Horizontal, HorzCenter</li>
</ul>
</li>
	<li>Miscellaneous
<ul>
	<li>Client - Fills client area, less other children</li>
	<li>Center - No resize, just centered</li>
	<li>Contents - Fills client area, ignoring other children</li>
	<li>Scale - resizes and moves to maintain the relative position and size</li>
</ul>
</li>
</ul>
<h2>Spacing – Margins and Padding</h2>
<ul>
	<li><a href="http://embt.co/fmxmargins">Margins</a><a href="/assets/images/2015/12/MarginsAndPadding.png"><img class="alignright wp-image-2180 size-medium" src="/assets/images/2015/12/MarginsAndPadding-300x177.png" alt="MarginsAndPadding" width="300" height="177" /></a>
<ul>
	<li>Spacing for siblings (and parent edges)</li>
</ul>
</li>
	<li><a href="http://embt.co/fmxpadding">Padding</a>
<ul>
	<li>Spacing for children</li>
</ul>
</li>
</ul>
<h2><a href="http://embt.co/tflowlayout">TFlowLayout</a></h2>
<ul>
	<li>Arrange child controls like words in a paragraph</li>
	<li>Controls arranged in order added to layout
<ul>
	<li>Use "Move to Front" or "Send to Back" to reorder</li>
</ul>
</li>
	<li>Use TFlowLayoutBreak for forced line break</li>
</ul>
<a href="/assets/images/2015/12/FlowLayout1.png" rel="attachment wp-att-2182"><img class="alignnone size-medium wp-image-2182" src="/assets/images/2015/12/FlowLayout1-300x192.png" alt="FlowLayout1" width="300" height="192" /></a> <a href="/assets/images/2015/12/FlowLayout2.png" rel="attachment wp-att-2181"><img class="alignnone size-medium wp-image-2181" src="/assets/images/2015/12/FlowLayout2-300x192.png" alt="FlowLayout2" width="300" height="192" /></a>
<h2><a href="http://embt.co/tgridlayout">TGridLayout</a></h2>
<ul>
	<li>Arranges child controls in a grid of equal sizes</li>
	<li>Controls flow through grid as parent resizes</li>
	<li>Use <em>ItemWidth</em> and <em>ItemHeight</em> properties</li>
	<li>Customize margins of individual controls</li>
</ul>
<a href="/assets/images/2015/12/GridLayout2.png" rel="attachment wp-att-2183"><img class="alignnone size-medium wp-image-2183" src="/assets/images/2015/12/GridLayout2-300x219.png" alt="GridLayout2" width="300" height="219" /></a> <a href="/assets/images/2015/12/GridLayout1.png" rel="attachment wp-att-2184"><img class="alignnone size-medium wp-image-2184" src="/assets/images/2015/12/GridLayout1-300x240.png" alt="GridLayout1" width="300" height="240" /></a>
<h2><a href="http://embt.co/tgridpanellayout">TGridPanelLayout</a></h2>
<ul>
	<li>Creates a grid of specified rows and columns</li>
	<li>Does not change the anchor or size of child</li>
	<li>Each cell can contain 1 child control</li>
	<li>You set the Height, Width, Align, and Anchors of children</li>
	<li>Controls can span multiple cells</li>
</ul>
<a href="/assets/images/2015/12/GridPanelLayout2.png" rel="attachment wp-att-2185"><img class="alignnone size-medium wp-image-2185" src="/assets/images/2015/12/GridPanelLayout2-300x261.png" alt="GridPanelLayout2" width="300" height="261" /></a> <a href="/assets/images/2015/12/GridPanelLayout1.png" rel="attachment wp-att-2186"><img class="alignnone size-medium wp-image-2186" src="/assets/images/2015/12/GridPanelLayout1-300x156.png" alt="GridPanelLayout1" width="300" height="156" /></a>
<h2><a href="http://embt.co/tscaledlayout">TScaledLayout</a></h2>
<ul>
	<li>Stretches child controls as it is resized at runtime</li>
	<li>Doesn’t respect aspect ratios of controls</li>
	<li>Set the <strong>Align</strong> of the <em>TScaledLayout</em> to <strong>Fit</strong> to maintain aspect ratio</li>
	<li>Some styles look better zoomed than others. The font grows - it is not a bitmap scale.</li>
	<li>Has properties for <em>OriginalWidth</em> and <em>OriginalHeight</em> - Compare to <em>Width</em> and <em>Height</em> to determine scaling.</li>
</ul>
<a href="/assets/images/2015/12/ScaledLayout-Stretch.png" rel="attachment wp-att-2187"><img class="alignnone size-medium wp-image-2187" src="/assets/images/2015/12/ScaledLayout-Stretch-300x80.png" alt="ScaledLayout-Stretch" width="300" height="80" /></a>
<h2><a href="http://embt.co/tscrollbox">TScrollBox</a></h2>
<ul>
	<li>Allows children to take up more space than parent</li>
	<li>Usually anchored to <strong>Client </strong></li>
	<li>Only anchor children to Top &amp; Left (default)</li>
	<li>Scroll to see additional children
<ul>
	<li>See also: <a href="http://docwiki.embarcadero.com/Libraries/Seattle/en/FMX.Layouts.TVertScrollBox">TVertScrollBox</a>, <a href="http://docwiki.embarcadero.com/Libraries/Seattle/en/FMX.Layouts.THorzScrollBox">THorzScrollBox</a>, <a href="http://docwiki.embarcadero.com/Libraries/Seattle/en/FMX.Layouts.TFramedScrollBox">TFramedScrollBox</a> and <a href="http://docwiki.embarcadero.com/Libraries/Seattle/en/FMX.Layouts.TFramedVertScrollBox">TFramedVertScrollBox</a></li>
</ul>
</li>
</ul>
<h2><a href="http://embt.co/usingttabcontrol">TTabControl</a></h2>
<ul>
	<li>Control to group child controls into tabs</li>
	<li>Tabs are in a stack with one visible at a time</li>
	<li><em>TabPosition := PlatformDefault</em> to use platform default behavior</li>
	<li><em>TabPosition := None</em> to hide navigation</li>
	<li>Use <em>TTabChangeAction</em> to animate transitions</li>
</ul>
<h2><a href="http://embt.co/workingwithframes">Frames</a></h2>
<ul>
	<li>Reusable pieces of User Interface
<ul>
	<li>Includes
<ul>
	<li>The layout</li>
	<li>All the event handlers</li>
	<li>All the code in the unit</li>
</ul>
</li>
</ul>
</li>
	<li>Create 1 or more Frames, then reposition based on current layout
<ul>
	<li>Examples:
<ul>
	<li>In TTabControl for phone</li>
	<li>Side-by-side for Tablet</li>
</ul>
</li>
</ul>
</li>
</ul>
<h2><a href="http://embt.co/usingmultiview">TMultiView</a></h2>
<ul>
	<li>One super panel with multiple modes<a href="/assets/images/2015/12/MultiView.png" rel="attachment wp-att-2188"><img class="alignright size-medium wp-image-2188" src="/assets/images/2015/12/MultiView-300x242.png" alt="MultiView" width="300" height="242" /></a></li>
	<li>Supported modes
<ul>
	<li><em>PlatformDefault </em></li>
	<li>Drawer</li>
	<li>NavigationPane</li>
	<li>Panel</li>
	<li>Popover</li>
	<li><em> Custom </em></li>
</ul>
</li>
	<li>Point to MasterPane, DetailPane and definable MasterButton</li>
	<li><em>PlatformDefault</em> adapts to platform and orientation</li>
	<li><em>Custom</em> supports user defined layout and behavior</li>
</ul>
<h1>Learning Resources</h1>
<ul>
	<li><a href="http://embt.co/fmxlayouts">FireMonkey Layout Strategies</a></li>
	<li>Layours
<ul>
	<li><a href="http://embt.co/tflowlayout">Flow Layout</a></li>
	<li><a href="http://embt.co/tgridlayout">Grid Layout</a></li>
	<li><a href="http://embt.co/tgridpanellayout">Grid Panel Layout</a></li>
	<li><a href="http://embt.co/tscaledlayout">Scaled Layout</a></li>
	<li><a href="http://embt.co/tscrollbox">Scroll Box</a></li>
</ul>
</li>
	<li>Related technologies
<ul>
	<li><a href="http://embt.co/fmxanchors">Anchors</a></li>
	<li><a href="http://embt.co/fmxalignlayout">Alignments</a></li>
	<li><a href="http://embt.co/fmxmargins">Margins</a></li>
	<li><a href="http://embt.co/fmxmargins">Padding</a></li>
</ul>
</li>
	<li>More layout options
<ul>
	<li><a href="http://embt.co/usingttabcontrol">Tab Control</a></li>
	<li><a href="http://embt.co/workingwithframes">Frames</a></li>
	<li><a href="http://embt.co/usingmultiview">TMultiView</a></li>
</ul>
</li>
	<li><strong>Previous Video Replays</strong>
<ul>
	<li><a href="http://embt.co/coderage_fireui">FireUI and TMultiView</a></li>
	<li><a href="https://www.youtube.com/watch?v=Z6_ZvnCmFCw">TFrameStand</a></li>
	<li><a href="https://www.youtube.com/watch?v=fmA7KLlOR1U">FireUI</a></li>
	<li><a href="https://www.youtube.com/watch?v=cj_geQ3Vz9E">FireUI and Multi-Device Designer</a></li>
</ul>
</li>
</ul>
<h1>ScaledLayout Helper</h1>
The <strong>AbsoluteToLocal</strong> and <strong>LocalToAbsolute</strong> for <strong>TScaledLayout</strong> don't handle the scaling. I've created a class helper that adds new methods for dealing with scaling.

[delphi]

{ TScaledLayoutHelper - interface } 

type 
  TScaledLayoutHelper = class helper for TScaledLayout 
    function LocalToAbsoluteScaled(const Point: TPointF): TPointF;
    function AbsoluteToLocalScaled(const Point: TPointF): TPointF; 
  end; 

{ TScaledLayoutHelper - implementation } 

function TScaledLayoutHelper.AbsoluteToLocalScaled( const Point: TPointF): TPointF; 
begin 
  Result.X := Self.Position.X 
              + Point.X 
              * Self.Width 
              / Self.OriginalWidth; 
  Result.Y := Self.Position.Y 
              + Point.Y 
              * Self.Height 
              / Self.OriginalHeight; 
end; 

function TScaledLayoutHelper.LocalToAbsoluteScaled( const Point: TPointF): TPointF; 
begin 
  Result.X := Point.X 
              / Self.Width 
              / Self.OriginalWidth 
              - Self.Position.X; 
  Result.Y := Point.Y 
              / Self.Height 
              / Self.OriginalHeight
              - Self.Position.Y; 
end; 
[/delphi]

If you look at the original implementations of <strong>AbsoluteToLocal</strong> and <strong>LocalToAbsolute</strong> you will see they have different execution paths and calculations based on private members, so there may be some circumstances where my new ones don't work as expected. They did work in my tests, and I am open to feedback.
