---
id: 1655
title: 'Where is StringToJString and StrToNSStr in XE6?'
date: '2014-05-06T07:38:27-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1655'
permalink: /2014/05/where-is-stringtojstring-and-strtonsstr-in-xe6/
categories:
    - News
tags:
    - News
---

The useful helper routines <strong>StringToJString</strong> and <strong>StrToNSStr</strong> (and other associated ones) moved between XE5 and XE6. In XE6 you can find them in the units <strong>Androidapi.Helpers</strong> and <strong>Macapi.Helpers</strong> respectively. But how to find other useful methods? I'll tell you what I do: <em>Use Windows Search</em>.

You want to go to Indexing Options to set Windows Search up to be useful.

<img class="aligncenter size-full wp-image-1656" src="/assets/images/2014/05/Indexing-Options.png" alt="Windows Search Indexing Options" width="589" height="673" />

First select <strong>Modify</strong> and browse to the Source folder and add it to the list of indexed locations. I like to add the source folder as a favorite in Explorer too, to make it easier to get back there.
<blockquote>C:\Program Files (x86)\Embarcadero\Studio\14.0\source</blockquote>
Next click <strong>Advanced</strong> and go to the <strong>File Types</strong> tab and select <strong>.PAS</strong> file and any other file types you would like to have indexed, and change them to <strong>Index Properties and File Contents</strong>. It uses the plain text filter, which in my experience is good enough, and your only option (without installing a new one).

<img class="aligncenter size-full wp-image-1657" src="/assets/images/2014/05/Indexing-Options-Advanced.png" alt="Indexing Options - Advanced - File Types" width="460" height="608" />

It takes a bit for the index to rebuild, but after that you can quickly search all of the XE6 source to find APIs, Helper Methods or any number of other useful code to aid in your development process. This is where that favorite to the source folder is helpful. Either search from the root of the source folder, or browse into a subfolder to only search specific source files.

There are other indexed searching utilities, and I've used many of them in the past. The advantage of Windows Search (probably it's only advantage) is that it is built in and already running.
