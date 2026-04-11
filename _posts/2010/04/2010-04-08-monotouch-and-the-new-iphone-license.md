---
id: 933
title: 'MonoTouch and the new iPhone license'
date: '2010-04-08T23:19:03-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=933'
permalink: /2010/04/monotouch-and-the-new-iphone-license/
podPressPostSpecific:
    - 'a:6:{s:15:"itunes:subtitle";s:15:"##PostExcerpt##";s:14:"itunes:summary";s:15:"##PostExcerpt##";s:15:"itunes:keywords";s:17:"##WordPressCats##";s:13:"itunes:author";s:10:"##Global##";s:15:"itunes:explicit";s:7:"Default";s:12:"itunes:block";s:7:"Default";}'
categories:
    - News
tags:
    - apple
    - ipad
    - iphone
    - News
---

Apple announced their new iPhone SDK and license agreement today.  Part of the change in the license agreement to use the SDK and publish apps to the app store includes

Changing Section 3.3.1 from:
<blockquote>3.3.1 — Applications may only use Documented APIs in the manner prescribed by Apple and must not use or call any private APIs.</blockquote>
To now read:
<blockquote>3.3.1 — Applications may only use Documented APIs in the manner prescribed by Apple and must not use or call any private APIs. Applications must be originally written in Objective-C, C, C++, or JavaScript as executed by the iPhone OS WebKit engine, and only code written in C, C++, and Objective-C may compile and directly link against the Documented APIs (e.g., Applications that link to Documented APIs through an intermediary translation or compatibility layer or tool are prohibited).</blockquote>
This is most likely the latest volley in Apples war against Adobe Flash, since Adobe announced that their new Flash Studio would include the ability to translate Flash applications into iPhone applications.  A lot of people are also saying that this will kill MonoTouch (which allows C# and Delphi Prism iPhone development).

I checked <a href="http://twitter.com/migueldeicaza/">Miguel de Icaza's twitter</a> stream to see his take on this.

Someone suggested that maybe MonoTouch add an option to generate Objective C for X Code to compile, to which <a href="http://twitter.com/migueldeicaza/status/11844609073">Miguel responded</a>:
<blockquote><span><span>MonoTouch  already  has an option to compile to C + XCode, just call mtouch --xcode  program.exe</span></span></blockquote>
Then <a href="http://twitter.com/thezduck/status/11849956138">TheZDuck asked</a>:<span></span>
<blockquote><span><span><strong>@migueldeicaza </strong>I just saw this. Does this mean the end  of MonoTouch!? <a rel="nofollow" href="http://bit.ly/cT2Zyn" target="_blank">http://bit.ly/cT2Zyn</a></span></span></blockquote>
Which seems to be a pretty direct question, and <a href="http://twitter.com/migueldeicaza/status/11850097546">Miguel responded</a>:
<blockquote>nope.</blockquote>
<em>Sure, it would have been nice if he elaborated more, but it is a direct answer.</em>

Earlier in the day <a href="http://twitter.com/migueldeicaza/status/11836097616">Miguel tweeted</a>:<span></span>
<blockquote><span><span>Started  work on  iPhoneOS 4.0 support in MonoTouch.</span></span></blockquote>
<div>

<em>Why would he work in it if it violates the license agreement?</em></div>
Miguel is on the beta and has Novell's legal department to pour  over  the license agreement, so he has more information then those who are speculating wildly about the end of MonoTouch.  So go back to learning and using Delphi Prism and MonoTouch.  You iPhone and iPad apps are safe for now.  It would appear Apple doesn't hate MonoTouch as much as it hates Flash.
