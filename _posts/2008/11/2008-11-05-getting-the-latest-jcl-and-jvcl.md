---
id: 447
title: 'Getting the Latest JCL and JVCL'
date: '2008-11-05T21:12:05-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=447'
permalink: /2008/11/getting-the-latest-jcl-and-jvcl/
podPressPostSpecific:
    - 'a:6:{s:15:"itunes:subtitle";s:15:"##PostExcerpt##";s:14:"itunes:summary";s:15:"##PostExcerpt##";s:15:"itunes:keywords";s:17:"##WordPressCats##";s:13:"itunes:author";s:10:"##Global##";s:15:"itunes:explicit";s:2:"No";s:12:"itunes:block";s:2:"No";}'
categories:
    - News
tags:
    - 7zip
    - delphi
    - 'delphi 2009'
    - 'Delphi programming'
    - jcl
    - jedi
    - jvcl
    - News
    - sourceforge
    - svn
---

I went to install the latest <a href="http://homepages.codegear.com/jedi/jvcl/">JVCL</a> today for Delphi 2009.  I was surprised that <a href="http://delphi-jedi.org/">JEDI</a> stopped offering one download with both the <a href="http://homepages.codegear.com/jedi/jcl/">JCL</a> and JVCL.  So I downloaded both, installing JCL first since it is required by JVCL.  Well, JVCL gave me an error that I had the wrong version of the JCL installed.

So I went back to <a href="http://sourceforge.net/">Sourceforge</a> to look if I grabbed the wrong one.  Sure enough, I had the September 9th version of each.  I tried again, and it still didn't work.  So I figured I would get the latest from Subversion.  After I installed the subversion client I discovered links to download the latest versions via the subversion web interface as a tar.gz file (no need to connect via subversion.)  The links are not obvious, but really useful in my opinion, so I thought I would share them here:

[<strong>Check out the official daily link in the comments!</strong>]
<ul>
	<li><a href="http://jcl.svn.sourceforge.net/viewvc/jcl/trunk/jcl.tar.gz?view=tar">Latest JCL</a></li>
	<li><a href="http://jvcl.svn.sourceforge.net/viewvc/jvcl/trunk/jvcl.tar.gz?view=tar">Latest JVCL</a></li>
</ul>
One thing that is missing is the JVCL help, which you can <a href="http://sourceforge.net/project/showfiles.php?group_id=45786">download seperately</a> (along with demos, etc.)

If you don't have something that can open a tar.gz then get <a href="http://www.7zip.org/">7Zip</a>.  It does a two step process (extract the tar from the gz, then extract the files from the tar), but it gets the job done.

Hope that helps.  Maybe I missed something and there is an easier way to get these packages. . . .
