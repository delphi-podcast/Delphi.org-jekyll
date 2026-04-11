---
id: 2644
title: 'FireMonkey vs. VCL'
date: '2016-10-04T18:32:13-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2644'
permalink: /2016/10/firemonkey-vs-vcl/
tags:
    - design
    - FireMonkey
    - 'User Interface'
    - VCL
---

Frequently when I am talking about the VCL or FireMonkey I get some of these common questions:
<ul>
 	<li>Is VCL deprecated?</li>
 	<li>Which is better FMX or VCL?</li>
 	<li>If I am starting a new app today, should I use VCL or FMX?</li>
</ul>
<img class="aligncenter size-full wp-image-2653" src="/assets/images/2016/10/FireMonkeyVsVCL.png" alt="FireMonkey vs. VCL" width="700" height="350" />

The first is easy to answer, the other two are a little harder. The VCL (or Visual Component Library) is <em><strong>NOT</strong></em> depreciated, nor will it be any time soon. As long as there is Windows and the Windows API, there will be VCL. Just recently in <a href="http://embt.co/delphiwin10webinar">Marco's Windows 10 Webinar</a> he said "<em>VCL is the best library for Windows desktop development and fully embraces Windows 10.</em>"

The VCL gets new components, features and bug fixes frequently, but maybe not as often as FireMonkey. The reason is the VCL is a mature framework, while FireMonkey has been going through a lot of growth the past few versions (although it has stabilized a lot recently, and is reaching a more mature status.)

So which is better, and which to use? There isn't a straightforward answer, but instead I can tell you the advantages of each, and you can make an educated choice for your next project.
<h1><img class="wp-image-2646 alignright" src="/assets/images/2016/09/VCL_v1.png" alt="Visual Component Library (VCL)" width="276" height="276" />Visual Component Library (VCL)</h1>
The VCL was release with the first version of Delphi. It is mostly a thin wrapper over the Windows API controls, but also includes a lot of owner draw controls. It uses GDI, Windows Handles and Windows Messages. This makes it subject to the same behavior as 90% of the other windows applications out there. If you want to you can inject a VCL button from your app into another app, or sniff messages sent to a different app and redirect them into yours.

As I said earlier, the VCL is mature, and so is the 3rd party component space. There are thousands of high quality VCL components, controls and libraries out there. Probably the most notable are the grids. The VCL grids are the best in the industry, and for good reason, our technology partners were making grids for the VCL before any other platforms had the idea of 3rd party controls. So if you want the best grid on the planet, you will probably use the VCL (although the FireMonkey grids are gaining fast).

Because VCL is mostly a thin wrapper on the Windows API, VCL based applications are much smaller than FireMonkey applications. Anymore this usually isn't a huge deal with fast download speeds and huge hard drive sizes. But if you need a really small lightweight application, then VCL might be a good choice.

Because VCL has been around a while, you may have some existing VCL code that you want to integrate into your application. You could use a utility like <a href="http://www.midaconverter.com/">Mida converter</a> to convert it to FireMonkey, or something like Monkey Mixer or <a href="https://parnassus.co/tfiremonkeycontainer-a-vcl-control-for-mixing-vcl-and-fmx/">TFireMonkeyContainer</a> to mix FireMonkey with VCL.

Generally if I am building a simple grid intensive application that I know will only run on Windows, then I find myself using VCL. Or if I need to leverage a specific 3rd party control, or Windows API feature that requires Windows messages. This is less and less frequent though.
<h1><img class="alignright  wp-image-2647" src="/assets/images/2016/09/FireMonkey_v2.png" alt="FireMonkey (FMX)" width="276" height="276" />FireMonkey Cross Platform Framework (FMX)</h1>
As FireMonkey is a newer framework you tend to see it covered more. A lot of people are still learning how to use it, and how to tackle cross platform development. The main advantage of FMX is that it is designed from the ground up to be a cross platform framework. It lets you design a single user interface that runs and looks great on Windows, iOS, macOS and Android. But that isn't the only reason to use FireMonkey.

FireMonkey is based on the latest GPU frameworks: DirectX for Windows and OpenGL elsewhere. It supports both 3D and 2D rendering models, both of which are hardware accelerated. If you want to have some powerful graphic effects or 3D, then FireMonkey is probably going be your first choice. There are some really powerful 3D engines as well as some great graphics effects libraries for VCL, but FireMonkey has these ideas baked into it's core.

FireMonkey is also a lot more flexible. You can embed any control in any other control with FireMonkey. This ability to build composite controls turns the smaller set of controls it includes into a much more robust set of controls. Also there are animations and effects that let you build fantastic, rich user interfaces with very little effort.

VCL has a respectable set of containers and alignments, but FireMonkey has many, many more, and again they are much more flexible. Another big difference is FireMonkey uses a single precision floating point number instead of an integer in laying out the controls. Much higher precision, but typically subpixel precision doesn't buy you much. Where it does make a difference is when you scale on FireMonkey since it supports multiple pixel densities.

The most obvious reason to use FireMonkey is if you are currently planning to target multiplatform, or there is a possibility you might in the future (which is a pretty high likelihood). The other reasons are you want a more flexible UI or you plan to take advantage of 3D or other effects FireMonkey provides.
<h1>Conclusion</h1>
In summary VCL is amazing, and continues to get fixes and new features. It is a better user interface framework than any other out there, except maybe FireMonkey. So use VCL when you are only targeting Windows and don't need the 3D, effects or flexibility of FireMonkey. Use FireMonkey when you are going multiplatform, or you new some of FireMonkey's flexibility especially when working around graphics.

Both frameworks will be around for a while. As you use them both you will get a better feel for which to use in each situation. I'd love to hear your feedback about when you choose which framework.
