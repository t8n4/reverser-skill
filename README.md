# reverser-skill installation
# with REA installation prompt:
Use the Ultimate Reverser skill.

First inspect whether REA is installed and connected to this coding agent. If missing or broken, prepare a detailed installation or repair plan for approval.

Show the exact commands and configuration changes before applying anything. Wait for my explicit approval.

After approval:
1. Install REA using `npx rea-agents@latest setup`.
2. Connect REA to OpenCode using the correct client configuration.
3. Use `--client opencode --skill=false` to prevent installation of REA's separate workflow skill.
4. Preserve existing configurations and create backups before modifying files.
5. Run REA doctor to verify the installation.
6. Restart or reconnect OpenCode and verify that REA MCP tools are actually available to the active coding agent.
7. If verification fails, diagnose the issue and present a repair plan for approval.

Ultimate Reverser must remain the sole workflow orchestrator. REA is only the preferred reverse-engineering analysis backend.

Do not analyze, execute, debug, or run any target executable or reconstructed source code during setup or verification.

Do not begin reverse engineering until the integration check is complete.

Do not claim success unless the live MCP connection has been verified.
# installation prompt without REA:
Use the Ultimate Reverser skill in standalone mode WITHOUT REA.

Do not install, download, configure, connect, or invoke REA. Do not use `npx rea-agents`, REA MCP, or any REA-related workflow.

First inspect the current coding agent environment and determine which static reverse-engineering tools are already installed and available.

Prepare a setup plan for approval:
1. Install or register Ultimate Reverser as the main skill.
2. Detect available static-analysis tools such as Ghidra, JADX, ILSpy, dnSpyEx, Detect It Easy, 7-Zip, file identification tools, and format-specific parsers.
3. Identify missing tools and explain which ones are genuinely necessary.
4. Show exact installation commands and configuration changes.
5. Wait for my explicit approval before making changes.

After approval:
1. Configure Ultimate Reverser to work independently.
2. Use available static-analysis tools as analysis providers.
3. Select tools dynamically according to the target format, language, runtime, and binary structure.
4. Verify that the skill is discoverable and that its available tools work.
5. Report unavailable capabilities honestly.

Ultimate Reverser must perform deep static analysis and reconstruct the best possible source representation.

STRICT RULES:
- Never install or use REA.
- Never execute the original target.
- Never execute reconstructed source code.
- Never use dynamic analysis, debugging, runtime instrumentation, or target execution.
- Do not fabricate recovered source code or claim exact source recovery without evidence.
- Do not bypass DRM, licensing, authentication, or access controls.
- Preserve the original target file.
- Output only the `decompiled_source` directory containing reconstructed source and essential metadata.
- Do not generate analysis reports, logs, dumps, caches, or unrelated output folders.

Do not begin reverse engineering until the standalone installation and verification are complete.

