#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

rm -fr ./tmp

for file in ./nyse-daily/*.zip
do
	unzip $file -d ./tmp
done

rm -fr ./NYSE.csv

echo Symbol,Date,Open,High,Low,Close,Volume > ./NYSE.csv

for file in ./tmp/*.csv
do
	tail -n +2 $file >> ./NYSE.csv
done

dos2unix ./NYSE.csv

rm -fr ./tmp
