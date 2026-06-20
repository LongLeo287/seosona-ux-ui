# SEOSONA UX-UI Project Rules

This project is bound to SEOSONA OS through `seosona.project.json`.

## Identity

**SEOSONA UX-UI** is a dual-purpose system:
1. **Design Library** — The single source of truth for all SEOSONA web product design standards.
2. **Autonomous UX/UI Agent System** — A self-operating team of AI agents that can research, design, build, and deliver complete web UI/UX projects.

## Startup Contract

1. Resolve SEOSONA OS through `~/.seosona`.
2. Read `~/.seosona/1_CORE/SOUL.md` (OS-level identity).
3. Read this project's `SOUL.md` (UX/UI design constitution — MANDATORY before any design work).
4. Read `1_LIBRARY/tokens/design-tokens.md` for exact color/spacing values.
5. Check active project memory at `4_MEMORY/projects/`.
6. Route task through appropriate workflow in `2_AGENTS/workflows/`.

## Design Enforcement

**CRITICAL:** Before writing a single line of CSS or HTML, you MUST:
- Read and internalize `SOUL.md` completely.
- Verify your color choices against `1_LIBRARY/tokens/design-tokens.md`.
- Check `1_LIBRARY/components/` for existing reusable components before building new ones.

## Project Connector

- Manifest: `seosona.project.json`
- Memory namespace: `seosona-uxui`
- Autonomy level: `project_edit`
- Output format: HTML/CSS/JS (vanilla) — framework-agnostic
- Publish/deploy actions require explicit user intent.

## Agent Activation

For design tasks, activate agents from `2_AGENTS/personas/`:
- UI/UX design, wireframes, mockups → `ui-ux-designer`
- Animations, micro-interactions, motion → `frontend-motion-interaction-designer`

## Output Convention

All deliverables go into:
- `4_MEMORY/exports/` — Standalone HTML files, component demos
- `4_MEMORY/projects/{project-name}/` — Full project workspaces
- `4_MEMORY/audits/{domain}/` — UX audit reports
