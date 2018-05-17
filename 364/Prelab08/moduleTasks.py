#!/usr/bin/python3.4


# * * * * PART 1 * * * *

from exModule import runNetworkCode 

def checkNetwork(**kwargs):
    try:
        runNetworkCode(**kwargs)
    except ConnectionError:
        raise ConnectionError("")
    except OSError as oe:
        return "An issue encountered during runtime. The name of the error is: {}".format(type(oe).__name__)
    except Exception:
        return False
    return True

# * * * * PART 2 * * * * 

import re
def isOK(signalName):
    if isinstance(signalName,str):
        p = re.compile(r'^[A-Z]{3}-[0-9]{3}$')
        if p.match(signalName):
            return True
    return False

import os.path
def getFloats(signalFile):
    floatArr = []
    with open(signalFile,'r') as myFile:
        all_lines = myFile.readlines()
    for line in all_lines:
        try:
            floatArr.append(float(line))
        except:
            pass
    myFile.close()
    return floatArr

def loadDataFrom(signalName,folderName):
    signalFile = folderName + '/' + signalName + ".txt"
    if not isOK(signalName):
        raise ValueError("SN " + signalName + " is not valid")
    elif not os.path.exists(signalFile):
        raise OSError("File " + signalFile + " not found in folder")
    else: 
        f = 0
        nf = 0
        with open(signalFile,'r') as myFile:
            all_lines = myFile.readlines()
        f = getFloats(signalFile)
        nf = len(all_lines) - len(f)
        myFile.close() 
    return (f,nf)

def isBounded(signalValues,bounds,thresh):
    count = 0
    if len(signalValues) == 0:
        raise ValueError("Signal contains no data.")
    mini = min(bounds)
    maxi = max(bounds)
    for val in signalValues:
        if val < mini or val > maxi:
            count += 1
    if count > thresh:
        return False
    else:
        return True




if __name__ == "__main__":
    print(isOK("0"))
    print(isOK("SWE-714"))
    print(isOK("SERR-2348"))
    print(isOK("DAS-2312"))





