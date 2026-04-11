---
id: 3135
title: 'API Limits with #FDEC'
date: '2018-08-31T17:58:08-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=3135'
permalink: /2018/08/api-limits-with-fdec/
categories:
    - News
tags:
    - Cloud
    - FireDAC
    - News
    - 'Source Code'
---

<img class="size-medium wp-image-3136 alignright" src="/assets/images/2018/08/API-Limits-300x300.png" alt="API Limits with FireDAC Enterprise Connectors" width="300" height="300" />The FireDAC Enterprise Connectors (#FDEC) by CData and Embarcadero make it really easy to work with various APIs just like you would any SQL database. For example if you want to publish the results of a query to a Google Sheet (which I find incredibly useful) then it is just a few FireDAC components and you are off to the races. You might run into an API limit though.

What is an API limit? Most rest services have a limit to how often a client can call a specific API within a certain amount of time. Google calls this their <a href="https://developers.google.com/sheets/api/limits">usage limit</a>:
<blockquote>This version of the Google Sheets API has a limit of 500 requests per 100 seconds per project, and 100 requests per 100 seconds per user. Limits for reads and writes are tracked separately. There is no daily usage limit.</blockquote>
That may seem like a lot, but I found I was running into that limit pretty quick once I moved my project into production. Luckily FireDAC and the FireDAC Enterprise Connectors have a simple workaround: Batch Processing.

Using the <a href="http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)">Array DML</a> features of FireDAC you can batch multiple DML (Data Manipulation Language) operations into a single API call. The <a href="http://cdn.cdata.com/help/RLC/fire/pg_usagef.htm">FDEC Google Sheets documentation</a> from CData doesn't cover Array DML, but the component supports this (they are updating the documentation). The Elasticsearch documentation does cover <a href="http://cdn.cdata.com/help/EED/fire/pg_FIREbatch.htm">Batch Processing</a> with an example, and I've used this with Sheets and it works great!
<h2>Bulk Insert</h2>
The following example prepares a single batch that inserts records in bulk.

[delphi]FDConnection1.ResourceOptions.ServerOutput := True;
FDQuery1.SQL.Text := 'insert into Account values (:Name, :Id )';
FDQuery1.Params.ArraySize := 100;
FDQuery1.Params[0].AsStrings[0]:= 'MyName1';
FDQuery1.Params[1].AsStrings[0]:= 'MyId1';

//next statement
FDQuery1.Params[0].AsStrings[1]:= 'MyName2';
FDQuery1.Params[1].AsStrings[1]:= 'MyId2';
...

FDQuery1.Execute(FDQuery1.Params.ArraySize);
ShowMessage(IntToStr(FDQuery1.RowsAffected));[/delphi]

To retrieve the Ids of the new records, query the LastResultInfo#TEMP table:


[pascal]sName := FDQuery1.Open('SELECT * FROM [LastResultInfo#TEMP]');[/pascal]

<h2>Bulk Update</h2>
The following example prepares a single batch that inserts records in bulk.


[delphi]FDQuery1.SQL.Text := 'update Account set Name = :Name WHERE Id = :Id';
FDQuery1.Params.ArraySize := 100;
FDQuery1.Params[0].AsStrings[0]:= 'Floppy Disks';
FDQuery1.Params[1].AsStrings[0]:= 'Id1';

//next statement
FDQuery1.Params[0].AsStrings[1]:= 'Jon Doe';
FDQuery1.Params[1].AsStrings[1]:= 'Id2';
...

FDQuery1.Execute(FDQuery.Params.ArraySize);
ShowMessage(IntToStr(FDQuery1.RowsAffected));[/delphi]

<h2>Bulk Delete</h2>
The following example prepares a single batch that inserts records in bulk:


[delphi]FDQuery1.SQL.Text := 'delete Account where Id = :Id';
FDQuery1.Params.ArraySize := 100;
FDQuery1.Params[0].AsStrings[0]:= 'MyId1';

//next statement
FDQuery1.Params[0].AsStrings[1]:= 'MyId2';
...

FDQuery1.Execute(FDQuery.Params.ArraySize);
ShowMessage(IntToStr(FDQuery1.RowsAffected));[/delphi]


If you want to learn more about <a href="http://docwiki.embarcadero.com/RADStudio/en/Array_DML_(FireDAC)">Array DML</a> check out these videos:

<a href="https://www.youtube.com/watch?v=S58Xv2TH5M0">Array DML Skill Sprint with Pawel Glowacki</a>

https://www.youtube.com/watch?v=S58Xv2TH5M0

<a href="https://www.youtube.com/watch?v=wS1A3v5_l98">FireDAC in Depth with Cary Jensen</a>

https://www.youtube.com/watch?v=wS1A3v5_l98

Also check out <a href="http://www.jensendatasystems.com/firedacbook/">Cary Jensen's book on the topic of FireDAC in Depth</a>.
