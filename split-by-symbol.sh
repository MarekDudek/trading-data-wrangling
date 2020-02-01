#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

BY_SYMBOL=./by-symbol

rm -fr ${BY_SYMBOL}
mkdir ${BY_SYMBOL}
cp ./NYSE.csv ${BY_SYMBOL}

ulimit -n 20000

awk -F\, -f ../split-by-symbol.awk ${BY_SYMBOL}/NYSE.csv

rm -fr ${BY_SYMBOL}/NYSE.csv
rm -fr ${BY_SYMBOL}/Symbol.csv
