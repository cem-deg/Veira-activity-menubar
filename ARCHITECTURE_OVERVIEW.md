# ARCHITECTURE_OVERVIEW.md

## Project Pulse Architecture Direction

This document is intentionally lightweight during the planning phase.
It exists to preserve architectural clarity without overcommitting too early.

## Product Shape
- macOS app
- menu bar utility
- dashboard window
- local-first persistence
- deterministic tracking pipeline

## Core Logical Layers
1. Tracking Layer
   - active app detection
   - tracking state
   - lifecycle events

2. Idle Layer
   - input-aware idle handling
   - threshold-based idle segmentation

3. Classification Layer
   - built-in app mapping
   - user override support
   - final category + productivity resolution

4. Persistence Layer
   - store sessions
   - store classification overrides
   - store preferences

5. Presentation Layer
   - menu bar summary
   - dashboard summaries
   - onboarding
   - settings

## Early Architectural Rules
- Do not merge all logic into UI views.
- Keep tracking logic separate from presentation logic.
- Keep classification logic deterministic and explainable.
- Keep persistence decisions local-first.
- Avoid premature abstraction until implementation pressure justifies it.

## Current State
Planning only.
Implementation structure will be refined after Xcode project setup and first scoped technical tasks.
