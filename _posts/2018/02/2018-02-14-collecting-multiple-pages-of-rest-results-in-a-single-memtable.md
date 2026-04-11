---
id: 3024
title: 'Collecting Multiple Pages of REST Results in a Single MemTable'
date: '2018-02-14T19:49:36-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=3024'
permalink: /2018/02/collecting-multiple-pages-of-rest-results-in-a-single-memtable/
categories:
    - News
tags:
    - News
---

I've run into this a few times, where a REST Service returns results in pages, so you have to make multiple passes to get all the data. One thing I love about the RAD REST Client Library is the ability to store all the data in the FDMemTable where you can work on it. Unfortunately when you can only get part of the results that limits the functionality. Here is a simple solution to get all the pages in a single FDMemTable.

What you need is a second <strong>FDMemTable</strong>. My first one is called <em>MembersTempTable</em>, and it is attached to the <strong>Response Adapter</strong>. The second one is called <em>MembersMemTable</em> and it will hold the complete set of data.

[delphi]
  // Drop any existing data
  MembersMemTable.Close; 
  
  // Get the first page 
  MembersRequest.Params.ParameterByName('limit').Value := '50';
  MembersRequest.Params.ParameterByName('offset').Value := '0';
  MembersRequest.Execute;

  // This clones the FDMemTable
  MembersMemTable.CopyDataSet(MembersTempTable, 
    [coStructure, coRestart, coAppend]);

  // Now we add the other tables
  MembersMemTable.BeginBatch();
  try
    // Repeat until we don't get a full page
    while MembersTempTable.RecordCount = 50 do
    begin
      // Start with the next page
      MembersRequest.Params.ParameterByName('offset').Value := 
        (MembersMemTable.RecordCount - 1).ToString;
      MembersRequest.Execute;
      // Append those records into our FDMemTable
      MembersMemTable.CopyDataSet(MembersTempTable, [coAppend]);
    end;
    MembersMemTable.IndexFieldNames := 'id';
  finally
    MembersMemTable.EndBatch;
  end;
[/delphi]

