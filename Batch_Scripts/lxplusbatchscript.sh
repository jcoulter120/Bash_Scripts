#!/bin/bash

export X509_USER_PROXY=/afs/cern.ch/user/j/jcoulter/x509_user_proxy/proxy
voms-proxy-init --voms cms

cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/

voms-proxy-init -valid 192:00 --out ~/x509_user_proxy/proxy
eval `scramv1 runtime -sh`

cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/Bash_Scripts/Batch_Scripts

nJobs=13
i=0
while [ $i -lt $nJobs ];
do 
    let "start=i*1"
    let "end=(i+1)*1"
    export FIRST=$start  
    export LAST=$end
    export JOBNUM=$i
    echo "First = $FIRST and last file = $LAST"   
    bsub -R "pool>5000" -M 3000000 -q 1nh -J batch_job_${i} < /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/Bash_Scripts/Batch_Scripts/submit.sh
    let "i++"
done

echo "submit all jobs!"
