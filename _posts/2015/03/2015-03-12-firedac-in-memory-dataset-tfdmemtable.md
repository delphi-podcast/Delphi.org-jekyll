---
id: 1933
title: 'FireDAC In-Memory DataSet: TFDMemTable'
date: '2015-03-12T05:00:32-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1933'
permalink: /2015/03/firedac-in-memory-dataset-tfdmemtable/
tags:
    - 'Source Code'
    - webinar
---

More information and resources on TFDMemTable from the <a href="http://www.embarcadero.com/landing-pages/skill-sprints">FireDAC Skill Sprint</a>.

If you missed the Skill Sprint, or want to review it, here is the video with the recording of the Q&amp;A. The presentation is 15-20 minutes, and the other 30 minutes is from the Q&amp;A.

[embed]https://www.youtube.com/watch?v=TEP4WcXNpAg[/embed]

Here are the slides for now, the replay will be available soon.

http://www.slideshare.net/jimmckeeth/skill-sprint-in-mem-dataset

<strong>Common code samples:</strong>

<em>Delphi / Object Pascal</em>

[delphi]
// Create Field Definitions
FDMemTable1.FieldDefs.Add('ID', ftInteger, 0, False);
FDMemTable1.FieldDefs.Add('Name', ftString, 20, False);
FDMemTable1.CreateDataSet;

// Append data
FDMemTable1.Open;
FDMemTable1.AppendRecord([1, 'Jim']);

// Load from another DataSet
FDMemTable1.CopyDataSet(DataSet1, [coStructure, coRestart, coAppend]);
[/delphi]

<em>C++</em>

[cpp]
// Create Field Definitions
FDMemTable1-&gt;FieldDefs-&gt;Add(&quot;ID&quot;, ftInteger, 0, False);
FDMemTable1-&gt;FieldDefs-&gt;Add(&quot;Name&quot;, ftString, 20, False);
FDMemTable1-&gt;CreateDataSet();

// Append Data
FDMemTable1-&gt;Open();
FDMemTable1-&gt;Append();
FDMemTable1-&gt;FieldByName(&quot;ID&quot;)-&gt;AsInteger = 1;
FDMemTable1-&gt;FieldByName(&quot;Name&quot;)-&gt;AsString = &quot;Jim&quot;;
FDMemTable1-&gt;Post();

// Load from another DataSet
FDMemTable1-&gt;CopyDataSet(DataSet1, TFDCopyDataSetOptions() &lt;&lt; coStructure &lt;&lt; coRestart &lt;&lt; coAppend);

[/cpp]

<strong>More information:</strong>
<ul>
	<li>Samples
<ul>
	<li>C:\Users\Public\Documents\Embarcadero\Studio\15.0\Samples\Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDMemTable</li>
	<li>C:\Users\Public\Documents\Embarcadero\Studio\15.0\Samples\Object Pascal\Database\FireDAC\Samples\Comp Layer\TFDLocalSQL</li>
</ul>
</li>
	<li>DocWiki
<ul>
	<li><a href="http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDMemTable">TFDMemTable</a></li>
	<li><a href="http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDCustomMemTable">TFDCustomMemTable</a></li>
	<li><a href="http://docwiki.embarcadero.com/RADStudio/en/TFDMemTable_Questions">TFDMemTable_Questions</a></li>
</ul>
</li>
</ul>
Cary Jensen's CodeRage 9 Video: TFDMemTable &amp; ClientDataSet Compared [<a href="http://wiert.me/2014/10/30/coderage-9-qa-log-clientdatasets-and-fdmemtables-compared/">Q&amp;A Log</a>]

https://www.youtube.com/watch?v=iNgHJakYWkU

Dmitry Arefiev's CodeRage 9 FireDAC Tips, Tricks and News

http://www.youtube.com/watch?v=gljfudAKlTI&nbsp;
