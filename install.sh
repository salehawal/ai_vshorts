#!/usr/bin/env bash
# install.sh — no‑branch setup: native tools + pipx‑based Whisper
set -euo pipefail

###############################################################################
# 0.  Core system packages (APT)
###############################################################################
sudo apt update -y
sudo apt install -y ffmpeg sox jq curl git build-essential \
                    python3 python3-venv python3-pip pipx

###############################################################################
# 1.  Ensure pipx on PATH
###############################################################################
pipx ensurepath
export PATH="$PATH:$HOME/.local/bin"

###############################################################################
# 2.  Python CLI tools (pipx only)
###############################################################################
pipx install whisper            # OpenAI/PyTorch Whisper
pipx install face_recognition   # used by process.sh

###############################################################################
# 3.  Local LLM runner + model
###############################################################################
curl -fsSL https://ollama.com/install.sh | sh
ollama pull mistral

echo
echo "✅  Finished: open a new terminal or run 'exec \$SHELL' to refresh PATH"
