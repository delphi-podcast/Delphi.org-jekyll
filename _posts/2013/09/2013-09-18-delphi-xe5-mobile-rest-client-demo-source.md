---
id: 1281
title: 'Delphi XE5 Mobile REST Client Demo Source'
date: '2013-09-18T06:17:39-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1281'
permalink: /2013/09/delphi-xe5-mobile-rest-client-demo-source/
categories:
    - News
tags:
    - 'Delphi Projects'
    - News
    - REST
    - 'Source Code'
---

With the release of Delphi XE5 I've made the source of the <a href="http://delphi.org/2013/08/delphi-xe5-mobile-rest-client-demo/">Mobile REST Client Demo</a> available. This is a really super simple demo of the Mobile REST Client in XE5. It is designed to show up how you can consume a JSON REST Service and adapt it into a DataSet and then bind that to the UI. If you change the data source you will probably need to change the live binding.

I've changed the demo from the one I used in the video to consume an OData data source. <a href="http://www.odata.org/">OData</a> is a new standard backed by Microsoft for sharing data over the web. You can think of it as SQL for the web. It is a combination of other technologies, including REST, AtomPub, and JSON. Sybase supports OData on all of their databases now, as does Microsoft and others.

The change was simply a matter of pointing it to the Northwind OData endpoint provided on Odata.org. The binding is setup to show the company name in the listview. I added the ability to specify a Root Element, but that isn't necessary for the demo.

This new technology works in both desktop and mobile, FireMonkey and VCL. It should also work in C++ Builder.

[<a href="http://delphi.org/downloads/MobileRestXE5.7z">Download the demo</a>] (MobileRestXE5.7z 8 KB - Requires <a href="http://www.embarcadero.com/products/delphi/">Delphi XE5</a> - Builds for iOS, Android or Win32)
