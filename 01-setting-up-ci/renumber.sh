#!/bin/sh

for f in `ls *md |grep -v README.md`
do
  echo
  echo processing $f
  git mv $f 01_${f}
  sed -e "s:$f:01_${f}:g" -i *.md
done
