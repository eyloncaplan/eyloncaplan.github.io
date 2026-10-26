#!/bin/bash
# Usage: ./update_cv.sh [new.pdf]
# Makes data/CV.pdf the current CV and overwrites every dated data/CV-*.pdf with it,
# so links to old dated CVs (e.g. from applications) serve the current one.
set -e
cd "$(dirname "$0")"
if [ -n "$1" ]; then cp "$1" data/CV.pdf; fi
for f in data/CV-*.pdf; do cp data/CV.pdf "$f"; done
chmod 644 data/CV*.pdf
echo "data/CV.pdf is current; synced $(ls data/CV-*.pdf | wc -l) dated copies"
