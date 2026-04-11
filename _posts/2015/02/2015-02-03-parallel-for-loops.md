---
id: 1886
title: 'Parallel For Loops'
date: '2015-02-03T06:11:41-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1886'
permalink: /2015/02/parallel-for-loops/
tags:
    - Architecture
    - iOS
    - Mobile
    - 'Source Code'
---

<a href="http://docwiki.embarcadero.com/RADStudio/XE7/en/Using_TParallel.For_from_the_Parallel_Programming_Library%20">Parallel For Loops</a> are a hassle-free way to supercharge your program with the Parallel Programming Library. The syntax is similar to the standard <strong>For</strong> loop, with the advantage of each iteration running on in a different task on the thread pool. This allows multiple iterations to run at the same time, taking advantage of the multi-core and hyper-threaded architecture common on laptops, desktops and mobile devices today.

Here is the replay of the Skill Sprint:

[embed]https://www.youtube.com/watch?v=uZ79t4bSM1w[/embed]
<p class="p1">Here are the slides:</p>
[embed]http://www.slideshare.net/slideshow/embed_code/44464343[/embed]
<p class="p1"><strong>Update:</strong> I was chatting with Allen Bauer today and he mentioned that while you technically can use Queue and Synchronize from within a Parallel For loop, he wouldn't recommend it because it will dramatically reduce the speed of the loop. It is still faster than a linear loop, but not as fast as it could be. I'll leave these examples here, but keep that in mind when optimizing your parallel code.</p>
Here is the syntax in Object Pascal. The stride is the first parameter is it is optional. It controls how the iterations are grouped when being sent to the CPUs. Min and Max are your usual start and stop range for the loop. The last parameter is an anonymous method that represents the code to be executed on each iterations. It takes an Index parameter that is either an Integer or Int64 that provides the value of the current iteration.

[delphi]
TParallel.For(Stride, Min, Max, procedure (Idx: Integer)
begin
  if IsPrime(Idx) then
  begin
    TInterlocked.Increment (Tot);
    TThread.Queue(TThread.CurrentThread, procedure
    begin
      Memo1.Lines.Add(Idx.ToString);
    end);
  end;
end);
[/delphi]

Here is the C++ code syntax. It takes a event instead of an anonymous method.

[cpp]
// . . .
TParallel::For(NULL, Min, Max, MyIteratorEvent);
// . . . 

void __fastcall TFormThreading::MyIteratorEvent(TObject *Sender, int AIndex)
{
	if(IsPrime(AIndex)){
		TInterlocked::Increment(Tot);
	};
}
[/cpp]

<strong>There are some great blog posts and videos on the Parallel Programming Library</strong>

<a href="http://delphiaball.co.uk/">Stephen Ball</a> has a series of blog posts on the <a href="http://delphiaball.co.uk/tag/parallel-programming/%20">Parallel Programming Library</a>, including a <a href="http://delphiaball.co.uk/2014/09/05/quick-introduction-to-parallel-programming-with-xe7/">Quick Introduction</a> and one on <a href="http://delphiaball.co.uk/2014/09/23/parallel-programming-thread-pool/">managing the thread pool</a>. As Stephen points out, while you can customize the thread pool, that doesn't alway mean you should. <a href="http://www.malcolmgroves.com/blog/">Malcolm Groves</a> also has some great <a href="http://www.malcolmgroves.com/blog/?cat=109">blog posts on PPL</a>.

<a href="http://dannywind.nl/">Danny Wind</a> has a great Code Rage 9 session on the <a href="http://dannywind.nl/delphi/coderage9/%20">Parallel Programming Library</a> (be sure to <a href="http://dannywind.nl/assets/images/2014/10/DelphiParallelLibrary_CreateResponsiveApps_DannyWind.zip">download his samples</a>). <em>David I. did the <a href="https://www.youtube.com/watch?v=QJeKfJHbwUk">C++ version</a></em>.

https://www.youtube.com/watch?v=rZfux4by0po&#038;rel=0

Allen Bauer, our Chief Scientist, also has a CodeRage 9 session on the <a href="https://www.youtube.com/watch?v=4_PB5bnapXw">PPL Architecture</a>.

https://www.youtube.com/watch?v=4_PB5bnapXw&#038;rel=0

If you want to take advantage of the new C++11 Lambda syntax on Win64 and mobile, then check out <a href="http://community.embarcadero.com/index.php/article/technical-articles/1044-coderage-9-snippet-consuming-object-pascal-code-from-c-apps-using-c-11-lambdas">this community article</a> or watch this <a href="https://www.youtube.com/watch?v=Q8Mpkn303BE">CodeRage 9 video snippet</a>. Get <a href="http://delphi.org/downloads/CppParallelExamples.zip">Bruneau and David's code for C++ and Parallel libraries</a>.

https://www.youtube.com/watch?v=Q8Mpkn303BE&#038;rel=0

Update: Keep in mind that a Parallel For loop isn't always the best performance option, but it is really easy to use. Check out <a href="http://stackoverflow.com/a/27542557/255">Stefan Glienke's Stack Overflow answer</a> for an alternative using the PPL TTask for even better performance.
