---
id: 1723
title: 'Android JNI Bridge and Custom Classes.dex'
date: '2014-07-08T00:34:22-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1723'
permalink: /2014/07/custom-classes-dex/
categories:
    - News
tags:
    - Mobile
    - MVP
    - News
    - 'Source Code'
    - webinar
---

By creating a <a href="http://embt.co/xe6classesdex">custom Classes.dex</a> you can get access to 3rd party Java JAR APIs from your application. For my <a href="http://www.embarcadero.com/landing-pages/skill-sprints"><strong>Integrate More Android with a JNI Call to your Android App</strong> Developer Skill Sprint</a> I created a demo app that demonstrates creating a custom Classes.dex. This is a new feature in XE6 and Appmethod 1.14. [<a href="http://cc.embarcadero.com/item/29900">Download the demo</a>] [<a href="http://cc.embarcadero.com/item/29901">Download the slides</a>] The Demo app uses the <a href="http://www.source-code.biz/base64coder/java/">Base64Coder JAR file</a> (included). To build the demo:
<ol>
	<li>Examine the <strong>createdex.bat</strong> file to make sure it refers to the correct location for your dx.bat utility and the fmx.jar &amp; android-support-v4.jar files.</li>
	<li>Run the createdex.bat file to create the <strong>classes.dex</strong> file which includes the two jar files above, plus the base64coder.jar file.</li>
	<li>Double check that the <a href="http://docwiki.embarcadero.com/RADStudio/XE6/en/Deployment_Manager">Deployment Manager</a> references the new classes.dex and not the old ones, and that the remote path is "classes\"</li>
	<li>Notice that the <strong>android.JNI.Base64Coder.pas</strong> file wraps and exposes the methods of the <a href="http://www.source-code.biz/base64coder/java/apidocs/biz/source_code/base64Coder/Base64Coder.html">base64coder class</a>.</li>
	<li>Run the app on your Android device and verify that it works as expected.</li>
</ol>
The Base64Coder.JAR is Android specific, so it will not work on iOS or Windows. Some additional notes from the Developer Skill Sprint: Some useful units for making JNI calls
<ul>
	<li>Androidapi.Jni – Java Native Interface type definitions</li>
	<li>Androidapi.JNIBridge – The JNI Bridge</li>
	<li>Androidapi.JNI.JavaTypes – JString and other common types.</li>
	<li>Androidapi.Helpers – JStringToString and other useful conversions.</li>
	<li>FMX.Platform.Android– Useful platform methods like GetAndroidApp, MainActivity and ConvertPointToPixel</li>
	<li>Others useful units: Androidapi.AppGlue, Androidapi.JNIMarshal, Androidapi.JNI.Embarcadero</li>
	<li>For more see: C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android (Object Pascal) and C:\Program Files (x86)\Embarcadero\Studio\14.0\include\android\rtl (C++)</li>
</ul>
You will want to make use of <a href="http://docwiki.embarcadero.com/RADStudio/XE6/en/Conditional_compilation_(Delphi)">Conditional Defines in Object Pascal</a> and <a href="http://docwiki.embarcadero.com/RADStudio/XE6/en/Predefined_Macros">Predefined Macros in C++</a>. In my blog post on <a title="Setting Android Settings" href="http://delphi.org/2014/03/setting-android-settings/">Android Settings</a> I showed how to make a JNI call with Object Pascal, but you can also look at the DeviceInfo Mobile Code Snippet in both C++ and Object Pascal. To create your own JNI Bridge wrappers, look at the source code in C:\Program Files (x86)\Embarcadero\Studio\14.0\source\rtl\android (Object Pascal) and C:\Program Files (x86)\Embarcadero\Studio\14.0\include\android\rtl (C++). You can also consider the following 3rd party utilities:
<ul>
	<li><a href="http://www.softwareunion.lu/en/downloads/">Java2Pas by Software Union</a></li>
	<li><a href="http://www.winsoft.sk/jimport.htm">JavaImport by WinSoft</a></li>
	<li><a href="http://journeyman.ath.cx/">Android2DelphiImport by CHUA Chee Wee aka “Chewy”</a> (also an Embarcadero MVP) [<a title="Every Android API for Delphi" href="http://delphi.org/2014/01/every-android-api-for-delphi/">my previous review</a>]</li>
</ul>
If you just want to include standard Android APIs then check out the <a href="http://www.fmxexpress.com/">FMXExpress</a> (also an Embarcadero MVP) project on GitHub that <a href="https://github.com/FMXExpress/android-object-pascal-wrapper/">includes all the Android APIs</a>. Here is the video replay of my skill sprint

http://www.youtube.com/watch?v=TyzE0T6zOyE

Also, check out Brian Long's video on accessing the Android API with XE5

http://www.youtube.com/watch?v=GcuYc7F0lIU
