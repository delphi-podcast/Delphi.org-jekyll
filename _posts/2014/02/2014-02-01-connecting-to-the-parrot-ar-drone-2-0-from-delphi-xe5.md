---
id: 1503
title: 'Connecting to the Parrot AR.Drone 2.0 from Delphi XE5'
date: '2014-02-01T22:36:56-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1503'
permalink: /2014/02/connecting-to-the-parrot-ar-drone-2-0-from-delphi-xe5/
tags:
    - api
    - 'Brain Computer Interface'
    - delphi
    - devices
    - gadgets
    - iOS
    - Mobile
    - parrot
    - quadricopter
    - xe5
---

My first thought when I see cool technology is to figure out how to connect to it with Delphi. So the day I got the Parrot AR.Drone 2.0 quadricopter I started working on Delphi interface. By the time evening rolled around the batteries were dead (after a couple recharges), but I had a basic interface working. The <a href="https://projects.ardrone.org/">official developer</a> guide seemed to be a little out of date, or I was reading it wrong, but once I got my facts staight, connecting was really easy. http://www.youtube.com/watch?v=aaGe2aERwgI The Parrot AR.Drone has it's own access point. Once you've connected to it, then it is simply a matter of sending UDP packets for the basic controls. To accomplish that I simply used the Indy UDP Client: <strong>TIdUDPClient</strong>. Each command is sent with an increasing sequence number, so I initialize my interface as follows:

[delphi light="true"]
  udp := TIdUDPClient.Create(nil);
  udp.Host := '192.168.1.1';
  udp.Port := 5556;
  seq := 1;
[/delphi]

The AR.Drone is always at 192.168.1.1 since it is the access point, and the port for communication is 5556 (one of a few ports, but the one we need for now.) It is worth pointing out that if you've previously flown your AR.Drone with the FreeFlight mobile app then you may need to reset your drone to unpair it. Otherwise it is paired to only that device. The commands are formatted with an <strong>AT*</strong> prefix, and a series of arguments. For example, to take off, the command is <strong>AT*REF=1,290718208</strong> where <strong>AT*REF</strong> is the command, <strong>1</strong> is the sequence number (always the first argument) and <strong>290718208</strong> is a bitmask that means take off. I created a SendCommand routine that looks like:

[delphi light="true"]
procedure TARDrone.SendCommand(cmd, arg: string);
var
  full: string;
begin
  if not udp.Active then Connect;

  full := Format('%s=%d,%s' + Chr(13), [Cmd, Seq, arg]);
  Seq := Seq + 1;
  udp.Send(full);
end;
[/delphi]

Notice the command is terminated with a carriage return (#13). The documentation says line-feed (#10), it is wrong. Supposedly you can send multiple commands in the same message, if they are separated by the carriage return. I haven't tested that. Then I can send the some common commands like this:

[delphi light="true"]
  SendCommand('AT*REF','290718208'); // Takeoff
  SendCommand('AT*REF','290717696'); // Land
  SendCommand('AT*CONFIG', '&quot;control:altitude_max&quot;,&quot;10000&quot;'); // unlimited altitude
  SendCommand('AT*CONFIG', '&quot;control:altitude_max&quot;,&quot;5000&quot;'); // restrituded altitude - unsure what units 500-5000.
  SendCommand('AT*PCMD','1,0,0,0,0'); // Hover (stop movement)
[/delphi]

<strong>PCMD</strong> is the move command. It takes 5 arguments (after the sequence number.) The first is the controller type, which we are leaving <strong>1</strong> for now. The next 4 are <strong>phi, theta, gaz, yaw</strong> and they are floating point numbers in an integer representation. This is where it gets interesting. The documentation says:
<blockquote>The number -<em>0.8</em> is stored in memory as a 32-bit word whose value is <em>BF4CCCCD(base 16)</em>, according to the IEEE-754 format. This 32-bit word can be considered as holding the 32-bit integer value -<em>1085485875(base 10)</em>.</blockquote>
The first way I thought of to access the same memory as two different types is a variant record. So I came up with the following helper routine:

[delphi light="true"]
function IEEEFloat(const aFloat: Single): Integer;
type
  TIEEEFloat = record
    case Boolean of
      True: (Float: Single);
      False: (Int: Integer);
  end;
var
  Convert: TIEEEFloat;
begin
  Convert.Float := aFloat;
  Result := Convert.Int;
end;
[/delphi]

Using that I built a move routine that takes 4 singles (32-bit floats) and sends them as integers:

[delphi light="true"]
procedure TARDrone.Move(const phi, theta, gaz, yaw: Single);
begin
  SendCommand('AT*PCMD',Format('1,%d,%d,%d,%d',
    [IEEEFloat(phi), IEEEFloat(theta), IEEEFloat(gaz), IEEEFloat(yaw)]));
end;
[/delphi]

Now if I want the drone to go up I can call:

[delphi light="true"]
  Move(0,0,5.6,0); // positive gaz is upward acceleration
[/delphi]

Now it is just a matter of figuring out how to the rest of the movements map to the physical worked and building a user interface on Android, iOS, Windows or Mac. Maybe all 4! Once I build up the API a little bit more I'll share some full working apps and libraries. Let me know if you are interested in collaborating on such.
