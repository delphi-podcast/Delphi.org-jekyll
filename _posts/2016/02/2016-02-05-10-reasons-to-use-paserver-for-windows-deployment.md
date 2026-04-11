---
id: 2212
title: '10 Reasons to Use PAServer for Remote Windows Deployment'
date: '2016-02-05T15:37:48-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2212'
permalink: /2016/02/10-reasons-to-use-paserver-for-windows-deployment/
categories:
    - News
tags:
    - Debugging
    - deployment
    - News
    - PAClient
    - PAServer
    - Tablets
    - windows
---

Everyone knows <a href="http://docwiki.embarcadero.com/RADStudio/en/PAServer,_the_Platform_Assistant_Server_Application">PAServer</a> (Platform Assist Server) is the easy way to deploy and debug multi device apps from Windows to Apple OS X and iOS. It handles all the bundling and deployment from your Windows development platform across the network, via a virtual machine, or even <a href="http://www.macincloud.com/">to the cloud</a>.

Previously I showed you how to connect to a <a href="http://delphi.org/2013/09/debugging-against-a-remote-android-emulator/">Android Emulator on another machine</a> (or outside your VM), but did you know you can also use the PAServer to deploy and debug against a remote Windows machine? It isn't required, so isn't as immediately obvious, but it is supported and pretty easy to setup.

If you are already developing on a Windows machine, why us PAServer to test against a remote Windows machine? There are a lot of reasons, here are a few . . .
<ol>
	<li>Testing on machine without IDE installed</li>
	<li><a href="http://delphi.org/2014/05/delphi-sensors-on-windows-8-tablet/">Windows tablets</a></li>
	<li><a href="http://docwiki.embarcadero.com/RADStudio/en/Connecting_Your_32-bit_PC_to_a_Win64_PC">Different CPU architectures (64-bit vs 32-bit)</a></li>
	<li>Different numbers of cores</li>
	<li>Utilizing specialized hardware</li>
	<li>Running outside / inside a virtual machine</li>
	<li>Deployment on a server (remote, local, in the cloud)</li>
	<li>Debugging on more than one version of Windows</li>
	<li>Debugging issue that only occurs on<em> one machine</em></li>
	<li>Bundled deployment options</li>
</ol>
Now that we see the need, how do we do it?

<a href="http://docwiki.embarcadero.com/RADStudio/en/Installing_the_Platform_Assistant_on_Windows">Install PAServer on the target Windows computer</a>. You can find it at C:\Program Files (x86)\Embarcadero\Studio\17.0\PAServer if you used the default install location during your original install. When installing PAServer, you either need to use a different install location (to a user writable folder), or specify a custom scratch-directory, as the default is not writable (unless you run PAServer as Administrator) and will give you an <a href="http://docwiki.embarcadero.com/RADStudio/en/E0009_Cannot_create_file_%22filepath%22._Access_is_denied">E0009 PAClient Error</a>. Once PAServer is setup <a href="http://docwiki.embarcadero.com/RADStudio/en/Running_the_Platform_Assistant_on_Windows">just run it</a>.

<img class="alignnone size-full wp-image-2254" src="/assets/images/2016/02/PAServerDestination.png" alt="Custom PAServer Install Destination" width="712" height="437" />

Use the <a href="http://docwiki.embarcadero.com/RADStudio/en/Connection_Profile_Manager">Connection Profile Manager</a> to <a href="http://docwiki.embarcadero.com/RADStudio/en/Create_a_Connection_Profile">create a new Windows profile</a>.

<img class="alignnone size-full wp-image-2255" src="/assets/images/2016/02/ProfileManager.png" alt="RAD Studio Connection Profile Manager" width="736" height="613" />

Instead of the default of OS X, choose either Windows 32-bit or 64-bit. The rest of the configuration is the same.

<img class="alignnone size-full wp-image-2256" src="/assets/images/2016/02/CreateProfile1.png" alt="Create Windows 64-bit Profile Connection" width="564" height="447" />

Then form the Project Manager, right-click on the Windows platform you want to deploy remotely, and select properties.

<img class="alignnone size-full wp-image-2257" src="/assets/images/2016/02/PlatformProperties.png" alt="Project Manager - Platform Properties" width="391" height="400" />

And then select the new connection you want.

<img class="alignnone size-full wp-image-2258" src="/assets/images/2016/02/SelectProfile.png" alt="Platform Properties - Select Profile" width="337" height="241" />

This works with any project type (FireMonkey, VCL, Console, etc.)

<img class="alignnone size-full wp-image-2259" src="/assets/images/2016/02/ProfileSelected.png" alt="Profile Selected" width="366" height="277" />

Now you can also use the <a href="http://docwiki.embarcadero.com/RADStudio/Seattle/en/Deployment_Manager">Deployment Manager</a> for Windows apps as well.
