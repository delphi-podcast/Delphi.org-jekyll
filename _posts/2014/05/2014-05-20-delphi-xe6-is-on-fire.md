---
id: 1675
title: 'Delphi XE6 is on Fire'
date: '2014-05-20T15:50:19-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1675'
permalink: /2014/05/delphi-xe6-is-on-fire/
categories:
    - News
tags:
    - News
---

Remember the demonstration I did showing how <a title="Oh Yeah, the Ouya!" href="http://delphi.org/2014/02/oh-yeah-the-ouya/">Delphi works great with Ouya</a>? Well, there is a new set top box in town, the Amazon Fire TV. Just like the Ouya, it is a Android powered set top box. So, does it support <a href="http://www.embarcadero.com/products/delphi">everyone's favorite Android development tool</a>? Turns out it works great with Delphi XE6. It uses a wireless ADB connection, so you just need to follow their simple steps to <a href="https://developer.amazon.com/public/solutions/devices/fire-tv/docs/connecting-adb">Connect ADB</a> and it shows up in the IDE as the Android device AFTB (not sure what that stands for). After that you can develop and deploy to it just like any other Android device.

When you run your app from the IDE it will popup and run on the Fire TV, but after you exit your app you won't see it anymore. It appears Fire TV only displays apps that are loaded from their app store on the home screen. Not to worry, you can easily launch it from the <a title="Running Your App" href="https://developer.amazon.com/public/solutions/devices/fire-tv/docs/installing-and-running-your-app#Running%20Your App (Device)">Settings -&gt; Applications screen</a>. Simply select your app and choose <strong>Launch application</strong>.

By default your only input device is the Amazon Fire TV remote.

<img class="aligncenter size-full wp-image-1676" src="/assets/images/2014/05/firetvremote.png" alt="firetvremote" width="501" height="501" />

Simply handle the <strong>OnKeyUp</strong> event on your form and you will receive events with the key codes <em>vkLeft, vkRight, vkUp, vkDown, vkMenu, vkHardwareBack, vkMediaPlayPause</em> and a key value of <strong>0</strong> for the select, fast forward or rewind buttons. The Home and Voice Search buttons are always handled by the OS. If you choose to handle the vkHardwareBack then set the key value to 0 (or any other value) and the system will ignore it, otherwise your app will exit.

Fire TV also supports a gamepad as well as various other bluetooth input devices, like a bluetooth keyboard, which greatly expands the input options. You also could use App Tethering to tether a mobile or desktop/laptop app to your Fire TV app to provide input and display it on the big screen. Like an image receiver that receives pictures from your mobile device to display them to everyone in the room.

If you download the Fire TV SDK it exposes Game Controller and Notification classes. If there is interest I can post some Object Pascal wrappers for those later on.

&nbsp;
