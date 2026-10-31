# Binary Formats — Advanced Static Analysis Reference

## Purpose

Identify, inspect and interpret binary formats using static evidence. Never assume a file extension accurately identifies its contents.

The goal is to understand the container, executable structure, architecture, metadata, dependencies and recoverable code regions.

## 1. Universal identification

For every target, determine where possible:

- Actual file signature and format.
- Architecture and bitness.
- Endianness.
- Operating-system target.
- Executable versus library versus data container.
- Compiler and toolchain fingerprints.
- Runtime and framework metadata.
- Section and segment layout.
- Symbols and debug information.
- Imports and exports.
- Embedded resources.
- Compression, packing and obfuscation indicators.

Use available static identification tools. Prefer independent confirmation when the format is ambiguous.

## 2. Windows PE

Inspect:

- DOS header and PE signature.
- COFF header.
- Optional header.
- Machine type.
- Section table.
- Entry-point metadata.
- Image base.
- Imports and exports.
- Relocations.
- Resources.
- TLS directory.
- Exception directory.
- Debug directory.
- CLR header.
- Rich header, if present.

Determine whether the file is:

- Native PE.
- Managed .NET assembly.
- Mixed-mode assembly.
- Native application hosting a managed runtime.
- Packed or transformed executable.

For native PE files, use compatible disassembly and decompilation providers.

For managed assemblies, prioritize metadata and IL-based reconstruction.

## 3. ELF

Inspect:

- ELF identification.
- Class and endianness.
- Machine architecture.
- ABI.
- Program headers.
- Section headers.
- Dynamic section.
- Symbol tables.
- Relocations.
- Notes.
- Dynamic dependencies.
- Debug information.

Distinguish executable segments from section metadata. Section headers may be missing in stripped binaries.

## 4. Mach-O

Inspect:

- Mach-O magic.
- CPU architecture.
- File type.
- Load commands.
- Segments and sections.
- Symbol tables.
- Dynamic libraries.
- Objective-C metadata.
- Swift metadata.
- Code-signing metadata.
- Universal binary slices.

Analyze each architecture slice separately when necessary.

## 5. Managed formats

### .NET

Inspect:

- Assembly metadata.
- Module metadata.
- Type definitions.
- Method definitions.
- Fields and properties.
- Attributes.
- Generic parameters.
- Method bodies and IL.
- Resources.
- Assembly references.
- PDB information when available.

Use managed decompilation where possible. Do not unnecessarily reduce high-level metadata to native pseudocode.

### JVM

Inspect:

- Class-file headers.
- Constant pool.
- Access flags.
- Fields.
- Methods.
- Descriptors.
- Attributes.
- Annotations.
- Bytecode.
- Debug metadata.

Recognize Kotlin metadata when present.

### DEX

Inspect:

- DEX header.
- Strings.
- Type identifiers.
- Prototypes.
- Field identifiers.
- Method identifiers.
- Class definitions.
- Code items.
- Annotations.
- Debug information.

Connect DEX analysis with package resources and manifest metadata.

### WebAssembly

Inspect:

- Module header.
- Sections.
- Imports and exports.
- Function signatures.
- Code bodies.
- Memory declarations.
- Tables.
- Globals.
- Data segments.
- Custom sections.

Distinguish WebAssembly generated from C/C++ from higher-level language toolchains where metadata permits.

## 6. JavaScript and Electron

Inspect:

- HTML.
- CSS.
- JavaScript bundles.
- TypeScript build artifacts.
- Source maps.
- Package manifests.
- Module boundaries.
- Electron ASAR archives.
- IPC channels.
- Native modules.
- Application resources.

Recover original TypeScript only when supported by source maps or actual source files.

Do not invent TypeScript types merely to make reconstructed code look more sophisticated.

## 7. Python

Inspect:

- Python source files.
- Bytecode magic.
- Python version.
- Code objects.
- Constants.
- Names.
- Imports.
- Function metadata.
- Class metadata.
- Package structure.
- Embedded resources.

Use version-compatible static bytecode interpretation.

Do not assume bytecode from one Python version can be accurately reconstructed using another version's tools.

## 8. Mobile packages

### APK

Inspect:

- ZIP container structure.
- AndroidManifest.xml.
- DEX files.
- Resources.
- Assets.
- Native libraries.
- Package metadata.
- Permissions.
- Framework metadata.

### IPA

Inspect:

- Payload structure.
- Application bundle.
- Info.plist.
- Mach-O executables.
- Frameworks.
- Resources.
- Entitlements as metadata.
- Asset catalogs.

Never install or launch mobile applications.

## 9. Archives and nested containers

For ZIP, TAR, 7z, ASAR, DMG and other supported containers:

1. Identify the container format.
2. Inspect the directory tree.
3. Identify embedded executable formats.
4. Extract only necessary content using static archive operations.
5. Analyze nested components independently.
6. Preserve relationships between components.
7. Never execute extracted files.

Do not treat an archive as a single executable when it contains multiple independent modules.

## 10. Firmware and disk images

Inspect where supported:

- Partition tables.
- Filesystem signatures.
- Firmware headers.
- Compression metadata.
- Embedded filesystems.
- Executable regions.
- Architecture.
- Resource regions.

Do not execute firmware images or extracted components.

## 11. Format-specific reconstruction

Choose the source reconstruction strategy based on the actual format:

| Format | Preferred reconstruction |
|---|---|
| PE native | C/C++-like source, assembly evidence |
| PE .NET | C#-like source |
| ELF native | C/C++/Rust/Go-like reconstruction as supported |
| Mach-O | Objective-C/Swift/C/C++ reconstruction as supported |
| JVM | Java/Kotlin-like reconstruction |
| DEX | Java/Kotlin-like reconstruction |
| Python bytecode | Python source reconstruction |
| JavaScript bundle | JavaScript reconstruction |
| WebAssembly | Source-like reconstruction supported by metadata |
| APK | Separate managed, native and resource components |
| IPA | Separate application, framework and resource components |

These are reconstruction targets, not guarantees of original language recovery.

## 12. Evidence requirements

Never infer a format from one weak indicator alone.

For important classifications, prefer multiple observations such as:

- File signature.
- Header structure.
- Metadata.
- Section layout.
- Tool identification.
- Runtime references.

If evidence is insufficient, mark the format as uncertain.

## 13. Safety

All operations must remain static.

Do not:
- Execute the target.
- Launch embedded programs.
- Install applications.
- Run scripts.
- Invoke target-controlled unpacking routines.
- Modify the original file.

The output of this reference is format understanding, not a separate analysis report.