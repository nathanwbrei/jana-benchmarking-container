#!/bin/bash

for AFFINITY in {0..2}
do
    for LOCALITY in {0..3}
    do
        mkdir /app/data/a${AFFINITY}l${LOCALITY}
        jana -b -Pplugins=JTest -Pbenchmark:resultsdir=/app/data/a${AFFINITY}l${LOCALITY} -Pjana:affinity=$AFFINITY -Pjana:locality=$LOCALITY
        if [ $? -ne 0 ]; then
          exit
        fi
    done
done


