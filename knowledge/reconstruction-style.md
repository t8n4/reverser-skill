# Reconstruction Style — Source Quality Standard

## Purpose

Define how reconstructed source must look and how it must be organized.

The output should be clean, readable and maintainable without pretending to be the original source.

## 1. Core principles

- Preserve behavior.
- Preserve reliable original names.
- Use inferred names conservatively.
- Prefer natural source syntax.
- Preserve meaningful module boundaries.
- Avoid unnecessary comments.
- Avoid decompiler noise.
- Never invent missing implementations.
- Keep uncertainty explicit.

## 2. Naming

Preserve names from:
- Debug symbols.
- Source maps.
- Managed metadata.
- Export tables.
- Reliable framework metadata.

When names are missing, use behavior-based names.

Examples:

- `parse_header`
- `load_configuration`
- `initialize_subsystem`
- `calculate_hash`
- `process_request`

Do not assign domain-specific names without evidence.

## 3. Functions

Each function should retain:

- Appropriate signature.
- Parameters.
- Return semantics.
- Branch conditions.
- Loops.
- Error paths.
- Relevant side effects.
- Important calls.

Avoid unnecessary restructuring.

Do not replace complex behavior with placeholder functions.

## 4. Classes and structures

Reconstruct classes and structures from reliable metadata and layout evidence.

Preserve:
- Fields.
- Methods.
- Interfaces.
- Inheritance.
- Access patterns.
- Important offsets.

Do not invent an object-oriented architecture for procedural code.

## 5. Formatting

Use consistent indentation and language conventions.

Avoid:
- Excessive blank lines.
- Repeated boilerplate.
- Unnecessary comments.
- Artificial abstractions.
- Random identifier changes.
- Repeated decompiler warnings.
- Unnecessary explanatory wrappers.

Use comments only for meaningful recovered behavior or important unresolved details.

## 6. Missing information

Use three internal categories:

**Known:** directly supported by evidence.

**Inferred:** supported by multiple observations but not directly preserved.

**Unknown:** insufficient evidence.

Do not turn unknown information into invented code.

If necessary, isolate an unresolved function or section.

Do not add empty files merely to imitate a presumed original project structure.

## 7. File organization

Prefer recovered original module boundaries.

When unavailable, group source according to verified responsibilities and relationships.

Do not create arbitrary directory trees.

Use appropriate file extensions and preserve multi-language separation.

## 8. Dependencies

Preserve known dependency names.

Do not invent:
- Versions.
- Package names.
- Repository locations.
- Build systems.
- External service configurations.

Only include essential metadata.

## 9. README

Keep it short.

Include only:
- Project identity, if known.
- Reconstructed language.
- Brief source structure.
- Significant limitations.
- Reconstruction disclaimer.

## 10. Final source quality

Before delivery, check:

- Naming consistency.
- Signature consistency.
- Imports.
- References.
- File structure.
- Duplicate code.
- Unnecessary files.
- Unsupported assumptions.
- Missing major components.

Perform static inspection only.

Never run the reconstructed project.