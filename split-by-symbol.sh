#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

WORK_AREA=./work-area
BY_SYMBOL=${WORK_AREA}/by-symbol

rm -fr ${BY_SYMBOL}
mkdir ${BY_SYMBOL}

ulimit -n 20000

awk -F\, -f ./split-by-symbol.awk ${WORK_AREA}/NYSE.csv

rm -fr ${BY_SYMBOL}/Symbol.csv
