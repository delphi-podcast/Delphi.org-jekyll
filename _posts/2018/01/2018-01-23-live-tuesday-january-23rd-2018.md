---
id: 2980
title: 'LIVE! Tuesday, January 23rd, 2018'
date: '2018-01-23T10:20:55-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2980'
permalink: /2018/01/live-tuesday-january-23rd-2018/
tags:
    - podcast
    - 'Video podCast'
---

You can watch live right here:

[embed]https://www.youtube.com/watch?v=_a4jM938_9U&rel=0[/embed]

During this episode we discussed:
<ul>
 	<li>We set up our own RTMP instance on <a href="https://www.linode.com/?r=fb41cc68526abce4ffa14bfd797d5c4cc684f192">Linode</a> to bounce the 3 streams off of for the podcast. I used <a href="http://chapmanworld.com/brutally-build-your-own-server-script-brolly/">Craig's Brolly</a> script to setup the server, and followed <a href="https://obsproject.com/forum/resources/how-to-set-up-your-own-private-rtmp-server-using-nginx.50/">this guide</a>. I used my local machine that I was streaming from to composite as well, which may have been stressing out the poor MacBook. I'll try adding another computer to the mix next time, possibly an <a href="https://aws.amazon.com/workspaces/">Amazon Workspace</a> instance like we did for <a href="https://www.embarcaderoacademy.com/p/coderage-xii">CodeRage</a>.</li>
 	<li>The Delphi powered game <a href="http://store.steampowered.com/app/391140/Blastoff/">Blast-Off</a> launched yesterday on Steam. It is a lot of fun and <a href="https://www.youtube.com/watch?v=Ks1T_zpQpZw&amp;rel=0">looks beautiful</a>.
[embed]https://www.youtube.com/watch?v=Ks1T_zpQpZw&rel=0[/embed]</li>
 	<li>Speaking of beautiful games created with Delphi, check out some of the latest videos by <a href="https://www.youtube.com/channel/UCtVUeGHNoJPQBT_4Xjj0jmg">Zudomon</a> showing off the game he is developing in Delphi. You can support it on <a href="https://www.patreon.com/Zudomon/">Patreon</a> or follow along on the <a href="https://www.facebook.com/StoneQuest.Game/">Facebook developer page</a>.[embed]https://www.youtube.com/watch?v=ujmBCE45j-w&amp;rel=0[/embed]</li>
 	<li>The team over at <a href="https://blog.grijjy.com/">Grijjy</a> has an open source <a href="https://github.com/grijjy/GrijjyCloudLogger">Cross Platform Cloud Logger</a> available git the GetIt packet manager or on GitHub. The Broker and LogViewer run on Windows, but the client logging code works on Android, iOS, Linux, macOS, and Windows. It has a lot of great features and is very useful.</li>
 	<li>There is an art and a science to writing good questions. Eric S. Raymond started it with his <a href="http://www.catb.org/esr/faqs/smart-questions.html">How to Ask Questions the Smart Way</a> back in 2004. I created a blog post Jon Skeet of Stack Overflow fame also made a blog post about <a href="https://codeblog.jonskeet.uk/2010/08/29/writing-the-perfect-question/">Writing the Perfect Question</a>, which he shorted into a <a href="https://meta.stackoverflow.com/questions/260648/stack-overflow-question-checklist">checklist</a> on Stack Overflow Meta. I've got a <a href="http://delphi.org/2014/08/how-to-get-answers-to-your-questions/">blog post on the subject</a> as well. Following these steps are also good troubleshooting too.
<img src="/assets/images/2014/08/Weve-tried-nothing-and-were-all-out-of-ideas.jpg" alt="We've tried nothing and we're all out of ideas." /></li>
 	<li>We also discussed some DevOps best practices
<ul>
 	<li>You need a literal backup of all the machines</li>
 	<li>Keep all your code in source control</li>
 	<li>Be sure you also have an offsite backup</li>
 	<li>You need to be able to rebuild your development machine quickly
<ul>
 	<li>This includes bringing up a new developer</li>
 	<li>Same process is used to set up a dedicated build machine</li>
</ul>
</li>
 	<li>If you use a database, you don’t have a database unless you have a script to rebuild it, and it is in source control
<ul>
 	<li>A script or some other system to manage the schema and lookup tables</li>
 	<li>Versionable</li>
</ul>
</li>
 	<li>Use Virtual Machines to manage development environments
You should have a dedicated build server - this proves your process to build a development machine works</li>
 	<li>Might as well setup CI too</li>
</ul>
</li>
 	<li>When discussion version control hosting consider the following:
<ul>
 	<li><a href="https://github.com/"><strong>GitHub</strong></a> has free open source repositories with free collaborators, but you can pay for private repositories</li>
 	<li><a href="https://bitbucket.org/"><strong>BitBucket</strong></a> has free private repositories, and Jira integration, but you pay for collaborators</li>
 	<li><a href="https://sourceforge.net/"><strong>SourceForge</strong></a> just launched a huge new update</li>
 	<li><strong><a href="https://gitlab.com">GitLab</a></strong> is an exciting new alternative that also allows free self hosting</li>
</ul>
</li>
</ul>
