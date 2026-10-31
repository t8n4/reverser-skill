# Protections and Obfuscation — Static Analysis Reference

## Purpose

Identify transformations that reduce source recoverability. Explain their impact and determine which parts can be reconstructed through permitted static analysis.

This document does not authorize bypassing licensing, DRM, authentication or access controls.

## 1. Classification

Distinguish:

- Compression: reduces data size.
- Packing: stores executable content in a transformed representation.
- Encryption: cryptographically transforms content.
- Obfuscation: reduces code readability.
- Symbol stripping: removes debugging or naming information.
- Control-flow flattening: transforms branch structure.
- Virtualization: represents logic through a custom instruction system.
- Anti-analysis metadata: attempts to detect or discourage inspection.

Do not use these terms interchangeably.

## 2. Initial detection

Inspect:

- Section names and permissions.
- Section sizes.
- Entropy.
- Entry-point location.
- Import count and structure.
- String distribution.
- Resource structure.
- Compiler signatures.
- Known format metadata.
- Unusual control-flow patterns.

High entropy alone does not prove encryption or packing.

Unusual imports alone do not prove malicious behavior.

## 3. Packing indicators

Potential indicators:

- Unusually small import tables.
- Unusual executable section layouts.
- High-entropy data regions.
- Suspicious entry-point placement.
- Large executable sections.
- Embedded compressed payload signatures.
- Recognized packer metadata.

Use multiple indicators before classifying a binary as packed.

## 4. Compression

Identify known compression formats and container metadata.

Where content is already stored in a statically accessible compressed form, ordinary format-level decompression may be used.

Do not execute target-controlled decompression stubs or loaders.

## 5. Encryption

Identify likely encrypted regions using static evidence.

Possible observations:
- High entropy.
- Unusual data layout.
- Cryptographic library references.
- Encryption-related API imports.
- Recognizable static metadata.

Do not attempt to recover credentials, secret keys or protected content through unauthorized circumvention.

If decryption requires runtime execution or access-control bypass, mark the affected region unresolved.

## 6. Obfuscation

Potential techniques:

- Identifier renaming.
- String encoding.
- Constant transformation.
- Dead-code insertion.
- Control-flow flattening.
- Indirect dispatch.
- Function splitting.
- Opaque predicates.
- Arithmetic transformations.
- Metadata manipulation.

Recover readable source only where the underlying behavior remains statically understandable.

Do not claim that an obfuscation layer has been completely removed.

## 7. Virtualization

Identify possible VM-based protection through:

- Dispatcher patterns.
- Repeated indirect branches.
- Custom instruction decoding structures.
- Handler-like function organization.
- Unusual control-flow patterns.

Do not execute virtualized routines or attempt unauthorized protection bypass.

If logic cannot be recovered through permitted static inspection, report it as unresolved.

## 8. Anti-analysis indicators

Recognize suspicious references to:
- Debugger detection.
- Process inspection.
- Virtual-machine detection.
- Timing checks.
- Integrity checks.
- Environment inspection.

Only identify and document their static presence.

Do not provide instructions to disable or evade these mechanisms.

## 9. Symbol stripping

When symbols are missing:

1. Recover function boundaries.
2. Inspect cross-references.
3. Inspect string references.
4. Analyze imported APIs.
5. Infer function roles conservatively.
6. Preserve addresses where useful.
7. Use evidence-backed names.

Do not fabricate original identifiers.

## 10. Recovery limitations

Classify affected regions:

- Accessible: statically inspectable.
- Partially accessible: only some structure is visible.
- Transformed: code exists in a transformed representation.
- Unresolved: insufficient static evidence.
- Restricted: would require prohibited bypass or execution.

Do not hide inaccessible regions with fabricated source.

## 11. Reporting

Keep protection findings in the final response only when they materially affect reconstruction.

Do not create large analysis reports or protection inventories unless explicitly requested.

## 12. Safety boundary

Never:
- Execute unpacking stubs.
- Launch the original binary.
- Disable security protections.
- Extract credentials or secrets.
- Circumvent commercial licensing.
- Bypass DRM or authentication.
- Defeat access controls.

The goal is evidence-based understanding, not unauthorized circumvention.