---
id: 2877
title: 'Creating a Bootable USB Drive on macOS from an ISO'
date: '2017-07-15T23:23:14-06:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2877'
permalink: /2017/07/creating-a-bootable-usb-drive-on-macos-from-an-iso/
categories:
    - News
tags:
    - News
---

Creating a bootable USB drive from an ISO is pretty easy on Windows, but you end up going to the terminal on macOS. Not a big deal if you remember all the commands. Since it seems like I'm frequently installing something (Linux, Windows 10, etc.) on a different I thought I would make a quick blog post listing the steps for next time.
<ul>
 	<li>First convert the ISO into a disk image for macOS.</li>
 	<li>Then rename it to .img</li>
 	<li>Use diskutil to find the target USB drive</li>
 	<li>Unmount the USB drive and write the img file</li>
 	<li>Eject the USB drive</li>
</ul>
<pre>hdiutil convert -format UDRW -o targetfile.dmg sourcefile.iso
mv targetfile.dmg targetfile.img
diskutil list
diskutil unmountDisk /dev/disk4
sudo dd if=Desktop/targetfile.img of=/dev/rdisk4 bs=1m
diskutil eject /dev/disk4</pre>
I usually get an error from macOS when I'm done about not being able to read the USB disk. It is also fairly quick too.
