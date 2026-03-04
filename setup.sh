#!/bin/bash

echo "Setting up image-studio-CC..."
echo ""

# Check Claude Code skills directory
SKILLS_DIR="$HOME/.claude/skills"
SKILL_DIR="$SKILLS_DIR/image-studio-CC"

# Install nano-banana dependency
NB_DIR="$SKILLS_DIR/nano-banana"
if [ -d "$NB_DIR" ]; then
  echo "nano-banana skill already installed."
else
  echo "Installing nano-banana skill..."
  git clone https://github.com/cvas-544/nano-banana.git "$NB_DIR"
  echo "nano-banana installed."
fi

echo ""

# Check Gemini CLI
if command -v gemini &> /dev/null; then
  echo "Gemini CLI found."
else
  echo "Gemini CLI not found. Install it from:"
  echo "https://github.com/google-gemini/gemini-cli"
fi

echo ""

# Check GEMINI_API_KEY
if [ -n "$GEMINI_API_KEY" ]; then
  echo "GEMINI_API_KEY is set."
else
  echo "GEMINI_API_KEY is not set. Add this to your shell profile (~/.zshrc or ~/.bashrc):"
  echo ""
  echo "  export GEMINI_API_KEY=\"your-key-here\""
  echo ""
  echo "Get your key at: https://aistudio.google.com"
fi

echo ""

# Check Node.js
if command -v node &> /dev/null; then
  echo "Node.js found ($(node -v)) — bridge server ready."
else
  echo "Node.js not found. Install it from https://nodejs.org"
fi

echo ""
echo "Setup complete. Load the skill in Claude Code by typing: image-studio-CC"
