---
id: 1423
title: 'FireDAC is the Recommended Database Access Library'
date: '2013-12-31T00:47:14-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1423'
permalink: /2013/12/firedac-is-recommended/
categories:
    - News
tags:
    - iOS
    - Mobile
    - News
    - webinar
---

I got a great call the other morning. A Delphi developer from a few versions back was considering upgrading to XE5, but he wanted to know if FireDAC was recommended for database access, or if he would need a 3rd party library.

I remember working on some data driven Delphi applications when the drill was you always bought a 3rd party database access library. There are lots of great database access libraries to choose from, which is one of the great things about Delphi: all the technology partners!

In XE5 the BDE is officially deprecated (and has been for a while), but it still ships (maybe not for much longer though). dbExpress is still there, and so is dbGo and IBX, and they are all good, specialized database access libraries. But with the full integration of FireDAC in XE5, it is the recommended database access library, and for good reason.

FireDAC is a universal data access library: you use the same components to connect to a huge variety of databases. The usage pattern is similar to the BDE, and it is fully bidirectional. It also has a large collection of specialized features for dealing with specific databases, and local, in memory data.

If you are still on the BDE, check out the <a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/BDE_Application_Migration_(FireDAC)">FireDAC migration guide</a> or any of the other <a href="http://docwiki.embarcadero.com/RADStudio/XE5/en/Category:FireDAC">great FireDAC documentation</a>. Cary Jensen just did a <a href="https://www.embarcadero.com/rad-in-action/no-app-is-an-island">fabulous webinar on FireDAC</a> including a fabulous 70 page whitepaper.

Of course you are still welcome to continue using 3rd party libraries, and some of them may offer some other specialized features. That is one of the great things about Delphi, C++Builder and RAD Studio: It comes with great features in the box, but you can expand on those with 3rd party libraries.

If you still aren't on XE5, you still have a little time to take advantage of the <a href="http://www.embarcadero.com/radoffer">special offers.</a>
