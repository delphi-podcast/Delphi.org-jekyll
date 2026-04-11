---
id: 1517
title: 'REST and the Kimono'
date: '2014-02-03T20:35:03-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1517'
permalink: /2014/02/rest-and-the-kimono/
categories:
    - News
tags:
    - News
    - REST
    - TRESTClient
---

I love the new TRESTClient components in XE5. Especially the ability to visual bind a REST datasource with the use of the TRESTResponseDataSetAdapter. Now I find I'm always on the look out for new REST datasources. The REST Debugger makes the whole process really easy too.

The other day I hit the mother-load of REST datasources with <a href="http://www.kimonolabs.com/">Kimono Labs</a>. It is a creative web service that makes it easy to scrape a web site and turn it into a REST data source. It looks for repeating data on the page. Their free service is enough to get you started. I created a simple REST datasource of <a href="http://www.49ers.com/">San Francisco 49ers</a> games from <a href="http://www.49ers.com/schedule/season-schedule.html">their schedule on their web site</a>.

<a href="/assets/images/2014/02/kimonolabs.png"><img class="aligncenter size-full wp-image-1518" alt="kimonolabs.com" src="/assets/images/2014/02/kimonolabs.png" width="879" height="741" /></a>A few tips for working with the Kimonolabs REST API.
<ul>
	<li>Make sure the web data doesn't include hyperlinks - if it does, then the REST data will include objects containing the href and the text, which doesn't map to a grid well.</li>
	<li>Use <strong>results.collection1</strong> as your root element in the TRESTResponseDataSetAdapter and you are off to the races.</li>
	<li>It doesn't work with every web page because of malformed pages, but it works with a lot of them.</li>
	<li>There is no way to edit your API once you've finished it (yet), so you end up deleting and recreating it a few times.</li>
</ul>
They have a lot of videos and tutorials on their site walking you through how to use their service. Take a look and I'm looking forward to your REST enabled apps!

&nbsp;

&nbsp;
