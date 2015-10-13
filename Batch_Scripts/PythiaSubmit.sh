cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/

eval `scramv1 runtime -sh`

cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/GeneratorInterface/

echo "Pythia $jobNumber"
#cd outputs/
#medType="med1"
mkdir Pythia_${jobNumber}_numEvents${nEvents}/
cd Pythia_${jobNumber}_numEvents${nEvents}/
#cp ../../GeneratorInterface/JewelInterface/test/medium-params.dat .
#cp ../../GeneratorInterface/JewelInterface/test/splitint.dat .
#cp ../../GeneratorInterface/JewelInterface/test/xsecs.dat .
#cp ../../GeneratorInterface/JewelInterface/test/pdfs.dat .

cmsRun /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/GeneratorInterface/JewelInterface/test/testPythiaZ2star.py output="${low}_${high}_Pythia_$jobNumber" maxEvents=$nEvents ptHatLow=$low ptHatHigh=$high &> Pythia_${jobNumber}_numEvents${nEvents}.log
#cp out.log ../LOG/${medType}_${jobNumber}_numEvents${nEvents}.log

#these do nothing inf not Jewel
#cp ${medType}_Pythia_${jobNumber}_numEvents${nEvents}.log ../LOG/.
#cp out.hepmc ../HEPMC/${medType}_${jobNumber}_numEvents${nEvents}.hepmc
#cp ${medType}_Pythia_${jobNumber}_numEvent${nEvents}.root ../ROOT/.
cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/SummerRutgers15/Bash_Scripts/Batch_Scripts/
#rm ${jobNumber}_numEvents${nEvents}/ -rf
#xrdcp JewelDijet_${jobNumber}_numEvent${nEvents}.root root://eosuser.cern.ch://eos/user/i/ihuntisa/
