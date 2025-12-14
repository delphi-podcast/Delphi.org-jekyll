---
id: 3613
title: 'The First Computer Program – In Delphi'
date: '2023-05-10T13:59:33-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=3613'
permalink: /2023/05/the-first-computer-program-in-delphi/
image: /assets/images/2023/05/Lovelace-with-Analytic-Engine-and-Bernoulli-numbers-algorithm-1200x675.webp
categories:
    - News
tags:
    - delphi
    - 'Delphi Projects'
    - News
---

<figure class="wp-block-image alignright size-medium is-style-rounded"><a href="/assets/images/2023/05/image.png"><img src="/assets/images/2023/05/image-200x300.png" alt="Lady Ada Lovelace using a modern day laptop" class="wp-image-3614"/></a></figure>

<figure class="wp-block-image alignleft size-medium is-style-rounded"><a href="/assets/images/2023/05/image-2.png"><img src="/assets/images/2023/05/image-2-200x300.png" alt="Charles Babbage" class="wp-image-3618"/></a></figure>

<p>Lady Ada Lovelace is generally considered the world’s first computer programmer. Born Augusta Ada Byron, in 1815, she was the daughter of <a href="https://en.wikipedia.org/wiki/Lord_Byron">Lord Byron, the English romantic poet</a>. She took an interest in mathematics and her talents lead her to work with <a href="https://en.wikipedia.org/wiki/Charles_Babbage">Charles Babbage</a>, "the father of computers," whom she met in 1833.</p>

<p>Babbage started work on his <a href="https://en.wikipedia.org/wiki/Difference_engine">Difference Engine</a>, as a means to automatically calculate and print the values of polynomial functions. While he never saw his Difference Engine completed, two were finished in modern times based on his original designs. One of which is in the <a href="https://computerhistory.org/">Computer History Museum</a> in Silicon Valley, where I saw it in operation.</p>

<figure class="wp-block-gallery alignfull has-nested-images columns-default is-cropped"><figure class="wp-block-image size-large"><a href="/assets/images/2023/05/IMG_8578-scaled.jpg"><img src="/assets/images/2023/05/IMG_8578-1024x765.jpg" alt="Difference Engine at CHM in Silicon Valley" class="wp-image-3622"/></a></figure>

<figure class="wp-block-image size-large"><a href="/assets/images/2023/05/image-1.webp"><img src="/assets/images/2023/05/image-1-1024x576.png" alt="Jim McKeeth wearing his Google Glass at the Computer History Museum in Silicon Valley standing in front of the Difference Engine" class="wp-image-3616"/></a></figure>

<figure class="wp-block-image size-large"><a href="/assets/images/2023/05/IMG_8576-scaled.jpg"><img src="/assets/images/2023/05/IMG_8576-1024x765.jpg" alt="Difference Engine at CHM in Silicon Valley" class="wp-image-3620"/></a></figure>

<figure class="wp-block-image size-large"><a href="/assets/images/2023/05/IMG_8577-scaled.jpg"><img src="/assets/images/2023/05/IMG_8577-1024x765.jpg" alt="Difference Engine at CHM in Silicon Valley" class="wp-image-3621"/></a></figure>

<figure class="wp-block-image size-large"><a href="/assets/images/2023/05/Jim-McKeeth-with-Difference-Engine-at-CHM.jpg"><img src="/assets/images/2023/05/Jim-McKeeth-with-Difference-Engine-at-CHM-1024x741.jpg" alt="Jim McKeeth with Difference Engine at CHM" class="wp-image-3619"/></a></figure>

<figure class="wp-block-image size-large"><a href="/assets/images/2023/05/IMG_8579-scaled.jpg"><img src="/assets/images/2023/05/IMG_8579-1024x765.jpg" alt="Difference Engine at CHM in Silicon Valley" class="wp-image-3623"/></a></figure>
</figure>

<p>In 1837 Babbage first described his <a href="https://en.wikipedia.org/wiki/Analytical_engine">Analytical Engine</a>, as a general-purpose computer. In 1843, Lovelace translated a French paper that Italian mathematician <a href="https://en.wikipedia.org/wiki/Luigi_Federico_Menabrea">Luigi Menabrea</a> wrote about Charles Babbage’s Analytical Engine. While translating it she added thousands of words of her own notes to the paper. As an example she wrote of one such sequence—how to calculate Bernoulli numbers. This is regarded by computer historians as the first computer program.</p>

<figure class="wp-block-image size-large"><a href="https://commons.wikimedia.org/wiki/File:Diagram_for_the_computation_of_Bernoulli_numbers.jpg"><img src="/assets/images/2023/05/Diagram_for_the_computation_of_Bernoulli_numbers-1024x717.jpg" alt="Lovelace's diagram from &quot;note G&quot;, the first published computer algorithm https://commons.wikimedia.org/wiki/File:Diagram_for_the_computation_of_Bernoulli_numbers.jpg" class="wp-image-3629"/></a></figure>

<p>Two Bit History has a great write up on Lovelace's program: <a href="https://twobithistory.org/2018/08/18/ada-lovelace-note-g.html">What Did Ada Lovelace's Program Actually Do?</a> which includes a <a href="https://gist.github.com/sinclairtarget/ad18ac65d277e453da5f479d6ccfc20e">C translation</a> and a solution for the bug it included. </p>

<p>Naturally I wanted to see what her code would look like in <a href="https://gist.github.com/jimmckeeth/193befe1ee2c7c2998666e10c1d36810">Delphi's Object Pascal</a>.</p>

```delphi
program LovelaceBernoulli;

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

function B7: extended;
(*
 * Calculates what Lady Ada Lovelace labeled "B7", 
 * which today we would call the 8th Bernoulli number.
 * Based on  https://gist.github.com/sinclairtarget/ad18ac65d277e453da5f479d6ccfc20e
 * More info https://twobithistory.org/2018/08/18/ada-lovelace-note-g.html
 * Bernoulli Numbers: https://en.wikipedia.org/wiki/Bernoulli_number
 *)
begin
    // ------------------------------------------------------------------------
    // Data
    // ------------------------------------------------------------------------
    var v1: Single := 1; // 1
    var v2: Single := 2; // 2
    var v3: Single := 4; // n

    // ------------------------------------------------------------------------
    // Working Variables
    // ------------------------------------------------------------------------
    var v4: Single := 0;
    var v5: Single := 0;
    var v6: Single := 0;                        // Factors in the numerator
    var v7: Single := 0;                        // Factors in the denominator
    var v8: Single := 0;
    var v10: Single := 0;                       // Terms remaining count, basically
    var v11: Single := 0;                       // Accumulates v6 / v7
    var v12: Single := 0;                       // Stores most recent calculated term
    var v13: Single := 0;                       // Accumulates the whole result

    // ------------------------------------------------------------------------
    // Result Variables
    // ------------------------------------------------------------------------
    var v21: Single := 1.0 / 6.0;             // B1
    var v22: Single := -1.0 / 30.0;           // B3
    var v23: Single := 1.0 / 42.0;            // B5
    var v24: Single := 0;                     // B7, not yet calculated

    // ------------------------------------------------------------------------
    // Calculation
    // ------------------------------------------------------------------------
    // ------- A0 -------
    (* 01 *) v6 := v2 * v3;                // 2n
    (* 02 *) v4 := v6 - v1;                // 2n - 1
    (* 03 *) v5 := v6 + v1;                // 2n + 1

    // In Lovelace's diagram, the below appears as v5 / v4, which is incorrect.
    (* 04 *) v11 := v4 / v5;               // (2n - 1) / (2n + 1)

    (* 05 *) v11 := v11 / v2;              // (1 / 2) * ((2n - 1) / (2n + 1))
    (* 06 *) v13 := v13 - v11;             // -(1 / 2) * ((2n - 1) / (2n + 1))
    (* 07 *) v10 := v3 - v1;               // (n - 1), set counter?

    // A0 = -(1 / 2) * ((2n - 1) / (2n + 1))

    // ------- B1A1 -------
    (* 08 *) v7 := v2 + v7;                // 2 + 0, basically a MOV instruction
    (* 09 *) v11 := v6 / v7;               // 2n / 2
    (* 10 *) v12 := v21 * v11;             // B1 * (2n / 2)

    // A1 = (2n / 2)
    // B1A1 = B1 * (2n / 2)

    // ------- A0 + B1A1 -------
    (* 11 *) v13 := v12 + v13;            // A0 + B1A1
    (* 12 *) v10 := v10 - v1;             // (n - 2)

    // On the first loop this calculates B3A3 and adds it on to v13.
    // On the second loop this calculates B5A5 and adds it on.
    while (v10 > 0) do
    begin
        // ------- B3A3, B5A5 -------
        while (v6 > 2 * v3 - (2 * (v3 - v10) - 2)) do
        begin                                // First Loop:
            (* 13 *) v6 := v6 - v1;           // 2n - 1
            (* 14 *) v7 := v1 + v7;           // 2 + 1
            (* 15 *) v8 := v6 / v7;           // (2n - 1) / 3
            (* 16 *) v11 := v8 * v11;         // (2n / 2) * ((2n - 1) / 3)

                                             // Second Loop:
            // 17    v6 := v6 - v1;              2n - 2
            // 18    v7 := v1 + v7;              3 + 1
            // 19    v8 := v6 / v7;              (2n - 2) / 4
            // 20    v11 := v8 * v11;            (2n / 2) * ((2n - 1) / 3) * ((2n - 2) / 4)
        end;

        // A better way to do this might be to use an array for all of the
        // "Working Variables" and then index into it based on some calculated
        // index. Lovelace might have intended v14-v20 to be used on the
        // second iteration of this loop.
        //
        // Lovelace's program only has the version of the below line using v22
        // in the multiplication.
        if (v10 = 2) then
        (* 21 *) v12 := v22 * v11             // B3 * A3
        else
        (* 21 *) v12 := v23 * v11;            // B5 * A5

        // B3A3 = B3 * (2n / 2) * ((2n - 1) / 3) * ((2n - 2) / 4)

        // ------- A0 + B1A1 + B3A3, A0 + B1A1 + B3A3 + B5A5 -------
        (* 22 *) v13 := v12 + v13;            // A0 + B1A1 + B3A3 (+ B5A5)
        (* 23 *) v10 := v10 - v1;             // (n - 3), (n - 4)
    end;

    (* 24 *) v24 := v13 + v24; // Store the final result in v24
    (* 25 *) v3 := v1 + v3;    // Move on to the next Bernoulli number!

    // This outputs a positive number, but really the answer should be
    // negative. There is some hand-waving in Lovelace's notes about the
    // Analytical Engine sorting out the proper sign.
    Result := v24;
end;

begin
  try
    Writeln('Calculates what Ada Lovelace labeled "B7", which today we would call the 8th Bernoulli number.');
    Writeln('--------------');
    Writeln('This outputs a positive number, but really the answer should be negative.');
    Writeln('There is some hand-waving in Lovelace''s notes about the Analytical Engine sorting out the proper sign.');
    Writeln('==============');
    Writeln(Format('A0 + B1A1 + B3A3 + B5A5: %.4f',[B7]));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Writeln('--------------');
  Writeln('Press [enter] to close');
  readln;
end.
```

<p>While this is one way to calculate the 8th Bernoulli number, what would a modern implementation look like? Using <a href="https://github.com/TurboPack/RudysBigNumbers/">Rudy's Big Numbers library</a> I created a sample application to <a href="https://github.com/TurboPack/RudysBigNumbers/tree/main/Samples/Bernoulli">calculate any Bernoulli</a> number.</p>

```delphi
function Bernoulli(n: Uint64): BigRational;
begin
  var a: TArray<BigRational>;
  SetLength(a, n + 1);
  for var m := 0 to High(a) do
  begin
    a[m] := BigRational.Create(1, m + 1);
    for var j := m downto 1 do
    begin
      a[j - 1] := (a[j - 1] - a[j]) * j;
    end;
  end;
  Result := a[0];
end;
```

<p>You can install the <a href="https://github.com/TurboPack/RudysBigNumbers/tree/main">BigNumbers library</a> via GetIt and this sample application is included.</p>

