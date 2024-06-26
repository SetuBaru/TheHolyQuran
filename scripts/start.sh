#!/bin/bash

# Upgrade pip
python3 -m pip install --upgrade pip

# Download the pre-trained models (AraVec cbow_100_twitter for now)
cd backend/api/semantic/models || exit

if [[ -z "$(ls -A | grep -vE 'README.md|\.gitignore')" ]]; then
  if command -v curl &>/dev/null; then
	  curl -O https://bakrianoo.ewr1.vultrobjects.com/aravec/full_grams_cbow_100_twitter.zip
  else
      echo "Error: curl not found. Please install curl."
      exit 1
  fi

  # Check if unzip is available
  if command -v unzip &>/dev/null; then
      unzip full_grams_cbow_100_twitter.zip
  else
      echo "Error: unzip not found. Please install unzip."
      exit 1
  fi
fi


cd ../../../../

# Also, KSUCCA full_cbow model is light to use, however, you will need to configure it manually in the code
# First, you will need to install requirements (gdown)
# gnome-terminal -x bash -c  "pip install gdown; cd backend/api/semantic/data/processed/; \
#                             gdown https://drive.google.com/uc?id=1rZiOKy71Z_WycxnOG9bwrNoAc4ziGo_n;"

# Install (backend/frontend) requirements
pip install -r backend/api/lexical/requirements.txt
pip install -r backend/api/semantic/requirements.txt
cd frontend || exit
npm install
