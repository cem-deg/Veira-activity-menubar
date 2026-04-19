We are continuing an existing structured product project.

# Project
Project Pulse

# Product Summary
Project Pulse is a local-first macOS developer-oriented activity tracker built as a menu bar + dashboard application.

The product is intended to help users understand where their time goes across development-related applications through active app tracking, idle separation, classification, and trustworthy summaries.

# Confirmed Product Decisions
- macOS only
- menu bar + dashboard
- local-first
- onboarding exists
- launch at login may exist
- launch at login does not imply auto-tracking
- tracking must never auto-start on app launch
- user manually starts tracking from the menu bar
- active app tracking is core
- idle detection is core
- idle must appear separately in analytics
- app classification is core
- productivity classification is core
- default classification + user override is core

# V1 Core Features
- active app tracking
- idle detection
- local persistence
- default app classification
- user override for category and productivity
- today summary
- total tracked time
- app breakdown
- weekly view
- menu bar quick summary
- pause / resume tracking
- privacy-aware onboarding

# V1 Non-Goals
- no iOS app
- no cloud sync
- no URL tracking
- no browser tab tracking
- no window-title parsing
- no content inspection
- no keystroke logging
- no screenshot capture
- no AI classification
- no deep work intelligence yet

# Critical Product Priorities
1. tracking correctness
2. idle correctness
3. classification clarity
4. privacy trust
5. scope control

# Workflow Roles
- ChatGPT = planning, architecture direction, scope control, task definition
- Claude Code = primary implementation agent
- Codex = low/medium implementation and audits
- Gemini = review only

# Working Rules
- do not expand scope
- do not refactor unrelated code
- correctness before polish
- deterministic behavior over speculative behavior
- privacy clarity must remain strong
- idle handling is product-critical
- classification quality is product-critical
- all outputs should follow the project templates

# Current Phase
Foundation / planning

# Immediate Goal
Continue from the planning phase without losing product boundaries, workflow discipline, or agent output consistency.
