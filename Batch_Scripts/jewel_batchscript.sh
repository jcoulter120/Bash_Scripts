#!/bin/bash
cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/

#cmsenv
eval `scramv1 runtime -sh`

cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/GeneratorInterface

#export nJewelSet=0;
medType="med5"
nJewelDijet=12
export nEvents=1000
jobNum=0

i=0
while [ $i -lt $nJewelDijet ]
do
    export jobNumber=$jobNum
    case $i in
	0) 
	    export low=15
	    export high=30
	    echo $low
	    echo $high
	    ;;
	1)
	    export low=30
	    export high=50
	    echo $low
	    echo $high
	    ;;
	2)
	    export low=50
	    export high=80
	    echo $low
	    echo $high
	    ;;
	3)
	    export low=80
	    export high=120
	    echo $low
	    echo $high
	    ;;
	4)
	    export low=120
	    export high=170
	    echo $low
	    echo $high
	    ;;
	5)
	    export low=170
	    export high=220
	    echo $low
	    echo $high	    
	    ;;
	6)
	    export low=220
	    export high=280
	    echo $low
	    echo $high
	    ;;
	7)
	    export low=280
	    export high=330
	    echo $low
	    echo $high
	    ;;
	8)
	    export low=330
	    export high=400
	    echo $low
	    echo $high
	    ;;
	9)
	    export low=400
	    export high=460
	    echo $low
	    echo $high
	    ;;
	10)
	    export low=460
	    export high=540
	    echo $low
	    echo $high
	    ;;
	11)
	    export low=540
	    export high=1000
	    echo $low
	    echo $high
	    ;;
    esac

    xrdcp root://eosuser.cern.ch://eos/user/j/jcoulter/MonteCarlo/${medType}_${jobNumber}_numEvent${nEvents}/${medType}_${low}_${high}_JewelDijet_${jobNumber}_set${nJewelSet}_numEvent${nEvents}.root ${medType}_${low}_${high}_JewelDijet_${jobNumber}_set${nJewelSet}_numEvent${nEvents}.root

    file=${medType}_${low}_${high}_JewelDijet_${jobNumber}_set${nJewelSet}_numEvent${nEvents}.root
    if [ ! -e $file ]
       let "i++"
       let "jobNum++"
       continue
    fi
    minimumsize=800000
    actualsize=$(wc -c <"$file")
    rm ${medType}_${low}_${high}_JewelDijet_${jobNumber}_set${nJewelSet}_numEvent${nEvents}.root
    if [ $actualsize -ge $minimumsize ]; then
	echo $actualsize size is over $minimumsize bytes IGNORE
	let "i++"
	let "jobNum++"
        continue
    else
	echo $actualsize size is under $minimumsize bytes RUN
	bsub -R "pool>300000" -M 300000 -q 1nw -J job_${jobNum}_${nJewelSet} < /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/Bash_Scripts/Batch_Scripts/JewelSubmit.sh
	let "i++"
	let "jobNum++"
    fi
done

cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/Bash_Scripts/Batch_Scripts
