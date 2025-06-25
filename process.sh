#!/usr/bin/env bash
set -euo pipefail

input="$1"
lang="${2:-ar}"

[[ -f "$input" ]] || { echo "File not found: $input"; exit 1; }

stem=$(basename "$input" | sed 's/\.[^.]*$//')
outdir="output"; mkdir -p "$outdir"

# Shared env for stages
export input lang stem outdir

./st01-ex_au.sh
./st02-ex_trans.sh
./st03-clean.sh
./st04-posts.sh
./st05-clips.sh