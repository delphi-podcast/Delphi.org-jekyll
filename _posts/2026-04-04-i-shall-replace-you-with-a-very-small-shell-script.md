---
title: I Shall Replace You with a Very Small Shell Script
date: 2026-04-04T17:44:00.000-06:00
author: Jim McKeeth
layout: post
---
Do you remember the T-shirt "Stop bothering me, or I shall replace you with a very small shell script?" For a long time, that was just a grumpy joke from the tech support trenches. Now I’m realizing it is our new reality.

[![Stop bothering me, or I shall replace you with a very small shell script](/images/uploads/shell-script.webp "Stop bothering me, or I shall replace you with a very small shell script")](/images/uploads/shell-script.webp)

## The Gargantuan Backlog

I just recorded a podcast with Nick Hodges (stay tuned), he pointed out a fundamental truth: the backlog of software that needs to be built is gargantuan. We have a nearly infinite list of features and tools we want to implement, but we’ve always been bottle-necked by time and cost.

[![Two football field's worth of backlog](/images/uploads/football-field-productivity.webp "Two football field's worth of backlog")](/images/uploads/football-field-productivity.webp)

### Agent coding tools change the math

What used to take a two-week sprint to build can now be accomplished in a single afternoon.

The economics of development will shift. Instead of billing $10,000 for 80 hours of tedious boilerplate coding, a developer might charge a flat, value-based rate of $1,500 for a solution they generate, review, and refine in a few hours.

Even though the revenue per individual project drops, the volume of concurrent work we  complete increases dramatically.

Technology keeps upgrading our productivity, allowing us to clear out the backlog rather than getting bogged down in foundational plumbing.

## The Support Call That Changed My Perspective

Earlier tonight I had a work-related call that reminded me why I’ve reached the "grumpy old man" stage of my career. I had written out clear, step-by-step instructions in a Markdown file for a testing environment setup.

The previous process required MS SQL Server Client installation. Typically that installs SQL Client command line utility "`SQLCMD`," and the updated documentation required verifying it was on the system path.

He didn't know how to check if the [SQL Client command line utility](https://learn.microsoft.com/en-us/sql/tools/sqlcmd/sqlcmd-utility) was on the path. I told him the easiest way was to open the terminal and type "Sequel command" (pronouncing it, not spelling it). Even with the document in front of him, he repeatedly typed `SQL Command` (with a space) instead of `sqlcmd`. I finally had to literally tell him the individual keys to press. Reminded me of when I did tech support back in the ‘90.

Oh, and he wasn’t an end user, he was a QA engineer who was *supposedly* experienced with installing and testing our SQL Server based software.

The call went on as I continued explaining things that were already written down. While it only wasted an hour of time on the clock, my rise in blood pressure wasted a couple more days of my life.

## Markdown is the New Programming Language

During our podcast, Nick mentioned that Markdown is effectively the new programming language. If you can describe a process clearly in a Markdown file, you can feed that file to a coding agent, and it will execute the task.

I decided to test this theory with the exact instructions that had just caused an hour of human frustration. I extracted just the steps he found confusing and fed it into a new agent window and told it to make a PowerShell script to complete those steps on Windows Server 2022.

I got busy with a couple of other things, with two other agents, and in a few minutes the script was written, tested, and documented.

## The Reality of the "Shell Script"

The hour I spent on the phone was wasted. The instructions were fine; the "processor" (the human on the other end) was failing to execute the code.

When I gave those same instructions to an AI agent, it performed the task without complaining, without typos, and without needing a hand-holding session. I didn't just automate a task; I literally replaced a frustrating human interaction with a shell script.

If you can't follow the Markdown, the AI will. And that is exactly how jobs will be replaced.
