#!/usr/bin/python3.4

# * * * * PART 3 * * * *

import moduleTasks as mT

def loadMultiple(signalNames, folderName, maxCount):
    final = {}
    for signal in signalNames:
        try:
            t = mT.loadDataFrom(signal, folderName)
            if t[1] <= maxCount:
                final[signal] = t[0]
            else:
                final[signal] = []
        except:
            final[signal] = None
    return final
	
def saveData(signalsDictionary, targetFolder, bounds, threshold):
    for signal,values in signalsDictionary.items():
        if values is not None and values != [] and mT.isBounded(values,bounds,threshold):
            signalFile = targetFolder + '/' + signal + '.txt'
            with open(signalFile,'w') as myFile:
                for val in values:
                    myFile.write('{:.3f}\n'.format(float(val)))
    myFile.close()
    return
