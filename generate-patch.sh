#!/bin/bash

cd "$(dirname "$0")"

if ! [ -d ./openai-python ]; then
  echo "missing ./openai-python"
else
  cd openai-python
  if (git remote update ; git status -uno | grep behind); then
    echo "warning: working tree not up-to-date"
  fi

  git add -N .
  mkdir -p ../patches
  cd src/openai
  git diff --no-prefix --relative > ../../../patches/$(git rev-parse --short HEAD).patch
  cd ../..

  cp ../patches/$(git rev-parse --short HEAD).patch ../patches/latest.patch

  echo stored to patches/$(git rev-parse --short HEAD).patch
  cd ..
fi
