#!/bin/bash
nJewelSet=0; 
nJewelSetDone=60;

cd ../../../GeneratorInterface/

echo > jewel_files_1k.txt

cd ../SummerRutgers15/Bash_Scripts/BatchScripts/

echo "Running:    $nJewelSetDone Sets"

while [  $nJewelSet -lt $nJewelSetDone ]; do
    cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/Bash_Scripts/Batch_Scripts/
    echo "Set: $nJewelSet"
    let "nJewelSet++"
    export nJewelSet
    source jewel_batchscript.sh
done

