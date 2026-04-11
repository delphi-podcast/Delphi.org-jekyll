---
id: 3371
title: 'Integrating OBS Studio with X-Keys XK-24 USB Keypad'
date: '2019-06-14T09:11:11-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=3371'
permalink: /2019/06/integrating-obs-studio-with-x-keys-xk-24-usb-keypad/
enclosure:
    - "/assets/images/2019/06/XkeysOBS.mp4\n48877903\nvideo/mp4\n"
image: /assets/images/2019/06/image-8-651x198.png
categories:
    - News
tags:
    - News
---

<figure class="wp-block-video"><video controls src="/assets/images/2019/06/XkeysOBS.mp4"></video><figcaption>Short demo and introduction</figcaption></figure>

<p>I was a guest on <a href="https://www.youtube.com/watch?v=KSi35Rl6kl8">X-Keys 5 Minute</a> Friday showing off an integration between <a href="https://obsproject.com/">OBS Studio</a> with the <a href="https://xkeys.com/xk24.html">X-Keys XK-24 USB Keypad</a>. I created a script that assigns F13 through F24 with and without the CTRL modifiers to the XK-24. You can simply assign these in the OBS hotkey settings and it will respond to those globally.</p>

<figure class="wp-block-image"><img src="/assets/images/2019/06/image-2.png" alt="" class="wp-image-3376"/></figure>

<p>Here is the MW3(VB) script you can load into MacroWorks <a href="https://github.com/jimmckeeth/XKeys-Scripts/blob/master/obs-xk-24.mw3">obs-xk-24.mw3</a> </p>

<figure class="wp-block-image"><img src="/assets/images/2019/06/image-8.png" alt="" class="wp-image-3377"/></figure>

<p> For some reason the F24 and CTRL+F24 didn't work. I'm not sure if that is an OBS issue or where the cause originates. This would allow you to use your XK-24 with any software that that allows you to assign F13-F24 and recognizes global hotkeys.</p>

