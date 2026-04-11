---
id: 1451
title: 'Launching a Delphi XE5 App via Voice on Google Glass'
date: '2014-01-10T15:59:26-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1451'
permalink: /2014/01/launching-a-delphi-xe5-app-via-voice-on-google-glass/
categories:
    - News
tags:
    - 'Google Glass'
    - News
---

Building a running an app on Google Glass is easy with Delphi XE5, but what about integrating it into the Glass menu system and launching it with a voice command? Turns out that is pretty easy too.

First of all, I find it easiest to to add <strong>AndroidManifest.template.xml</strong> to your project. It shows up in your project folder after you build an Android app the first time. This template is for the AndroidManifest XML file that is used to describe your application to the Android OS. We open this file and find the <manifest><application><activity><intent-filter> element. We then need to add the following child to it, along with the <action> and <category> children elements already there.

[xml light="true"]&lt;action android:name=&quot;com.google.android.glass.action.VOICE_TRIGGER&quot;&gt;[/xml]

This tells it that our main activity is eligible to receive the VOICE_TRIGGER intent. Next we need to specify which voice command we want to receive. This is done by adding a &lt;meta-data&gt; element outside of the &lt;intent-filter&gt; element (but still inside the &lt;activity&gt; element).

[xml light="true"]&lt;meta-data android:name=&quot;com.google.android.glass.VoiceTrigger&quot; android:resource=&quot;@xml/voice_trigger_start&quot;&gt;[/xml]

This specifies that there is VoiceTrigger metadata in the xml file <strong>voice_trigger_start</strong>. 

<strong>Update:</strong> Thanks to the <em>Glass XE16 KitKat</em> update, a special permission is required to use a non standard voice trigger command. In the Manifest, right below the &lt;%uses-permission%&gt; line you need to add the following <a href="https://developers.google.com/glass/develop/gdk/starting-glassware#unlisted_commands">special
permission</a>:
[xml light="true"]&lt;uses-permission android:name=&quot;com.google.android.glass.permission.DEVELOPMENT&quot;&gt;[/xml]

So now we need to create that XML file. Simply right click on your project in the <em>Project Manager </em>and select <em>Add New</em>, then under <em>Web Documents</em> select <em>XML File</em>. Rename it to <strong>voice_trigger_start.xml</strong>, save it, and edit it to look like the following:

[xml light="true"]&lt;!--?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?--&gt;
 &lt;trigger keyword=&quot;My voice is my passport, verify me.&quot;&gt;[/xml]

The value of keyword can be any word or phrase that you want to associate with your app. This will be used in the sentence of "OK Glass, my voice is my passport, verify me." Generally you want to keep it short, like "take a picture" or "get directions", while not using something that conflicts with a built in command. This is also what will show up in the launcher on glass next to your app icon.

Now we use the Deployment Manager to specify the location for this new XML file. Simply go to Project \ Deployment and select Add File and choose the <strong>voice_trigger_start.xml</strong> file. Then change the Remote Path to <strong>res\xml</strong>.

Simply run your app from the IDE (after you've installed a Google Glass USB ADB driver) and after that you can launch your app from the Glass launcher or your selected voice command.

http://www.youtube.com/watch?v=WZgUJKlAHuo

What to learn more about other devices and gadgets? Join me for my free webinar on <a href="http://forms.embarcadero.com/DevicesWebinar1-22">Programming Devices and Gadgets with RAD Studio</a>&nbsp;on January 22nd.<a href="http://forms.embarcadero.com/DevicesWebinar1-22"><img class="alignnone" alt="Programming Devices and Gadgets with RAD Studio" src="http://img.en25.com/EloquaImages/clients/Embarcadero/%7Bbdf8dda7-28a8-449b-9a5a-23cf781bd523%7D_RADInAction_Devices_680x150.jpg" width="680" height="150"></a></trigger></uses-permission></meta-data></action>


