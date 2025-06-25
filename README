```markdown
# Local AI-Powered Video Processing System Using Bash and Native Linux Tools

## 📌 Objective

Design a **fully local video processing pipeline** that automates:

- 🎤 Audio transcription  
- ✂️ Content segmentation  
- 🎥 Face-based cropping  
- 📱 Exporting vertical clips for social media  

✅ 100% offline, privacy-respecting, modular, and efficient.

> **Bash is the main language. Python is only used via `pipx` when no native tool is available.**

---

## ⚙️ System Setup

Run the one-time install script (to be provided) or install manually:

### 🧱 Core packages (via `apt`):

```bash
sudo apt update && sudo apt install -y \
  ffmpeg sox jq curl git build-essential \
  python3 python3-pip pipx
```

### 🐍 Python tools (via `pipx`):

```bash
pipx install openai-whisper
pipx install face_recognition
```

### 🧠 Ollama (for local LLM):

Install Ollama from [https://ollama.com](https://ollama.com), then run:

```bash
ollama run mistral
```

---

## 🗂️ Project Structure

```
.
├── process.sh         # Main controller script
├── st01-ex_au.sh      # Audio extraction
├── st02-ex_trans.sh   # Transcription
├── st03-clean.sh      # Transcript cleanup
├── st04-posts.sh      # Scene segmentation + hashtags
├── st05-clips.sh      # Video cropping and export
├── output/            # All generated files (txt, srt, mp4, json)
```

---

## 🎬 Input

Just provide a long video file (e.g., `.mp4`) to the system.

---

## 📤 Output

- `*.txt` — Raw and cleaned transcript  
- `*.srt` — Subtitle file  
- `*-scenes.json` — Detected scenes (start, end, title)  
- `output/v01.mp4`, `v02.mp4`… — Cropped vertical clips  
- `output/social.txt` — Titles + 7 AI-generated hashtags for each clip  

---

## 🔧 Features

### 1. **Transcription**
- Uses `ffmpeg` to extract mono 16kHz audio
- `whisper` transcribes to:
  - `.txt` (raw text)
  - `.srt` (subtitle with timestamps)

### 2. **Transcript Cleanup**
- `ollama` + `mistral` correct errors in `.txt` without rewriting or summarizing
- Cleaned file: `*.clean.txt`

### 3. **Scene Segmentation**
- Subtitle `.srt` analyzed using local LLM
- Skips filler and intros
- Detects up to 3 scenes (60–120 sec each)
- Stored in `*-scenes.json`

### 4. **Visual Formatting**
- `face_recognition` detects face at scene midpoint
- Video is cropped and resized:
  - Format: **576x1024 (vertical)**
- Exported using `ffmpeg` with fast preset

### 5. **Hashtag Generation**
- For each clip:
  - Title generated from scene
  - 7 one-word hashtags via `ollama`
- Stored in `social.txt`

---

## 📜 Constraints

- 🐚 Bash-only scripting logic
- 🛠️ Native Linux tools preferred: `ffmpeg`, `jq`, `awk`, `grep`, `bc`, etc.
- 🧪 Python used **only via pipx** (`whisper`, `face_recognition`)
- 🧾 Filenames: lowercase, simple, no spaces
- 🔢 Clip numbers: `v01.mp4`, `v02.mp4`, etc.

---

## 🏁 Final Result

An offline-first, automated video processing system for creating **short, content-rich social clips** from longer videos. Perfect for educational, podcast, or speaking content.

**No internet required. No cloud services used. 100% local.**
```