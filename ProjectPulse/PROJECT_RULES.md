# PROJECT_RULES.md

## Core Principle
Project Pulse must remain controlled, privacy-aware, and correctness-first.

## Priority Order
When tradeoffs appear, use this order:
1. correctness
2. privacy clarity
3. scope control
4. maintainability
5. polish
6. expansion

## Product Rules
- This project is macOS-only.
- This project is a menu bar + dashboard product.
- This project is local-first.
- Tracking must never start automatically on app launch.
- The user must explicitly start tracking from the menu bar.
- Launch at login does not imply auto-tracking.
- Idle must be represented separately.
- Category and productivity classification must be explainable.
- Default classification plus user override is required.

## V1 Scope Rules
Allowed in V1:
- active app tracking
- idle detection
- classification system
- local persistence
- onboarding
- menu bar controls
- dashboard summaries

Not allowed in V1 unless explicitly approved:
- iOS support
- cloud sync
- URL tracking
- browser tab tracking
- window-title parsing
- AI-based categorization
- deep work intelligence
- speculative recommendation systems
- “smart” automation beyond defined scope

## Privacy Rules
- Do not implement keystroke logging.
- Do not implement screenshot capture.
- Do not implement content inspection.
- Do not imply invasive tracking in product copy.
- Do not request permissions that are not required for the approved scope.
- Any user-facing privacy text must be plain, explicit, and trustworthy.

## Tracking Rules
- Tracking correctness is product-critical.
- Idle handling is product-critical.
- Mouse, click, keyboard, and scroll behavior must be considered in design and implementation where relevant.
- Do not use weak or misleading heuristics without explicit approval.
- Do not silently treat ambiguous behavior as certainty.
- Prefer clear deterministic logic over speculative logic.

## Idle Rules
- Idle must be separable from active usage.
- Idle must appear in analytics rather than disappearing silently.
- Idle thresholds must remain user-controlled only within the approved set.
- Any future idle confirmation prompt requires explicit approval and is not default V1 behavior.

## Classification Rules
- Use bundle identifier as the core app identity key.
- Built-in classifications must be deterministic.
- User override must take precedence over built-in mapping.
- Classification must remain understandable to the user.
- Avoid hidden logic that makes classification hard to explain.

## Engineering Rules
- No random refactors.
- No unrelated file changes.
- No broad rewrites without approval.
- Keep changes scoped and reviewable.
- Separate UI logic from product logic when practical.
- Prefer modular and explicit structure.
- Prefer clarity over abstraction for its own sake.
- Do not introduce unnecessary dependencies.

## Workflow Rules
- ChatGPT handles planning, scope control, and task definition.
- Claude Code is the primary implementation agent.
- Codex handles low/medium complexity implementation and audit tasks.
- Gemini handles review, risk analysis, and issue classification.
- All agents must follow shared project context and output standards.

## Documentation Rules
Before implementation work grows, maintain:
- PROJECT_CONTEXT.md
- PROJECT_RULES.md
- CLAUDE.md
- TASK_TEMPLATE.md
- REVIEW_TEMPLATE.md
- any task-specific handoff notes as needed

## Output Rules
Every implementation response must include:
- Plan
- Changed Files
- What Was Done
- Risks
- Open Questions

Every review response must include:
- Critical Issues
- Medium Issues
- Minor Issues
- Nice to Have
- Regression Risk
- Final Decision

## Scope Discipline
When a task is narrowly scoped:
- solve the scoped problem
- do not redesign adjacent systems
- do not “improve” unrelated areas
- do not use the task as an excuse for cleanup elsewhere

## Escalation Rule
If a requested change would likely affect:
- tracking correctness
- idle correctness
- persistence correctness
- privacy model
- onboarding expectations
- product scope

then the agent must call it out explicitly in Risks or Open Questions instead of quietly proceeding.
