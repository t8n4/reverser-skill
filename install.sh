
#!/usr/bin/env bash
set -Eeuo pipefail

SCOPE="global"
BRANCH="main"
WITH_REA="false"

usage() {
  echo "Usage: bash install.sh [--global|--project] [--branch BRANCH] [--with-rea]"
}

while (($#)); do
  case "$1" in
    --global) SCOPE="global"; shift ;;
    --project) SCOPE="project"; shift ;;
    --branch)
      [[ $# -ge 2 ]] || { echo "Missing branch name"; exit 2; }
      BRANCH="$2"
      shift 2
      ;;
    --with-rea) WITH_REA="true"; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1"; usage; exit 2 ;;
  esac
done

for cmd in curl tar; do
  command -v "$cmd" >/dev/null 2>&1 || {
    echo "Required command not found: $cmd"
    exit 1
  }
done

REPO="t8n4/reverser-skill"
ARCHIVE_URL="https://codeload.github.com/${REPO}/tar.gz/refs/heads/${BRANCH}"
TMP="$(mktemp -d)"
STAGE=""
BACKUP=""

cleanup() {
  [[ -n "$STAGE" && -d "$STAGE" ]] && rm -rf "$STAGE"
  rm -rf "$TMP"
}
trap cleanup EXIT

if [[ "$SCOPE" == "global" ]]; then
  DEST="${HOME}/.config/opencode/skills/ultimate-reverser"
else
  DEST="$(pwd)/.opencode/skills/ultimate-reverser"
fi

echo "[Ultimate Reverser] Downloading repository..."
curl -fL "$ARCHIVE_URL" -o "$TMP/repository.tar.gz"

mkdir "$TMP/extracted"
tar -xzf "$TMP/repository.tar.gz" -C "$TMP/extracted"

ROOT=""

while IFS= read -r -d '' candidate; do
  if [[ -f "$candidate/SKILL.md" ]]; then
    ROOT="$candidate"
    break
  fi
done < <(find "$TMP/extracted" -mindepth 1 -maxdepth 1 -type d -print0)

[[ -n "$ROOT" ]] || {
  echo "SKILL.md not found."
  exit 1
}

for required in SKILL.md knowledge workflows tools; do
  [[ -e "$ROOT/$required" ]] || {
    echo "Missing required item: $required"
    exit 1
  }
done

mkdir -p "$(dirname "$DEST")"

STAGE="$(mktemp -d "$(dirname "$DEST")/.ultimate-reverser-stage.XXXXXX")"

cp "$ROOT/SKILL.md" "$STAGE/"
cp -R "$ROOT/knowledge" "$ROOT/workflows" "$ROOT/tools" "$STAGE/"

if [[ -e "$DEST" ]]; then
  BACKUP="${DEST}.backup.$(date +%Y%m%d-%H%M%S)"
  echo "[Ultimate Reverser] Backing up existing installation: $BACKUP"
  mv "$DEST" "$BACKUP"
fi

if ! mv "$STAGE" "$DEST"; then
  if [[ -n "$BACKUP" && -e "$BACKUP" && ! -e "$DEST" ]]; then
    mv "$BACKUP" "$DEST"
  fi

  echo "Installation failed."
  exit 1
fi

STAGE=""

echo ""
echo "[Ultimate Reverser] Core installation completed."
echo "Installed to: $DEST"
echo "Mode: Standalone. REA was not installed or configured."

if [[ -n "$BACKUP" ]]; then
  echo "Previous version backup: $BACKUP"
fi

if [[ "$WITH_REA" == "true" ]]; then
  echo ""
  echo "[Ultimate Reverser] Optional REA setup."

  if ! command -v node >/dev/null 2>&1 ||
     ! command -v npm >/dev/null 2>&1 ||
     ! command -v npx >/dev/null 2>&1; then
    echo "Node.js/npm/npx not found. REA setup skipped."
  else
    npx -y rea-agents@latest setup --client opencode --skill=false --dry-run --json

    echo ""
    read -r -p "Review the preview. Type YES to apply REA setup: " approval

    if [[ "$approval" == "YES" ]]; then
      npx -y rea-agents@latest setup --client opencode --skill=false
      echo "REA setup command completed. Restart OpenCode and verify live MCP tools."
    else
      echo "REA setup skipped."
    fi
  fi
fi

echo ""
echo "[Ultimate Reverser] Restart OpenCode to load the skill."
