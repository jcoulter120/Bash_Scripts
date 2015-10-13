cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/

eval `scramv1 runtime -sh`

export nEvents=1000;
nJewelDijet=12;
medType="med5"

i=0
while [ $i -lt $nJewelDijet ]
do
    case $i in
	0) 
	    export low=15
	    export high=30
	    ;;
	1)
	    export low=30
	    export high=50
	    ;;
	2)
	    export low=50
	    export high=80
	    ;;
	3)
	    export low=80
	    export high=120
	    ;;
	4)
	    export low=120
	    export high=170
	    ;;
	5)
	    export low=170
	    export high=220
	    ;;
	6)
	    export low=220
	    export high=280

	    ;;
	7)
	    export low=280
	    export high=330
	    ;;
	8)
	    export low=330
	    export high=400
	    ;;
	9)
	    export low=400
	    export high=460
	    ;;
	10)
	    export low=460
	    export high=540
	    ;;
	11)
	    export low=540
	    export high=1000
	    ;;
    esac

    echo "Merging-> MedType: $medType pThat: $low $high"
    
    cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/GeneratorInterface/outputs/${medType}_${i}_numEvents${nEvents};

    hadd -f ${medType}_${low}_${high}_JewelDijet_${i}_numEvents${nEvents}.root ${medType}_${low}_${high}_JewelDijet_${i}_set*_numEvent${nEvents}.root
    let "i++"
done

  cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/Bash_Scripts/Batch_Scripts/
