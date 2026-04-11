---
id: 1645
title: 'OpenGL ES Support on Mobile with XE6'
date: '2014-04-21T17:04:30-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=1645'
permalink: /2014/04/opengl-es-support-on-mobile-with-xe6/
tags:
    - Graphics
    - iOS
    - Mobile
    - 'Source Code'
---

<a href="/assets/images/2014/04/OpenGL_ES_logo.png"><img class="alignright wp-image-1648 size-medium" src="/assets/images/2014/04/OpenGL_ES_logo-300x105.png" alt="OpenGL ES logo" width="300" height="105" /></a><a class="zem_slink" title="Appmethod" href="http://www.appmethod.com/" target="_blank" rel="homepage">Appmethod</a>, <a title="RAD Studio XE6" href="http://www.embarcadero.com/products/rad-studio" target="_blank">RAD Studio</a>, <a title="Delphi XE6" href="http://www.embarcadero.com/products/delphi" target="_blank">Delphi</a> and <a class="zem_slink" title="C++Builder XE6" href="http://www.embarcadero.com/products/cbuilder/" target="_blank" rel="homepage">C++Builder</a> XE6 all make it really easy to work with <a title="OpenGL ES" href="http://www.khronos.org/opengles/" target="_blank">OpenGL ES</a> on mobile devices. Under the covers <a class="zem_slink" title="FireMonkey" href="http://www.embarcadero.com/products/firemonkey" target="_blank" rel="homepage">FireMonkey</a> is implemented with OpenGL ES on mobile (<a class="zem_slink" title="IOS" href="http://www.apple.com/ios/" target="_blank" rel="homepage">iOS</a> &amp; Android), <a title="OpenGL" href="http://www.opengl.org/" target="_blank">OpenGL</a> on <a class="zem_slink" title="OS X" href="http://www.apple.com/osx" target="_blank" rel="homepage">OS X</a> and <a class="zem_slink" title="DirectX" href="http://en.wikipedia.org/wiki/DirectX" target="_blank" rel="wikipedia">DirectX</a> on <a class="zem_slink" title="Windows" href="http://www.microsoft.com/WINDOWS" target="_blank" rel="homepage">Windows</a>. It provides a number of useful abstractions for working with 2D and 3D graphics, but sometimes you just want to get down to a lower level.

Here is all you need to access an OpenGL ES rendering context in your FireMonkey mobile application. This example is in <a title="Object Pascal is Delphi" href="http://www.embarcadero.com/products/delphi" target="_blank">Object Pascal</a>, but should be easy enough to adapt to C++.
<ol>
	<li>Create a new FireMonkey Mobile application</li>
	<li>Select 3D application</li>
	<li>Add <a title="FMX.Types3D" href="http://docwiki.embarcadero.com/Libraries/XE6/en/FMX.Types3D" target="_blank">FMX.Types3D</a> to the Interface uses clause</li>
	<li>In the Object Inspector, create a new event handler for the <a title="FMX.Forms3D.TForm3D.OnRender" href="http://docwiki.embarcadero.com/Libraries/XE6/en/FMX.Forms3D.TForm3D.OnRender" target="_blank">OnRender</a> event for your form</li>
	<li>You now have access to the OpenGL render context.</li>
</ol>
You can work with the <a href="http://docwiki.embarcadero.com/Libraries/XE6/en/FMX.Types3D.TContext3D" target="_blank">TContext3D</a> that is passed in via a parameter, and your code will work across platforms automatically. If you want to work with the <a href="http://www.khronos.org/opengles/sdk/docs/man/">OpenGL ES API</a>s directly you can do that too with the following uses clause in your Implementation section:

[delphi]uses
  // Gives you access to the FMX wrappers for GLES
  FMX.Context.GLES, 
{$IFDEF ANDROID}
  // Direct access to the Android GLES implementation
  Androidapi.Gles, FMX.Context.GLES.Android;
  // More useful units for Android
  //, FMX.Platform.Android, Androidapi.Gles2, Androidapi.JNI.OpenGL,
  // Androidapi.Glesext, Androidapi.Gles2ext;
{$ENDIF}
{$IFDEF IOS}
  // Direct access to the iOS GLES implementation
  iOSapi.OpenGLES, FMX.Context.GLES.iOS;
  // More useful units for iOS
  //, iOSapi.GLKIT, FMX.Platform.iOS;
{$ENDIF}[/delphi]

And here is an example event handler with a couple calls to the OpenGL ES APIs:

[delphi]procedure TForm1.Form3DRender(Sender: TObject; Context: TContext3D);
begin
  glClearColor(1, 1, 0, 1);
  glClear(GL_COLOR_BUFFER_BIT);
end;[/delphi]

This accesses the iOS and Android equivalents of the same OpenGL ES APIs. Thanks to the compiler directives, and the cross platform nature of OpenGL ES, this code just works. I'm not an OpenGL expert, but I looked through the <a title="OpenGL ES Software Development Kit API Reference" href="http://www.khronos.org/opengles/sdk/docs/man/" target="_blank">OpenGL ES API</a> and all the routines I tested worked, but I never did anything interesting with them.
