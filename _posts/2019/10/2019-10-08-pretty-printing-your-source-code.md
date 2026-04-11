---
id: 3419
title: 'Pretty Printing Your Source Code'
date: '2019-10-08T17:33:10-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=3419'
permalink: /2019/10/pretty-printing-your-source-code/
image: /assets/images/2019/10/Header-940x198.png
categories:
    - News
tags:
    - News
    - presentations
    - screenshot
    - 'Source Code'
    - tools
---

<p>A picture is worth a thousand words, but how do you include source code in a presentation? By text or by image?</p>

<p><a href="https://www.facebook.com/nick.hodges/posts/10156126437796627">Nick Hodges asked about this on Facebook</a> the other day. (post is gone)</p> 

<p>Here are some of the suggestions from the community (with my commentary), followed by a few of my suggestions.</p>

<ul><li><strong>Robert Love</strong> suggested <a href="https://slides.com/">Slides.com</a> - it is a paid web based presentation service centered around web standards. It includes built in features for making your code snippets look nice. Pro: Includes the code as text. Con: One more monthly fee (there is a free plan).</li><li><strong>Glenn Dufke</strong> suggested pasting the code with Syntax Highlighting preserved - By default the RAD Studio/Delphi IDE doesn't maintain this, but the <a href="http://www.gexperts.org/">GExperts</a> IDE Plugin has a Source Code Export expert (I used to use this). I'm sure there are others (<a href="http://www.cnpack.org/">CnPack</a> maybe?)</li></ul>

<div class="wp-block-image"><figure class="aligncenter"><img src="http://www.gexperts.org/tour/source%20export.png" alt="Source Export"/><figcaption><a href="http://www.gexperts.org/">GExperts </a>Source Export Export</figcaption></figure></div>

<ul><li><strong>David Schwartz </strong>suggested just doing a screenshot from the IDE - this preserves your artistic view of how you have your IDE configured. Downside is the code can't be easily extracted from the slides . . . </li><li><strong>Bruce McGee</strong> suggested <a href="https://revealjs.com/">reveal.js</a> - I've not used it yet, but it is a full web standard presentation framework, and looks <a href="https://wsmoak.net/2015/09/16/presenting-source-code.html">promising</a>. It uses <a href="https://highlightjs.org/">highlight.js</a> for the syntax highlighting, which I have used. With support for 185 languages, it has you covered. I'll certainly be checking that one out. Thanks Bruce!</li></ul>

<p>Now for my suggestions. In the past I've used the rich export options like Glenn suggested, colorized the text by hand, or used an intermediary like Notepad++, etc. But here are some options specifically around creating code screenshots. </p>

<div class="wp-block-image"><figure class="alignright is-resized"><img src="/assets/images/2019/10/image.png" alt="" class="wp-image-3428" width="75" height="75"/></figure></div>

<p><strong><a href="https://getgreenshot.org/">Greenshot</a></strong> - is my current preferred desktop screenshot tool for pulling images directly from the IDE. It includes a nice editor for your screenshots too, so you can quickly annotate them, blur things out, etc.</p>

<div class="wp-block-image"><figure class="aligncenter is-resized"><img src="/assets/images/2019/10/image-1.webp" alt="" class="wp-image-3429" width="403" height="463"/><figcaption><a href="https://getgreenshot.org/"><strong>Greenshot </strong></a>screen shot image editor</figcaption></figure></div>

<div class="wp-block-image"><figure class="alignright"><img src="/assets/images/2019/10/image-3.png" alt="" class="wp-image-3431"/></figure></div>

<p><a href="https://carbon.now.sh/"><strong>Carbon.now.sh</strong></a> is a web page that takes your code and converts it into a nice image with a macOS style window. There are a few customization options. If you embed it or share it via <a href="https://carbon.now.sh/?bg=rgba(171%2C%20184%2C%20195%2C%201)&amp;t=oceanic-next&amp;wt=none&amp;l=pascal&amp;ds=true&amp;dsyoff=20px&amp;dsblur=68px&amp;wc=true&amp;wa=true&amp;pv=56px&amp;ph=56px&amp;ln=false&amp;fl=1&amp;fm=Hack&amp;fs=14px&amp;lh=133%25&amp;si=false&amp;es=2x&amp;wm=false&amp;code=unit%2520CodeRage2019%253B%250A%250Auses%250A%2520%2520Delphi%252C%2520CppBuilder%252C%2520InterBase%252C%2520VCL%252C%250A%2520%2520FireMonkey%252C%2520FireDAC%252C%2520RAD%2520Server%252C%2520DataSnap%252C%2520OTA%252C%250A%2520%2520Windows%252C%2520macOS%252C%2520Android%252C%2520iOS%252C%2520Linux%252C%2520IoT%253B%250A%250Atype%250A%2520%2520TAttendee%2520%253D%2520class(TProgrammer)%250A%2520%2520private%250A%2520%2520%2520%2520FSkills%253A%2520Extended%253B%250A%2520%2520public%250A%2520%2520%2520%2520procedure%2520Attend%253B%250A%2520%2520published%250A%2520%2520%2520%2520property%2520Skills%253A%2520Extended%2520read%2520FSkills%2520write%2520FSkills%253B%250A%2520%2520end%253B">URL</a> then it provides both the source code and the preview. It doesn't list Delphi as a language, but the Pascal support is <em>close enough</em>.</p>

<figure class="wp-block-image is-resized"><img src="https://i2.wp.com/delphi.org/assets/images/2019/10/carbon.png?fit=640%2C365" alt="" class="wp-image-3423" width="640" height="365"/><figcaption>Sample from  <a href="https://carbon.now.sh/">Carbon.now.sh</a> </figcaption></figure>

<div class="wp-block-image"><figure class="alignright"><img src="/assets/images/2019/10/image-5.png" alt="" class="wp-image-3433"/></figure></div>

<p><strong><a href="https://codeimg.io/">Codeimg.io</a></strong> is similar to Carbon, but has more configuration options. The best part is that you can use templates sized exactly for different social media platforms. A lot more customization options, including both Windows and macOS window styles. It doesn't appear to offer a share by URL or embed option, and only does the image generation. For some reason it defaults to a JPG instead of a PNG for the image though (also supports SVG). Newer addition and still in beta.</p>

<figure class="wp-block-image"><img src="/assets/images/2019/10/CodeRage-1.png" alt="" class="wp-image-3425"/><figcaption> <a href="https://codeimg.io/">Codeimg.io</a></figcaption></figure>

<div class="wp-block-image"><figure class="alignright is-resized"><img src="/assets/images/2019/10/image-6.png" alt="" class="wp-image-3434" width="261" height="92"/></figure></div>

<p><a href="https://team411.github.io/src2img/"><strong>src2img</strong></a> is a no-nonsense straightforward converter that turns out Source into a PNG file. Just select language (auto detects Delphi) and style. It is based on <a href="https://highlightjs.org/">highlight.js</a> and the <a href="https://github.com/team411/src2img/">source is on GitHub</a>. Doesn't offer a link share, just image download.</p>

<div class="wp-block-image"><figure class="aligncenter"><img src="/assets/images/2019/10/src2img-CodeRage.png" alt="" class="wp-image-3426"/><figcaption> <a href="https://team411.github.io/src2img/"><strong>src2img</strong></a> </figcaption></figure></div>

<div class="wp-block-image"><figure class="alignright is-resized"><img src="/assets/images/2019/10/image-7.png" alt="" class="wp-image-3435" width="88" height="88"/></figure></div>

<p><strong><s>Instacode</s></strong> was the Instagram of the bunch, with image filters like tilt shift and 3D rotation. Directly supports Delphi language, and you can share a URL <s>http://instaco.de/119239?remix=119237</s> that allows someone to access the code and remix the image. Even has wallpaper generator. </p>

<div class="wp-block-image"><figure class="aligncenter"><img src="http://instaco.de/stream/119239" alt=""/><figcaption><a href="http://instaco.de/119239?remix=119237">Instacode</a></figcaption></figure></div>

<p>Lastly, if you have some <strong>Photoshop </strong>skills (or can follow tutorials like I do) then you can make your own. This is a combination of screenshots, with perspective warps, a few filters, background images, etc. </p>

<p>Did I mention <strong>CodeRage 2019 </strong>is coming soon? </p>

<figure class="wp-block-image"><img src="https://i2.wp.com/delphi.org/assets/images/2019/10/CodeRage-2019.png?fit=640%2C360" alt="" class="wp-image-3427"/></figure>

<p>How do you pretty print your source code? Which of the above is your favorite, or what did I miss?</p>

