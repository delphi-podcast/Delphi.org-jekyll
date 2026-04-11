---
id: 1576
title: 'Setting Android Settings'
date: '2014-03-03T14:53:59-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1576'
permalink: /2014/03/setting-android-settings/
categories:
    - News
tags:
    - android
    - api
    - News
    - settings
---

On the Android platform all the system wide settings that are accessible via the Settings app are also accessible to your app. You just need to add the uses permission <a href="http://developer.android.com/reference/android/Manifest.permission.html#WRITE_SETTINGS">WRITE_SETTINGS</a>. Here is a simple Delphi XE5 example for changing the screen timeout.

First you need the following in your uses clause:

[delphi light="true"]Androidapi.JNI.Provider, // JSettings_SystemClass
FMX.Helpers.Android; // SharedActivityContext[/delphi]

Here is the code to read and set the <a href="http://developer.android.com/reference/android/provider/Settings.System.html#SCREEN_OFF_TIMEOUT">Screen Off Timeout</a>:

[delphi]function GetScreenOffTimeout: Integer;
begin
  Result := TJSettings_System.JavaClass.getInt(
    SharedActivityContext.getContentResolver,
    TJSettings_System.JavaClass.SCREEN_OFF_TIMEOUT,
    15000);  // 15 seconds is default is not found
end;

function SetScreenOffTimeout(ATimeOut: Integer): Boolean;
begin
  Result := TJSettings_System.JavaClass.putInt(
    SharedActivityContext.getContentResolver,
    TJSettings_System.JavaClass.SCREEN_OFF_TIMEOUT,
    ATimeOut);
end;[/delphi]

In the GetScreenOffTimeout we pass a default value to use if none is found. I passed in 15000, which is 15 seconds, or the smallest value for my phone. The largest value on my phone is 600000, which is 10 minutes. It appears you can set it to any value, even one that the settings app doesn't explicitly list as an option. 

There are <a href="http://developer.android.com/reference/android/provider/Settings.System.html">lots of other settings available for your adjustment</a>.
