---
title: Delphi.org Time Travel Toolkit
date: 2025-12-15
permalink: /TimeTravelToolkit
layout: page
---

Here are some resources from my Time Traveller's Toolkit session from CodeRage 2025.

Click a thumbnail to get the full quality infographic on [my Pareon](https://www.patreon.com/c/JimMcKeeth) 

## Temporal Architecture

A programmer's guide to Time Concepts

[![Temporal Architecture - A programmer's guide to Time Concepts - Infographic](infographics/temporalArchitecture.webp)](https://www.patreon.com/c/JimMcKeeth)

## Pysics of Time

From Atoms to Orbits: Atomic Clocks and GPS Relativity

[![Pysics of Time - From Atoms to Orbits: Atomic Clocks and GPS Relativity - Infographic](infographics/physicsOfTime.webp)](https://www.patreon.com/c/JimMcKeeth)

## Core Foundations

The Atomic to Civil Time Pipeline

[![Core Foundations - The Atomic to Civil Time Pipeline -Infographic](infographics/coreFoundations.webp)](https://www.patreon.com/c/JimMcKeeth)

## Escape the Now()

`Now()` is local time, but `TDateTime.NowUTC` is global time. Use UTC for storage and calculations to avoid time zone and daylight saving issues.

[![Escape the Now () and use TDateTime.NowUTC - Infographic](infographics/escapeTheNow.webp)](https://www.patreon.com/c/JimMcKeeth)

## Representation & Interchange

ISO 8601 and RFC 3339 are the standards for representing and exchanging date-time data in a clear, unambiguous format.

[![Representation & Interchange using the ISO 8601 standard Infographic](infographics/representationAndInterchange.webp)](https://www.patreon.com/c/JimMcKeeth)

## Store User Intent, Not UTC

When scheduling events, store the user's local time and time zone instead of converting to UTC. This preserves the intended time across daylight saving changes and time zone shifts.

[![Store User Intent, Not UTC when scheduling future events - Infographic](infographics/storeUserIntentNotUTC.webp)](https://www.patreon.com/c/JimMcKeeth)

## Tale of Two Clocks

Monotonic clocks measure elapsed time without being affected by system clock changes, while wall clocks represent real-world time, which can jump forward or backward due to adjustments.

[![Tale of Two Clocks - Monotonic vs Wall clocks - Infographic](infographics/measurementAndClocks.webp)](https://www.patreon.com/c/JimMcKeeth)

## TDateTime vs TTimeStamp

Both use 64-bits, but TTimeStamp has fixed accuracy for consistent, granular time calculations, while TDateTime's variable accuracy can lead to rounding errors in time arithmetic.

[![TDateTime vs TTimeStamp Infographic](infographics/TDateTimeVsTTimeStamp.webp)](https://www.patreon.com/c/JimMcKeeth)

## Remote NTP Sync

Use NTP to synchronize system clocks with high-precision time servers, ensuring accurate timekeeping across distributed systems and applications.

[![Remote NTP Sync Infographic](infographics/remoteNtpSync.webp)](https://www.patreon.com/c/JimMcKeeth)

## IANA TzDB

The IANA Time Zone Database (TzDB) is the authoritative source for global time zone information, including historical changes and daylight saving rules.

[![The IANA Time Zone Database (TzDB) is the authoritative source for global time zone information, including historical changes and daylight saving rules.](infographics/ianaTzDb.webp)](https://www.patreon.com/c/JimMcKeeth)

## Delphi TzDB vs IANA TzDB

The [Delphi TzDB](https://github.com/pavkam/tzdb) is the full implementation of the IANA TzDB, providing accurate and up-to-date time zone data for Delphi applications.

[![The Delphi TzDB is the full implementation of the IANA TzDB, providing accurate and up-to-date time zone data for Delphi applications](infographics/delphiTzdb.webp)](https://www.patreon.com/c/JimMcKeeth)

## Mastering Daylight Saving Time with the TzDB

Use the TzDB to handle daylight saving time transitions correctly, ensuring scheduled events occur at the intended local times.

[![Use the TzDB to handle daylight saving time transitions correctly, ensuring scheduled events occur at the intended local times.](infographics/masteringDst.webp)](https://www.patreon.com/c/JimMcKeeth)

## Delphi Timekeeper's Overview

The overview roadmap: legacy & foundational types, modern measurement & clocks, time zones & locationalize, and best practices.

[![Delphi Timekeeper's Overview legacy & foundational types, modern measurement & clocks, time zones & locationalize, and best practices Infographic](infographics/delphiTimeZoneToolkit.webp)](https://www.patreon.com/c/JimMcKeeth)
