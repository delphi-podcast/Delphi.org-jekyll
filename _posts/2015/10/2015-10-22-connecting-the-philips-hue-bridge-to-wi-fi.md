---
id: 2065
title: 'Connecting the Philips Hue Bridge to Wi-Fi'
date: '2015-10-22T10:28:56-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2065'
permalink: /2015/10/connecting-the-philips-hue-bridge-to-wi-fi/
tags:
    - gadgets
    - 'Phillips Hue'
---

<a href="http://www2.meethue.com/en-us/productdetail/philips-hue-bridge"><img class="alignright size-medium wp-image-2066" src="/assets/images/2015/10/philips-hue-bridge-300x300.jpg" alt="philips-hue-bridge" width="300" height="300" /></a>I needed to connect my Philips Hue Bridge to Wi-Fi to use it for a presentation at a conference in Brazil. Most public Wi-Fi networks segments each connection preventing communication between devices, besides the fact the Hue Bridge is Ethernet only (Not sure who at Phillips made that decision). Luckily I was able to come up with a solution.

All I needed was my MacBook Pro, which was connected to the conference WiFi and a Thunderbolt Ethernet adapter (which I always carry just incase there is wired Internet access).

Connect the Hue to the MacBook via the Thunderbolt adapter. Then under System Preferences -&gt; Sharing. Select <strong>Internet Sharing</strong>. Connect from <strong>Wi-Fi</strong> to computers using <strong>Thunderbolt Ethernet</strong> (I usually have sharing set the otherway around). Then activate Internet Sharing (and verify you want to do it).

<img class="aligncenter wp-image-2069 size-full" src="/assets/images/2015/10/Sharing-WiFi-to-Thunderbolt.png" alt="Sharing WiFi to Thunderbolt" width="668" height="531" />

This granted the Bridge access to the internet, and gave it a 192.x.x.x IP address that I could reach from my MacBook Pro (and the VM) to send commands to the bridge. This worked great for my presentation, but isn't a solution for home connectivity.

Also, it turns out the Philips Hue Bridge I just purchased is <a href="http://www2.meethue.com/en-us/productdetail/philips-hue-bridge">now obsolete</a> thanks to an Apple HomeKit requirement.
