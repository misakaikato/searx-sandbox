#!/bin/bash
# opencli with CDP endpoint pointing to sandbox browser
# Usage: ./opencli-cdp.sh <opencli-command> [args...]

CDP_HOST="${CDP_HOST:-localhost}"
CDP_PORT="${CDP_PORT:-9222}"

export OPENCLI_CDP_ENDPOINT="ws://${CDP_HOST}:${CDP_PORT}"

echo "[opencli-cdp] CDP endpoint: $OPENCLI_CDP_ENDPOINT"

opencli "$@"
