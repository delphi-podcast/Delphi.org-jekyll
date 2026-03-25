---
id: 1272
title: 'Debugging Against a Remote Android Emulator'
date: '2013-09-17T20:59:00-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1272'
permalink: /2013/09/debugging-against-a-remote-android-emulator/
categories:
    - News
tags:
    - Debugging
    - Mobile
    - News
---

The Android emulator is impossibly slow when running inside a virtual machine. It is possible to debug against a remote emulator via SSH. Here are the steps to connect from a Windows guest OS to an OS X host OS (they can be easily adapted for a Windows host). It does require installing the Android SDK on the host OS and creating and running an emulator there. It seems to work even if you have a device connected too. I’ve gotten them both to show up in the IDE and am able to pick between them and deploy and run on the emulator.  The Emulator is still slower than hardware, but this makes it usable.

<em>Of note, this emulator performance isn't an issue with Delphi, but is an issue with the Android emulator. So you may find this tip useful with other Android development tools as well.</em>

This could be adapted to debug against a remote Android Emulator running on a remote machine located anywhere on the internet. Just requires port 22 to be open between the two machines.

Thanks to <a href="http://stackoverflow.com/users/6278/255">hheimbuerger</a> for the the <a href="http://stackoverflow.com/a/2792395/255">Stack Overflow answer</a> that got me pointed in the right direction. This information has been adapted to the <a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Running_and_Debugging_Your_Android_Application_Remotely">DocWiki</a> too with additional links to more information.

<iframe width="420" height="315"
src="https://www.youtube.com/embed/CacpPleWsZM">
</iframe>

<ol>
	<li>Install the <a href="http://developer.android.com/sdk/">Android SDK</a> (not the ADT bundle) on your Mac OS X host &amp; start an ARM based emulator (With use Host GPU enabled)</li>
	<li>Enable SSH on the host
<ul>
	<li>On a Mac OS X Host go to System Preferences -&gt; Sharing -&gt; Remote Login</li>
	<li>On a Windows host, <s>you need to install a 3rd party SSH host. FreeSSHd has been found to work.</s> Microsoft added <a href="https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse">OpenSSH Server support</a>.</li>
	```powershell
	Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
	Start-Service sshd
	Set-Service -Name sshd -StartupType 'Automatic'
	```
</ul>
</li>
	<li>Install the <a href="http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html">PuTTY SSH</a> (putty.exe) client on the Windows Guest OS</li>
	<li>Ensure port 22 is open between the Windows guest OS and the Mac OS X host.</li>
	<li>Create a connection in PuTTY to the Host OS
<ol>
	<li>You will most likely use the 192.168.x.x IP address of the host</li>
	<li>Go to Connection -&gt; SSH -&gt; Tunnels and add a local/auto port forwarding for 5555 to locahost:5555 and 5554 to localhost:5554.</li>
</ol>
</li>
	<li>Save and Open the connection in PuTTY</li>
	<li>Provide the login credentials for the Mac OS X host - anything typed in this window is executed on the remote machine</li>
	<li>You can check or change the tunnel settings via the icon in the upper left of the PuTTY window</li>
	<li>Minimize PuTTY (keep it open to maintain the SSH connection)</li>
	<li>Open a new command window in the Windows guest OS and type "adb kill-server &amp; adb devices" and you should see the <i>emulator-5554</i> as a listed device.</li>
	<li>Refresh target devices in Delphi and it should appear</li>
</ol>
<img class="alignnone  wp-image-1276" alt="PuTTY Tunnels" src="/assets/images/2013/09/PuTTY-Tunnels.png" width="472" height="456" />

This should work for any emulators or devices connected to the remote machine. Unlike emulators that are local, you need to start the emulators before Delphi will see them. You may need to adjust the tunnel port numbers if you are connecting multiple devices.

Good luck, and happy debugging!
