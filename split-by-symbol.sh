#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

rm -fr ./by-symbol
mkdir ./by-symbol

cp ./NYSE.csv ./by-symbol

awk -f ./split-by-symbol.awk ./by-symbol/NYSE.csv
