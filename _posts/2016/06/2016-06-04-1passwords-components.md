---
id: 2474
title: 'More on 1Password’s Components'
date: '2016-06-04T21:36:41-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2474'
permalink: /2016/06/1passwords-components/
image: /assets/images/2016/06/StefanVanAs-200x198.jpeg
categories:
    - News
tags:
    - Article
    - News
---

<a href="https://medium.com/@svanas/"><img class="alignright wp-image-2477" src="/assets/images/2016/06/StefanVanAs.jpeg" alt="Stefan van As" width="93" height="93" /></a>Stefan van As of <a href="http://community.embarcadero.com/article/news/16234-1password-for-windows-is-the-1st-winner-of-the-cool-app-contest-2">1Password fame</a> sent me a more exhaustive list of the libraries and tools used in 1Password. I thought I would share it with everyone. He also recently started <a href="https://medium.com/@svanas/">blogging about security, software development and Delphi</a>.

Here is an overview of the 3rd party components used in 1Password:
<ul>
 	<li><img class="alignright wp-image-2448" src="/assets/images/2016/05/1Password-300x300.png" alt="1Password" width="216" height="216" /><a href="https://msdn.microsoft.com/en-us/library/bb250436(v=vs.85).aspx">Browser Helper Objects (BHOs)</a> -- this is what powers 1Password inside Internet Explorer.</li>
 	<li><a href="https://developer.apple.com/bonjour/">Bonjour</a> -- this is what powers Wi-Fi Sync. (<a href="https://github.com/deltics/delphi.libs/tree/master/bonjour">here is an unrelated Delphi
implementation</a>)</li>
 	<li><a href="https://www.chilkatsoft.com/delphiDll.asp">ChilkatCrypt</a> -- this is what powers some of our crypto</li>
 	<li>MS Crypto -- this is the Pseudo Random Number Generator (PRNG)</li>
 	<li><a href="http://www.wikitaxi.org/delphi/products/sqlite3/index">DISQLite</a> -- Some of 1Password's features - such as Watchtower, for example - are utilizing SQLite. Because 1Password 4 is in Delphi 2007, we use DISQLite for that (today, it would be using FireDAC for that)</li>
 	<li><a href="http://dxgettext.po.dk/">dxgettext</a> -- this is used to localize 1Password. It works nicely with <a href="https://crowdin.com/">Crowdin</a>, a localization project management platform</li>
 	<li><a href="http://www.soft-gems.net/index.php/libs/graphicex-library">GraphicEx</a> and <a href="http://graphics32.org/">Graphics32</a> -- this gives (alpha channel) transparency</li>
 	<li>HyperString -- super fast string handling routines. (no longer available)</li>
 	<li><a href="http://docwiki.embarcadero.com/RADStudio/en/OpenSSL">OpenSSL</a> -- this is what powers PBKDF2 (among other crypto routines)</li>
 	<li><a href="http://www.esegece.com/websockets/">sgcWebSockets</a> -- The WebSockets are used with the Chrome and Firefox browser extensions</li>
 	<li><a href="http://www.streamsec.com/">StreamSec</a> -- another crypto library, mostly for SSL/TLS</li>
 	<li><a href="http://docwiki.embarcadero.com/CodeExamples/Berlin/en/ZLibCompressDecompress_(Delphi)">zlib</a> and <a href="http://destructor.de/libtar/index.htm">LibTar</a> -- for OS X-compatible compression routines</li>
</ul>
Also uses the following tools:
<ul>
 	<li><a href="https://www.eurekalog.com/">EurekaLog</a> -- For diagnostics reporting</li>
 	<li><a href="https://www.finalbuilder.com/finalbuilder">FinalBuilder</a> -- For build management</li>
 	<li><a href="http://www.jrsoftware.org/isinfo.php">Inno Setup</a> -- The installation wizard</li>
</ul>
A lot of great tools and libraries there.

