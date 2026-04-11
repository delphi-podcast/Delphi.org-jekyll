---
id: 1553
title: 'Hidden features in the Delphi Object Pascal language'
date: '2014-02-20T15:19:01-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1553'
permalink: /2014/02/hidden-features-in-the-delphi-object-pascal-language/
tags:
    - Commentary
    - delphi
    - 'object pascal'
    - 'Programming Languages'
    - stackoverflow
---

A list of hidden features in Delphi Object Pascal that are great, obscure, best avoided or remarkable.

This was copied from <a href="http://stackoverflow.com/questions/6063274/hidden-features-in-the-delphi-language">Stack Overflow's question of the same name</a> which is closed and flagged for deletion. Licensed under <a href="http://creativecommons.org/licenses/by-sa/3.0/" rel="license">cc by-sa 3.0</a> with <a href="http://blog.stackoverflow.com/2009/06/attribution-required/" rel="license">attribution required</a>. I've made a few changes, updates and some copy editing. Original question by <a href="http://stackoverflow.com/users/650492/johan">Johan</a> and others on <a href="http://stackoverflow.com/revisions/6063274/1">May 19 2011 at 18:34</a>. Post inspired by <a href="http://wiert.me/2014/02/20/hidden-features-in-delphi-related-topics-from-stackoverflow-until-the-diamond-moderators-kill-these-too/">Jeroen W. Pluimers'</a> post.

<!--more-->

<hr />

<a href="http://stackoverflow.com/users/121689">David M</a> added:

My favourite (although I don't know if I have ever written code that uses this) is how you can <a href="http://docwiki.embarcadero.com/RADStudio/en/Using_Implements_for_Delegation"><strong>delegate implementation of an interface 'supported' by a class to one of the class's properties</strong></a>. In a pure OO design sense, I don't know if this is awful or beautiful - you're basically lying about what your class's methods are - but in a code cleanliness and separation sense it's awesome.

For example (untested, written from memory):

[delphi]type
IFoo = interface
['{3F996D68-1FD0-4490-AE60-8F735A9DFFE8}']
    function TheQueensHead: Byte; // Geddit?  They're bars 
    function TheBoar: Byte;
    function TeeFortyTwo: Byte;
  end;&lt;/p&gt;
&lt;p&gt;TOnTheTown = class(TInterfacedObject, IFoo)
  private
    FFoo: TFoo; // Some class that actually concretely implements IFoo
  public
    constructor Create();
    property Foo: TFoo read FFoo implements IFoo; // This keyword is the awesome one
  end;[/delphi]

Now, if I remember my Delphi correctly (I mostly use C++ these days) you can call:

[delphi]Party := TOnTheTown.Create();
Party.TheBoar;[/delphi]

where <code>TheBoar</code> is shown in the class declaration as implemented by that class, but code-wise you implement it in the class that the property <code>Foo</code> is of - the call is delegated to the property. Neat, isn't it?

Even better, I just learned this very day while googling to check my memory was correct that starting with XE, <a href="http://docwiki.embarcadero.com/RADStudio/en/Property_Implements_Support_for_C++Builder">you can do this in C++ too</a>.

Either declare Party as IFoo or, perhaps, cast it (Party as IFoo). The point is that you have an object that you state implements various methods (because it claims to implement a particular interface) and yet it doesn't - calls are redirected / delegated somewhere else.

<hr />

<a href="http://stackoverflow.com/users/282848/andreas-rejbrand">Andreas Rejbrand</a> added:

You can use <strong>&amp;</strong> to prefix identifiers that would normally be invalid because they are reserved words.

[delphi]procedure TForm1.Button1Click(Sender: TObject);
var
  &amp;amp;begin,
  &amp;amp;if,
  &amp;amp;end: integer;
begin
  &amp;amp;begin := 10;
  &amp;amp;if := 100;
  &amp;amp;end := 1000;
  ShowMessage(IntToStr(&amp;amp;begin + &amp;amp;if + &amp;amp;end));
end;[/delphi]

You can use the <strong>^A</strong> syntax to denote a <strong>Ctrl+A</strong> 'character':

[delphi]procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^C then
    ShowMessage('The user wants to copy something.')
  else if Key = ^V then
    ShowMessage('The user wants to paste.')
end;[/delphi]


Something I have always found a bit funny is the compiler magic associated with the TGUID type. This is declared as

[delphi]TGUID = packed record
  D1: LongWord;
  D2: Word;
  D3: Word;
  D4: array[0..7] of Byte;
end;[/delphi]
and so, <emphasis>a priori</emphasis>, one would not expect something naïve like

[delphi light="true"]const
  g: TGUID = '{E4C26C63-CDD1-4450-9FE0-6F035E33CF90}';[/delphi]
to work, but it does. Compiler magic, it is!

One would expect

<pre>[DCC Error] Unit1.pas(27): E2010 Incompatible types: 'TGUID' and 'string'</pre>

<hr />

<a href="http://stackoverflow.com/users/243614/sertac-akyuz">Sertac Akyuz</a> added:

Construct a dynamic array using it's type's constructor:

[delphi]type
  TInts = array of Integer;

..

var
  Ints: TInts;
begin
  Ints := TInts.Create(3, 5, 1, 0, -2, 5);
end;[/delphi]

Not sure if this is documented or not but when I learned this from a newsgroup post after years of using Delphi, I was a bit surprised.

PS: Do not <strong>Free</strong> the array. :)

<hr />


<a href="http://stackoverflow.com/users/282676">Cosmin Prund</a> brought up <strong>The ABSOLUTE keyword</strong>.

This is a nice way to shoot yourself in the foot, because it throws type-safety out the window big time. Delphi's RTL sources uses this in 5 different units. The first 4 only use it once per unit, then there's Mxarrays.pas where this is used 22 times. What I'm trying to say is that the absolute keyword is rarely used.

[delphi]// This is how it's useful:
procedure Test;
var i64: Int64;
    b:array[0..7] of Byte absolute i64; // starts at the same memory space as i64
begin
  i64 := 7;
  WriteLn(b[3]);
end;

// This is how you shoot yourself in the foot:
procedure Test;
var s: string;
    i: NativeInt absolute s;
begin
  s := 'Test';
  Dec(i, 7);
  ShowMessage(s); // will give you garbage or AV
end;[/delphi]

<strong>Variant records</strong> are weired-looking records where some part of the record is "variable". Every time I see one used I say That's an useful trick, but never managed to actually use one in my own code. And I do use weird unsafe things like the absolute keyword and pointer arithmetic.

Example:

[delphi]type
  TKindOfShape = (ksCircle, ksSquare);

  Shape = record
    case Kind:TKindOfShape of
      ksCircle:
        (
          R: Double;
          CenterX, CenterY: Double;
        );
      ksSquare:
        (
          Top, Left, SideSize: Double;
        );
  end;[/delphi]

<hr />

<a href="http://stackoverflow.com/users/84704/warren-p">Warren Postma</a> brought in some ancient syntax:

Not so much hidden, as ancient are the digraphs supported by the original Wirth pascal, which still work in Delphi:

[delphi]procedure Dummy;
var
   a:array (. 0 .. 2 .) of Integer;
begin

end;[/delphi]
The character sequence (. and .) replace [ and ] on systems where the [ and ] are not even available, and are called digraphs because they are two characters. C/C++ for example, supports some Trigraphs (three character symbols), too.

I think most Delphi programmers have seen comments that are written with (* and *) which are the common digraph form of { and }.

<hr />

<a href="http://stackoverflow.com/users/30176/lkessler">lkessler</a> added:

Almost everyone knows about the <strong>inc</strong>rement and <strong>dec</strong>rement function:

[delphi light="true"]Inc(N) // to increment N by 1.
Dec(N) // to decrement N by 1.[/delphi]
But did you know they have a second parameter, which is the amount of the increment?

[delphi light="true"]Inc(N, I) // to increment N by I.
Dec(N, D) // to decrement N by D.[/delphi]
Now I think these are for people who start using Delphi after using other languages. Personally I prefer:

[delphi light="true"]N := N + 1;
N := N - 1;
N := N + I;
N := N - D;[/delphi]
which generates exactly the same code as Inc and Dec do, with equivalent optimizations.

Don't forget about <strong>Pred</strong> and <strong>Succ</strong>, which when applied to integers returns the value one less and one greater without changing the original value. And you can string them, e.g.

[delphi light="true"]Pred(Pred(Pred(N)));[/delphi]

<hr />

<a href="http://stackoverflow.com/users/757830">NGLN</a> points out it is possible to omit the parameter list of routines that are declared in the interface section. For functions it is even possible to omit the result type, which leads to weird looking implementations like:

[delphi light="true"]function GetText(var A: Integer; const B: Char; C: Word = 0): String;

implementation

function GetText;
begin
  Result := 'Where am I going?';
end;[/delphi]
Obviously, this does not apply to overloaded routines. ;)

Sometimes when someone else's code passes by, this is still surprising. Users would have maintenance reasons.

<hr />

<a href="http://stackoverflow.com/users/764487/rudy-velthuis">Rudy Velthuis</a> points out that there is a calling convention called "winapi" which (at the moment, at least) is completely identical to "stdcall"?

Example:

[delphi light="true"]function CryptReleaseContext(hProv: HCRYPTPROV; dwFlags: DWORD): BOOL; winapi;[/delphi]
This is fully equivalent to:

[delphi light="true"]function CryptReleaseContext(hProv: HCRYPTPROV; dwFlags: DWORD): BOOL; stdcall;[/delphi]

<hr />

<a href="http://stackoverflow.com/users/30176/lkessler">lkessler</a> always seems to forget about Method Overloading. Multiple routines can share the same name. The number of parameters and type of each parameter determine which will be called.

e.g.:

[delphi light="true"]Function Multiply (A, B: integer): integer; overload;
Function Multiply (A, B: double): double; overload;[/delphi]
Early Delphi users might not know about this one because it was added in Delphi 4.

See: <a href="http://www.delphibasics.co.uk/RTL.asp?Name=Overload">http://www.delphibasics.co.uk/RTL.asp?Name=Overload</a>

Also there is a nice list of new Delphi language features added since Delphi 7, along with good examples of each at: <a href="http://edn.embarcadero.com/article/34324">http://edn.embarcadero.com/article/34324</a>

It includes:

<ul>
	<li>Inlining</li>
	<li>Operator Overloading</li>
	<li>Class Helpers</li>
	<li>Strict Private</li>
	<li>Strict Protected</li>
	<li>Records with Methods</li>
	<li>Class abstract</li>
	<li>Class sealed</li>
	<li>Class const</li>
	<li>Class type</li>
	<li>Class var</li>
	<li>Class property</li>
	<li>Nested classes</li>
	<li>Final methods</li>
	<li>Sealed methods</li>
	<li>Static class methods</li>
	<li>For-in loop</li></ul>
<hr />

<a href="http://stackoverflow.com/users/267938/jorn-e-angeltveit">Jørn E. Angeltveit</a> point out that the <strong>;</strong> is used to separate statements, not end statements, so you actually don't need the last <strong>;</strong> before <strong>end</strong>:

[delphi light="true"]procedure DoNothing;
begin
  Inc(i);
  Dec(i)
end;[/delphi]
It is more convenient to add statements and move statements when they all end with the <strong>;</strong>, so I definitely wouldn't recommend to implement this a new practice at the workplace :)

<hr />

What else should be on the list? 
