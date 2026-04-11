---
id: 245
title: 'Update on Explore Tool'
date: '2008-09-25T23:59:33-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=245'
permalink: /2008/09/update-on-explore-tool/
podPressPostSpecific:
    - 'a:6:{s:15:"itunes:subtitle";s:15:"##PostExcerpt##";s:14:"itunes:summary";s:15:"##PostExcerpt##";s:15:"itunes:keywords";s:17:"##WordPressCats##";s:13:"itunes:author";s:10:"##Global##";s:15:"itunes:explicit";s:2:"No";s:12:"itunes:block";s:2:"No";}'
categories:
    - News
tags:
    - delphi
    - explore
    - News
    - tool
---

MikeG reported that he wasn't able to get the <a href="http://delphi.org/2008/09/screencast-1-adding-an-explore-tool/#comments">Explore Tool in Delphi</a> to work in XP.  I tried it on XP today and it worked fine.  It might be that something was missed.  Here is a nice reference of the important bits from that screen cast:

Go to <strong>Tools </strong>/ <strong>Configure Tools </strong>/ <strong>Add</strong>

<a href="/assets/images/2008/09/1-addingexploretool.png"><img class="alignnone size-medium wp-image-246" title="Adding an Explore Tool" src="/assets/images/2008/09/1-addingexploretool.png" alt="Adding an Explore Tool" /></a>

The Title can be anything you want.  The program is <strong>Explorer </strong>(the .exe is optional) and the parameters must be<strong> /select, $edname</strong> (be sure you remember the comma!)

That should do it for you to open an explorer window with the currently edited file selected.

<strong>Update</strong>: <a href="http://support.microsoft.com/kb/152457">More explorer parameters</a>.
