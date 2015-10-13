#!/bin/bash

# A macro used to cleanup all the output from a set of batch jobs

cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/Bash_Scripts/Batch_Scripts/

mv LSF* ../../Job_Output/STDOUT

cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/

mv *.log $PWD/Job_Output/Logs

mv *output*.root $PWD/Job_Output/

cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/Bash_Scripts/Batch_Scripts/
