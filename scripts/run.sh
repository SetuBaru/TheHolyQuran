#!/bin/bash

export NODE_PATH=/usr/local/bin/node
# Clear the content of logger.log file
cat /dev/null > logger.log

# Get the current working directory
x=$(pwd)

# Run the lexical/semantic API locally
cd "$x/backend/api/lexical" || exit
python3 manage.py runserver >> "${x}/../../logger.log" 2>&1 &
cd "$x/backend/api/semantic" || exit
python3 app.py >> "${x}/../../logger.log" 2>&1 &
# Run the website frontend locally
cd ${x} || exit
cd frontend || exit
npm start
