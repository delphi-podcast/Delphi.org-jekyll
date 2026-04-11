---
id: 3207
title: 'Android Z-Order, Native Controls, and 10.3 Rio'
date: '2018-11-03T17:07:29-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=3207'
permalink: /2018/11/android-z-order-native-controls-and-10-3-rio/
image: /assets/images/2018/11/Attack-of-Android-Z-Order-and-the-Native-Controls-Featured-940x198.jpg
categories:
    - News
tags:
    - '10.3 Rio'
    - FireMonkey
    - News
    - Platform-Native
    - Z-Order
---

<div class="wp-block-image"><figure class="alignright is-resized"><img src="/assets/images/2018/11/Z-order.png" alt="Z-order represents stacking controls" class="wp-image-3208" width="245" height="297"/><figcaption>Z-order represents stacking controls</figcaption></figure></div>

<p>Before 10.3 Rio when you used a a platform-native control, like <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser">TWebBrowser</a> or <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer">TMediaPlayer</a>, you were not able to put other controls on top of them. That stacking of controls is knowns as Z-Order. This was especially annoying when you were using them with the <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.MultiView.TMultiView">TMultiView</a> (one of my favorite controls), because the drawer would slide out under instead of over the platform-native control. There were ways around it, but it was still frustrating.</p>

<p>In <a href="http://docwiki.embarcadero.com/RADStudio/XE7/en/What%27s_New_in_Delphi_and_C%2B%2BBuilder_XE7">XE7</a> we introduced the <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.Presentation.TPresentedControl.ControlType">ControlType</a> property for iOS, and then in Seattle we brought it to Windows. Setting it to Platform switches a FireMonkey control to a platform-native control at runtime. <br></p>

<p>Now with the upcoming 10.3 Rio release the ControlType property is coming to Android, and it is brining two significant benefits: More Native Controls, and corrected Z-Ordering.</p>

<h2>More Android Native Controls</h2>

<p>The <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.WebBrowser.TWebBrowser">TWebBrowser</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer">TMediaPlayer</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.Advertising.TBannerAd">TBannerAd</a>, and <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView">TMapView</a> are always platform native controls (they are rendered by the underlying Android OS and not by FireMonkey.) But in 10.3 Rio there are 4 new controls that are <em>optionally</em> platform native. <br></p>

<div class="wp-block-image"><figure class="alignright"><img src="http://docwiki.embarcadero.com/images/Libraries/Tokyo/e/e/ea/Switches.png" alt=""/><figcaption>TSwitch component</figcaption></figure></div>

<ul><li><a href="http://docwiki.embarcadero.com/Libraries/en/FMX.Calendar.TCalendar">TCalendar</a></li><li><a href="http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit">TEdit</a></li><li><a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch">TSwitch</a></li><li><a href="http://docwiki.embarcadero.com/Libraries/en/FMX.MultiView.TMultiView">TMultiView</a></li></ul>

<p>That means when you set the <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.Presentation.TPresentedControl.ControlType">ControlType property</a> on these controls they will be rendered by the Android system instead of FireMonkey. You may notice some slight changes in the way they look and work because of this. <br></p>

<p>This is especially important in the <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit">TEdit</a> as there are certain behaviors that are attached to the way users provide keyboard input and edit text. Here are some of the advantages your users will now have when you use a ControlType of Platform with your TEdit<br></p>

<ul><li><strong>Auto-Correction: </strong>Words are suggested while typing, these can be used by clicking on the space bar.</li><li><strong>Define: </strong>You can select a word and click on Define to see the definition of such word in the dictionary.</li><li><strong>"." Shortcut: </strong>Double tapping the space bar inserts a period followed by a space.</li><li><strong>Text Shortcuts:? </strong>That will expand into the word or phrase as you type.</li></ul>

<p>Some of these behaviors vary from one Android platform to others (for example Samsung has a Clipboard feature). You can configure these settings on your Android devices in <strong>Settings &gt; General &gt; Keyboard</strong>.</p>

<h2>Native Aware Android Z-Ordering</h2>

<p>Additionally many controls now are able to handle a Z-Order over a platform native control. Now you can put control buttons over your <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer">TMediaPlayer</a> for example. These controls have a ControlType property that when you set it to Platform it will maintain the Z-Order with other platform-native controls.<br></p>

<ul><li><a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton">TButton</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton">TSpeedButton</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.Colors.TColorButton">TColorButton</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCornerButton">TCornerButton</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.ExtCtrls.TPopupBox">TPopupBox</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.MagnifierGlass.TMagnifierGlass">TMagnifierGlass</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TPanel">TPanel</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel">TLabel</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox">TCheckBox</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TRadioButton">TRadioButton</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TGroupBox">TGroupBox</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar">TStatusBar</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar">TToolBar</a>, <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar">TProgressBar</a>, and <a href="http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar">TTrackBar</a>.</li></ul>

<p>Setting their ControlType to Platform doesn’t make these platform-native, it just makes them work correctly with other platform native controls.</p>

<h2>What’s Next?</h2>

<p>10.3 Rio is in beta <em>(which means these features are subject to change) </em>and available to update subscription customers. Once it is released you can learn more about all of these features in the <a href="http://docwiki.embarcadero.com/Libraries/en/Main_Page">DocWiki</a>. Also, if you are already using Platform native ControlType on iOS or Windows then those control will take advantage of the Android Platform native ControlType right away!</p>

<figure class="wp-block-image"><a href="https://i0.wp.com/delphi.org/assets/images/2018/11/Attack-of-Android-Z-Order-and-the-Native-Controls.jpg?fit=640%2C402"><img src="https://i0.wp.com/delphi.org/assets/images/2018/11/Attack-of-Android-Z-Order-and-the-Native-Controls.jpg?fit=640%2C402" alt="Android Z-Order and the Native Controls - Coming soon to a RAD Studio 10.3 Rio Near you!" class="wp-image-3211"/></a></figure>

