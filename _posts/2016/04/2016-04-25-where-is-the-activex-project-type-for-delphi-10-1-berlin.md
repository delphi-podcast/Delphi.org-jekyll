---
id: 2348
title: 'Where is the ActiveX Project Type for Delphi 10.1 Berlin?'
date: '2016-04-25T14:57:59-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2348'
permalink: /2016/04/where-is-the-activex-project-type-for-delphi-10-1-berlin/
categories:
    - News
tags:
    - '10.1'
    - ActiveX
    - Berlin
    - delphi
    - News
---

In 10.1 Berlin the ActiveX project types are missing from the New Items Window under Delphi. They are there for C++Builder, but not for Delphi.

<img class="alignnone size-full wp-image-2349" src="/assets/images/2016/04/Missing.png" alt="Missing AcitveX" width="594" height="433" />

This only happens if you use the shiney new Feature Installer that was introduced with 10.1 Berlin. So if you use the old offline ISO installer then it shows up fine.

[<strong>Update</strong>: <em>This was just fixed in the installer. So if you download and install after today everything will work great!</em>]

Turns out though, it is only a simple registry issue. Instead of explaining the details behind why, here is the quick and easy work around.
<ol>
 	<li>Close RAD Studio or Delphi 10.1 Berlin.</li>
 	<li>Open RegEdit</li>
 	<li>Browse to "HKEY_CURRENT_USER\SOFTWARE\Embarcadero\BDS\18.0\Known IDE Packages\Delphi"</li>
 	<li>Find the entry named "$(BDS)\Bin\delphicompro240.bpl" and change the value from "__(Untitled)" to "(Untitled)". Here is a before screenshot:
<img class="alignnone wp-image-2350 size-full" src="/assets/images/2016/04/RegEdit.png" alt="RegEdit" width="864" height="387" /></li>
 	<li>And here is an after screenshot (notice the missing double underscore)</li>
 	<li>Then restart your RAD Studio or Delphi 10.1 IDE and bask in all the ActiveX glory that you have restored!
<img class="alignnone wp-image-2351 size-full" src="/assets/images/2016/04/Success.png" alt="ActiveX Success" width="544" height="412" /></li>
 	<li>Now you can create a new ActiveX Library or Type Library with your favorite programming language.</li>
</ol>
Interesting story, long ago a friend of mine worked for a software development company that used Visual Basic. He was in the "skunkworks" division that used Delphi to create all the ActiveX components that the Visual Basic developers used. There were 2 Delphi developers and about 50 VB developers. Whenever there was something that couldn't be done in VB (which happened a lot) then they would make a new ActiveX in Delphi for them.

My friend showed him that they could actually out produce the VB developers with Delphi, but his boss was convinced that they were a VB development firm, and didn't want to switch to the superior development tool. Unfortunately VB has died off, and all of those developers lost their jobs. My friend is glad he stuck with Delphi.
