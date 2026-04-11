---
id: 1805
title: 'Voice Enable Your Android Apps'
date: '2014-10-28T17:06:00-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1805'
permalink: /2014/10/voice-enable-your-android-apps/
categories:
    - News
tags:
    - Mobile
    - News
---

During CodeRage 9 I revisited adding voice support to Android apps. There are some updates from my previous <a title="Skill Sprint: Android Voice – Speech Recognition and TTS" href="http://delphi.org/2014/07/android-voice/">skill sprint coverage on the topic</a> and my original post on <a title="Launching a Delphi XE5 App via Voice on Google Glass" href="http://delphi.org/2014/01/launching-a-delphi-xe5-app-via-voice-on-google-glass/">launching Google Glass apps via Voice</a>.

You can download the <a href="https://github.com/jimmckeeth/FireMonkey-Android-Voice/">Samples and Components on GitHub</a>. It covers voice recognition, text to speech and launching apps on Google glass with your voice. The examples also cover Android Wear.

<strong>Voice Launching Google Glass Apps</strong>
<ul>
	<li class="p1"><span class="s1">Add a Voice Trigger XML file:</span>
<ul>
	<li class="p2"><span class="s2">Choose a Standard Voice command <a href="http://embt.co/glass-voice-triggers"><span class="s3">http://embt.co/glass-voice-triggers</span></a></span></li>
	<li class="p2"><span class="s1">Deploy to </span><span class="s5">res\xml\</span><span class="s1"> folder.</span></li>
</ul>
</li>
	<li class="p1"><span class="s1">Modify the Android Manifest Template:</span>
<ul>
	<li class="p4"><span class="s1">Add an Intent Filter</span>
<ul>
	<li class="p5"><span class="s1">&lt;action android:name="com.google.android.glass.action.VOICE_TRIGGER"/&gt;</span></li>
</ul>
</li>
</ul>
</li>
	<li class="p6"><span class="s1">Add Meta Data for Filter</span>
<ul>
	<li class="p7"><span class="s1">&lt;meta-data android:name="com.google.android.glass.VoiceTrigger”
<span class="Apple-converted-space">       </span>android:resource="@xml/my_voice_trigger" /&gt;</span></li>
</ul>
</li>
</ul>
<p class="p1"><span class="s1"><b>Custom Glass Voice Trigger</b></span></p>

<ul>
	<li class="p1"><span class="s1">Change XML to from Command to Keyword.</span></li>
	<li class="p1"><span class="s1">Use arbitrary text for voice trigger.</span></li>
	<li class="p2"><span class="s1">Use the Development permission:</span>
<ul>
	<li class="p3"><span class="s1">&lt;uses-permission
android:name="com.google.android.glass.permission.DEVELOPMENT"/&gt;</span></li>
	<li class="p4"><span class="s1">Added to android manifest template</span></li>
</ul>
</li>
	<li class="p5"><span class="s1">Not allowed for app store distribution</span>
<ul>
	<li class="p6"><span class="s1">Usable for in-house or ad-hoc use</span></li>
</ul>
</li>
</ul>
<p class="p1"><span class="s1"><b>Additional Prompts on Google Glass</b></span></p>

<ul>
	<li class="p1"><span class="s1">Collect additional Voice recognition input when app is launched.</span>
<ul>
	<li class="p2"><span class="s1">Add an Input Prompt to the Voice Trigger XML</span>
<ul>
	<li class="p3"><span class="s1">&lt;?xml version="1.0" encoding="UTF-8"?&gt;</span></li>
	<li class="p3"><span class="s1">&lt;trigger command="TAKE_A_NOTE"&gt;</span></li>
	<li class="p3"><span class="s1"><span class="Apple-converted-space">    </span>&lt;input prompt="What shall I say?" /&gt;</span></li>
	<li class="p4"><span class="s1">&lt;/trigger&gt;</span></li>
</ul>
</li>
</ul>
</li>
	<li class="p5"><span class="s1">In FormCreate get speech guesses from Intent Extras</span>
<ul>
	<li class="p6"><span class="s1">SharedActivity.getIntent.getExtras. getStringArrayList(TJRecognizerIntent.JavaClass.EXTRA_RESULTS);</span></li>
</ul>
</li>
</ul>
<strong>Voice Recognition on Android<img class="alignright size-full wp-image-1809" src="/assets/images/2014/10/Android-Speak-Now.png" alt="Android/Google - Speak Now" width="264" height="176" /></strong>
<ul>
	<li class="p1"><span class="s1">Prompts user for voice input</span></li>
	<li class="p1"><span class="s1">Returns up to 5 “guesses”</span></li>
	<li class="p2"><span class="s1">Works offline too </span>
<ul>
	<li class="p3"><span class="s1">(only returns 1 guess)</span></li>
</ul>
</li>
	<li class="p4"><span class="s1">Reusable component for download.</span></li>
	<li class="p4">Requires RECORD_AUDIO &amp; INTERNET permissions.</li>
	<li class="p4">Sends audio to Google’s servers.</li>
	<li class="p4">Uses context to select words.</li>
	<li class="p4">Pronounce punctuation (period, comma, etc.)</li>
	<li class="p4">Works on Android phones &amp; tablets</li>
	<li class="p4">Works on Google Glass</li>
	<li class="p4">Works on Android Wear</li>
	<li class="p4">Doesn’t work on iOS (no exposed API)
<ul>
	<li class="p4">Could use a 3rd party recognition service
<ul>
	<li class="p4">Ex: <a href="http://www.politepix.com/openears/">http://www.politepix.com/openears/</a></li>
</ul>
</li>
</ul>
</li>
</ul>
<strong>Using TSpeechRecognition Component</strong>
<ul>
	<li class="p1"><span class="s1">Properties</span>
<ul>
	<li class="p1"><span class="s1">Language: en-US</span></li>
	<li class="p1"><span class="s1">Prompt: Speak now</span></li>
	<li class="p1"><span class="s1">AlwaysGuesses: True</span></li>
</ul>
</li>
	<li class="p1"><span class="s1">Methods</span>
<ul>
	<li class="p1"><span class="s1">Listen</span></li>
	<li class="p1"><span class="s1">ListenFor</span></li>
</ul>
</li>
	<li class="p1"><span class="s1">Events</span>
<ul>
	<li class="p1"><span class="s1">OnRecognition</span></li>
	<li class="p1"><span class="s1">OnRecognitionEx</span></li>
	<li class="p2"><span class="s1">OnCommand</span></li>
</ul>
</li>
</ul>
<strong>Text-To-Speech on Android</strong>
<ul>
	<li>Converts Text to spoken word.</li>
	<li>Reusable component based on Jeff Overcash’s translation.</li>
	<li>Code shows example of handling Java Listener events.</li>
	<li>Works on Android phones &amp; tablets</li>
	<li>Works on Google Glass</li>
	<li>Doesn’t work on Android Wear (no speaker)</li>
	<li>iOS Support is possible . . . . (needs implementation)</li>
</ul>
<strong>Using TAndroidTTS Component </strong>(component name may change)
<ul>
	<li>Just one procedure: Speak</li>
</ul>
<strong>A Note About iOS</strong>
<ul>
	<li>iOS does not expose voice recognition API
<ul>
	<li>(Need to use 3rd party)</li>
</ul>
</li>
	<li>iOS 7 supports Text to Speech API
<ul>
	<li>AVSpeechSynthesizer</li>
	<li>Just haven’t implemented in component yet</li>
</ul>
</li>
</ul>
<strong>Google Glass Voice Trigger Sample</strong>
<ul>
	<li>C:\Users\Public\Documents\Embarcadero\Studio\15.0\Samples\
<ul>
	<li>\Object Pascal\Mobile Samples\Google Glass</li>
	<li>\CPP\Mobile Samples\Google Glass</li>
</ul>
</li>
	<li><a href="http://docwiki.embarcadero.com/CodeExamples/XE7/en/FMX.Mobile.GoogleGlass_Sample_(Delphi)">docwiki.embarcadero.com/CodeExamples/XE7/en/FMX.Mobile.GoogleGlass_Sample_(Delphi)</a></li>
</ul>
<em>The replay video will be available here later.</em>

<a href="https://downloads.embarcadero.com/free/delphi">Download the XE7 Trial</a> today and <a href="http://www.embarcadero.com/radoffer">check out the special offers</a>.
