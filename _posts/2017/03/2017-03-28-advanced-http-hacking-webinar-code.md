---
id: 2787
title: 'Advanced HTTP Hacking Webinar Code'
date: '2017-03-28T20:27:44-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2787'
permalink: /2017/03/advanced-http-hacking-webinar-code/
tags:
    - 'Source Code'
---

You can find all the code from my HTTP webinar in <a href="http://delphi.org/http/">my special HTTP folder</a>.

<strong>[<a href="http://delphi.org/http/HttpDebugger.7z">Project source code</a>] [<a href="https://youtu.be/up8Vz5PTX3M">YouTube Replay</a>]</strong>

https://youtu.be/up8Vz5PTX3M

This is the script I use to demonstrate HTTP Range requests through Telnet. Just copy and paste each block of code (including the trailing blank line) into a command window and it will run telnet and make the HTTP request. You can view the <a href="http://delphi.org/http/httptestfile.txt">test file here</a>. Read HTTP <a href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html">Status Codes</a> (including <a href="https://en.wikipedia.org/wiki/Hyper_Text_Coffee_Pot_Control_Protocol">418</a>), <a href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html">Methods</a>, <a href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html">Headers</a>, and <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS">Access Control (CORS)</a>.
<pre>telnet delphi.org 80
HEAD /http/httptestfile.txt HTTP/1.1
Host: delphi.org
Connection: close
</pre>
<pre>telnet delphi.org 80
GET /http/httptestfile.txt HTTP/1.1
Host: delphi.org
Connection: close
</pre>
<pre>telnet delphi.org 80
GET /http/httptestfile.txt HTTP/1.1
Host: delphi.org
Range: bytes=0-77
Connection: close
</pre>
<pre>telnet delphi.org 80
GET /http/httptestfile.txt HTTP/1.1
Host: delphi.org
Range: bytes=115-154
Connection: close
</pre>
<pre>telnet delphi.org 80
GET /http/httptestfile.txt HTTP/1.1
Host: delphi.org
Range: bytes=78-113
Connection: close
</pre>
<pre>telnet delphi.org 80
GET /http/httptestfile.txt HTTP/1.1
Host: delphi.org	
Range: bytes=115-154,127-127
Connection: close
</pre>
This last one stopped working because of a change on the web server.

Here are the images. They all are available as both JPG and BMP and are 640x472 in resolution.
<table>
<tbody>
<tr>
<td colspan="3" align="center"><a href="http://delphi.org/http/original.jpg"><img src="http://delphi.org/http/original.jpg" width="500" height="333" />
original.jpg</a></td>
</tr>
<tr>
<td align="center"><a href="http://delphi.org/http/blue.jpg"><img src="http://delphi.org/http/blue.jpg" width="160" height="107" />
blue.jpg</a></td>
<td align="center"><a href="http://delphi.org/http/green.jpg"><img src="http://delphi.org/http/green.jpg" width="160" height="107" />
green.jpg</a></td>
<td align="center"><a href="http://delphi.org/http/red.jpg"><img src="http://delphi.org/http/red.jpg" width="160" height="107" />
red.jpg</a></td>
</tr>
<tr>
<td align="center"><a href="http://delphi.org/http/purple.jpg"><img src="http://delphi.org/http/purple.jpg" width="160" height="107" />
purple.jpg</a></td>
<td align="center"><a href="http://delphi.org/http/teal.jpg"><img src="http://delphi.org/http/teal.jpg" width="160" height="107" />
teal.jpg</a></td>
<td align="center"><a href="http://delphi.org/http/yellow.jpg"><img src="http://delphi.org/http/yellow.jpg" width="160" height="107" />
yellow.jpg</a></td>
</tr>
</tbody>
</table>
Here is the code I used to stream all 7 images into one image. HTTPClient is a <a href="http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClientComponent.TNetHTTPClient">TNetHTTPClient</a> and HTTPReq is a <a href="http://docwiki.embarcadero.com/Libraries/en/System.Net.HttpClientComponent.TNetHTTPRequest">TNetHTTPRequest</a> on the form. The reason it uses Bitmap images is that they are an uncompressed stream of pixel data, so are easier to recombine into one image.
<pre><span style="color: red;"><b>const</b></span>
  baseurl<span style="color: blue; font-size: xx-small;"><b>:</b></span> <span style="color: red;"><b>string</b></span> <span style="color: blue; font-size: xx-small;">=</span> <span style="color: purple;">'http://delphi.org/http/'</span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
  files<span style="color: blue; font-size: xx-small;"><b>:</b></span> <span style="color: red;"><b>array</b></span><span style="color: blue; font-size: xx-small;"><b>[</b></span>0<span style="color: blue; font-size: xx-small;"><b>.</b></span><span style="color: blue; font-size: xx-small;"><b>.</b></span>5<span style="color: blue; font-size: xx-small;"><b>]</b></span> <span style="color: red;"><b>of</b></span> <span style="color: red;"><b>string</b></span> <span style="color: blue; font-size: xx-small;">=</span> <span style="color: blue; font-size: xx-small;"><b>(</b></span><span style="color: purple;">'red.bmp'</span><span style="color: blue; font-size: xx-small;"><b>,</b></span><span style="color: purple;">'green.bmp'</span><span style="color: blue; font-size: xx-small;"><b>,</b></span><span style="color: purple;">'blue.bmp'</span><span style="color: blue; font-size: xx-small;"><b>,</b></span>
    <span style="color: purple;">'yellow.bmp'</span><span style="color: blue; font-size: xx-small;"><b>,</b></span><span style="color: purple;">'purple.bmp'</span><span style="color: blue; font-size: xx-small;"><b>,</b></span><span style="color: purple;">'teal.bmp'</span><span style="color: blue; font-size: xx-small;"><b>)</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>

<span style="color: red;"><b>procedure</b></span> TForm34<span style="color: blue; font-size: xx-small;"><b>.</b></span>Button1Click<span style="color: blue; font-size: xx-small;"><b>(</b></span>Sender<span style="color: blue; font-size: xx-small;"><b>:</b></span> TObject<span style="color: blue; font-size: xx-small;"><b>)</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
<span style="color: red;"><b>var</b></span>
  resp<span style="color: blue; font-size: xx-small;"><b>:</b></span> IHTTPResponse<span style="color: blue; font-size: xx-small;"><b>;</b></span>
  chunk<span style="color: blue; font-size: xx-small;"><b>:</b></span> Integer<span style="color: blue; font-size: xx-small;"><b>;</b></span>
  mem<span style="color: blue; font-size: xx-small;"><b>:</b></span> TMemoryStream<span style="color: blue; font-size: xx-small;"><b>;</b></span>
  I<span style="color: blue; font-size: xx-small;"><b>:</b></span> Integer<span style="color: blue; font-size: xx-small;"><b>;</b></span>
<span style="color: red;"><b>begin</b></span>
  resp <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> HTTPReq<span style="color: blue; font-size: xx-small;"><b>.</b></span>Head<span style="color: blue; font-size: xx-small;"><b>(</b></span>baseurl <span style="color: blue; font-size: xx-small;">+</span> <span style="color: purple;">'original.bmp'</span><span style="color: blue; font-size: xx-small;"><b>)</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
  chunk <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> resp<span style="color: blue; font-size: xx-small;"><b>.</b></span>ContentLength <span style="color: red;"><b>div</b></span> <span style="color: brown;">12</span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
  ProgressBar1<span style="color: blue; font-size: xx-small;"><b>.</b></span>Max <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> resp<span style="color: blue; font-size: xx-small;"><b>.</b></span>ContentLength<span style="color: blue; font-size: xx-small;"><b>;</b></span>
  resp <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> HTTPReq<span style="color: blue; font-size: xx-small;"><b>.</b></span>Get<span style="color: blue; font-size: xx-small;"><b>(</b></span>baseurl <span style="color: blue; font-size: xx-small;">+</span> <span style="color: purple;">'original.bmp'</span><span style="color: blue; font-size: xx-small;"><b>)</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
  mem <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> TMemoryStream<span style="color: blue; font-size: xx-small;"><b>.</b></span>Create<span style="color: blue; font-size: xx-small;"><b>;</b></span>
  <span style="color: red;"><b>try</b></span>
    mem<span style="color: blue; font-size: xx-small;"><b>.</b></span>LoadFromStream<span style="color: blue; font-size: xx-small;"><b>(</b></span>resp<span style="color: blue; font-size: xx-small;"><b>.</b></span>ContentStream<span style="color: blue; font-size: xx-small;"><b>)</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
    <span style="color: red;"><b>for</b></span> I <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> <span style="color: brown;">5</span> <span style="color: red;"><b>to</b></span> <span style="color: brown;">11</span> <span style="color: red;"><b>do</b></span>
    <span style="color: red;"><b>begin</b></span>
      ProgressBar1<span style="color: blue; font-size: xx-small;"><b>.</b></span>Tag <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> chunk<span style="color: blue; font-size: xx-small;">*</span>i<span style="color: blue; font-size: xx-small;"><b>;</b></span>
      <span style="color: red;"><b>if</b></span> I <span style="color: blue; font-size: xx-small;">&lt;</span> <span style="color: brown;">11</span> <span style="color: red;"><b>then</b></span>
        httpreq<span style="color: blue; font-size: xx-small;"><b>.</b></span>CustomHeaders<span style="color: blue; font-size: xx-small;"><b>[</b></span><span style="color: purple;">'Range'</span><span style="color: blue; font-size: xx-small;"><b>]</b></span> <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> <span style="color: purple;">'bytes='</span> <span style="color: blue; font-size: xx-small;">+</span> IntToStr<span style="color: blue; font-size: xx-small;"><b>(</b></span>chunk<span style="color: blue; font-size: xx-small;">*</span>i<span style="color: blue; font-size: xx-small;"><b>)</b></span> <span style="color: blue; font-size: xx-small;">+</span><span style="color: purple;">'-'</span> <span style="color: blue; font-size: xx-small;">+</span> IntToStr<span style="color: blue; font-size: xx-small;"><b>(</b></span>chunk<span style="color: blue; font-size: xx-small;">*</span>i<span style="color: blue; font-size: xx-small;">+</span>chunk<span style="color: blue; font-size: xx-small;">-</span><span style="color: brown;">1</span><span style="color: blue; font-size: xx-small;"><b>)</b></span>
      <span style="color: red;"><b>else</b></span>
        httpreq<span style="color: blue; font-size: xx-small;"><b>.</b></span>CustomHeaders<span style="color: blue; font-size: xx-small;"><b>[</b></span><span style="color: purple;">'Range'</span><span style="color: blue; font-size: xx-small;"><b>]</b></span> <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> <span style="color: purple;">'bytes='</span> <span style="color: blue; font-size: xx-small;">+</span> IntToStr<span style="color: blue; font-size: xx-small;"><b>(</b></span>chunk<span style="color: blue; font-size: xx-small;">*</span>i<span style="color: blue; font-size: xx-small;"><b>)</b></span> <span style="color: blue; font-size: xx-small;">+</span><span style="color: purple;">'-'</span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
      HTTPReq<span style="color: blue; font-size: xx-small;"><b>.</b></span>MethodString <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> <span style="color: purple;">'GET'</span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
      button1<span style="color: blue; font-size: xx-small;"><b>.</b></span>Text <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> files<span style="color: blue; font-size: xx-small;"><b>[</b></span>i <span style="color: red;"><b>mod</b></span> <span style="color: brown;">6</span><span style="color: blue; font-size: xx-small;"><b>]</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
      HTTPReq<span style="color: blue; font-size: xx-small;"><b>.</b></span>URL <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> baseurl <span style="color: blue; font-size: xx-small;">+</span> files<span style="color: blue; font-size: xx-small;"><b>[</b></span>i <span style="color: red;"><b>mod</b></span> <span style="color: brown;">6</span><span style="color: blue; font-size: xx-small;"><b>]</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
      resp <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> HTTPReq<span style="color: blue; font-size: xx-small;"><b>.</b></span>Execute<span style="color: blue; font-size: xx-small;"><b>(</b></span><span style="color: blue; font-size: xx-small;"><b>)</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
      mem<span style="color: blue; font-size: xx-small;"><b>.</b></span>Position <span style="color: blue; font-size: xx-small;"><b>:</b></span><span style="color: blue; font-size: xx-small;">=</span> chunk<span style="color: blue; font-size: xx-small;">*</span>i<span style="color: blue; font-size: xx-small;"><b>;</b></span>
      TMemoryStream<span style="color: blue; font-size: xx-small;"><b>(</b></span>resp<span style="color: blue; font-size: xx-small;"><b>.</b></span>ContentStream<span style="color: blue; font-size: xx-small;"><b>)</b></span><span style="color: blue; font-size: xx-small;"><b>.</b></span>SaveToStream<span style="color: blue; font-size: xx-small;"><b>(</b></span>mem<span style="color: blue; font-size: xx-small;"><b>)</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
    <span style="color: red;"><b>end</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
    Image1<span style="color: blue; font-size: xx-small;"><b>.</b></span>Bitmap<span style="color: blue; font-size: xx-small;"><b>.</b></span>LoadFromStream<span style="color: blue; font-size: xx-small;"><b>(</b></span>mem<span style="color: blue; font-size: xx-small;"><b>)</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
  <span style="color: red;"><b>finally</b></span>
    mem<span style="color: blue; font-size: xx-small;"><b>.</b></span>DisposeOf<span style="color: blue; font-size: xx-small;"><b>;</b></span>
  <span style="color: red;"><b>end</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span>
<span style="color: red;"><b>end</b></span><span style="color: blue; font-size: xx-small;"><b>;</b></span></pre>
&nbsp;

&nbsp;
