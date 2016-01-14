import sys
f = open('out.txt', 'w')
minFile=0
maxFile=12
skipSix=False
SUMString=""
QCDString=""

for fileNum in range(minFile,maxFile):
    SUM=0
    SUM_STAT=0

    print "\n\n\nFILE   :"+str(fileNum)+""
    #if skipSix and fileNum==6:
    #    SUMString+="-1,"
    #    continue
    #print "\n\n\nFILE   :"+str(fileNum)+""
    #File = open('outputs/med10_'+str(fileNum)+'_numEvent5000/med10_Jewel_'+str(fileNum)+'_numEvent1000_set4.log')
    File = open('outputs/med10_'+str(fileNum)+'_numEvent5000/out.log')
    #104 gets first one
    #109 gets last one
    for i in range(0,4000000):
        line= File.readline()
        if "ISUB" in line:
            print "found ISUB"
            for i in range(0,3):
                line = File.readline()
                print line
            print "done first section"
            for i in range(0,6):
                line=File.readline().replace('D','E')
                print line
                print line[55:-2]
                try:
                    if i==0:
                        QCDString+=str(float(line[55:-2]))+","
                    SUM+=float(line[55:-2])
                    print float(line[55:-2])
                except:
                    print "BROKEN FILE"
                    if i==0:
                        QCDString+=str(0)+","
                    SUM+=float(0)
            SUMString+=str(SUM)+","
print "SUM cross sections:"
print SUMString[:-1]#slice removes final comma
print "QCD cross sections:"
print QCDString[:-1]#slice removes final comma
