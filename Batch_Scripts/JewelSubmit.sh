cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/

eval `scramv1 runtime -sh`

cd /afs/cern.ch/work/j/jcoulter/WORK/CMSSW_5_3_20/src/GeneratorInterface

echo "JewelDijet   $jobNumber"
cd outputs/
medType="med5"
mkdir ${medType}_${jobNumber}_numEvents${nEvents}/
cd ${medType}_${jobNumber}_numEvents${nEvents}/
cp ../../GeneratorInterface/JewelInterface/test/medium-params.dat .
cp ../../GeneratorInterface/JewelInterface/test/splitint.dat .
cp ../../GeneratorInterface/JewelInterface/test/xsecs.dat .
cp ../../GeneratorInterface/JewelInterface/test/pdfs.dat .

cmsRun ../../GeneratorInterface/JewelInterface/test/testJewelDijet.py output="${medType}_${low}_${high}_JewelDijet_$jobNumber" maxEvents=$nEvents ptHatLow=$low ptHatHigh=$high &> ${medType}_Jewel_${jobNumber}_numEvents${nEvents}.log
cp out.log ../LOG/${medType}_${jobNumber}_numEvents${nEvents}.log

cp ${medType}_Jewel_${jobNumber}_numEvents${nEvents}.log ../LOG/.
cp out.hepmc ../HEPMC/${medType}_${jobNumber}_numEvents${nEvents}.hepmc
cp ${medType}_JewelDijet_${jobNumber}_numEvent${nEvents}.root ../ROOT/.
cd ../
#rm ${jobNumber}_numEvents${nEvents}/ -rf
#xrdcp JewelDijet_${jobNumber}_numEvent${nEvents}.root root://eosuser.cern.ch://eos/user/i/ihuntisa/
