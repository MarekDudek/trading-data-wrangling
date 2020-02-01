#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


WORK_AREA=./work-area
TMP=${WORK_AREA}/tmp

rm -fr ${WORK_AREA}

mkdir -p ${WORK_AREA}

for file in ./nyse-daily/*.zip
do
	unzip $file -d ${TMP} 
done

ENTIRE_DATA=${WORK_AREA}/NYSE.csv

echo Symbol,Date,Open,High,Low,Close,Volume > ${ENTIRE_DATA}

for file in ${TMP}/*.csv
do
	tail -n +2 $file >> ${ENTIRE_DATA}
done

dos2unix ${ENTIRE_DATA}

rm -fr ${TMP}
