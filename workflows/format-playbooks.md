# Format-Specific Analysis Playbooks

## Purpose

Provide targeted static-analysis sequences for common executable and application formats.

Always use the universal static-first workflow before applying a playbook.

## 1. Native Windows PE

1. Identify PE architecture and headers.
2. Inspect sections and permissions.
3. Inspect imports and exports.
4. Inspect symbols and debug metadata.
5. Check for CLR metadata.
6. Identify resources.
7. Inspect entry-point-related functions statically.
8. Map functions and cross-references.
9. Select a compatible native decompiler.
10. Reconstruct C/C++-like source where supported.

If CLR metadata exists, inspect the managed component separately.

## 2. .NET assembly

1. Identify assembly metadata.
2. Inspect namespaces and types.
3. Enumerate methods and properties.
4. Inspect IL and signatures.
5. Identify attributes and resources.
6. Inspect dependencies.
7. Use managed decompilation.
8. Reconstruct C#-like source.
9. Preserve original names and metadata.
10. Review source consistency statically.

## 3. ELF application

1. Identify architecture and ABI.
2. Inspect program headers.
3. Inspect sections.
4. Inspect symbols and relocations.
5. Inspect dynamic dependencies.
6. Identify compiler/runtime clues.
7. Map functions.
8. Trace relevant calls.
9. Decompile selected functions.
10. Reconstruct source conservatively.

## 4. Mach-O application

1. Identify architecture slices.
2. Inspect load commands.
3. Inspect segments and sections.
4. Inspect symbols.
5. Inspect frameworks and dynamic dependencies.
6. Inspect Objective-C and Swift metadata.
7. Map classes and methods.
8. Decompile selected native functions.
9. Reconstruct source according to available metadata.

## 5. Java / Kotlin application

1. Inspect package structure.
2. Inspect DEX or class files.
3. Identify language metadata.
4. Inspect class hierarchy.
5. Enumerate methods and fields.
6. Inspect bytecode and annotations.
7. Connect resources and manifest metadata.
8. Reconstruct Java/Kotlin-like source.
9. Preserve language uncertainty.

## 6. Python application

1. Inspect archive or executable container.
2. Identify Python version.
3. Locate bytecode and module metadata.
4. Inspect code objects.
5. Map imports and functions.
6. Recover class structures.
7. Reconstruct Python source.
8. Preserve version-specific behavior.

## 7. Electron application

1. Inspect the application container.
2. Identify ASAR or equivalent archives.
3. Inspect package metadata.
4. Identify JavaScript bundles.
5. Inspect source maps.
6. Identify main and renderer modules.
7. Inspect IPC relationships.
8. Identify native modules.
9. Reconstruct readable source.
10. Preserve resource and module boundaries.

## 8. WebAssembly

1. Identify module structure.
2. Inspect imports and exports.
3. Inspect function types.
4. Inspect code sections.
5. Inspect memory and tables.
6. Inspect custom sections.
7. Identify compiler clues.
8. Decompile or reconstruct source where supported.
9. Preserve low-level representation when needed.

## 9. APK

1. Inspect ZIP structure.
2. Read manifest statically.
3. Enumerate DEX files.
4. Inspect native libraries.
5. Inspect resources and assets.
6. Identify framework and language.
7. Reconstruct managed components.
8. Reconstruct native components separately.
9. Preserve package organization.

## 10. IPA

1. Inspect application bundle.
2. Read Info.plist.
3. Identify Mach-O binaries.
4. Inspect frameworks.
5. Inspect Objective-C/Swift metadata.
6. Inspect resources.
7. Reconstruct source components.
8. Preserve framework boundaries.

## 11. Firmware

1. Identify image format.
2. Inspect partition structure.
3. Identify filesystems.
4. Identify executable regions.
5. Inspect embedded metadata.
6. Extract only statically accessible components.
7. Analyze supported executables individually.
8. Preserve unresolved regions.

## 12. Unknown or custom format

1. Inspect file signatures.
2. Inspect headers and offsets.
3. Identify repeated structural patterns.
4. Search for known embedded formats.
5. Identify likely executable regions.
6. Use available parsers where safe.
7. Avoid assumptions about undocumented fields.
8. Reconstruct only supported structures.

## Universal rules

- Do not execute targets.
- Do not run extracted code.
- Do not bypass access controls.
- Do not invent missing source.
- Do not assume one tool supports every format.
- Do not include analysis artifacts in the final source directory.