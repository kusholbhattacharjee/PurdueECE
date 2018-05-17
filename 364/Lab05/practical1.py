#! /user/local/bin/python3.4


def getHorizontalMax():
    final = ()
    curr_max = 0
    arr = []

    with open ("square.txt") as myFile: 
        lines = [line.split() for line in myFile]

    for i in range(0,20):
        for j in range(0,17):
            mul = int(lines[i][j]) * int(lines[i][j+1]) * int(lines[i][j+2]) * int(lines[i][j+3])
            if mul > curr_max:
                curr_max = mul
                arr = [int(lines[i][j]), int(lines[i][j+1]), int(lines[i][j+1]), int(lines[i][j+2]), int(lines[i][j+3])]
    final = (curr_max,arr)
    #print(final)
    return final

def getVerticalMax():
    final = ()
    curr_max = 0
    arr = []

    with open ("square.txt") as myFile: 
        lines = [line.split() for line in myFile]

    for i in range(0,17):
        for j in range(0,20):
            mul = int(lines[i][j]) * int(lines[i+1][j]) * int(lines[i+2][j]) * int(lines[i+3][j])
            if mul > curr_max:
                curr_max = mul
                arr = [int(lines[i][j]), int(lines[i][j]), int(lines[i+1][j]), int(lines[i+2][j]), int(lines[i+3][j])]
    final = (curr_max,arr)
    #print(final)
    return final


def getPPL():
    people = {}
    with open ("codes.txt") as myFile:
        lines = [line.split('  ') for line in myFile]
        lines = lines[3:]
    
    count = 0
    for line in lines:
        people[line[0]] = count
        count+=1
    with open ("codes.txt") as myFile:
        lines = [line.split() for line in myFile]
        lines = lines[3:]
    return people, lines

def getCode(name,day):
    day = int(day[3:])
    #print(day)
    people,lines = getPPL()
    #print(people)
    if name not in people or day > 20:
        return None
    return str(lines[people[name]][day+1])

def getCodesOn(day):
    final = set()
    people,lines = getPPL()
    day = int(day[3:])
    if day > 20:
        return final
    for line in lines:
        final.add(line[day+1])
    return final

def getUsersOf(code):
    final = set()
    people,lines = getPPL()
    for line in lines:
        for i in range(0,len(line)):
            if line[i] == code:
                person = line[0]+" "+line[1]
                date = "08/"+str(i-1)
                t = (person,date)
                final.add(t)
    return final

def getCommonCodes(name1, name2):
    final = set()
    people, lines = getPPL()
    line1 = lines[people[name1]]
    line2 = lines[people[name2]]
    for code in line1:
        if code in line2:
            final.add(code)
    return final


#if __name__ == "__main__":
#    print(getHorizontalMax())
#    print(getVerticalMax())
    print(getCode('Bailey, Catherine', "08/14"))
    print(getCode("Roberts, Teresa", "08/05"))
    #print(getCodesOn("08/18"))
    #print(getUsersOf('999999'))
    #print(getCommonCodes("Moore, John", "Ross, Frances"))
