# Languages and Runtimes — Reconstruction Reference

## Purpose

Identify the likely implementation language, compiler, runtime and framework. Select the most appropriate static decompiler and reconstruct source code using the highest-level representation supported by evidence.

## 1. Language identification

Use multiple signals:

- Symbols and name mangling.
- Runtime metadata.
- Compiler fingerprints.
- Standard-library references.
- Exception-handling structures.
- Type metadata.
- Debug information.
- Known runtime initialization patterns.
- Binary format and dependencies.

Do not claim an exact language based only on a generic compiler signature.

## 2. C

Investigate:

- Function boundaries.
- Calling conventions.
- Pointer arithmetic.
- Stack variables.
- Global variables.
- Struct layouts.
- Arrays.
- Function pointers.
- Memory operations.
- Imported system APIs.

Reconstruct readable C where possible.

Preserve pointer semantics and memory behavior. Do not replace low-level operations with invented high-level abstractions.

## 3. C++

Investigate:

- Name mangling.
- Classes and inheritance.
- Virtual function tables.
- Constructors and destructors.
- RTTI.
- Templates.
- Exception handling.
- Standard library usage.
- Operator overloads.
- Object layouts.

Reconstruct class structure only when evidence supports it.

Do not mistake compiler-generated template instantiations for original application classes.

## 4. C#

Inspect:

- Assembly metadata.
- Namespaces.
- Classes and interfaces.
- Properties and events.
- Generic types.
- Attributes.
- Method bodies.
- Async and iterator state machines.
- Resources.
- Assembly references.

Prefer IL-aware C# decompilation.

Preserve metadata-derived identifiers.

Do not invent original comments or source formatting.

## 5. Java and Kotlin

Inspect:

- Class hierarchy.
- Method descriptors.
- Bytecode.
- Annotations.
- Generic signatures.
- Debug metadata.
- Kotlin metadata.
- Synthetic methods.
- Lambda implementation patterns.

Prefer Java-like reconstruction when Kotlin metadata is absent.

Use Kotlin syntax only where the evidence supports it.

## 6. Python

Inspect:

- Bytecode version.
- Code objects.
- Function definitions.
- Constants.
- Imports.
- Names.
- Class definitions.
- Comprehensions.
- Generator structures.
- Exception tables.

Match tools to the correct bytecode version.

Reconstruct idiomatic Python where possible, but preserve behavior rather than forcing modern syntax.

## 7. JavaScript and TypeScript

Inspect:

- Module format.
- Imports and exports.
- Bundler output.
- Minification patterns.
- Source maps.
- Class and function structure.
- Async functions.
- Promises.
- Closures.
- Module initialization.

Prefer source maps when available.

Otherwise reconstruct readable JavaScript. Do not fabricate original TypeScript interfaces or type annotations.

## 8. Go

Inspect:

- Go build metadata.
- Runtime symbols.
- Package information.
- Function metadata.
- Type information.
- Goroutine-related structures.
- Interface tables.
- String and slice layouts.

Separate Go runtime code from application code where possible.

Use Go-like reconstruction only when supported by the available evidence.

## 9. Rust

Inspect:

- Rust symbol patterns.
- Crate metadata.
- Panic-related structures.
- Trait-related dispatch.
- Monomorphized functions.
- Runtime dependencies.
- Type and layout evidence.

Native Rust binaries may lose significant high-level information.

Do not claim exact recovery of traits, generics or original module structure when only machine code remains.

## 10. Swift and Objective-C

Inspect:

- Runtime metadata.
- Class and protocol information.
- Selector references.
- Method tables.
- Objective-C metadata.
- Swift type metadata.
- Generic and protocol witness structures.
- Framework dependencies.

Use high-level reconstruction when metadata supports it. Otherwise preserve low-level evidence.

## 11. Delphi and Pascal

Inspect:

- Compiler signatures.
- RTTI.
- VMT structures.
- Class metadata.
- Resource information.
- Exception-handling patterns.
- Runtime library references.

Recover class and method structure when possible.

## 12. Other languages

When encountering Zig, Fortran, D, Ada, Lua, Ruby, PHP, Dart or another language:

1. Identify compiler/runtime evidence.
2. Identify the corresponding intermediate representation or bytecode.
3. Inspect available metadata.
4. Select a compatible static-analysis tool.
5. Reconstruct only what evidence supports.
6. Document unresolved language-specific details minimally.

## 13. Runtime identification

Identify relevant runtimes where possible:

- CLR / .NET.
- JVM.
- CPython.
- Node.js.
- Electron.
- Go runtime.
- Rust runtime dependencies.
- Swift runtime.
- Objective-C runtime.
- Mono.
- Unity.
- WebAssembly runtime.

Separate runtime-generated code from application-specific logic.

## 14. Source reconstruction rules

Use the highest-level source representation that can be defended.

Priority:

1. Genuine source files.
2. Source maps and debug information.
3. Metadata-aware managed decompilation.
4. Intermediate representation decompilation.
5. Native high-level pseudocode reconciled with assembly.
6. Carefully reconstructed source.
7. Low-level representation when necessary.

Never label inferred source as original source.

## 15. Type recovery

Recover types using:

- Metadata.
- Function signatures.
- Calling conventions.
- Data references.
- Object layouts.
- Field offsets.
- API signatures.
- Repeated usage patterns.

Distinguish proven types from inferred types.

Do not invent type definitions to make the code compile.

## 16. Output language consistency

Each reconstructed module must use an appropriate language and file extension.

Do not combine unrelated language representations into a single artificial project.

If an application contains multiple languages, preserve separate source areas.

## 17. Safety

Never execute:
- Target programs.
- Reconstructed source.
- Package scripts.
- Build scripts.
- Runtime initialization code.

Static analysis only.