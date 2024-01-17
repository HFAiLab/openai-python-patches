#!/bin/bash

cd "$(dirname "$0")"

if [ -d ./openai-python ]; then
  cd openai-python
  git checkout main
  git pull
  cd ..
else
  git clone https://github.com/openai/openai-python.git
fi
