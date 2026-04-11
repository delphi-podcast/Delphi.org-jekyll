---
id: 1700
title: 'Know Your Alignments'
date: '2014-05-26T04:17:13-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1700'
permalink: /2014/05/know-your-alignments/
tags:
    - design
---

FireMonkey offers a lot more <a title="DocWiki: FMX.Types.TAlignLayout" href="http://docwiki.embarcadero.com/Libraries/XE6/en/FMX.Types.TAlignLayout">alignment options</a> than those <a title="DocWiki: Vcl.Controls.TAlign" href="http://docwiki.embarcadero.com/Libraries/XE6/en/Vcl.Controls.TAlign">offered in the VCL</a>. The Alignment aligns the control within its parent, setting anchors, size and position. The Default is <strong>None</strong>. To make it easier to think about them, you can group the different types of alignments.
<ul>
	<li>Anchor and fill along edge - these are 4 of the alignments you are most likely familiar with.
<ul>
	<li><strong>Top, Bottom, Left, Right</strong></li>
</ul>
</li>
	<li>Like the above, but takes precedence over other alignments
<ul>
	<li><strong>MostBottom, MostTop, MostLeft, MostRight</strong></li>
</ul>
</li>
	<li>Fill parent, but preserve aspect ratio - very powerful, especially when applied to one of the new layouts, like the <a href="http://docwiki.embarcadero.com/Libraries/XE6/en/FMX.Layouts.TScaledLayout">TScaledLayout</a>.
<ul>
	<li><strong>Fit, FitLeft, FitRight</strong></li>
</ul>
</li>
	<li>Resize only on one axis (width or height) to fill that axis of the parent and optionally centered
<ul>
	<li><strong>Vertical, VertCenter, Horizontal, HorzCenter</strong></li>
</ul>
</li>
	<li>Miscellaneous
<ul>
	<li><strong>Client</strong> - Fills remaining space not occupied by other pinned controls.</li>
	<li><strong>Contents</strong> - Fills entire client area of the parent <em>overlapping</em> other controls.</li>
	<li><strong>Center</strong> - Just moves to the center without resizing.</li>
	<li><strong>Scale</strong> - Maintains relative size and position relative to the parent as it resizes.</li>
</ul>
</li>
</ul>
Checkout the full DocWiki pages for more details on <a title="DocWiki: FMX.Types.TAlignLayout" href="http://docwiki.embarcadero.com/Libraries/XE6/en/FMX.Types.TAlignLayout">FMX.Types.TAlignLayout</a> and <a title="DocWiki: Vcl.Controls.TAlign" href="http://docwiki.embarcadero.com/Libraries/XE6/en/Vcl.Controls.TAlign">Vcl.Controls.TAlign</a>.
