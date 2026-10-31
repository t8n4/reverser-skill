# Source-Only Delivery Protocol

## Objective

Produce one clean and coherent source directory from the completed static reconstruction.

The final directory name is:

`decompiled_source`

## 1. Required output

Include only:

- Reconstructed source files.
- Genuine recovered source files that belong to the target.
- Necessary headers and interfaces.
- Essential resources.
- Necessary project metadata.
- Minimal README.

Use the original project organization when it is recoverable.

Otherwise use a minimal structure based on verified module relationships.

## 2. Directory structure

Example:

    decompiled_source/
    ├── src/
    ├── include/
    ├── resources/
    ├── project/
    └── README.md

Do not create empty folders.

Do not force every project into this exact layout.

## 3. File selection

For each candidate file, ask:

- Is this a source file?
- Is it necessary to represent the reconstructed project?
- Is it genuinely recovered or defensibly reconstructed?
- Is it a required resource?
- Is it essential project metadata?

If not, exclude it.

## 4. Excluded artifacts

Never include by default:

- Original executable copies.
- Decompiled raw dumps.
- Assembly dumps.
- Tool databases.
- Ghidra projects.
- Hopper projects.
- Logs.
- Screenshots.
- Temporary files.
- Caches.
- Analysis reports.
- Debug traces.
- Duplicate files.
- Unrelated binaries.
- Installer files.
- Unnecessary dependency downloads.
- Unnecessary configuration backups.

## 5. Project metadata

Include only metadata that is essential and supported.

Do not invent:
- Dependency versions.
- Build scripts.
- Compiler settings.
- Repository URLs.
- Package names.
- Deployment configurations.

If a complete build configuration cannot be recovered, do not fabricate one.

## 6. README

Keep it minimal.

Include:
- Reconstructed project identity, if known.
- Language and format.
- Short directory overview.
- Important limitations.
- Statement that this is reconstructed source, not guaranteed original source.

## 7. Static final inspection

Before delivery, inspect:

- File names.
- Directory structure.
- Duplicate files.
- Missing source references.
- Unnecessary content.
- Project metadata.
- README accuracy.

Do not execute the source.
Do not build the project.
Do not run tests.
Do not invoke package scripts.

## 8. Cleanup

Remove only temporary files created by the current analysis workflow.

Never delete:
- The original target.
- User-provided files.
- Existing user projects.
- Files whose ownership is uncertain.

Keep temporary analysis material outside the final delivery directory.

## 9. Delivery verification

Confirm:
- `decompiled_source` exists.
- It contains the intended source files.
- It contains no unnecessary analysis artifacts.
- The original target remains untouched.

Do not claim successful runtime operation.

## 10. Final response

Provide the output location and a concise summary.

Do not attach a separate report unless requested.

The final deliverable is one source directory.