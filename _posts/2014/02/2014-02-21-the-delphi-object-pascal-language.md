---
id: 1567
title: 'The Delphi Object Pascal Language'
date: '2014-02-21T12:02:11-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1567'
permalink: /2014/02/the-delphi-object-pascal-language/
tags:
    - Commentary
    - delphi
    - Language
    - 'object pascal'
    - Pascal
---

<blockquote>What's in a name? That which we call a rose
By any other name would smell as sweet;</blockquote>
The other day I noticed <a href="http://Github.com">Github</a> has a language choice for <a href="https://github.com/search?l=Pascal&amp;q=delphi&amp;ref=cmdform&amp;type=Repositories">Pascal, but not Delphi</a>. It turns out originally they had Delphi listed as a language, but some of the Delphi clones were getting marked as Delphi, so they <a href="https://github.com/github/linguist/pull/677">renamed it to the more generic Pascal</a>. Which immediately resulted in people requesting they rolled it back.

This brings up a good question though, "What is Delphi and what is Object Pascal?" Interestingly there were three implementations of <a href="http://en.wikipedia.org/wiki/Object_Pascal">Object Pascal</a> that evolved from the original Pascal. The one we are all familiar with was designed at Borland as part of Turbo Pascal. Apple also designed one consulting with <a href="http://en.wikipedia.org/wiki/Niklaus_Wirth">Nicholas Wirth</a>. And there was the Think Pascal IDE with it's own flavor.

The Borland flavor of Object Pascal evolved into the language we see in Delphi today, while the other two faded away. There actually exists a few other <a href="http://en.wikipedia.org/wiki/Object_Pascal#Versions">variations of Object Pascal</a>, most all of which were inspired by the language that still lives in Delphi today.

Personally I think it is exciting to see so many other tools and languages in the Object Pascal and Pascal space. That is part of what made C &amp; C++ so vibrant: All the other languages wanted to copy them (Java, JavaScript, C#, etc.)

So back to the question, "What is Delphi and what is Object Pascal." Object Pascal is the language that powers Delphi. Object Pascal can exist without Delphi, but part of what defines Delphi is it's Object Pascal language. Just in the same way C++Builder isn't the only implementation of C++, but part of C++Builder is the C++ language. So Delphi and C++Builder are each the whole package: Language + IDE + Compiler + Debugger + Libraries + Tools. You could say they are the definitive implementation of those languages.

Could we see Delphi with a different language? That would be interesting. At one end of the spectrum there was <a href="http://edn.embarcadero.com/article/34059">Delphi for PHP</a> (which evolved into HTML5 Builder.) It was Delphi's Rapid Application Development concept combined with the PHP language. And then Delphi Prism which used the Oxygene language variant of Object Pascal combined with Visual Studio and .NET.

In my opinion, Delphi is a specific version of Object Pascal, if for no other reason than because it has a fabulous runtime library and framework. Using Object Pascal without TStringList and all the other useful types, function and libraries that Delphi comes with wouldn't be much fun.
