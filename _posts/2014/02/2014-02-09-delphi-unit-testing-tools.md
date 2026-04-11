---
id: 1541
title: 'Delphi Unit Testing Tools'
date: '2014-02-09T20:56:58-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1541'
permalink: /2014/02/delphi-unit-testing-tools/
tags:
    - 'Code Coverage'
    - 'Delphi Mocks'
    - DUnit
    - DUnitX
    - 'mock objects'
    - 'unit test'
    - 'unit testing'
    - webinar
---

Recently I was discussing with some friends if <a href="http://www.npr.org/blogs/alltechconsidered/2014/01/25/266162832/computers-are-the-future-but-does-everyone-need-to-code">everyone should learn to code</a> and one friend said "I think everyone should learn to write <em>unit tests</em>." I was reading Nick Hodges' <a href="https://leanpub.com/codingindelphi"><em>Coding In Delphi</em></a> book (<a href="http://www.embarcadero.com/radoffer">available free when you buy XE5</a>) in the chapter on Unit Tests and my son asked me about it. In trying to explain it to him, my son was convinced it was a great idea and wanted to know why everyone didn't do unit testing. Good question.

This month, for our RAD-In-Action webinar series we have Nick Hodges talking about <a href="http://forms.embarcadero.com/DelphiUnitTesting2-12">Unit Testing in Delphi</a>. If you sign up to attend the event you get a copy of the chapter on unit testing from Nick's book. It is a good one.

<a href="http://forms.embarcadero.com/DelphiUnitTesting2-12"><img class="alignnone" alt="Wednesday, February 12, 2014" src="http://img.en25.com/EloquaImages/clients/Embarcadero/%7B2c89bf05-c1d6-4f77-909d-edf048696066%7D_RADInAction_DelphiUnitTesting_680x150.jpg" width="680" height="150" /></a>

This is sure to be a great event, and I highly recommend everyone makes time for it. In preparation for the event I thought I would list out some Delphi Unit Testing tools. These are covered in Nick's book, but I'll add my commentary here:
<ul>
	<li><a href="http://dunit.sourceforge.net/">DUnit</a>: The original unit testing framework for Delphi. It still ships with Delphi, and still works great.</li>
	<li><a href="http://dunit2.sourceforge.net/">DUnit2</a>: A fork of the original DUnit this is an alternative unit testing framework that is enhanced to work with the language features introduced in Delphi 2009.</li>
	<li><a href="https://github.com/VSoftTechnologies/DUnitX#dunitx-overview">DUnitX</a>: There are a lot of new language features in Delphi since DUnit was created. DUnitX is a whole new unit testing framework that takes advantage of these new language features to do some really cool things. MVP Robert Love has an excellent blog post about some of the <a href="http://robstechcorner.blogspot.com/2013/12/dunitx-and-my-plans.html">cool things you can do with DUnitX</a> and his plans and contributions.</li>
	<li><a href="https://code.google.com/p/delphi-code-coverage/">Delphi Code Coverage</a>: Curious how much of your code is covered by unit tests? This tool answers that question for you. There is a <a href="https://code.google.com/p/delphi-code-coverage-wizard/">wizard</a> that goes with it to integrate it into the IDE.</li>
	<li><a href="https://github.com/VSoftTechnologies/Delphi-Mocks#delphi-mocks">Delphi Mocks</a>: One of the tricks with unit testing is to separate dependencies, but if your code depends on a database or network socket, how do you test it by itself? Enter Mocks. A brilliant tool to let you test the independent units of code without dependencies.</li>
</ul>
One side not about unit testing is you actually don't need to use a framework, you just need to do it. Maybe there is another framework or tool you use, or you've developed your own in-house methodology. I'd love to hear about it, and I hope you join us <a href="http://forms.embarcadero.com/DelphiUnitTesting2-12">Wednesday for Nick's webinar</a>, and bring your questions. I've got a few myself.
