---
id: 2864
title: 'Exceptionally Bad Exception Abuse'
date: '2017-06-14T20:31:46-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2864'
permalink: /2017/06/really-bad-exception-abuse/
tags:
    - Architecture
    - Funny
---

<a href="http://codingindelphi.com"><img class=" wp-image-2409 alignright" src="/assets/images/2016/05/CodingInDelphiCover.png" alt="Nick Hodges' Coding In Delphi" width="179" height="232" /></a>I was reading <a href="http://www.codingindelphi.com/blog/">Nick Hodges</a>’ <a href="http://codingindelphi.com/">Coding in Delphi</a> again last night (insomnia). In chapter 1 on <em>Exception Handling</em> he opens talking about how <em>not</em> to use exceptions. It got me thinking about some of the atrocious exception usage I’ve seen. I thought I would share a few examples beyond the usual exception sins.
<h2>The Try / Except / Raise / Free Pattern</h2>
The documentation on the <b>Try / Except</b> pattern says that all the code after the <b>Except</b> block gets ran because the exception is handled. Additionally you can call <b>Raise</b> during the handler to send the exception further up the call stack.

I had just started a new job and was sitting with one of the <em>senior</em> developers to fix some bugs and get to know the codebase. He was creating a local object and so needed to free it. This is the pattern he used:

```delphi
sl := TStringList.Create;
try
  // using sl
except
  raise;
end;
sl.Free;
```

I looked at the code for a minute quizzically, and then asked why he did that. He explained that everything after the <b>except</b> always gets ran, so he can be sure the memory is freed, but still let the exception bubble up to the global exception handler so it is logged. I told him that I was pretty sure calling <b>raise</b> in the <b>except</b> block prevented the code after the block from being ran. He assured me he had been writing code like this for a <em>long time</em>, and it always works.

I thought about it a bit more and then suggested we test the code. So we made a little test application with a message after the <b>except</b> block, and forced it to raise an exception, and sure enough, the message didn't show. (Always test your theories and patterns with test code!)

There was a look of panic on his face. He'd been using this pattern for <em>years</em>, and it was all over multiple codebases. He claimed that the documentation must be wrong or it changed in a recent update, but I tried to assure him that is was clear and always worked that way, he just misunderstood.
<h2>Log ’em All and Let Support Sort ’em Out</h2>
This was using an early version of C# and WinForms.NET in Visual Studio. I took over a project and was having a hard time tracking down some odd behavior. Some code just wasn’t being ran, and there was no error messages. This was a project that was really, really early in the development process, and my first large scale project in C#, and I was getting really frustrated.

I finally discovered that an exception was being raised, but it was never showing up as an error. Even if the debugger was attached there was no exception message. The program just kept on running as if nothing happened, but the operation aborts. I started to question .NET’s ability to handle exceptions.

I dug and dug and finally figured out that the previous developer had setup a global exception handling and logging system that captured all the exceptions and logged them into the eventual support database with a detailed call stack. IIRC WinForms apps close automatically if there is an unhandled exception, so having an exception handler is a good idea, but silently logging them seems questionable. And then since there was an exception logging system in place the developer set the project options to have the debugger ignore all exceptions.

The result is an app running completely silent of exceptions, even while developing, but at least support will have a lot of debug information. I talked to the original developer, and he thought it was a brilliant idea, and said it is the first thing he does in all his projects. He just looks in the support database to see if things are working. His logic being users don't want to see error messages. Not sure how hiding all the error messages is a good idea, especially hiding them from the developer during development.
<h2>Exceptions as Robust Return Objects</h2>
I was maintaining some code where a previous developer built this system where custom Exception were used to return a complex type system. He built this impressive hierarchy of exception classes, and then only certain types of exceptions were handled at different levels, where the data was needed. So instead of methods returning a result, or modifying a passed value, they all just raised different exceptions, with the properties set to different values.

There are really two issues here in my opinion. The first is raising and handling exceptions is rather expensive. A better option would have been to just create plain old objects (or even interfaced objects) and return them as results. You can still examine their types and decide when to handle them. You would just need to be aware of managing the object lifecycle (the automatic lifecycle handling was his justification for using exceptions).

The second issue is this was just one subsystem of a larger project. It was only this subsystem that used this bizarre data management system. So when you were fixing a bug here there was a mental tax of wrapping your brain around the different architecture. As soon as you figure it all out, fix the bug, and move on to other code you go back to the normal way of thinking. Again paying the mental tax of forgetting the atrocity you just witnessed.

I really believe that in a large project there should be some consistency in how the pieces are architected unless there is a compelling reason to do things different in one subsystem. That makes it easier for developers to work in different parts of the system.
<h2 style="text-align: center;">So what are the craziest abuses of exceptions and exception handling you’ve seen?</h2>
By the way, Nick has a new book out on <a href="https://leanpub.com/dependencyinjectionindelphi">Dependency Injection in Delphi</a>. You should pick up a copy.<a href="https://leanpub.com/dependencyinjectionindelphi"><img class="aligncenter wp-image-2733" src="/assets/images/2017/02/Dependency-Injection-In-Delphi.jpg" alt="Nick Hodges' Dependency Injection In Delphi" width="203" height="264" /></a>
