#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-all}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"

# Handle remote execution via curl
if [ -z "$SCRIPT_DIR" ] || [ ! -d "$SCRIPT_DIR/antigravity" ]; then
    TMP_DIR="$(mktemp -d)"
    echo "Cloning ai-toolkit into temporary workspace..."
    git clone --recurse-submodules --depth 1 https://github.com/tysongoulding/ai-toolkit.git "$TMP_DIR/ai-toolkit"
    cd "$TMP_DIR/ai-toolkit"
    SCRIPT_DIR="$TMP_DIR/ai-toolkit"
    trap 'rm -rf "$TMP_DIR"' EXIT
else
    cd "$SCRIPT_DIR"
fi

chmod +x installers/*.sh

case "$TARGET" in
    antigravity)
        ./installers/install-antigravity.sh ;;
    claude)
        ./installers/install-claude.sh ;;
    cursor)
        ./installers/install-cursor.sh ;;
    all)
        ./installers/install-antigravity.sh
        ./installers/install-claude.sh
        ./installers/install-cursor.sh ;;
    *)
        echo "Usage: ./install.sh [antigravity|claude|cursor|all]" && exit 1 ;;
esac

echo "✓ Installation complete for target: $TARGET"
