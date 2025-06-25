#!/usr/bin/env bash
# process.sh — ai_vsg v2.11

set -euo pipefail
set -x
PS4='+ ${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]:-main}() '

banner() { printf "\e[1;34m▶ %s\e[0m\n" "$*"; }
done_()  { printf "\e[0;32m✔ %s\e[0m\n" "$*"; }
fail()   { printf "\e[0;31m✖ %s\e[0m\n" "$*"; exit 1; }

[[ $# -ge 1 ]] || fail "usage: $0 <video-file> [language]"
input="$1"; shift
lang="${1:-ar}"
[[ -f "$input" ]] || fail "File not found: $input"

stem="$(basename "$input" | sed 's/\.[^.]*$//')"
audio="${stem}.wav"
txt_raw="${stem}.txt"
txt_clean="${stem}.clean.txt"
srt_file="${stem}.srt"
scenes_json="${stem}-scenes.json"
outdir="output"
social_file="$outdir/social.txt"
mkdir -p "$outdir"

###############################################################################
# 1. Extract Audio
###############################################################################
banner "1/5 Extract audio"
./st01-ex_au.sh "$input" "$audio"

###############################################################################
# 2. Transcribe
###############################################################################
banner "2/5 Whisper transcription"
./st02-ex_trans.sh "$audio" "$lang"

###############################################################################
# 3. Clean Transcript
###############################################################################
banner "3/5 Clean transcript"
./st03-clean.sh "$stem" "$lang"

###############################################################################
# 4. Segment Scenes
###############################################################################
banner "4/5 Segment scenes"
./st04-posts.sh "$srt_file" "$lang" "$scenes_json"

###############################################################################
# 5. Export Clips + Generate social.txt
###############################################################################
banner "5/5 Export clips"
./st05-clips.sh "$input" "$stem" "$scenes_json" "$lang" "$outdir" "$social_file"

done_ "✅ All done! Results saved in → $outdir"
