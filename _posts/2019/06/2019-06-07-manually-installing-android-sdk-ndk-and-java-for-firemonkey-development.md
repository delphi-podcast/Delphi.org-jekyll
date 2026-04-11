---
id: 3345
title: 'Manually Installing Android SDK, NDK, and Java for FireMonkey Development'
date: '2019-06-07T00:55:20-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=3345'
permalink: /2019/06/manually-installing-android-sdk-ndk-and-java-for-firemonkey-development/
categories:
    - Android
tags:
    - Android
---

<figure class="wp-block-image"><img src="/assets/images/2019/06/Manually-Installing-Andorid.png" alt="" class="wp-image-3367"/></figure>

<p>10.3 Rio's installer (I use and recommend the EXE/web over the ISO, since it is faster and more flexible) does a fantastic job of installing and setting everything up for Android development, without requiring any manual steps. Still, sometimes it is nice to be able to manually install everything, which brings me to this guide. </p>

<p>I'm a big believer in understanding the way the underlying systems work, and installing this way is more work, but you are able to see how everything works together. Also, this allows you to share SDKs between multiple installations, and also place the tools like ADB on your path for easy use. Not to say you can't do all of that with the automatic install, but sometimes it is nice to get your hands dirty.</p>

<p>I also occasionally run into people who are having trouble getting things installed for various reasons. So this is a great way to troubleshoot installation issues. </p>

<p>This assumes you already have RAD Studio, Delphi, or C++Builder 10.3 Rio already installed. 10.3 Rio changed the versions of the SDK and NDK that it uses, so this guide won't work with other versions. Also, I switched to <a href="https://adoptopenjdk.net/">AdoptOpenJDK</a> instead of the traditional Oracle JDK. I'll show you how to install that here, but if you use a different JDK that will be different for you.</p>

<figure class="wp-block-image"><img src="https://i1.wp.com/delphi.org/assets/images/2019/06/openjdk-1.png?fit=640%2C174" alt="" class="wp-image-3347"/><figcaption>What is the OpenJDK?</figcaption></figure>

<p><a href="https://openjdk.java.net/">OpenJDK</a>  is a free and open-source implementation of the Java  Platform, Standard Edition. It is the result of an effort Sun  Microsystems began in 2006. The implementation is licensed under the GNU General Public License version 2 with a linking exception. It is  the official reference implementation of Java SE since version 7.</p>

<p>There are multiple builds available, with different terms and support options. Why not just use the Java SE JDK? Oracle has changed the license on it that may require you to purchase a license to use it. For my purposes it is better save than sorry, plus the OpenJDK is a lot smaller and less annoying. I picked  <a href="https://adoptopenjdk.net/">AdoptOpenJDK</a>, which seems to be the most popular option, but this should mostly work the same with any build.</p>

<p>AdoptOpenJDK includes the JRE (Java Runtime Environment) too, so just one install. You must install it first because you can't run the Android SDK manager without Java installed, and the IDE users the JDK for KeyTool and JarSigner.</p>

<h2>AdoptOpenJDK Install Instructions</h2>

<p>Download the <a href="https://adoptopenjdk.net/index.html?variant=openjdk8&amp;jvmVariant=openj9">Windows installer</a> for OpenJDK 8 (LTS). I used the 64-bit Windows version with the HotSpot JVM, and then just run the installation. Be sure to tell it to set the JAVA_HOME environment variable.</p>

<ul><li><a href="https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u212-b04/OpenJDK8U-jdk_x64_windows_hotspot_8u212b04.msi">OpenJDK8U-jdk_x64_windows_hotspot_8u212b04.msi</a></li><li>Windows 64-bit OpenJDK 8 (LTS) with HotSpot JVM </li><li>90.2 MB (94,650,368 bytes)</li><li>SHA256 22303C8338C8015BA34B21829706C1231DD966BD84372CE0DE944C848BB13C52</li></ul>

<figure class="wp-block-image"><img src="/assets/images/2019/06/OpenJDK-Install.jpg" alt="" class="wp-image-3348"/><figcaption>While installing AdoptOpenJDK, have it Set JAVA_HOME environment variable.</figcaption></figure>

<div class="wp-block-image"><figure class="alignright is-resized"><img src="https://i1.wp.com/delphi.org/assets/images/2019/06/Android-sdk.png?fit=640%2C752" alt="" class="wp-image-3364" width="251" height="294"/></figure></div>

<h2>Installing the Android SDK</h2>

<p>When you visit the site to download the Android SDK they try to get you to download the full Android Studio, but you don't need all of that. If you scroll to the bottom, you will see the <a href="https://developer.android.com/studio#command-tools">"Command line tools only" downloads</a>. One note, the downloads listed on the site no longer include the GUI SDK Manager. If you scroll down further, I'll show you how you can download that and use it instead.</p>

<h3>Command-Line Only install</h3>

<ul><li><a href="https://dl.google.com/android/repository/sdk-tools-windows-4333796.zip">sdk-tools-windows-4333796.zip</a></li><li>Windows Platform SDK</li><li>148 MB (156,136,858 bytes)</li><li>SHA256 7e81d69c303e47a4f0e748a6352d85cd0c8fd90a5a95ae4e076b5e5f960d3c7a</li></ul>

<p>This isn't an installer, so just pick a folder to unzip it into. You will just find a "tools" folder in the zip. This contains the SDK Manager to install the rest of the Android SDK. I typically unzip it into the folder: </p>

<pre class="wp-block-preformatted">C:\Users\Public\Documents\Embarcadero\Studio\AndroidSDK\</pre>

<p>Then use the <a href="https://developer.android.com/studio/command-line/sdkmanager">sdkmanager command-line</a> tool (in the tools\bin folder) to install everything you need. Notice I am installing the Android 26 Platform. This is the version you want to use with 10.3 Rio. It meets the new Target SDK requirements and still gives your Android apps maximum compatibility. This is the version 10.3 Rio is designed to work with.</p>

<pre class="wp-block-preformatted">sdkmanager "build-tools;29.0.0" "extras;google;usb_driver" "platforms;android-26" "tools" "platform-tools" </pre>

<h3>Android SDK with GUI Install</h3>

<p>For some reason the Android SDK GUI Installer isn't listed for download, but the file is still available on their servers.</p>

<ul><li><a href="https://dl.google.com/android/repository/tools_r25.2.5-windows.zip">https://dl.google.com/android/repository/tools_r25.2.5-windows.zip</a></li><li>Android SDK release 25.2.5 (this is the version RAD Studio installs, and the last version with the GUI)</li><li>292 MB (306,785,944 bytes)</li><li>SHA256 DA1A0BD9BB358CB52A8FC0A553A060428EFE11151E69B9EA7A5CBACB27CF1C7C</li></ul>

<p>The fact we are installing an older version of the SDK isn't a big deal because we will still update it when we are done, but now we have a choice of using the command-line interface like I showed in the previous section, or using the GUI SDK Manager by running the Android.bat file in the tools folder.</p>

<p>Once you run the SDK manager, you want to install the latest Android SDK Tools, Android SDK Platform-tools, Android SDK Build-tools, Android API 26 SDK Platform, and the Google USB Driver. It will default to installing a lot of other things you don't need. Feel free to deselect those. The Google USB Driver isn't technically needed, but is nice to have.</p>

<figure class="wp-block-image"><img src="/assets/images/2019/06/image.png" alt="" class="wp-image-3354"/><figcaption>The GUI for the Android SDK Manager</figcaption></figure>

<p>Once you've selected what you want installed, you can always update them via the command line with the <a href="https://developer.android.com/studio/command-line/sdkmanager">sdkmanager</a> utility in the tools\bin folder</p>

<pre class="wp-block-preformatted">sdkmanager --update</pre>

<div class="wp-block-image"><figure class="alignright is-resized"><img src="https://i0.wp.com/delphi.org/assets/images/2019/06/Android-ndk.png?fit=640%2C752" alt="" class="wp-image-3365" width="250" height="293"/></figure></div>

<h2>Installing the Android NDK</h2>

<p>10.3 Rio updated the version of the Android NDK it uses to release 17b. It was the latest at the time of Rio's development. There have been some new NDK releases since then. If you visit the <a href="https://developer.android.com/ndk/downloads/older_releases.html">Older Releases page for the Android NDK</a> you will see 17b isn't listed there, but the download file is still available. 17c may work, but I haven't tested it extensively yet.</p>

<ul><li><a href="https://dl.google.com/android/repository/android-ndk-r17b-windows-x86.zip">android-ndk-r17b-windows-x86.zip</a></li><li>Windows 32-bit version 17b</li><li>580 MB (608,351,759 bytes)</li><li>SHA256 4F6128AE1D6382A783EF6C8B836E8DA94B81AA490DC83DDCD2788BFE27E40A53</li></ul>

<p>The NDK is also a zip file, so just extract it to the folder of your choosing. I'll extract it next to my Android SDK. The root folder in the zip file is "android-ndk-r17b"</p>

<pre class="wp-block-preformatted">C:\Users\Public\Documents\Embarcadero\Studio\android-ndk-r17b </pre>

<p>There are no further installation steps necessary. Your folders should look something like this when you are done:</p>

<figure class="wp-block-image"><img src="/assets/images/2019/06/Studio-SDK-Folders-1.png" alt="" class="wp-image-3352"/><figcaption>The folder containing the Android SDK and NDK</figcaption></figure>

<p>I've expanded the directories so you can see the build tools and Android platforms also installed</p>

<h2>Environment Variables and System Path</h2>

<p>Last thing you need to do is set up some Environment Variables and add things to your system path. This isn't strictly necessary, but I highly recommend it! </p>

<figure class="wp-block-image"><img src="/assets/images/2019/06/image-1.webp" alt="" class="wp-image-3355"/><figcaption> Make sure your JAVA_HOME is correct, and set the ANDROID_HOME environment variable.  </figcaption></figure>

<p>Then add the following to your system path</p>

<ul><li>%JAVA_HOME%\bin (you can replace the expanded version with this)</li><li> %JAVA_HOME%\jre\bin </li><li>%ANDROID_HOME%\tools </li><li>%ANDROID_HOME%\tools\bin </li><li>%ANDROID_HOME%\platform-tools  </li></ul>

<figure class="wp-block-image"><img src="/assets/images/2019/06/image-3.png" alt="" class="wp-image-3357"/><figcaption>The first JAVA path is the JRE, the second is the JDK. <br>Using the environment variables in the path saves environment space.</figcaption></figure>

<h2>Settings Up the IDE SDK Manager</h2>

<p>Since we've installed the SDK manually, we need to tell the IDE where to find it. This is really simple. Go into Tools ? Options ? Deployment ? SDK Manager (or just use the IDE search for SDK Manager) and add a new SDK entry.</p>

<figure class="wp-block-image"><img src="/assets/images/2019/06/image-5.png" alt="" class="wp-image-3359"/><figcaption>If you have an existing Android entry here, you can remove it before adding a new one.</figcaption></figure>

<figure class="wp-block-image"><img src="/assets/images/2019/06/image-4.png" alt="" class="wp-image-3358"/><figcaption>We are adding a new Android platform.</figcaption></figure>

<figure class="wp-block-image"><img src="/assets/images/2019/06/image-6.png" alt="" class="wp-image-3360"/><figcaption>Provide the three paths based on where you installed them</figcaption></figure>

<p>The next stage in the wizard looks to make sure it can find everything it needs. If you didn't install everything with the Android SDK Manager, then you may see a warning symbol next to something. If that is the case go back and double check the installation.</p>

<figure class="wp-block-image"><img src="/assets/images/2019/06/image-7.png" alt="" class="wp-image-3361"/><figcaption> Be sure you select Android-26 for the API level, especially if you installed other versions too. <br>The SDK Manager found everything it needs to continue.</figcaption></figure>

<p>And with that you are ready to develop and deploy Android apps with FireMonkey.</p>

