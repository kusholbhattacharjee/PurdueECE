#! /user/local/bin/python3.4

def find(pattern):
    #find patterns of shit with the X meaning anything
    final = []
    match = 1
    with open ("sequence.txt",'r') as myFile:
        line = myFile.read()
    for i in range(0,len(line)-len(pattern)):
        match = 1
        patch = line[i:i+len(pattern)]
        for j in range(0,len(pattern)):
            if (pattern[j] != patch[j] and pattern[j] != 'X'):
                match = 0
        if match == 1:
            final.append(patch)
    return final

def getStreakProduct(sequence, maxSize, product):
    final = []
    curr = ""
    for i in range(0,len(sequence)):
        curr = sequence[i]
        num = int(sequence[i])
        j = i+1
        while(num < product and len(curr) < maxSize and j < len(sequence)):
            num *= int(sequence[j])
            curr += sequence[j]
            j+=1
            if num == product:
                final.append(curr)
    return final

def writePyramids(filePath, baseSize, count, char):
    lines = []
    start = baseSize//2 + 2
    for j in range(1,start):
        temp = ""
        temp += " "*(start-j-1)
        temp += char*(2*j-1)
        temp += " "*(start-j)
        temp *= count
        lines.append(temp)
    with open (filePath,'w') as myFile:
        for line in lines:
            myFile.write(line[0:len(line)] + '\n')
    return

def getStreaks(sequence, letters):
    final = []
    s = set(letters)
    i = 0
    while i < len(sequence):
        temp = ""
        if sequence[i] in s:
            temp = sequence[i]
            i += 1
            while (i < len(sequence) and sequence[i] == sequence[i-1]): 
                temp += sequence[i]
                i += 1
            final.append(temp)
        else:
            i += 1
    return final

def findNames(nameList, part, name):
    index=1
    name = name.lower()
    final = []
    if part=='F':
        index=0
    for n in nameList:
        if name == n.split(" ")[index].lower():
            final.append(n)
        if part == 'FL':
            if name == n.split(" ")[0].lower():
                final.append(n)
    return final

def convertToBoolean(num, size):
    final = [False] * size
    n = 0
    while n != num:
        temp = 0
        while (n + (2**temp) <= num):
            temp+=1
        if (len(final) < temp):
            final = ([False] * (temp-size)) + final
        final[-(temp)] = True
        if temp-1 < 0:
            n += 1
        n += 2**(temp-1)
    return final



def convertToInteger(booList):
    num = 0
    l = len(booList)
    counter = 1
    for boo in booList:
        if boo:
            num += 2**(l-counter)
        counter+=1
    return num

if __name__ == "__main__":
    #s = find("1XX7")
    #print(s)
    #o = getStreakProduct("54789654321687984", 10, 288)
    #print(o)
    
    writePyramids("pyramid17.txt", 15, 5, '*')
    #print( getStreaks("AAASSSSSSAPPPSSPPBBCCCSSS","SAQT") )
    #names = ["George Smith", "Mark Johnson", "Cordell Theodore", "Maria Satterfield","Johnson Cadence"]
    #print( findNames(names, "FL", "johnson") )
    #print( convertToBoolean(135, 12) )
    #print( convertToBoolean(9, 3) )
    


    #bList = [True, False, False, False, False, True, True, True]
    #bList = [False, False, True, False, False, True]
    #print( convertToInteger(bList) )




