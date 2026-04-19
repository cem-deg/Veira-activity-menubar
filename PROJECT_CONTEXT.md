# Project Pulse

## Project Type
Project Pulse is a local-first macOS developer-oriented activity tracker.

## Product Shape
The product is built as:
- a menu bar utility
- a dashboard window
- a local-first analytics tool

This is not a web app.
This is not an iPhone product.
This is not a cloud-first SaaS.

## Product Goal
Help users understand where their time goes across development-related applications by tracking active app usage, separating idle time, classifying usage into categories, and presenting clear summaries in a trustworthy way.

## Product Character
- developer-oriented
- privacy-aware
- practical
- premium
- utility-first
- explainable, not gimmicky

## Confirmed Product Decisions
- macOS only
- menu bar + dashboard
- local-first
- tracking never starts automatically on app launch
- user must manually start tracking from the menu bar
- onboarding exists
- launch at login may be enabled
- launch at login must NOT imply auto-tracking
- active application tracking is core
- idle detection is core
- idle must be shown separately in analytics
- category classification is core
- productivity classification is core
- default classification + user override is core

## V1 Core Features
- active app tracking
- idle detection
- app identity handling via bundle identifier
- default app classification
- user override for category and productivity classification
- today summary
- total tracked time
- app breakdown
- weekly view
- menu bar quick summary
- pause / resume tracking
- clear privacy-oriented onboarding

## V1 Non-Goals
- no iOS app
- no browser URL tracking
- no browser tab tracking
- no window-title parsing
- no content inspection
- no keystroke logging
- no screenshot capture
- no AI classification
- no “smart” activity inference that cannot be explained clearly
- no deep work intelligence in V1
- no cloud sync in V1

## Sensitive Product Areas
These areas are product-critical and must be treated carefully:
- idle detection correctness
- app tracking correctness
- classification correctness
- persistence correctness
- privacy messaging
- menu bar control behavior

## Tracking Philosophy
Tracking correctness matters more than feature count.
Explainable behavior matters more than clever-looking behavior.
Privacy clarity matters more than aggressive automation.

## Current Phase
Foundation / planning phase

## Immediate Objective
Establish project rules, agent workflow, templates, and documentation before beginning implementation inside Xcode.
