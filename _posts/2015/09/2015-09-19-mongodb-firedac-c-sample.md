---
id: 2039
title: 'MongoDB FireDAC C++ Sample'
date: '2015-09-19T10:58:06-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2039'
permalink: /2015/09/mongodb-firedac-c-sample/
tags:
    - 'C#'
    - DataBase
    - FireDAC
    - MongoDB
---

I created a simple sample that shows some basic FireDAC functionality with <a href="http://delphi.org/downloads/CppMongoGrid.zip">MongoDB in C++</a> (Works with C++Builder or RAD Studio 10 Seattle)

<img class="aligncenter size-full wp-image-2040" src="/assets/images/2015/09/MongoDBFireDACCPP.png" alt="MongoDB FireDAC C++" width="556" height="456" />

This is similar to a one of the Object Pascal / Delphi MongoDB sample. It shows how you can query a MongoDB database using the new TFDMongoQuery component and display it in a grid. It also shows how to handle nested document objects (like Address) and arrays / DataSets (Address.Coords and Grades).

In addition to using the match property of the query, it also allows the specification of a sort and a projection. The projection is used to change which fields of the document you retrieve.

For more information on MongoDB, check out my <a href="http://embt.co/sprint-nosql-mongodb">MongoDB Skill Sprint</a> and register for <a href="http://thecoderage.com/">CodeRage X</a> (Oct 13 - 15)

<a href="http://embt.co/sprint-nosql-mongodb"><img class="aligncenter size-full wp-image-2041" src="/assets/images/2015/09/FireDACMongoDBNoSQL.png" alt="FireDAC MongoDB NoSQL" width="500" height="350" /></a>

&nbsp;
