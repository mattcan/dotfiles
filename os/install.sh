#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$ID_LIKE" == "arch" ]]; then
      pacman -Sy $(cat _software.txt)
    fi
    echo "No configuration for $ID_LIKE"
  else
    echo "No /etc/os-release found"
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "osx";
else
  echo "Unknown OS: $OSTYPE"
fi
