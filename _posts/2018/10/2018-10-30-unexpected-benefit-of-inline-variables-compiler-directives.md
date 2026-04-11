---
id: 3196
title: 'Unexpected Benefit of Inline Variables: Conditional Blocks'
date: '2018-10-30T17:05:10-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=3196'
permalink: /2018/10/unexpected-benefit-of-inline-variables-compiler-directives/
categories:
    - News
tags:
    - '10.3 Rio'
    - 'clean code'
    - delphi
    - 'language features'
    - News
    - 'Source Code'
---

<p><a href="http://blog.marcocantu.com/blog/2018-october-inline-variables-delphi.html">Inline variables</a>&nbsp;is one of the cool new feature coming in 10.3. The obvious huge use case is loop control variables, but I just discovered another great use case while reviewing some code.&nbsp;</p>

<code>[delphi]procedure DoesSomething;
var
  var1, var2: Integer;
begin
  // use var1
  {$IFDEF Something}
  // use var1 &amp;amp;amp;amp;amp;amp; var2
  {$ENDIF Something}
end;[/delphi]</code>

<p>This is a pattern I see a lot, and it generates a hint on var2 being unused based on the current compiler directive status.</p>

<code>[dcc32 Hint] myUnit.pas(123): H2164 Variable 'var2' is declared but never used in 'DoesSomething'</code>

<p>Now there are a number of ways to deal with this with more compiler directives, which is what I've done in the past, but I never like adding more compiler directives. It makes the code way more complicated and harder to maintain. Now with Inline Variables I can simplify it, make it easier to maintain, and hande the hint! (all of which makes me so happy!)</p>

<code>[delphi]procedure DoesSomething;
var
  var1: Integer;
begin
  // use var1
  {$IFDEF Something}
  var var2: Integer;
  // use var1 and var2
  {$ENDIF Something}
end;[/delphi]</code>

<figure class="wp-block-image display: block; margin-left: auto; margin-right:"><img src="https://media.giphy.com/media/YZfqHzpjw1I40/giphy.gif" alt=""/><figcaption>Happy dance commencing in T-minus 10 seconds.&nbsp;</figcaption></figure>

<p>What are some interesting ways you see inline variables benefiting you?</p>

