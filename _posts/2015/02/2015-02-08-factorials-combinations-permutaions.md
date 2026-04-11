---
id: 1905
title: 'Factorials, Combinations & Permutaions'
date: '2015-02-08T18:56:51-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1905'
permalink: /2015/02/factorials-combinations-permutaions/
tags:
    - 'Source Code'
---

This is some code I wrote a long time ago as part of the <a href="https://groups.yahoo.com/neo/groups/tdag/info">TDAG mailing list</a>. It calculates Factorials, the number of Combinations and Permutations. This is the mathematics, it calculates the number of Combinations and Permutations, it doesn't create each different Combination and Permutation.

They take Cardinals as parameters because it doesn't make sense to accept negative numbers. Keep in mind that factorials get big really, really quickly, so if you use too large of numbers then it will overflow even the Int64.

[delphi]
unit FactCombPerm;

interface

// Parameters are Cardinal because Int64 isn't Ordinal
//  Besides, Factorial(100) will overflow Int64 already.
function Factorial(const ANumber: Cardinal): Int64; overload;
function Factorial(const ANumber: Cardinal;
                   const AStop: Cardinal): Int64; overload;
function CombinationUnOpt(const ACount, AChoose: Cardinal): Int64;
function Combination(const ACount, AChoose: Cardinal): Int64;
function Permutation(const ACount, AChoose: Cardinal): Int64;

implementation

function Factorial(const ANumber: Cardinal): Int64; overload;
// n! = n * (n-1) . . . n(2)
var
  lCtr: Cardinal;
begin
  Result := 1;
  for lCtr := ANumber downto 2 do
    Result := Result * lCtr;
end;

function Factorial(const ANumber: Cardinal;
                   const AStop: Cardinal): Int64; overload;
// Factorial with a stop point (needed in the optimized Combination routine
// if no AStop is specified then is the same as Factorial
var
  lCtr: Cardinal;
begin
  Result := 1;
  if ANumber &gt;= AStop then
    for lCtr := ANumber downto AStop do
      Result := Result * lCtr;
end;

function CombinationUnOpt(const ACount, AChoose: Cardinal): Int64;
// n!
// n_C_k = ----------
// k!(n - k)!
begin
  if AChoose &lt; ACount then
    Result := Factorial(ACount)
      div (Factorial(AChoose) * Factorial(ACount - AChoose))
  else
    Result := 0;
end;

function Combination(const ACount, AChoose: Cardinal): Int64;
// n!
// n_C_k = ----------
// k!(n - k)!
// with optimizations even!
begin
  if AChoose &lt; ACount then
    Result := Factorial(ACount, succ(ACount - AChoose))
      div (Factorial(AChoose))
  else
    Result := 0;
end;

function Permutation(const ACount, AChoose: Cardinal): Int64;
// n!
// n_P_k = --------
// (n - k)!
begin
  if AChoose &lt; ACount then
    Result := Factorial(ACount)
      div Factorial(ACount - AChoose)
  else
    Result := 0;
end;

end.
[/delphi]

My original optimization had a bug in it, but <a href="https://groups.yahoo.com/neo/groups/tdag/conversations/topics/5342">Bryan Mayland</a> fixed it for me. This is old code, and there are probably some options to optimize it better. I'd love input, suggestions, etc.

