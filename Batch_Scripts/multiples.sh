#!/bin/bash
nJewelSet=0; 
nJewelSetDone=1;

echo "Running:    $nJewelSetDone Sets"

while [  $nJewelSet -lt $nJewelSetDone ]; do
    cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/Bash_Scripts/Batch_Scripts/
    echo "Set: $nJewelSet"
    let "nJewelSet++"
    export nJewelSet
    source jewel_batchscript.sh
done

