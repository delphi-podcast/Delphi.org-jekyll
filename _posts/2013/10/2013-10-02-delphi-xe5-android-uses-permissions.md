---
id: 1326
title: 'Delphi XE5 Android “Uses Permissions”'
date: '2013-10-02T08:34:29-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1326'
permalink: /2013/10/delphi-xe5-android-uses-permissions/
categories:
    - News
tags:
    - News
---

The permissions required by a Delphi XE5 Android application are defined through the <a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions">Uses Permissions dialog</a>. It is found under <strong>Project -&gt; Options...</strong> [Shift+Ctrl+F11].

&nbsp;

<a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions"><img class="aligncenter size-full wp-image-1328" alt="RAD Studio XE5 Android &quot;Uses Permissions&quot; Dialog" src="/assets/images/2013/10/Uses-Permissions.png" width="755" height="604" /></a>

If you select other Targets besides Android then the list is blank, for now. By default the following common permissions are selected. If you do not select a permission then any calls you make that require that permission will fail. The "Internet" permission is required for any network access, even your local network.
<ul>
	<li><b><a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions#access-coarse-location">Access coarse location</a></b></li>
	<li><b><a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions#access-fine-location">Access fine location</a></b></li>
	<li><b><a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions#call-phone">Call phone</a></b></li>
	<li><b><a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions#camera">Camera</a></b></li>
	<li><b><a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions#internet">Internet</a></b></li>
	<li><b><a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions#read-calendar">Read calendar</a></b></li>
	<li><b><a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions#read-external-storage">Read external storage</a></b></li>
	<li><b><a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions#write-calendar">Write calendar</a></b></li>
	<li><b><a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions#write-external-storage">Write external storage</a></b></li>
	<li><b><a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions#read-phone">Read phone state</a></b></li>
</ul>
If you scroll down the list you will see an <a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Uses_Permissions#Advanced_Uses_Permissions">Advanced node</a> which contains permissions that are less commonly used permissions. For many apps you will never need to change these permissions, but your users may notice the "services that can cost money" warning next to Call phone and Internet permission request, so you may want to remove those.

The requested permissions are automatically added to the AndroidManifest.xml file, which is read by the Android operating system and Google Play store to know which permissions your app requested.

