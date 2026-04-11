---
id: 2840
title: 'Simple Mobile FireDAC App'
date: '2017-06-06T04:07:39-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2840'
permalink: /2017/06/simple-mobile-firedac-app/
tags:
    - FireDAC
---

The DocWiki has a great mobile tutorial on <a href="http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_FireDAC_and_SQLite_(iOS_and_Android)">building a mobile To Do app with FireDAC and SQLite</a>. I find I usually build it a little differently though, so I thought I would share my code here.

Go ahead and lay the UI out the same, and put down most of the same FireDAC components, with the visual LiveBindings. I love how it uses the LiveBindings wizard to create the data source. What I change is the code in the event handlers, but what you don't need is the Insert and Delete FDQuery components. While that code all works, it uses an older model that doesn't take full advantage of the amazing features of FireDAC.

So your form will look something like this . . .

<img class="aligncenter size-full wp-image-2841" src="/assets/images/2017/06/FireDAC-ToDo-1.png" alt="FireDAC-ToDo-1" width="318" height="467" />

Add an implementation uses clause

```delphi
uses FMX.DialogService.Async, IOUtils;
```

And then your <strong>addButtonClick</strong> event handler will look like this . . .

```delphi
procedure TForm42.addButtonClick(Sender: TObject);
begin
  TDialogServiceAsync.InputQuery('New item',['Name'], [''],
  procedure (const AResult: TModalResult;
             const AValues: array of string)
  begin
    if (AResult = mrOK) and (Length(AValues) &gt; 0) and
       (Length(Trim(AValues[0])) &gt; 0) then
    begin
      FDQuery1.InsertRecord([AValues[0]]);
    end;
    UpdateDeleteButton;
  end);
end;
```

You'll notice a few changes. First of all, I used an anonymous method for the async callback. Also, instead of using an entirely different insert query, I just call <em>InsertRecord</em> on the existing <em>FDQuery1</em>, passing in the value. For simple tables like this one this is so much easier. This really simplified the code in my opinion. Also instead of spreading the code to update the Delete button's visibility all over the place I used a procedure called UpdateDeleteButton. Here is the rest of the code with a few comments.

```delphi
procedure TForm42.deleteButtonClick(Sender: TObject);
begin 
  // Again we use the built in Delete method instead of a separate
  //   Delete query. This just deletes the currently active record.
  FDQuery1.Delete;
  UpdateDeleteButton;
end;

procedure TForm42.FDConnection1AfterConnect(Sender: TObject);
begin
  // This makes sure our table exists, just in case the data file
  //   no longer exists. Makes the app more resilient. 
  FDQueryCreateTable.ExecSQL;
  // And let's not assume anything about that Delete button status
  UpdateDeleteButton;
end;

procedure TForm42.FDConnection1BeforeConnect(Sender: TObject);
begin
  // We don't need to use a compiler directive here, but that does
  //   mean our database file is in our documents folder, which 
  //   doesn't make as much since for a desktop.
  {$if DEFINED(iOS) or DEFINED(ANDROID)} 
  FDConnection1.Params.Values['Database'] := 
    TPath.Combine(TPath.GetDocumentsPath, 'todolist.sdb');  
  {$ENDIF} 
end;

procedure TForm42.ListView1Click(Sender: TObject);
begin
  UpdateDeleteButton;
end;

procedure TForm42.UpdateDeleteButton;
begin
  deleteButton.Visible := ListView1.Selected &lt;&gt; nil;
end;
```

The beauty of calling the <em>FDQueryCreateTable.ExecSQL</em> is that you don't need to deploy an empty database file. It just creates an empty one the first time it runs.

So what do you think, is this simpler? What would you do differently?
