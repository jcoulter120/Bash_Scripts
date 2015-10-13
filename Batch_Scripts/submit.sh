#!/bin/bash

export X509_USER_PROXY=/afs/cern.ch/user/j/jcoulter/x509_user_proxy/proxy
voms-proxy-init --noregen

cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/
#cmsenv
eval `scramv1 runtime -sh`

cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/

echo "root -l -b -q thrust_HiForest.C++"
echo "First = $FIRST and last file = $LAST"   

root -b > thrust_data${FIRST}-${LAST}.log <<EOF
.x thrust_HiForest.C(${FIRST},${LAST},${JOBNUM});
.q
EOF

echo "Done all jobs!"
