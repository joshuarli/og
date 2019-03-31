#!/usr/bin/env bash

find . -type f -iname "*.jpg" | while read fp; do
    hash="$(sha1sum "$fp" | cut -d ' ' -f1)"
    ext="${fp##*.}"
    dirn="$(dirname "$fp")"
    mv -v "$fp" "${dirn}/${hash}.${ext}"
done
