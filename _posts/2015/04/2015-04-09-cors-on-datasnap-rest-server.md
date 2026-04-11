---
id: 1979
title: 'CORS on DataSnap REST Server'
date: '2015-04-09T09:04:50-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1979'
permalink: /2015/04/cors-on-datasnap-rest-server/
categories:
    - News
tags:
    - News
    - 'Source Code'
---

<a href="https://en.wikipedia.org/wiki/Cross-origin_resource_sharing">Cross-origin resource sharing (CORS)</a> is a mechanism that enables resources to be shared across domains. Typically this isn't allowed to prevent security issues. To enable on your DataSnap REST server you can use the following code per <a href="https://niravkaku.wordpress.com/">MVP Nirav Kaku</a> from India.
<p class="p1"><span class="s1">All you need to do is add a custom header in the Response before </span>dispatching the result on the DataSnap server...</p>


[delphi]procedure TWebModule1.WebModuleBeforeDispatch(Sender: TObject;
Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  //allows cross domain calls
  Response.SetCustomHeader('Access-Control-Allow-Origin','*');
  if FServerFunctionInvokerAction &lt;&gt; nil then
    FServerFunctionInvokerAction.Enabled := AllowServerFunctionInvoker;
end;[/delphi]

It is useful for DataSnap server developers who want
their REST calls to be supported via AJAX using JavaScript from a
different server.

[<a href="http://enable-cors.org/server.html">Reference</a>]

Note: CORS is security feature of the browser so there could be some
dependency there. Tested with Firefox, Chrome and IE and it seems to
be working fine.

