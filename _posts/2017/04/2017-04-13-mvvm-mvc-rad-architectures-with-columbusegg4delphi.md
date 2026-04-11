---
id: 2799
title: 'MVVM-MVC-RAD Architectures with ColumbusEgg4Delphi'
date: '2017-04-13T15:48:58-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2799'
permalink: /2017/04/mvvm-mvc-rad-architectures-with-columbusegg4delphi/
tags:
    - Architecture
---

Loosely coupled is good. We don't want our business logic and data access all mixed together, that makes our code harder to maintain. But we all love RAD and being able to create our applications quickly. Drop some components on the form, set some properties and write a little code and we are done! Unfortunately we usually end up with tightly coupled code.

Most architectures I've seen for keeping everything separated results in needing to write all the data binding manually. You still get to design your forms with the visual designer, but missing the data binding kind of sucks.

<a href="https://www.youtube.com/watch?v=vmVVFEkiYtk"><img class="alignnone size-large" src="https://community.embarcadero.com/uploads/390/webinar_banners/Modern-Delphi-Architectures_784x295px.jpg" alt="Modern Delphi Architectures" width="784" height="295" /></a>

That all changes with <a href="http://www.danieleteti.it/">Daniele Teti</a>'s <a href="https://github.com/danieleteti/columbusegg4delphi">ColumbusEgg4Delphi</a>. It lets you build loosely coupled applications where the business logic, data access and user interface are all kept separately, but you still get to use all those great RAD design tools. Daniele did a <a href="https://www.youtube.com/watch?v=vmVVFEkiYtk">Modern Delphi Software Architectures webinar</a> where he introduced ColumbusEgg4Delphi and explained how it works. You can catch the <a href="https://www.youtube.com/watch?v=vmVVFEkiYtk">replay here</a> . . . .

https://www.youtube.com/watch?v=vmVVFEkiYtk

The first 10 minutes explains the need for ColumbusEgg4Delphi, then after that he explains how it works and shows a great example and answers questions.

Is ColumbusEgg4Delphi perfect? I don't know, but it is a huge step in the right direction.

Check out Daniele Teti's <a href="http://www.danieleteti.it/">blog</a> and his <a href="http://www.bittimeprofessionals.it/">company site</a>, his <a href="http://www.danieleteti.it/delphi-mvc-framework/">MVC framework</a>, as well as <a href="http://www.danieleteti.it/delphi-cookbook/">his books</a>.
