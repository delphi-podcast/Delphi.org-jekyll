---
id: 2155
title: 'How to Reference a Procedure'
date: '2015-11-06T10:33:34-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2155'
permalink: /2015/11/how-to-alias-a-procedure/
tags:
    - 'Source Code'
---

<blockquote>It was pointed out in the comments and <a href="https://plus.google.com/u/0/108684844040122144755/posts/2mRNUAamqnc">on G+</a> that this covers type aliases, but <strong>not</strong> <a href="https://en.wikipedia.org/wiki/Aliasing_%28computing%29">procedure aliases</a>. Instead it shows how to have a variable that references a procedure and then allows you to call it by this new variable. While I used alias as meaning "reference by a different name" it does in fact have a specific definition in this context. Sorry if there was any confusion or undue frustration at imprecise terminology.</blockquote>
I just answered a question about how to alias a procedure. I thought it was interesting enough to share here.

It is easy enough to alias a type . . .

[delphi]type
  my_integer = integer;
[/delphi]

then we can just use <em>my_interger</em> in place of <em>integer</em> as a type. But what about a <strong>procedure</strong> (or <strong>function</strong> for that matter)?

There are two different ways, depending on if the procedure is a member of a class. For straight up procedural procedures and functions it looks a little something like this:

[delphi]procedure HelloWorld; // declare our procedure
begin
  ShowMessage('Hi');
end;

var
  my_proc: Procedure; // declare our alias

begin
  my_proc := HelloWorld; // assign the alias
  
  // ...

  if assigned(my_proc) then // verify the reference
    my_proc; // call the alias
end;[/delphi]

This is pretty straight forward. We just create an <del>alias</del> reference variable of the right type, and assign it to the procedure we want to <del>alias</del> reference. If you call an <del>alias</del> reference variable that is unassigned you will get a null reference access violation.

You can also streamline it a little like this

[delphi]var // or as const
  my_proc: procedure = HelloWorld;[/delphi]

Then you know it is assigned. I guess this would be useful if you want to <del>alias</del> reference a procedure declared in a different unit.

This works the same for functions or procedures with parameters.

[delphi]procedure Hello(name: String);
begin
  ShowMessage('Hello ' + name);
end;

function Nine: integer;
begin
  Result := 9;
end;

var
  argumentative: procedure(s: string) = Hello;
  number: function: integer = Nine;[/delphi]

Notice that the name of the argument doesn't have to match, but the number, order and types do. If they don't then you will get the error
<blockquote>E2009 Incompatible types: 'Parameter lists differ'</blockquote>
Now what if you are dealing with procedures or functions that are members of an object? If you try to assign them to the above types you will get the error
<blockquote>E2009 Incompatible types: 'regular procedure and method pointer'</blockquote>
And that is because members of an object are method pointers. Fear not, you can handle them with just a slightly different type declaration:

[delphi]type
  TMethod = procedure of object;
  TFunc = function: integer of object;
  TNotifyEvent = procedure(Sender: TObject) of object;[/delphi]

In this case they are declared as types with "of object" added to the end. This indicates that they are procedures of an object. AKA members or method pointers.

You can read more about <a href="http://docwiki.embarcadero.com/RADStudio/en/Procedural_Types">procedural types and method pointers in the DocWiki</a>.

Why would you want to do any of this? First of all, the method pointer is how the VCL &amp; FMX handles dependency injection through <a href="http://docwiki.embarcadero.com/RADStudio/en/Event_Handlers">event handlers</a>. This is also really useful when combined with <a href="http://docwiki.embarcadero.com/RADStudio/en/Anonymous_Methods_in_Delphi">anonymous methods</a> and the <a href="http://docwiki.embarcadero.com/RADStudio/en/Using_the_Parallel_Programming_Library">parallel programming library</a>.
