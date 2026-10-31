# Static-First Workflow

## Objective

Analyze an authorized target using static methods, coordinate REA and alternative providers, reconstruct source and deliver one clean source directory.

## Phase 1 — Input preservation

1. Identify the supplied target.
2. Confirm the intended analysis scope.
3. Preserve the original.
4. Work on a separate copy when necessary.
5. Do not launch or execute any target component.

## Phase 2 — Tool discovery

1. Inspect available MCP tools.
2. Identify REA operations.
3. Read actual tool schemas.
4. Determine static versus runtime behavior.
5. Identify compatible local tools.
6. Select providers based on actual availability.

Do not invent tools or arguments.

## Phase 3 — Target identification

Determine:
- Format.
- Architecture.
- Operating-system target.
- Language.
- Runtime.
- Compiler clues.
- Dependencies.
- Debug metadata.
- Packing and obfuscation indicators.

Use the binary-format reference.

## Phase 4 — Structural analysis

Inspect:
- Headers.
- Sections.
- Symbols.
- Imports.
- Exports.
- Resources.
- Strings.
- Modules.
- Function boundaries.

Build an internal structural map.

## Phase 5 — REA analysis

If available:

1. Obtain overview.
2. Inspect the target.
3. Enumerate relevant functions.
4. Decompile important functions.
5. Trace callers and callees.
6. Inspect cross-references.
7. Retrieve relevant data types and metadata.
8. Cross-check important observations.

Use only static REA operations.

## Phase 6 — Alternative analysis

If REA is missing or incomplete:

1. Select compatible static providers.
2. Inspect the same relevant structures.
3. Use format-specific decompilers.
4. Compare independent results.
5. Preserve unresolved differences.

Do not repeatedly invoke unavailable tools.

## Phase 7 — Deep reconstruction

Prioritize:
1. Entry-point-related code.
2. Initialization.
3. Main application logic.
4. Major subsystems.
5. Public interfaces.
6. Important data models.
7. Utility functions.
8. Supporting modules.

Use control-flow, data-flow and cross-reference evidence.

Do not waste effort exhaustively decompiling irrelevant runtime boilerplate when the user's requested scope is narrower.

## Phase 8 — Source generation

1. Determine the most defensible source language.
2. Recover names and types.
3. Reconstruct functions.
4. Reconstruct classes and structures.
5. Restore module relationships.
6. Preserve behavior.
7. Separate unresolved regions.
8. Apply reconstruction-style rules.

## Phase 9 — Static review

Check:
- Source organization.
- File naming.
- Imports.
- Function signatures.
- Duplicate definitions.
- Missing references.
- Inconsistent types.
- Unsupported assumptions.
- Unnecessary files.

Do not build or execute the project.

## Phase 10 — Delivery

Create:

`decompiled_source/`

Include only source files and essential metadata.

Do not include raw analysis logs, tool databases, caches, dumps or temporary files.

Preserve the original target.

## Failure handling

If a provider fails:
- Identify the unavailable capability.
- Try a compatible alternative.
- Continue with accessible components.
- Do not invent results.

If a region cannot be reconstructed:
- Preserve the known structure.
- Mark the region unresolved.
- Continue with the rest of the target.

## Final response

Summarize:
- Identified format.
- Identified language.
- Providers actually used.
- Major reconstructed components.
- Important limitations.
- Output location.

Keep the response concise.

## Absolute restriction

The original target and reconstructed source must never be executed under this workflow.