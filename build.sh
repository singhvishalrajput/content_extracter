#!/usr/bin/env bash
# Exit on error
set -o errexit

# Add Tesseract repository
add-apt-repository -y ppa:alex-p/tesseract-ocr-devel

# Update package list and install system dependencies
apt-get update -y
apt-get install -y \
    tesseract-ocr \
    libtesseract-dev \
    tesseract-ocr-eng \
    libgl1-mesa-glx

# Verify Tesseract installation
tesseract --version

# Create symbolic link if needed
if [ ! -f "/usr/bin/tesseract" ]; then
    ln -s /usr/local/bin/tesseract /usr/bin/tesseract
fi

# Install Python dependencies
pip install -r requirements.txt

# Print Tesseract location for verification
which tesseract