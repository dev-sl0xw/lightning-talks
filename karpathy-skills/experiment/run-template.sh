#!/usr/bin/env bash
# usage: ./run-template.sh <task-id> <initial-file-path>
# 예: ./run-template.sh 1-think /tmp/trap.py
set -euo pipefail
TASK="$1"
INITIAL="$2"
ROOT="$(git rev-parse --show-toplevel)"
RUNDIR="$ROOT/karpathy-skills/experiment/runs/$TASK"
mkdir -p "$RUNDIR"

for COND in A B; do
  WT="$ROOT/../karpathy-skills-wt-$TASK-$COND"
  git worktree add "$WT" -b "exp/$TASK-$COND" 2>/dev/null || true
  EXT="${INITIAL##*.}"
  cp "$INITIAL" "$WT/trap.$EXT"
  if [[ "$COND" == "B" ]]; then
    cp "$ROOT/karpathy-skills/experiment/karpathy-claude.md" "$WT/CLAUDE.md"
  else
    : > "$WT/CLAUDE.md"
  fi
  echo "Worktree ready: $WT  (CLAUDE.md condition: $COND)"
done

echo ""
echo "Next steps:"
echo "  1. cd into each worktree"
echo "  2. Run: claude --model claude-sonnet-4-6"
echo "  3. Paste the prompt from tasks/$TASK.md"
echo "  4. After session: git diff > \$RUNDIR/$TASK.diff  (from inside the worktree)"
echo "  5. Save transcript to \$RUNDIR/transcript.{A,B}.md"
