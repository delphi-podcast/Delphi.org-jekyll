---
id: 2699
title: 'Using TMS Cloud Pack to Integrate Your Apps with the Cloud'
date: '2017-02-20T20:37:39-07:00'
author: 'Jim McKeeth'
excerpt: 'I’m a huge fan of the REST Client Components included with RAD Studio. They make it really easy to take advantage of the huge amount of REST services available online. The TMS Cloud Pack makes working with standard REST Services a breeze.'
layout: post
guid: 'http://delphi.org/?p=2699'
permalink: /2017/02/using-tms-cloud-pack-to-integrate-your-apps-with-the-cloud/
image: /assets/images/2017/02/1487647992_featured-400x198.jpeg
tags:
    - Cloud
    - FireMonk
    - iOS
    - macOS
    - TMS
---

<p dir="auto">I’m a huge fan of the REST Client Components included with RAD Studio. They make it really easy to take advantage of the huge amount of REST services available online.

Here is a quick video of me using the REST Client components to build a REST Client in 5 minuntes.</p>

<div class="video-container" style="clear: both; text-align: center;">[embed width="480" height="270"]http://www.youtube.com/watch?v=Rnuwgrt151g[/embed]</div>
<p dir="ltr"><a href="https://attendee.gotowebinar.com/rt/8526643784138245379"><img class="alignright" src="/assets/images/2017/02/Using-TMS-Cloud-Pack-to-Integrate-Your-Apps-with-the-Cloud.jpeg" width="400" height="400" align="right" /></a>One thing about more complex REST APIs is REST isn’t a strict protocol like SOAP, it is more of a philosophy in building an API. This usually means I spend a few hours looking at each REST API that I want to work with. Authentication is the thing that really changes from API to API.

That is where the TMS Cloud Pack comes it. They make working with some of the standard large APIs a breeze (get it, a breeze when I am talking about clouds!?!) You just need to setup an API account and get your API key and provide it to the component and it does the rest.

I got a license for <a href="http://www.tmssoftware.com/site/cloudpack.asp" target="_blank">TMS Cloud Pack</a> from <a href="http://www.tmssoftware.com/" target="_blank">TMS Software</a>. I was surprised at first that it didn’t work with FireMonkey. It turns out there is a seperate <a href="http://www.tmssoftware.com/site/tmsfmxcloudpack.asp" target="_blank">Cloud Pack for FMX</a>, although they offer a <a href="http://www.tmssoftware.com/site/tmscloudstudio.asp" target="_blank">Cloud Studio</a> that works with a variety of tools (including IntraWeb!)

When I started working with it I realized it made sense to have a different VCL and FMX version of the components because they include a browser window that is used when the user needs to authenticate for the OAuth services.

Besides the different browser window I found the FMX and VCL versions very simialr in functionality. So it is just a matter of what frameworks and platforms you want to work with since the FMX versions add support for macOS, iOS and Android in addition to the Windows support in the VCL version.

With the power and variety of REST APIs available today, you really should look at leveraging them in your apps, and if it is one of the APIs that TMS supports, then you will want to use it!

If you are new to TMS Cloud Pack then join us for our <a href="https://attendee.gotowebinar.com/rt/8526643784138245379" target="_blank">webinar on Tuesday the 21st of February</a> and check out the TMS Cloud Packs in the GetIt Package manager.

See you online!</p>
<a href="https://attendee.gotowebinar.com/rt/8526643784138245379" target="_blank"><img class="aligncenter" src="/assets/images/2017/02/Using-TMS-Cloud-Pack-to-Integrate-Your-Apps-with-the-Cloud_1200x628px.jpg" width="600" height="314" align="middle" /></a>
