---
id: 2953
title: 'Law of the Instrument and Curse of the Programmer'
date: '2018-01-10T14:59:08-07:00'
author: 'Jim McKeeth'
layout: post
guid: 'http://delphi.org/?p=2953'
permalink: /2018/01/curse-of-the-programmer/
image: /assets/images/2018/01/hammer-screw-940x198.jpg
categories:
    - News
tags:
    - Article
    - News
---

If you aren't familiar with the <a href="https://en.wikipedia.org/wiki/Law_of_the_instrument">Law of the Instrument</a>, otherwise known as Maslow's hammer/gavel, or the golden hammer it is often expressed as

<blockquote>If your only tool is a hammer, you treat everything as like a nail.</blockquote>

My understanding is that the law of the instrument means you are limited by instruments or tools you know how to use. For example, if you have a screw, some wood, and a hammer, then you might successfully get the screw into the wood, but a screwdriver would be a better alternative.

<img class="wp-image-2956 size-full" src="/assets/images/2018/01/hammer-screw.jpg" alt="Law of the instrument" width="960" height="640" /> Image from Pixabay by <a href="https://pixabay.com/photos/confused-muddled-illogical-880735/">Steve Buissinne</a>

The law of the instrument also means an obsession with the perfection of the instruments you know. I remember back in the day when I was convinced there was no reason to bother with any other programming languages because Delphi was the best. Now I've spent some time using a lot of other programming languages, and so I can confidently say Delphi is the best, while I can see the value and use of other programming languages.

I believe it is worthwhile learning about new technologies, frameworks, languages, or methodologies. Then you can pick the correct one for the job. This doesn't mean you need to be an expert in all of them, but you should know enough that you are confident in your choice.

The reverse of this is the obsession to chase new and exciting technologies and recreate things every few years. This keeps the developers entertained, but doesn't really provide business value. Again I believe Delphi does a good job with this as it respects your existing code while moving forward to new platforms, features, and frameworks.

So what is the <strong>Curse of the Programmer</strong>?

When I'm talking to other programmers I see two behaviors. The first is, every problem they encounter in life (at work and beyond) they respond with "<em>I could write a program to do this</em>," or some variation. By extension, they also cast a critical eye toward any software system (even those developed by themselves) to see how to do them better. This results in a huge backlog of projects that they create to fix problems, fix a problem better, or just out of curiosity to see if they can.

This is similar to the Law of the Instrument, but I see it more as your learning the flexibility and power of programming results in your seeing many opportunities to apply it. I've talked to people in other industries, and I think the general tendency is fairly universal, it is just that programming is (in my opinion) so much more powerful and flexible than many other applied technologies.

The second behavior, which is something to be more cautious about falling into, is the <em>urge to create a "<strong>library</strong>" or "<strong>framework</strong>" instead of finishing the program at hand</em>. For example, you are creating a program to solve a problem, and in the process, you create series of libraries just in case you need to solve similar problems.

There is value in having reusable libraries, functions, components, and frameworks. The trick is to not let the creation of them get in the way of shipping. The best way I've found to deal with this is to only create the library when you need it. Write your code with the appropriate level of coupling to solve the problem at hand. When you need to reuse a bit of it elsewhere, consider refactoring it into something reusable. Then as you use it in more places you can keep refactoring it and expanding it until you have a full blown framework.

<em><strong>How do you see the Curse of the Programmer in your life? What do you use to prevent every project from spawning a series of reusable frameworks?</strong></em>
