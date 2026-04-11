---
id: 2046
title: 'Export Trello to CSV'
date: '2015-09-23T20:59:36-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2046'
permalink: /2015/09/export-trello-to-csv/
categories:
    - News
tags:
    - DataBase
    - FireDAC
    - News
    - REST
    - TFDLocalSQL
    - Trello
---

I'm a big fan of <a href="http://trello.com">Trello</a> as a way to organize and collaborate. Recently I needed to export a Trello board to CSV. They have an export to JSON, but you have to buy a years worth of business class for the export to CSV. The business class is probably worth it for other reasons as well, but I thought I would see what it would take to convert JSON to CSV using Delphi 10 Seattle's REST Client and FireDAC. I'm really pleased with what I came up with, and it didn't take much effort.

I used the REST Client to connect to the JSON export on Trello. The REST Client is overkill for this since it is just a simple HTTP GET request, but the REST Response DataSet adapter is what I was after. This piped the JSON into a TFDMemTable.

Now the JSON from Trello contains a few collections (JSON Array's of objects) so I used 3 different adapters (each with a different root node) and 3 different memory tables: Cards, Lists and Labels. There are other collections, but I wasn't interested in them right now.

Once I have the JSON in a DataSet, I need to work with it. So I put down a <a href="https://www.youtube.com/watch?v=nkjVPOGcdw0">TFDLocalSQL</a> component and pointed it to the Mem Tables. Then attached a TMemo to the Query of a TFDQuery component, and I was able to run SQL querries against the Trello board. This made it easy to select exactly the data I wanted to export.

For the export I just used the <a href="https://www.youtube.com/watch?v=dMyFEOHznww">FireDAC ETL</a> functionality to pump the DataSet resulting from the Local SQL query to a text writer which saves a CSV file.  I love the way FireDAC provides all this great high level functionality like Local SQL and the Text Writers. It makes so many tasks so easy to deal with.

There is still a lot of polish to do for this, but right now it does the job really well. I thought I would share it with anyone else who might be interested in exporting Trello to CSV. You could take a look at the source code and use it to convert most any REST/JSON datasource to CSV.

<a href="https://github.com/jimmckeeth/Trello2CSV">I put the code up on GitHub.</a>
