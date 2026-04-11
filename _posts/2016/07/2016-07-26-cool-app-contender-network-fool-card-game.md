---
id: 2584
title: 'Cool App Contender: Network Fool Card Game'
date: '2016-07-26T02:04:54-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2584'
permalink: /2016/07/cool-app-contender-network-fool-card-game/
categories:
    - News
tags:
    - 'Cool Apps'
    - News
---

I don't know Russian, but I suppose I think I'm pretty good at recognizing Cyrillic characters and assuming it must be Russian. But I checked with Google Translate and it tells me that this is Russian for "Network Fool game." <a href="https://www.youtube.com/watch?v=8GvZc2I2kbk">The video</a> also includes some Cyrillic text on buttons and such, but no audio.

https://www.youtube.com/watch?v=8GvZc2I2kbk

It turns out Network Fool isn't just a card game. It is an plugin for the <a href="http://www.commfort.com/">chat system CommFort</a>. Maxim describes the architecture pretty well:
<blockquote>Since the text chat is a client-server structure I had to write the server side of the game - to store statistics and other calculations, as well as the client part. However, the client side is not so simple, it not only communicates with the server, but also starts a separate process for the graphic display of the game and builds a GUI in the chat window. The server and client side is a dll library written with VCL, and the graphical shell is a separate exe using FMX.</blockquote>
I love that network fool integrates with a 3rd party system, extending a chat system into a full card game platform. The fact that is uses both FireMonkey and VCL to make it all work is a great example of flexibility and versatility. It is developed with Delphi, and uses FireDAC and Named Pipes to make it all work.

<a href="https://www.youtube.com/watch?v=8GvZc2I2kbk">Watching the video</a> I would not have expected that it was a card game plugged into a chat system. It looks more like a card game with an integrated chat window. I'm always tickled to see people extend systems in new and creative ways like this. Certainly a cool app contender.

<a href="https://www.embarcadero.com/products/delphi"><img class="alignnone" src="http://delphi.org/mvp/logo/PoweredBy/Delphi/Built_with_Delphi.png" alt="Built with Delphi" width="199" height="81" /></a> <a href="https://www.embarcadero.com/products/delphi"><img class="alignnone" src="http://delphi.org/mvp/logo/PoweredBy/FireMonkey/Built_with_FireMonkey.png" alt="Built with FireMonkey" width="196" height="80" /></a> <a href="https://www.embarcadero.com/products/delphi"><img class="alignnone" src="http://delphi.org/mvp/logo/PoweredBy/VCL/Built_with_VCL.png" alt="Built with VCL" width="196" height="80" /></a>

Notice the VCL button doesn't have an icon on it? You may remember the old one with the colorful, 3D shaded shapes: circle, cube and cone. I'm working on a new one that I hope you all like just as much. Stay tuned!
