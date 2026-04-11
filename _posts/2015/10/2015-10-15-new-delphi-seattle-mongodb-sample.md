---
id: 2053
title: 'New Delphi Seattle MongoDB Sample'
date: '2015-10-15T13:58:23-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2053'
permalink: /2015/10/new-delphi-seattle-mongodb-sample/
tags:
    - DataBase
    - MongoDB
    - 'Source Code'
---

I created some more Delphi 10 Seattle samples to show off MongoDB and FireDAC functionality: LocalSQL, Indexing &amp; Geospatial.

<img class="aligncenter size-full wp-image-2041" src="/assets/images/2015/09/FireDACMongoDBNoSQL.png" alt="FireDAC MongoDB NoSQL" width="500" height="350" />

The first one queries some data from MongoDB allowing you to specify the match, sort and projection, then it stores the results in a DataSet. At that point you can use LocalSQL to write a SQL query against the result set. While FireDAC gives you full native support for MongoDB, it also puts the SQL back into NoSQL.

<img class="aligncenter size-full wp-image-2061" src="/assets/images/2015/10/LocalSQL.png" alt="MongoDB FireDAC LocalSQL" width="659" height="473" />

Indexing is used to improve your query performance. It is really easy to work with MongoDB queries with FireDAC.

<img class="aligncenter size-full wp-image-2060" src="/assets/images/2015/10/Indexes.png" alt="MongoDB FireDAC Indexes" width="434" height="609" />

And one of the cool features of MongoDB is that you can do spatial queries. Here is an example that shows how to create a Spatial index and then do a spatial query with FireDAC. This uses the restaurant data that is included with the shipping samples, so make sure you load the restaurant data first.

<img class="aligncenter size-full wp-image-2059" src="/assets/images/2015/10/Geospatial.png" alt="Geospatial MongoDB FireDAC" width="663" height="512" />

If you missed my previous post I had a <a href="http://delphi.org/2015/09/mongodb-firedac-c-sample/">MongoDB FireDAC and C++Builder sample</a>.

[<a href="http://delphi.org/downloads/MongoDB.zip">You can download my new samples here.</a>]
