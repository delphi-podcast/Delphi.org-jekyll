---
title: Delphi.org Time Travel Toolkit
date: 2025-12-15
permalink: /TimeTravelToolkit/
layout: page
redirect_from:
  - /time-travel-toolkit
  - /time travel toolkit
  - /timetraveltoolkit
---

Here are some resources from my Time Traveller's Toolkit session from CodeRage 2025.

Click an infographic thumbnail to get the full quality infographic.

## Temporal Architecture

A programmer's guide to Time Concepts

[![Temporal Architecture - A programmer's guide to Time Concepts - Infographic](infographics/temporalArchitecture.webp)](infographics/fullsize/temporalArchitecture.webp)

## Pysics of Time

From Atoms to Orbits: Atomic Clocks and GPS Relativity

[![Pysics of Time - From Atoms to Orbits: Atomic Clocks and GPS Relativity - Infographic](infographics/temporalArchitecture.webp)](infographics/fullsize/physicsOfTime.webp)

## Core Foundations

The Atomic to Civil Time Pipeline

[![Core Foundations - The Atomic to Civil Time Pipeline -Infographic](infographics/temporalArchitecture.webp)](infographics/fullsize/coreFoundations.webp)

## Escape the Now()

`Now()` is local time, but `TDateTime.NowUTC` is global time. Use UTC for storage and calculations to avoid time zone and daylight saving issues.

[![Escape the Now () and use TDateTime.NowUTC - Infographic](infographics/temporalArchitecture.webp)](infographics/fullsize/escapeTheNow.webp)

## Representation & Interchange

ISO 8601 and RFC 3339 are the standards for representing and exchanging date-time data in a clear, unambiguous format.

[![Representation & Interchange using the ISO 8601 standard Infographic](infographics/temporalArchitecture.webp)](infographics/fullsize/representationAndInterchange.webp)

## Store User Intent, Not UTC

When scheduling events, store the user's local time and time zone instead of converting to UTC. This preserves the intended time across daylight saving changes and time zone shifts.

[![Store User Intent, Not UTC when scheduling future events - Infographic](infographics/temporalArchitecture.webp)](infographics/fullsize/storeUserIntentNotUTC.webp)

## Tale of Two Clocks

Monotonic clocks measure elapsed time without being affected by system clock changes, while wall clocks represent real-world time, which can jump forward or backward due to adjustments.

[![Tale of Two Clocks - Monotonic vs Wall clocks - Infographic](infographics/temporalArchitecture.webp)](infographics/fullsize/measurementAndClocks.webp)

## TDateTime vs TTimeStamp

Both use 64-bits, but TTimeStamp has fixed accuracy for consistent, granular time calculations, while TDateTime's variable accuracy can lead to rounding errors in time arithmetic.

[![TDateTime vs TTimeStamp Infographic](infographics/temporalArchitecture.webp)](infographics/fullsize/TDateTimeVsTTimeStamp.webp)

## Remote NTP Sync

Use NTP to synchronize system clocks with high-precision time servers, ensuring accurate timekeeping across distributed systems and applications.

[![Remote NTP Sync Infographic](infographics/temporalArchitecture.webp)](infographics/fullsize/remoteNtpSync.webp)

## IANA TzDB

The IANA Time Zone Database (TzDB) is the authoritative source for global time zone information, including historical changes and daylight saving rules.

[![The IANA Time Zone Database (TzDB) is the authoritative source for global time zone information, including historical changes and daylight saving rules.](infographics/temporalArchitecture.webp)](infographics/fullsize/ianaTzDb.webp)

## Delphi TzDB vs IANA TzDB

The [Delphi TzDB](https://github.com/pavkam/tzdb) is the full implementation of the IANA TzDB, providing accurate and up-to-date time zone data for Delphi applications.

[![The Delphi TzDB is the full implementation of the IANA TzDB, providing accurate and up-to-date time zone data for Delphi applications](infographics/temporalArchitecture.webp)](infographics/fullsize/delphiTzdb.webp)

## Mastering Daylight Saving Time with the TzDB

Use the TzDB to handle daylight saving time transitions correctly, ensuring scheduled events occur at the intended local times.

[![Use the TzDB to handle daylight saving time transitions correctly, ensuring scheduled events occur at the intended local times.](infographics/temporalArchitecture.webp)](infographics/fullsize/masteringDst.webp)

## Delphi Timekeeper's Overview

The overview roadmap: legacy & foundational types, modern measurement & clocks, time zones & locationalize, and best practices.

[![Delphi Timekeeper's Overview legacy & foundational types, modern measurement & clocks, time zones & locationalize, and best practices Infographic](infographics/temporalArchitecture.webp)](infographics/fullsize/delphiTimeZoneToolkit.webp)
