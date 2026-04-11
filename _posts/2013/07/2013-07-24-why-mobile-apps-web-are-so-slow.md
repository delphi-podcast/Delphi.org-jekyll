---
id: 1174
title: 'Why Some Mobile Apps are So Slow'
date: '2013-07-24T00:00:07-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1174'
permalink: /2013/07/why-mobile-apps-web-are-so-slow/
tags:
    - Architecture
---

If you haven't read the lengthy article on <a href="http://sealedabstract.com/rants/why-mobile-web-apps-are-slow/">Why Mobile Web Apps are So Slow</a> I recommend you check it out. It appears well researched, citing lots of tests, sources, benchmarks and authorities. In summary JavaScript is garbage collected, and garbage collection introduces overhead making it up to 5x slower than native code. This isn't such a big deal on x86 desktops, but with the slower architecture of ARM it is killing the performance of mobile apps.

Take a look at it, even if you just skim it you will no doubt learn something about this heated debate. Oh, and everywhere it talks about LLVM and ARC remember that is the same <a title="??????The Delphi Language for Mobile Development [PDF]" href="http://www.embarcadero.com/resources/white-papers?download=102">architecture that Delphi uses <sup>[PDF]</sup></a>  for iOS development (and <a href="http://edn.embarcadero.com/article/42544">Android soon too</a>).

Also keep in mind that JavaScript isn't the only garbage collected language on mobile devices. Languages that run on the Java Virtual Machine and .NET Framework are also garbage collected, as are most all scripting languages. This includes the Dalvik Virtual Machine that non-NDK Android apps run on. Granted Dalvik is optimized differently than that Java Virtual Machine, but it is still garbage collected, so it will still pause program execution at some point.

Quote from the article by Herb Sutter:
<blockquote>Managed languages made deliberate design tradeoffs to optimize for programmer productivity even when that was fundamentally in tension with, and at the <strong>expense of, performance efficiency</strong>…</blockquote>
Which was endorsed by Miguel de Icaza of Mono &amp; Xamarin:
<blockquote>This is a pretty accurate statement on the difference of the mainstream VMs for managed languages (.NET, Java and Javascript). Designers of managed languages have chosen the path of <strong>safety over performance</strong> for their designs.</blockquote>
Points to remember:
<ul>
	<li><span style="line-height: 13px;">Garbage collection is up to 5x slower than native code</span></li>
	<li>This is a much bigger deal on ARM architecture than x86</li>
	<li>Automatic Reference Counting (ARC) is not Garbage collection</li>
	<li>Delphi uses LLVM architecture and supports ARC like Objective-C</li>
</ul>
<em>Clarification</em>: A big part of the slowdown is that JavaScript is also a dynamic language, so all garbage collected languages are not 5x slower than native code. There are pros and cons to GC and ARC. There is a comment on the article that points out the 5x comparison was between GC and manual memory management, not ARC. There is overhead with ARC, but it doesn't pause your apps execution.

Read the article and draw your own conclusions, but I'd love to hear what you think.
