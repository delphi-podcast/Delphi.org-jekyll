---
id: 2035
title: 'More on Android Services with Delphi 10 Seattle'
date: '2015-09-19T10:35:23-06:00'
author: 'Jim McKeeth'
excerpt: 'Today we had our RAD Studio 10 Seattle Deep Dive and I expanded on my Minimalistic Android Studio video with some more details. If you didn''t get registered to join us live, be sure and register now to get access to the replay. In the meantime, here are some more details and a new sample for you.'
layout: post
guid: 'http://delphi.org/?p=2035'
permalink: /2015/09/more-on-android-services-with-delphi-10-seattle/
tags:
    - Android-Services
    - iOS
    - Mobile
---

<img class="alignright size-full wp-image-2036" src="/assets/images/2015/09/NewAndroidServiceWizard.png" alt="New Android Service Wizard" width="335" height="395" />Today we had our <a href="http://forms.embarcadero.com/RAD10SeattleDeepDive?cid=701G0000000tKTx">RAD Studio 10 Seattle Deep Dive</a> and I expanded on my <a href="http://delphi.org/2015/09/minimalistic-android-service-with-delphi-10-seattle/">Minimalistic Android Studio</a> video with some more details. If you didn't get registered to join us live, be sure and <a href="http://forms.embarcadero.com/RAD10SeattleDeepDive?cid=701G0000000tKTx">register now</a> to get access to the replay. In the meantime, here are some more details and a new sample for you.

These slides cover both Android Services and iOS Background Execution Mode. You can read about the different <a href="http://embt.co/UIBackgroundModes">iOS Background Modes</a> in Apple's documentation.

[slideshare id=52969196&amp;doc=seattleandroidservies-150919181101-lva1-app6891]

Luis Navaro published a new sample that shows how to <a href="http://community.embarcadero.com/blogs/entry/download-an-image-in-background-with-android-services">download a image in the background with an Android service</a>. It uses a local service, and launches it with an Android Intent.

Here is <a href="http://delphi.org/downloads/RemoteServiceDemo.zip">another sample</a> that shows how to use the bind mechanism to launch an remote Android service and communicates to it via the Java Message (JMessage) object. There are a couple manual steps that you need to consult the included readme about. Otherwise it won't work as expected. There are three projects in the project group. One is the actual Android Service, then the other two are apps that connect to the project. One of them is the host app that will contain the service within its APK.

Remember, you need to add the service to the host application after building the service. Then you can deploy it within the host app APK.

The DocWiki has an <a href="http://docwiki.embarcadero.com/RADStudio/en/Android_Service">Overview of Android Services</a> and a <a href="http://docwiki.embarcadero.com/RADStudio/en/Creating_Android_Services">Guide to Creating Android Services</a>.

https://youtu.be/eZzMBHNoj4o

Stay tuned for more details about Android Services with Delphi 10 Seattle.
