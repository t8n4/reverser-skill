
[CmdletBinding()]
param(
    [ValidateSet("Global", "Project")]
    [string]$Scope = "Global",

    [string]$Branch = "main",

    [switch]$WithREA
)

$ErrorActionPreference = "Stop"
$Repo = "t8n4/reverser-skill"
$ArchiveUrl = "https://codeload.github.com/$Repo/zip/refs/heads/$Branch"
$TempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("ultimate-reverser-" + [guid]::NewGuid().ToString("N"))
$Stage = $null
$Backup = $null
$Destination = $null

function Write-Info([string]$Message) {
    Write-Host "[Ultimate Reverser] $Message" -ForegroundColor Cyan
}

function Write-Fail([string]$Message) {
    Write-Host "[Ultimate Reverser] ERROR: $Message" -ForegroundColor Red
}

try {
    if ($Scope -eq "Global") {
        $Destination = Join-Path $HOME ".config/opencode/skills/ultimate-reverser"
    }
    else {
        $Destination = Join-Path (Get-Location).Path ".opencode/skills/ultimate-reverser"
    }

    New-Item -ItemType Directory -Force -Path $TempRoot | Out-Null

    $ZipPath = Join-Path $TempRoot "repository.zip"
    $ExtractPath = Join-Path $TempRoot "extracted"

    Write-Info "Downloading repository archive..."
    Invoke-WebRequest -Uri $ArchiveUrl -OutFile $ZipPath

    Expand-Archive -LiteralPath $ZipPath -DestinationPath $ExtractPath -Force

    $RepoRoot = Get-ChildItem -LiteralPath $ExtractPath -Directory |
        Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") } |
        Select-Object -First 1

    if (-not $RepoRoot) {
        throw "SKILL.md was not found in the downloaded repository."
    }

    foreach ($Required in @("SKILL.md", "knowledge", "workflows", "tools")) {
        if (-not (Test-Path (Join-Path $RepoRoot.FullName $Required))) {
            throw "Required project item is missing: $Required"
        }
    }

    $Parent = Split-Path -Parent $Destination
    New-Item -ItemType Directory -Force -Path $Parent | Out-Null

    $Stage = Join-Path $Parent ("ultimate-reverser-stage-" + [guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path $Stage | Out-Null

    Copy-Item (Join-Path $RepoRoot.FullName "SKILL.md") -Destination $Stage
    Copy-Item (Join-Path $RepoRoot.FullName "knowledge") -Destination $Stage -Recurse
    Copy-Item (Join-Path $RepoRoot.FullName "workflows") -Destination $Stage -Recurse
    Copy-Item (Join-Path $RepoRoot.FullName "tools") -Destination $Stage -Recurse

    if (Test-Path $Destination) {
        $Stamp = Get-Date -Format "yyyyMMdd-HHmmss"
        $Backup = "$Destination.backup-$Stamp"

        Write-Info "Creating backup: $Backup"
        Move-Item -LiteralPath $Destination -Destination $Backup
    }

    try {
        Move-Item -LiteralPath $Stage -Destination $Destination
        $Stage = $null
    }
    catch {
        if ($Backup -and (Test-Path $Backup) -and -not (Test-Path $Destination)) {
            Move-Item -LiteralPath $Backup -Destination $Destination
        }

        throw
    }

    Write-Host ""
    Write-Info "Core installation completed."
    Write-Info "Installed to: $Destination"
    Write-Info "Mode: Standalone. REA was not installed or configured."

    if ($Backup) {
        Write-Info "Previous version backup: $Backup"
    }

    if ($WithREA) {
        Write-Host ""
        Write-Info "REA is optional. Core is already installed."

        if (-not (Get-Command node -ErrorAction SilentlyContinue) -or
            -not (Get-Command npm -ErrorAction SilentlyContinue) -or
            -not (Get-Command npx.cmd -ErrorAction SilentlyContinue)) {

            Write-Fail "Node.js/npm/npx.cmd was not found. REA setup skipped."
        }
        else {
            Write-Info "REA setup preview follows."

            & npx.cmd -y rea-agents@latest setup --client opencode --skill=false --dry-run --json

            if ($LASTEXITCODE -ne 0) {
                throw "REA dry-run failed with exit code $LASTEXITCODE."
            }

            $Approval = Read-Host "Review the preview. Type YES to apply REA setup"

            if ($Approval -ceq "YES") {
                & npx.cmd -y rea-agents@latest setup --client opencode --skill=false

                if ($LASTEXITCODE -ne 0) {
                    throw "REA setup failed. Core remains installed."
                }

                Write-Info "REA setup command completed. Restart OpenCode and verify live MCP tools."
            }
            else {
                Write-Info "REA setup skipped."
            }
        }
    }

    Write-Host ""
    Write-Info "Restart OpenCode to load the skill."
}
catch {
    Write-Fail $_.Exception.Message
    exit 1
}
finally {
    if ($Stage -and (Test-Path $Stage)) {
        Remove-Item -LiteralPath $Stage -Recurse -Force
    }

    if (Test-Path $TempRoot) {
        Remove-Item -LiteralPath $TempRoot -Recurse -Force
    }
}
