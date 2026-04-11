---
id: 3094
title: 'Use the Source!'
date: '2018-06-24T04:57:23-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=3094'
permalink: /2018/06/use-the-source/
categories:
    - News
tags:
    - News
    - search
    - 'search engines'
    - 'Source Code'
---

One of the great things about Delphi is not only is it written in Delphi (mostly), but it ships with the VCL, RTL, &amp; FMX source code. You can use this source code in lots of different ways, which I'll cover in a bit, but sometimes it is a matter of finding the source file with the code you want. There are over 2,234 Delphi source files in the source folder, so it can take a while to find the right file if you don't know where to look. Not to mention the 1,711 C files, and a few thousand other assorted files.

<img class="aligncenter wp-image-3095" src="/assets/images/2018/06/Source-Files.png" alt="Source Folder Files" width="408" height="200" />

I used to use various GREP and full text searching tools to find the code I was looking for, but then I realized Windows 10 (and earlier versions) has a search function built into it, but you need to make a few configuration changes to use it effectively. So I thought I would outline those for you.

Your source folder is usually located in
<strong>C:\Program Files (x86)\Embarcadero\Studio\19.0</strong>
but it might be different depending on your installation. I usually Pin it to Quick Access, which makes it easy to access since I find I'm there a lot.

<img class="aligncenter wp-image-3096" src="/assets/images/2018/06/Source-Folder.png" alt="Source Folder" width="500" height="416" />
<h1>Windows Search and Indexing Options</h1>
The next thing to do is configure your Indexing Options. This is what makes it quick to search for files you need. You can find Indexing Options in Control Panel, or just <strong>runcontrol.exe srchadmin.dll</strong>.

<img class="aligncenter wp-image-3097" src="/assets/images/2018/06/srchadmin.png" alt="control.exe srchadmin.dll" width="350" height="204" />

There are two steps to get the most out of Windows search for your source code. The first is you need to activate Windows search for the file extensions you want, and the second it to tell it to index your folders.

<img class="aligncenter wp-image-3098" src="/assets/images/2018/06/IndexingOptions.png" alt="Indexing Options" width="450" height="476" />

To add PAS files to indexing click <strong>Advanced</strong> and go to <strong>File Types</strong>. You can just type PAS in the list of file types and it will find it for you. You don't need to add a new extension. PAS files are already listed, but just not indexed by default. Just put a check next to it, and change the "How should this file be indexed?" to "Index Properties and File Contents" that will index all the text contents of the file

<img class="aligncenter wp-image-3100 " src="/assets/images/2018/06/IndexingFileTypes.png" alt="Indexing File Types" width="382" height="472" />

By default all your user folders are indexed, but Source is in your Program Files folder, so you need to explicitly add it. From the main Indexing Options window click <strong>Modify</strong> and from there you can add any folder you want to search.

<img class="aligncenter wp-image-3102" src="/assets/images/2018/06/IndexedLocations.png" alt="Indexed Locations - Source" width="400" height="553" />

It takes a while a while to build and update the index after this change. You just gave it 2,000 more files to index. It has to read all the text out of them, which takes a while. Once it is done then just go to your source folder and use the search box to quickly find the code you are looking for.

<img class="aligncenter size-full wp-image-3105" src="/assets/images/2018/06/SearchResults.png" alt="Search Results" width="1720" height="755" />
<h1>Everything Search</h1>
<a href="https://www.voidtools.com/"><img class="alignright size-full wp-image-3104" src="/assets/images/2018/06/EverythingIcon.png" alt="Everything Software Icon" width="48" height="48" /></a>Another great tool to use, to search by file name is the <a href="https://www.voidtools.com/">Everything desktop search engine</a> by Voidtools. The thing I love about using Everything is it searches all the file names on your system quickly. The difference between it and Windows Search is Everything only searches the file names, but it searches all the file names.

<img class="aligncenter size-full wp-image-3103" src="/assets/images/2018/06/EverythingSearch.png" alt="Everything Search" width="1540" height="961" />

I find I usually remember the name of a file, but not exactly where I left it. This makes Everything indispensable for me.
<h1>Using the Source</h1>
So how useful is it that Delphi, RAD Studio and C++Builder includes all this source code? What all can you do with it?
<ul>
 	<li><strong>Finding that function</strong> - You know how I said I can remember the name of a file, but not where I put it? I do the same things with classes and functions. I can remember the name of the method or class, but not which unit it is in. Being able to search all of the source instantaneously to find the source file you need is a huge help.</li>
 	<li><strong>Learning</strong> - Just reading source isn't the best way to learn to program, but having access to the source code is a great way to gain a deeper understanding.</li>
 	<li><strong>Debugging</strong> - Sometimes your program doesn't behave the way you expect it to. When all you have is a blackbox then you are unable to figure out what is happening behind the scenes. When you have the source code you can not only see how that method is implemented, but also debug into the source code, using all the great debugger features.</li>
 	<li><strong>Adding New Features</strong> - Maybe there is a new API that was just released, or you need to access an obscure API or 3rd party feature. Since you have access to all the source you can see how other similar APIs are accessed and use that as a roadmap.</li>
 	<li><strong>Fixing or Changing Functionality</strong> - One man's bug is another man's feature. Sometimes there are bugs you need to fix in the shipping source code, other times you just want to change the way things work. For small changes I just copy the source file out into my project directory. Then my code will use my modifications instead of the original implementation. While you can't redistribute changed source code, you can compile the code into your program. If you do need to share your changes or fixes you can share a change-set that only contains your changes.</li>
</ul>
<h1><em>What else do you use the source for?</em></h1>
