---
id: 1523
title: 'XE5 REST Debugger Supercharged'
date: '2014-02-05T15:55:26-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1523'
permalink: /2014/02/xe5-rest-debugger-supercharged/
categories:
    - News
tags:
    - Kimono
    - News
    - 'Source Code'
    - xe5
---

Some people asked for the source code to using the new XE5 REST Client Library to consume the <a href="http://delphi.org/2014/02/rest-and-the-kimono/">Kimono web service</a>. The crazy thing is there isn't any. I decided to make a video about how easy it is to consume REST web services the the new REST Client Library and the REST Debugger. In the process I thought of a way to make it even easier by supercharging the Rest Debugger (source code below).

In this video I show you how to create a REST Web service with Kimono Labs (in beta, so it will change) and then bind that data to your XE5 app using the REST Debugger.

http://www.youtube.com/watch?v=IKMI73-xGdc

You can supercharge your REST Debugger too. The source code is installed with XE5
<blockquote>C:\Program Files (x86)\Embarcadero\RAD Studio\12.0\source\data\rest\restdebugger</blockquote>
You will want to copy it somewhere else before modifying it. Then add a button where ever you want, and on the click event for the button add the following code:

[delphi light="True"]StreamToClipboard([RESTClient, RESTRequest, RESTResponse, RESTResponseDataSetAdapter, RESTClient.Authenticator]);[/delphi]

And then download <a href="/assets/images/2014/02/uCopyComponents.zip">uCopyComponents.pas</a> and add it to your project and uses clause. It is pretty simple, but is designed specifically to work with non-visual components, although could be modified to work with visual components too.

If you want to include the TClientDataSet in the copy, then add it to the array (although make sure it is not active). Or you could modify it to add a TFDMemTable. Use it how you wish, I hope it works for you. If you discover any bugs make any changes let me know. If anyone is interested in contributing to it, let me know.
