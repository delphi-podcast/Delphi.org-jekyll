---
id: 1346
title: 'Sending a URL to Another App on Android and iOS with Delphi XE5'
date: '2013-10-15T13:32:44-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1346'
permalink: /2013/10/sending-a-url-to-another-app-on-android-and-ios-with-delphi-xe5/
tags:
    - Conferences
    - iOS
    - Mobile
---

Here is the source code for my Open and View URL library from my <a href="www.embarcadero.com/coderage">CodeRage 8</a> session "Beyond the App". Here is a download of the <a href="http://delphi.org/downloads/SendURL.7z">example app</a>. I'll see about posting it to a SVN repository too so it can grow and evolve. Thanks to Al Mannarino for his code that started this!

<strong>Note</strong> the code is using <em>TidURL.URLEncode on all URLs</em>. I found it is only required on the maps for iOS (iOS doesn't like spaces) but may be causing trouble with the geo:// on Android.

<strong>Some example protocols</strong>
<ul>
	<li>http, tel, sms, fb, mailto, twitter, geo, <em>etc.</em></li>
</ul>
<strong>Example URLs</strong>
<ul>
	<li><strong><em>- Common to both iOS &amp; Android -</em></strong></li>
	<li>http://www.embarcadero.com/</li>
	<li>tel://(415)834-3131</li>
	<li>sms://1234</li>
	<li>http://twitter.com/coderage<em> (This opens with the Twitter client on Android)</em></li>
	<li>mailto://jim.mckeeth@embarcadero.com</li>
	<li>twitter://user?screen_name=coderage</li>
	<li>fb://profile/34960937498 <em>(get the UID from <a href="http://graph.facebook.com/embarcaderotech">http://graph.facebook.com/embarcaderotech</a> or for whatever page you are looking for)</em></li>
	<li><strong><em>- iOS Specific -</em></strong></li>
	<li>http://maps.apple.com?q=5617 Scotts Valley Drive, Scotts Valley, CA 95066<em> (this needs the URL encode - Apple has some additional APIs that are recommended.)</em></li>
	<li><strong><span style="line-height: 22px;">- Android Only -</span></strong></li>
	<li>content://contacts/people/</li>
	<li>content://contacts/people/1</li>
	<li>geo://0,0?q=5617 Scotts Valley Drive, Scotts Valley, CA 95066</li>
	<li>geo://46.191200, -122.194400 (I think this one doesn't like the URLEncode)</li>
</ul>

[delphi]unit OpenViewUrl;

interface

// URLEncode is performed on the URL
// so you need to format it   protocol://path
function OpenURL(const URL: string; const DisplayError: Boolean = False): Boolean;

implementation

uses
  IdURI, SysUtils, Classes, FMX.Dialogs,
{$IFDEF ANDROID}
  Androidapi.Helpers,
  FMX.Helpers.Android, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Net, Androidapi.JNI.JavaTypes;
{$ELSE}
{$IFDEF IOS}
  Macapi.Helpers, iOSapi.Foundation, FMX.Helpers.iOS;
{$ENDIF IOS}
{$ENDIF ANDROID}

function OpenURL(const URL: string; const DisplayError: Boolean = False): Boolean;
{$IFDEF ANDROID}
var
  Intent: JIntent;
begin
// There may be an issue with the geo: prefix and URLEncode.
// will need to research
  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
    TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(URL))));
  try
    SharedActivity.startActivity(Intent);
    exit(true);
  except
    on e: Exception do
    begin
      if DisplayError then ShowMessage('Error: ' + e.Message);
      exit(false);
    end;
  end;
end;
{$ELSE}
{$IFDEF IOS}
var
  NSU: NSUrl;
begin
  // iOS doesn't like spaces, so URL encode is important.
  NSU := StrToNSUrl(TIdURI.URLEncode(URL));
  if SharedApplication.canOpenURL(NSU) then
    exit(SharedApplication.openUrl(NSU))
  else
  begin
    if DisplayError then
      ShowMessage('Error: Opening &quot;' + URL + '&quot; not supported.');
    exit(false);
  end;
end;
{$ELSE}
begin
  raise Exception.Create('Not supported!');
end;
{$ENDIF IOS}
{$ENDIF ANDROID}

end.[/delphi]

