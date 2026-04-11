---
id: 2007
title: 'Adding to the Android User Dictionary'
date: '2015-08-07T10:01:59-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2007'
permalink: /2015/08/adding-to-the-android-user-dictionary/
categories:
    - News
tags:
    - News
---

On Android there is a single UserDictionary that works across all keyboards, and any app (with the appropriate permissions) can query, add and remove words. Here is some simple code to add a word to the dictionary (via XE8):

[delphi light="true"]uses
  Androidapi.JNI.Provider, Androidapi.Helpers, Androidapi.JNI.JavaTypes;
 
procedure AddUserWord(const AWord: string);
begin
  // Need WRITE_USER_DICTIONARY permission
  TJUserDictionary_Words.JavaClass.addWord(
    SharedActivityContext, // Context
    StringToJString(AWord),// Word to add
    255,                   // Frequency: 1- 255
    nil,                   // optional shortcut
    SharedActivityContext.getResources.getConfiguration.locale
    );
end;
[/delphi]

If you also want to read the dictionary then you need to have the <strong>READ_USER_DICTIONARY</strong> permission. Check out the documentation for more information on the <a href="https://developer.android.com/reference/android/provider/UserDictionary.html">UserDictionary</a> and it's <a href="https://developer.android.com/reference/android/provider/UserDictionary.Words.html">Words list</a>.
