---
id: 3309
title: 'Animated Path Graphics of Grace Hopper'
date: '2019-04-01T00:51:32-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=3309'
permalink: /2019/04/animated-path-graphics-of-grace-hopper/
categories:
    - News
tags:
    - News
---

<p>I wanted to finish this side project during Women's History Month to honor the <a href="https://en.wikipedia.org/wiki/Grace_Hopper">Amazing Grace Hopper</a> and her contributions to the field of Computer Science. I found this interesting <a href="https://openclipart.org/detail/137533/grace-hopper">SVG of Grace Hopper</a> that wanted to figure out how to render in Delphi using the FireMonkey TPath, but it also looked like it should be animated somehow . . . .</p>

<div class="wp-block-image"><figure class="aligncenter"><a href="https://openclipart.org/detail/137533/grace-hopper" target="_blank" rel="noreferrer noopener"><img src="/assets/images/2019/04/grace-hopper-154833_640.png" alt="Grace Hopper illustration by gingercoons" class="wp-image-3310"/></a></figure></div>

<p> I've rendered some simple SVG graphics with the TPath component before, but this one was more complicated. It has multiple colors and variable opacity. This requires multiple TPath instances to handle each variation. It was a simple matter of loading in the SVG file using an IXMLDocument, then parsing the elements, and creating a TPath for each one. For fun I included a variable sleep between each draw. Also, to make sure all the paths have the same relative size I added a couple MoveTo calls to define the client area.</p>

```delphi
var
  XmlSvg: IXMLDocument;
  val: String;
  vals: TArray<String>;
  node: IXMLNode;
  path: TPath;
begin
  tabControl.ActiveTab := TabItem2;
  // This removes the encoded carriage returns
  XmlSvg := LoadXMLData(StringReplace(memo1.Text, '&#xA;', '', [rfReplaceAll]));
  if XmlSvg.DocumentElement.HasAttribute('viewBox') then
  begin
    val := XmlSvg.DocumentElement.Attributes['viewBox'];
    vals := val.Split([' ']);
    SVGLayout.Width := vals[2].ToInteger - vals[0].ToInteger;
    SVGLayout.Height := vals[3].ToInteger - vals[1].ToInteger;
  end;
  for var idx := 0 to XmlSvg.DocumentElement.ChildNodes.Count - 1 do
  begin
    node := XmlSvg.DocumentElement.ChildNodes[idx];
    if (node.NodeName = 'path') and (node.HasAttribute('d')) then
    begin
      path := TPath.Create(svgLayout);
      path.Parent := svgLayout;

      path.WrapMode := TPathWrapMode.Stretch;
      path.Align := TAlignLayout.Contents;

      path.Data.Data := node.Attributes['d'];
      path.Data.MoveTo(TPointF.Zero);
      path.Data.MoveTo(TPointF.Create(SVGLayout.Width, SVGLayout.Height));

      if node.HasAttribute('opacity') then
        path.Opacity := StrToFloat(node.Attributes['opacity']);
      if node.HasAttribute('fill') and (node.Attributes['fill'] <> 'none') and (node.Attributes['fill'] <> '') then
        path.Fill.Color := TAlphaColorRec.Alpha or StringToAlphaColor(node.Attributes['fill']);

    end;
    Sleep(Trunc(TrackBar1.Value));
    svgLayout.Repaint;
    Application.ProcessMessages;
  end;
```

<p>This is by no means a complete implementation of the SVG standard, but it is getting closer! Close enough for some simple SVG images though, and possibly a useful basis for more complicated ones.</p>

<p>The animations was just a matter of assigning a TFloatAnimation to each TPath that adds some random movement. I included both slight scales and rotations. I could have done both on each, but was afraid that might be too much movement.</p>

```delphi
var
  dance: TFloatAnimation;
  path: TPath;
  I: Integer;
begin
  for I := 0 to pred(SVGLayout.ChildrenCount) do
  begin
    if SVGLayout.Children[I] is TPath then
    begin
      path := SVGLayout.Children[I] as TPath;
      dance := TFloatAnimation.Create(nil);
      dancers.Add(dance);
      dance.Parent := Path;
      dance.AutoReverse := True;
      dance.Loop := True;
      dance.StartFromCurrent := True;
      case random(4) of
        0: begin
            case random(2) of
              0: dance.PropertyName := 'Scale.X';
              1: dance.PropertyName := 'Scale.Y';
            end;
            case random(2) of
              0: dance.StopValue := 1.01;
              1: dance.StopValue := 0.99;
            end;
        end;
        1: begin
            case random(2) of
              0: begin
                dance.PropertyName := 'Position.X';
                case random(2) of
                  0: dance.StopValue := Path.Position.X - random - 0.01;
                  1: dance.StopValue := Path.Position.X + random + 0.01;
                end;
              end;
              1: begin
                dance.PropertyName := 'Position.Y';
                case random(2) of
                  0: dance.StopValue := Path.Position.Y - random - 0.01;
                  1: dance.StopValue := Path.Position.Y + random + 0.01;
                end;
              end;
            end;
        end;
        2..3: begin
          dance.PropertyName := 'RotationAngle';
          path.RotationCenter.X := random;
          path.RotationCenter.Y := random;
          case random(2) of
            0: dance.StopValue := random + 0.01;
            1: dance.StopValue := -1 * random - 0.01;
          end;
        end;
      end;
      dance.Enabled := True;
    end;
  end;
```

<p>And we end up with something like this . . .. (Down scaled and lower FPS) </p>

<figure class="wp-block-image"><img src="/assets/images/2019/04/Grace-Hopper-Animatedsample.gif" alt="" class="wp-image-3315"/></figure>

<p>I'm posting my code if you want to play with it some more. The source SVG is embedded in a memo instead of reading it from a file. It was written with Delphi 10.3.1 Rio.</p>

<div class="wp-block-file"><a href="/assets/images/2019/04/SVGAnimation.7z">SVGAnimation</a><a href="/assets/images/2019/04/SVGAnimation.7z" class="wp-block-file__button" download>Download</a></div>

