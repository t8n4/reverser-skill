# Tool Detection and Capability Registry

## Purpose

Discover available static-analysis tools and determine which operations are safe and useful for the current target.

Never assume a tool is installed or available.

## 1. MCP discovery

Inspect available MCP tools.

Identify:
- REA tools.
- Binary-analysis providers.
- File-inspection tools.
- Decompilers.
- Disassemblers.
- Metadata parsers.
- Archive inspectors.

Read actual tool descriptions and schemas before invocation.

Do not invent tool names or parameters.

## 2. REA discovery

When REA is available, determine:

- Connection status.
- Available operations.
- Provider names.
- Supported formats.
- Host requirements.
- Static-analysis capabilities.
- Runtime-oriented capabilities.
- Tool limitations.

Use only operations confirmed to be static.

Never invoke REA process execution, runtime capture, live debugging or target launching operations.

## 3. Local tool discovery

Inspect installed tools using safe metadata or executable-presence checks.

Possible tools:

### General
- file
- strings
- 7z
- YARA

### Native analysis
- Ghidra
- Rizin
- radare2
- RetDec
- Hopper, where supported

### Windows PE
- PE inspection utilities.
- Resource inspection utilities.
- Import/export inspection utilities.

### .NET
- IL inspection tools.
- Managed assembly decompilers.
- Metadata inspection utilities.

### JVM
- Class-file inspection tools.
- Bytecode disassemblers.
- Java decompilers.

### Python
- Bytecode metadata inspection tools.
- Version-compatible static decompilers.

### Web and application packages
- Source-map parsers.
- ASAR inspection tools.
- Archive readers.
- Package metadata parsers.

This is a candidate list only.

## 4. Capability classification

Classify each discovered operation:

**STATIC_READ**
Reads file bytes or metadata without execution.

**STATIC_PARSE**
Parses file structure without executing target code.

**STATIC_DECOMPILE**
Transforms existing code or bytecode into a readable representation without executing the target.

**STATIC_EXTRACT**
Extracts archive contents or resources without launching them.

**RUNTIME**
Executes or interacts with the target.

**MODIFYING**
Changes the original target or its contents.

Only the first four categories are permitted by default.

Do not use operations with unclear behavior until their effects are understood.

## 5. Provider compatibility

For each provider, determine:

- Host operating system.
- Supported formats.
- Supported architectures.
- Required dependencies.
- Required configuration.
- Output types.
- Limitations.

Do not claim compatibility without evidence.

## 6. Provider selection

Choose based on:

1. Format compatibility.
2. Language compatibility.
3. Static operation support.
4. Metadata preservation.
5. Decompilation quality.
6. Host compatibility.
7. Availability.

Prefer specialized tools when they provide better information than generic disassemblers.

Use a second provider to cross-check important findings where practical.

## 7. Failure handling

If a provider is unavailable:

- Do not repeatedly retry it.
- Do not invent its output.
- Select an alternative.
- Continue with available static methods.
- Record the limitation internally.

## 8. Installation policy

Do not install tools automatically.

Do not download executables or external components without authorization.

If installation is required, explain:
- Which tool is missing.
- Why it is needed.
- Which capability it provides.
- Whether a viable alternative exists.

## 9. Safety rules

Never:
- Launch the target.
- Execute extracted files.
- Run reconstructed code.
- Invoke runtime instrumentation.
- Disable security protections.
- Modify the original binary.

Tool availability never overrides the static-only policy.

## 10. Final rule

Use the tools that actually exist, not the tools that are merely expected to exist.
## 11. REA Installation and Connection Management

### Detect

Check:
- Node.js version.
- npm and npx availability.
- Current agent identity.
- Existing REA MCP registration.
- Live REA MCP tools.
- Existing REA CLI installation.

### Preview

For OpenCode:

`npx -y rea-agents@latest setup --client opencode --skill=false --dry-run --json`

Use the appropriate Windows command shim (`npx.cmd`) when necessary.

Inspect the returned plan before making changes.

### Approval

Present:
- Exact command.
- Package source.
- Configuration paths.
- Proposed changes.
- Existing registrations affected.
- Optional dependencies.
- Backup behavior.

Wait for explicit user approval.

### Apply

For OpenCode:

`npx -y rea-agents@latest setup --client opencode --skill=false`

Do not add broad client selection.

Do not install REA's duplicate workflow skill.

Do not install optional Hopper automatically.

### Verify

For OpenCode:

`npx -y rea-agents@latest doctor --client opencode --json`

Inspect the actual diagnostics.

After restarting the agent, inspect the live MCP tool inventory.

### Important distinction


A successful setup command does not necessarily mean the active agent session has loaded the new MCP tools.

Only classify REA as connected after live tool discovery succeeds.

Do not reinstall a healthy registration merely because the active session needs a restart.

REA is preferred when available, but the workflow must remain independent of it.

## 12. On-Demand Tool Installation

The Core skill must load without installing external analysis tools.

### 12.1 Detect first

Use safe executable-presence checks, version queries and MCP tool discovery. Do not execute the supplied target.

### 12.2 Match tool to target

Install a tool only when:

- The target format is identified.
- A required static-analysis capability is missing.
- No already-installed compatible alternative is available.

Examples:

- Android APK/DEX: consider JADX only if no compatible provider exists.
- .NET assemblies: consider ILSpy only if no compatible provider exists.
- Native binaries: consider Ghidra or Rizin only if existing providers are insufficient.

These are examples, not automatic installation rules.

### 12.3 Approval gate

Before installing any external tool, present:

- Tool name and official source.
- Target-specific reason.
- Required dependencies and approximate installation impact, if known.
- Exact command.
- Whether administrator privileges are required.
- Existing alternatives.

Wait for explicit approval. Install only the approved component.

### 12.4 Never bulk install

Do not install all candidate tools at once. Do not install tools during Core skill setup. Do not install optional GUI tools without a concrete need.

### 12.5 Verify safely

Verify the tool's version or availability after installation. Do not open or execute the user's target as part of installation verification.
