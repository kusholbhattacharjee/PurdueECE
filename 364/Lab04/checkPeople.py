#! /user/local/bin/python3.4

import os
from pprint import pprint as pp



def identifyAccess():
    final = {}
    for filename in os.listdir('Departments/'):
        #print(filename)
        room = filename[:len(filename)-4]
        #print(room)
        with open ('Departments/'+filename, 'r') as myFile:
            people = myFile.readlines()
        
        people = [p.strip() for p in people]
        people = set(people)
        for ppl in people:
            if ppl in final:
                final[ppl].append(room)
            else:
                final[ppl] = [room]

    for person,rooms in final.items():
        rooms = sorted(rooms)

    #print(final['Saran Loveall'])
    #print(final['Selma Zinck'])
    #print(final['Portia Reiter'])
    #print(final['Raymundo Loan'])
    #print(final)
    return final

def getCommon(name1, name2):
    common = set()
    ppl = identifyAccess()
    if name1 not in ppl or name2 not in ppl:
        return None
    rooms1 = ppl[name1]
    rooms2 = ppl[name2]

    for room in rooms2:
        if room in rooms1:
            common.add(room)

    return common


#if __name__ == "__main__":
#    identifyAccess()
#    print(getCommon('Tamatha Granderson', 'Tasha Shell'))
#    print(getCommon('Zenaida Blaisdell', 'Neomi Flournoy'))
#    print(getCommon('Merideth Kind', 'Melba Gist'))
#    print(getCommon('boo','blop'))


