---
id: 1693
title: 'Clone from GitHub in Delphi IDE'
date: '2014-05-23T04:39:48-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1693'
permalink: /2014/05/clone-from-github-in-delphi/
categories:
    - News
tags:
    - News
---

There are a lot of interesting Delphi projects showing up on <a href="http://www.GitHub.com/">GitHub</a>. GitHub offers a convenient <strong>Download ZIP</strong> function, not to mention a very easy to use <a href="https://windows.github.com/">Windows Desktop Client</a> that has full support for managing local repositories, syncing them to GitHub and accessing GitHub projects via <strong>Cloning in Desktop</strong>.

Sometimes it is nice to just open the project in your <a href="http://www.embarcadero.com/products/rad-studio">IDE of choice</a> directly from GitHub. Turns out this is just as easy as 1-2-3. Right above the <em>Clone in Desktop</em> and <em>Download ZIP</em> buttons there is a <strong>checkout URL</strong> with support for Subversion. Simple click Subversion, then click copy URL and your can then open the GitHub project directly from the Delphi or RAD Studio IDE.

<a href="/assets/images/2014/05/github-subversion.png"><img class="aligncenter size-large wp-image-1694" src="/assets/images/2014/05/github-subversion-1024x740.png" alt="github-subversion" width="620" height="448" /></a>

This maintains the revision history locally so you can browse it from the history tab, but it doesn't appear to allow checking changes back in.

You probably want to update the SVN client RAD Studio uses. This is easy enough too. Just download and install the <a title="Colab Subversion" href="http://www.collab.net/downloads/subversion">Colab SVN 32-bit Windows client</a> (don't get 64-bit or Edge) and install it normally. Then edit your Registry and browse to "HKEY_CURRENT_USER\Software\Embarcadero\BDS\14.0\Subversion" and add a string value named SvnDllDir. This value of SvnDllDir should be the path to your SVN client install. Something like "C:\Program Files (x86)\Subversion Client" (without the quotes).

If you don't like the fact the Colab Subversion site requires a login, there are other sources for download the Subversion command-line client. Just be sure you get the 32-bit version since the IDE is 32-bit. You may have luck with with the command-line tools that come with <a href="http://tortoisesvn.net/">TortoiseSVN</a>, or I've tested it with the <a href="http://svn-ref.assembla.com/download-clients.html">Command-line client from Assembla</a> and found it worked fine.
