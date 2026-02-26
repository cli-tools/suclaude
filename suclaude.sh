#!/bin/sh
CLAUDE="$(readlink -f "$(command -v claude)")"
exec env LD_PRELOAD="$HOME/.local/lib/fakeuid.so" \
  "$CLAUDE" --dangerously-skip-permissions "$@"
