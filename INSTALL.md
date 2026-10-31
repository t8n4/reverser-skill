
# Installation and Update Guide

## Core installation

The Core installer installs only:

- `SKILL.md`
- `knowledge/`
- `workflows/`
- `tools/`

It does not install analysis applications, Node.js, REA, or modify OpenCode MCP configuration.

### Windows

Global installation:

```powershell
.\install.ps1
```

Project-local installation:

```powershell
.\install.ps1 -Scope Project
```

Run the project-local command from the project directory.

### macOS / Linux

Global installation:

```bash
bash install.sh
```

Project-local installation:

```bash
bash install.sh --project
```

## Optional REA provider

REA is optional. To preview and optionally install it:

```powershell
.\install.ps1 -WithREA
```

```bash
bash install.sh --with-rea
```

The installer previews the REA setup plan and asks the user to type `YES` before applying it. It uses `--skill=false` so REA does not add a duplicate workflow skill.

## Backups

If the destination already exists, the installer moves it to a timestamped sibling backup before installing the new files.

If the new directory cannot be moved into place, it attempts to restore the backup.

## Tool installation

Large analysis tools are not part of Core installation. Ultimate Reverser should detect existing tools and recommend only the missing tool that is actually needed for the supplied target.

Obtain user approval before installing external tools.

## After installation

Restart OpenCode and confirm that `ultimate-reverser` appears in the available skills.
