#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/skills/karpathy-guidelines"
DEST="${HERMES_HOME:-$HOME/.hermes}/skills/karpathy-guidelines"

mkdir -p "$(dirname "$DEST")"
rm -rf "$DEST"
cp -R "$SRC" "$DEST"

echo "Installed karpathy-guidelines to $DEST"
echo "Use it with Hermes-Agent: hermes -s karpathy-guidelines"
echo "Or inside a running Hermes-Agent session: /skill karpathy-guidelines"
