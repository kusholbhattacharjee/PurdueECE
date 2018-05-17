#! /usr/local/bin/python3.4
import re
from uuid import UUID

def getUrlParts(url):
    #   http://[BaseAddress]/[Controller]/[Action]?[QueryString]
    p =  re.compile("http://(.+)/(.+)/(.+)\?(.+)")
    m = p.match(url)
    return (m.group(1), m.group(2), m.group(3)) 

def getQueryParameters(url):
    final = []
    p =  re.compile("([\w.-]+)=([\w.-]+)")
    m = p.findall(url)
    return m

def getSpecial(sentence, letter):
    p = re.compile(r"\b({}\w*[^\W{}]|[^\W{}]\w*{})\b".format(letter, letter, letter, letter))
    m = p.findall(sentence, re.IGNORECASE)
    return list(m)

def getRealMAC(sentence):
    p = re.compile(r"(?P<MA>[a-zA-Z0-9]{2}[:-]{1}[a-zA-Z0-9]{2}[:-]{1}[a-zA-Z0-9]{2}[:-]{1}[a-zA-Z0-9]{2}[:-]{1}[a-zA-Z0-9]{2}[:-]{1}[a-zA-Z0-9]{2})")
    m = p.search(sentence)
    if m:
        return m.group('MA')
    else:
        return None




def formatNames(names):
    if names['firstName1']:
        name = names['firstName1'] + ' ' + names['lastName1']
    else:
        name = names['firstName2'] + ' ' + names['lastName2']
    return name

def formatIDs(IDs):
    ID = str(UUID(IDs))
    return ID

def formatPhones(nums):
    phoneNum = '('+nums['first']+') '+nums['second']+'-'+nums['third']
    return phoneNum


def getAllEmployees():
    final = []
    with open ("Employees.txt",'r') as myFile:
        for line in myFile:
            p = re.compile(r"(?P<firstName1>[\w]+) (?P<lastName1>[\w]+)|(?P<lastName2>[\w]+), (?P<firstName2>[\w]+)")
            names = (p.search(line)).groupdict()
            allNames = formatNames(names)

            p = re.compile(r"(?P<ID>(-?[a-fA-F0-9]){32})")
            ID = p.search(line)
            allIDs = None
            if ID:
                addIDs = formatIDs(ID.group('ID'))

            p = re.compile(r"\(?(?P<first>[0-9]{3})\)?[ -]?(?P<second>[0-9]{3})-?(?P<third>([0-9]){4})")
            phone = p.search(line)
            allPhones = None
            if phone:
                allPhones = formatPhones(phone.groupdict())

            p = re.compile(r"(?P<state>[\w ]+)?$")
            state = p.search(line)
            allStates = state.group('state')

            final.append( (allNames, allIDs, allPhones, allStates) )
    return final


def getRejectedEntries():
    ALLINFO = getAllEmployees()
    return [name for name, ID, phone, state in ALLINFO if ID is None and phone is None and state is None].sort()

def getEmployeesWithIDs():
    ALLINFO = getAllEmployees()
    return {name:ID for name, ID, phone, state in ALLINFO if ID is not None}

def getEmployeesWithoutIDs():
    ALLINFO = getAllEmployees()
    return [name for name, ID, phone, state in ALLINFO if (phone is not None or state is not None) and ID is None].sort()

def getEmployeesWithPhones():
    ALLINFO = getAllEmployees()
    return {name:phone for name, ID, phone, state in ALLINFO if phone is not None}
    

def getEmployeesWithStates():
    ALLINFO = getAllEmployees()
    return {name:state for name, ID, phone, state in ALLINFO if state is not None}
 

def getCompleteEntries():
    ALLINFO = getAllEmployees()
    return {name:(ID, phone, state) for name, ID, phone, state in ALLINFO if ID is not None and phone is not None and state is not None} 


if __name__ == "__main__":
    url = "http://www.purdue.edu/Home/Calendar?Year=2016&Month=September&Semester=Fall"
    print(getUrlParts(url))
    print(getQueryParameters(url))

    s = "The TART program runs on Tuesdays and Thursdays, but it does not start until next week."
    print(getSpecial(s, "t"))

    print(getAllEmployees())
