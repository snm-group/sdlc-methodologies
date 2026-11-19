# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A documentation-only repository (no code, build, lint, or tests) that collects SDLC methodologies, taught through one running case study: an **Employee Management** web app meant to replace an HR Google Spreadsheet (see `README.md`). Content is Markdown, Mermaid diagrams, and a Gherkin example. Author: sonnm; versioned in the table at the top of `README.md`.

## Structure

- `README.md` — case study (business problem and solution) plus the index of methodology docs. New docs should be linked here or from `methodologies.md`.
- `methodologies.md` — index of methodology docs (currently the 4+1 doc).
- `definitions.md` — shared glossary (e.g. Use Case = Actor + Behavior + Business Goal). Reuse these terms in other docs.
- `4-plus-1-architecture.md` — Kruchten's 4+1 view model applied to the case study: collecting and breaking down use cases, three estimation methods (complexity matrix, task slicing, Use Case Points), tools.
- `logical-view-method.md` / `logical-view-guide.md` — the Logical view: turning a use case into a class diagram (noun extraction, attributes, relationships, multiplicity, iteration via exception flows). The method file holds the decision flow; the guide is the longer worked walkthrough.
- `process-view-*.md`, `development-view-*.md`, `physical-view-*.md` — the other three views, each as a `-method.md` (short step-by-step with decision flow and UC-01 example) plus a `-guide.md` (workflow, templates, decision log, traceability, checklist), mirroring the logical view pair. Decision log prefixes: `LD-` logical, `PD-` process, `DV-` development, `PH-` physical.
- `ems-use-cases.md` — the case study's use cases; the shared input to the other docs.
- `examples/bdd-example.feature` — Gherkin scenarios for the Employee 360 Profile use case (role-based visibility, e.g. BOD sees salary, Line Manager does not).
- `ai/` — "Working with AI" section; `ai/claude.md` is currently an empty stub.
- `image.png`, `image-1.png` — diagrams embedded in `4-plus-1-architecture.md`.

## Conventions

- The docs form a pipeline anchored on the case study: use cases (Scenarios view) → logical view (class diagram) → process view (runtime) → development view (modules) → physical view (nodes). Each view's Step 6 fills one more column of the shared use case traceability table (`logical-view-guide.md` §9.2), so keep component, message, module, and node names consistent across views. Keep examples consistent with the Employee Management domain and the actors in `ems-use-cases.md` (HR, BOD, Line Manager, etc.).
- Diagrams are Mermaid fenced blocks, so they render on GitHub; keep them valid Mermaid.
- Relative links between docs (`./file.md`); `4-plus-1-architecture.md` has a manual table of contents, so update it when adding or renaming headings.
