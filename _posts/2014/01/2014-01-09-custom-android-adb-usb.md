---
id: 1439
title: 'Connecting to Any Android with ADB via USB'
date: '2014-01-09T14:21:09-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1439'
permalink: /2014/01/custom-android-adb-usb/
categories:
    - News
tags:
    - News
---

I've seen other attempts at universal ADB (Android Debug Bridge) drivers, but I've tested those and not had any luck. The following steps have worked for a wide variety of devices that I've tested it with. With such a huge variety of different Android devices available it isn't always easy to find the right USB driver, but you need an ADB USB driver to connect development and debugging tools. This is different then being able to add and remove files from the Android device.

<strong>Disclaimer:</strong> I've done this a few times, and talked to others who have done it too, all without any incident. This is however a bit of a hack, and may result in some unintended consequence, which may including voiding your warranty, damaging your computer, damaging your android device, or even causing your hair to fall out. <em>Proceed at your own risk.</em>

First of all, you need the <a href="http://developer.android.com/sdk/">Android SDK</a> installed. You don't need the ADT Bundle or Android Studio if you don't want those. Just scroll down to Use an Existing IDE. If you have RAD Studio XE5 (an edition with Mobile) installed then you had the option to install this during the RAD Studio install. I'll include directions for either installation method. Google provides a USB driver for their Nexus line of devices. This is the driver we are going to use, but first we need to modify it to work with our device. I'm assuming you are running Windows. OS X doesn't need device specific USB drivers.

These directions are for Windows 8.1. Run the <em>Android SDK Manager</em>. You can do this from the <strong>Android Tools</strong> start menu item that is installed with RAD Studio, or run the <em>android.bat</em> file located in the SDK\Tools folder of the Android SDK installation. This brings up the Android SDK Manager. Scroll to the bottom and look for Google USB Driver in the Extras category. If that is not installed then put a check mark next to it and install it. <img class="aligncenter size-full wp-image-1435" alt="Android SDK Manager - Extras - USB Driver" src="/assets/images/2014/01/AndroidSDKManager-Extras-USBDriver.png" width="697" height="547" /> Next go to the folder where your Android SDK is installed. With RAD Studio XE5 the default install location is  under Users\Public\Documents:
<blockquote>C:\Users\Public\Documents\RAD Studio\12.0\PlatformSDKs\adt-bundle-windows-x86-20130522</blockquote>
From there go to the \sdk\extras\google\usb_driver folder, as that is where the Google USB Driver is installed. I typically make a copy of these folder somewhere else, as we will be modifying some of these files. If you get an updated driver, then your changes will be overwritten if you leave them here. Next we need to go to <strong>Device Manager</strong> with your new Android device attached (and in developer mode). Look for the entry for Android under <strong>Other devices</strong>. <img class="aligncenter size-full wp-image-1436" alt="Device Manager - Other Deivces - Android" src="/assets/images/2014/01/DeviceManager-OtherDeivces-Android.png" width="314" height="443" /> This is your Android device without a driver loaded. If you don't see it then either it isn't connected, or your Android device isn't in developer mode. It is possible it may show up with the name of the Android device, but it should still be under "Other devices" and have the yellow triangle on it. Right click on this device and select properties. <img class="aligncenter size-full wp-image-1437" alt="Android Properties - No Driver" src="/assets/images/2014/01/AndroidProperties-NoDriver.png" width="414" height="462" />Then go to the <strong>Details</strong> tab and from the dropdown select the <em>Hardware Ids</em> property.<a href="/assets/images/2014/01/AndroidProperties-Details.png"><img class="aligncenter size-full wp-image-1440" alt="AndroidProperties-Details" src="/assets/images/2014/01/AndroidProperties-Details.png" width="414" height="462" /></a>

These are the identification for your specific Android device. It should look similar to the picture above.

<img class="aligncenter size-full wp-image-1443" alt="USB Driver file in folder" src="/assets/images/2014/01/usb_driver.png" width="639" height="294" />

Now using your favorite text editor open the <strong>android_winusb.inf</strong> file we found in the usb_driver folder above. Locate the line that says <strong>[Google.NTamd64]</strong>. You'll see some entries above this line, these are for 32-bit installs (it is section [Google.NTx86]), and the entries after the line are for 64-bit installs. Chances are you only need to edit one section, since you are doing this for your own windows install, but you can edit both sections if you are not sure. The lines are the same.

So add lines similar to the following in the section(s) you choose.
<pre>;Samsung Galaxy S3 
%SingleAdbInterface% = USB_Install, USB\VID_04E8&amp;PID_6860 
%CompositeAdbInterface% = USB_Install, USB\VID_04E8&amp;PID_6860&amp;MI_03</pre>
You probably noticed that is that crazy looking string on the right looks really similar to the values we saw for the Hardware Ids from device manager. The line prefixed by the semicolon is a comment, so I usually put the name of the device there.

Notice that the portion of the identifier with<em> REV_####</em> is missing (I usually leave it off, but it should work either way). Also the <strong>%SingleAdbInterface%</strong> line doesn't have the <em>MI_##</em> portion, while the <strong>%CompositeAdbInterface%</strong> line does include it. You might need to experiment with this to find what works (again remember the disclaimer).

If you want to load the driver for Google Glass, then it should look something like the following.
<pre>;Google Glass
%SingleAdbInterface% = USB_Install, USB\VID_18D1&amp;PID_9001&amp;REV_0216&amp;MI_01
%CompositeAdbInterface% = USB_Install, USB\VID_18D1&amp;PID_9001&amp;MI_01

%SingleAdbInterface% = USB_Install, USB\VID_18D1&amp;PID_9001&amp;REV_0216&amp;MI_00
%CompositeAdbInterface% = USB_Install, USB\VID_18D1&amp;PID_9001&amp;MI_00</pre>
(the first two lines are for the 2nd edition, the second two lines are for the 1st edition I believe).

<em><strong>Advanced</strong></em>: If you want to load the driver for the <em>bootloader</em>, then put your device into bootloader mode and add a <strong>%SingleBootLoaderInterface%</strong> line for the value that shows up in Device manager then (it will be different).

Now save the <strong>android_winsub.inf </strong>file. Unfortunately since it is modified, the signature is invalid and Windows won't let you load it. With Windows XP this wasn't such a big deal, but in recent versions the driver signature is enforced. There is a way around it though.

Check out the following guides for loading unsigned drivers in specific OS:
<ul>
	<li><a href="http://www.techspot.com/community/topics/how-to-install-use-unsigned-drivers-in-windows-vista-7-x64.127187/">Windows 7 or Vista</a></li>
	<li><a href="http://www.makeuseof.com/tag/how-can-i-install-hardware-with-unsigned-drivers-in-windows-8/">Windows 8</a></li>
	<li><a href="http://www.howtogeek.com/167723/how-to-disable-driver-signature-verification-on-64-bit-windows-8.1-so-that-you-can-install-unsigned-drivers/">Windows 8.1</a></li>
</ul>
I've also made a video of the process on Windows 8.1

http://www.youtube.com/watch?v=UPm_6aejOlo

What to learn more about connecting to devices and gadgets? Join me for my free webinar on <a href="http://forms.embarcadero.com/DevicesWebinar1-22">Programming Devices and Gadgets with RAD Studio</a> on January 22nd.

<a href="http://forms.embarcadero.com/DevicesWebinar1-22"><img class="alignnone" alt="Programming Devices and Gadgets with RAD Studio" src="http://img.en25.com/EloquaImages/clients/Embarcadero/%7Bbdf8dda7-28a8-449b-9a5a-23cf781bd523%7D_RADInAction_Devices_680x150.jpg" width="680" height="150" /></a>
