---
id: 1490
title: 'Every Android API for Delphi'
date: '2014-01-29T20:46:51-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1490'
permalink: /2014/01/every-android-api-for-delphi/
tags:
    - MVP
    - 'Source Code'
---

Delphi XE5's support for Android includes many of the most common Android APIs either wrapped in nice cross platform libraries and component or accessible directly via the JNI wrappers. The rest can be accessed by creating headers to expose them. The new JNI Bridge makes this calling of the managed Java APIs from the native Delphi app much easier then it used to be, but it still takes a little effort to make the translation (it is easier than translating a Windows API). <a href="http://blog.blong.com/2013/10/my-coderage-session-files.html">Brian Long</a> (an Embarcadero MVP) has an excellent video from <a href="http://www.embarcadero.com/coderage/coderage-8-on-demand">CodeRage 8</a> that goes into great detail on the process.

http://www.youtube.com/watch?&amp;v=GcuYc7F0lIU#t=1470

But all of that has now changed. CHUA Chee Wee aka "Chewy" (also an Embarcadero MVP) has released an <a href="http://journeyman.ath.cx/">Android2DelphiImport</a> tool that makes wrapping and accessing any and every Android API much easier. It gives you 3 distinct benefits:
<ol>
	<li>You can point it at Android.jar in the Android SDK and have it create wrappers for <em>EVERY</em> Android API. You'll need to copy and paste out the pieces you want (it puts them all in one source file), but it saves a lot of typing and research. It implements the wrapper using the JNI Bridge just like the RTL does.</li>
	<li>You can point it at any other built in Java library, like the Google Glass GDK that provides all the Glass specific features on Google Glass, or maybe the Google Cloud Messaging (GCM) API. You'll have a source file that wraps all the API calls exposed in that JAR file.</li>
	<li>You can use it to wrap a 3rd party Java JAR file for Android and it will create a .PAS interface for it, bundle it up for inclusion in your Delphi app, and load it at runtime.</li>
</ol>
As a matter of testing this tool I pointed it the Android.jar file for Kit Kat. It took a little while, but when it was done I had over 100,000 lines of interface wrappers covering EVERY Android API on Kit Kit. I copied out the lines for Toast support, added in the necessary uses statements, and I had full toast support in just a few minutes.

My next test was to point it to the Google Glass GDK (Glass Development Kit) for building native Glass Apps. Previously I had only used the Android SDK &amp; NDK, which supports the common Android functionality on Glass, but the GDK adds support for Glass specific features. Once the GDK is installed (via the Android SDK Manager under API 15) you will find gdk.jar in the sdk\add-ons\addon-google_gdk-google-15\libs folder. It created a nice wrapper for it, but that wrapper wouldn't compile because the uses clause was incomplete (it has a notice that you need to adjust the uses clause). I had to track down 4 additional units for the uses clause and then I extracted 3 more apis from the earlier Android wrapper to cover APIs that weren't previously exposed. In all it took me about 15 minutes and then I had <strong>full support</strong> for the Google Glass GDK.

Since compiling isn't enough, I built a simple app to insert and remove cards on the Google Glass timeline. It worked like a charm. I didn't need to tweak or adjust the generated code at all (beyond the uses clause). Here is my code:

[delphi light="true"]tm := TJTimelineManager.JavaClass.from(SharedActivityContext);
card := TJCard.JavaClass.Init(SharedActivityContext);
card.setText(StringToJString('Hello Glass'));
card.setFootnote(StringToJString('From Delphi'));
id := tm.insert(card); // Use id to edit or remove card later[/delphi]

I haven't tested the 3rd scenario yet, but I did observe how it works. The tool creates a .apk out of the selected JAR file. It then includes a routine to load that APK at runtime so you can call into the methods it includes. You would need to go this route when the JAR isn't built into the platform already. I have a library that I'm planning to test this with (so stay tuned), but I wanted to blog about the other benefits right way.

I am really excited about the potential of this tool. Not only does this mean you have even easier access to the entire Android API, but you also have easy access to all the extended APIs and 3rd party APIs. It has a simple command-line interface, and very few options, but when it works that is all you need.

Right now purchasing it is a little more complicated than using it. He only accepts Bitcoins, 1/4 Bitcoin to be exact. Based on the current exchange rate it is about $200 US, which is an excellent value for what you get (and considering how much effort has gone into its development). So you will either need to mine or purchase a bitcoin to pick this tool up, but if you are doing Android development I highly recommend it.
