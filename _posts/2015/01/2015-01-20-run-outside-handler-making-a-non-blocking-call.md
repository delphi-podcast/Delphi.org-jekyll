---
id: 1861
title: 'Run Outside the Handler or Making a Non-Blocking Call'
date: '2015-01-20T16:31:09-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1861'
permalink: /2015/01/run-outside-handler-making-a-non-blocking-call/
tags:
    - 'Source Code'
---

Have you ever had some code you wanted to run outside of the event handler that causes the code to run? If not, then this blog post isn't for you. I'm not here to debate why you would want to do that, or if it is a good idea or not. I just know there've been times I've needed my code to run outside the event handler, or just a bit later.

One use case example: You are calling a slow routine (Network I/O maybe) and don't want to freeze the UI while you wait for it to execute.

Still with me? Good. What I used to do was drop a TTimer on the form and set the Interval to 1, then enable it to trigger the code to run later. This worked, but it was messy. You had a timer to deal with, and you had to remember to disable it in the event handler, so it didn't run multiple times. You also could have used a TThread, which may have been a better solution, but still seemed kind of messy, especially if you wanted to update the UI from your code.

Thanks to the new System.Threading library introduced with XE7, I've created a simple procedure that makes this a breeze to do. I call the procedure <strong>NonBlocking</strong>, but you could just as easily call it <em>RunALittleLater</em>, <em>RunOutsideHandler</em>, etc.

[delphi]
uses System.Threading;

procedure NonBlocking(const Proc: TThreadProcedure);
begin
  TTask.Create(procedure begin
    TThread.Queue(nil, Proc);
  end).Start;
end;
[/delphi]

All this does is create a task, and then inside the task queue an update back to the main thread to execute the code that is passed to this procedure as an anonymous method. You could easily just write this code inline, but I thought it worthwhile creating a procedure to handle it for me.

Lets look at a normal execution scenario:

[delphi]
  //...
  ListBox1.Items.Add('Before Handler');
  EventHandler;
  ListBox1.Items.Add('After Handler');
  //....

procedure TForm1.EventHandler;
begin
  ListBox1.Items.Add('Inside Handler');
end;
[/delphi]

When this is run, our ListBox1 will look like
<ul>
	<li>Before Handler</li>
	<li>Inside Handler</li>
	<li>After Handler</li>
</ul>
which is what we would expect. Now when we introduce a call to our new procedure in the EventHandler:

[delphi]
  //...
  ListBox1.Items.Add('Before Handler');
  EventHandler;
  ListBox1.Items.Add('After Handler');
  //....

procedure TForm1.EventHandler;
begin
  ListBox1.Items.Add('Inside Handler 1');
  NonBlocking(procedure begin
    ListBox1.Items.Add('Outside Handler'); // This will run last
  end);
  ListBox1.Items.Add('Inside Handler 2');
end;
[/delphi]

Our ListBox1 will look like
<ul>
	<li>Before Handler</li>
	<li>Inside Handler 1</li>
	<li>Inside Handler 2</li>
	<li>After Handler</li>
	<li><strong>Outside Handler</strong></li>
</ul>
Notice that Outside Handler was the very last line added, even though it is written between Inside Handler 1 and Inside Handler 2. It even occurs after the <em>After Handler</em> line. Also, this works across all platforms: iOS, Android, Windows and OS X.

Everything before and within the call to <em>NonBlocking</em> will execute in order, but the code within NonBlocking will execute after the code that comes after that anonymous method.

If you have a ShowMessage or something else that blocks the UI thread in the event handler, then the code you passed to the <em>NonBlocking</em> procedure will be executed early, which is fine since the UI thread was already blocked.

&nbsp;
