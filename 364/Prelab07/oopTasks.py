#! /user/local/bin/python3.4
from enum import Enum
from random import sample
import uuid

class Level(Enum):
    freshman = 'Freshman'
    sophomore = 'Sophomore'
    junior = 'Junior'
    senior = 'Senior'

class Student:

    def __init__(self,ID,firstName,lastName,level):
        self.ID = ID
        self.firstName = firstName
        self.lastName = lastName
        if level not in (Level.freshman,Level.sophomore, Level.junior, Level.senior):
            raise TypeError("The argument must be an instance of the ‘Level’ Enum.")
        else:
            self.level = level
        return


    def __str__(self):
        return self.ID+', '+self.firstName+' '+self.lastName+', '+ self.level.value
    
class Circuit:

    def __init__(self,ID,r,c,i,t): 
        if not self.checkLists(r,c,i,t):
            raise ValueError("One of the lists contain invalid components.")
        self.ID = ID
        self.resistors = r
        self.capacitors = c
        self.inductors = i
        self.transistors = t
        return

    def checkLists(self,r,c,i,t):
        if r:
            for res in r:
                if res[0] != 'R':
                    return False
        if c:
            for cap in c:
                if cap[0] != 'C':
                    return False
        if i:
            for ind in i:
                if ind[0] != 'L':
                    return False
        if t:
            for trans in t:
                if trans[0] != 'T':
                    return False
        return True

    def __str__(self):
        r = len(self.resistors)
        c = len(self.capacitors)
        i = len(self.inductors)
        t = len(self.transistors)
        return '{}: (R = {:02d}, C = {:02d}, L = {:02d}, T = {:02d})'.format(self.ID,r,c,i,t)

    def getDetails(self):
        res = sorted(self.resistors)
        cap = sorted(self.capacitors)
        ind = sorted(self.inductors)
        trans = sorted(self.transistors)
        s = self.ID + ': '
        for r in res:
            s += r + ', '
        for c in cap:
            s += c + ', '
        for i in ind:
            s += i + ', '
        for t in trans:
            s += t + ', '
        if s[len(s)-2:] == ', ':
            return s[0:len(s)-2]
        return s

    def __contains__(self,item):
        allArrays = self.resistors + self.capacitors + self.inductors + self.transistors
        if not isinstance(item,str):
            raise TypeError("not string item")
        if item[0] not in ('R','C','L','T'):
            raise ValueError("Not one of the component types")
        if item in allArrays:
            return True
        else:
            return False

    def __add__(self,c):
        if isinstance(c,str):
            if c in self:
                return self
            if c[0] not in ('R','C','L','T'):
                raise ValueError("")
            if c[0] == 'R':
                self.resistors.append(c)
            elif c[0] == 'C':
                self.capacitors.append(c)
            elif c[0] == 'L':
                self.inductors.append(c)
            else:
                self.transistors.append(c)
            return self
        elif isinstance(c,Circuit):
            ID = ""
            other = c
            rando = sample(range(0,10),5)
            for i in rando:
                ID += str(i)
            r = set(self.resistors + other.resistors)
            c = set(self.capacitors + other.capacitors)
            i = set(self.inductors + other.inductors)
            t = set(self.transistors + other.transistors)
            return Circuit(str(ID),list(r),list(c),list(i),list(t))
        else:
            raise(TypeError)

    def __radd__(self,c):
        return self.__add__(c)

    def __sub__(self,c):
        if not isinstance(c,str):
            raise TypeError("")
        if c[0] not in ('R','C','L','T'):
            raise ValueError("")
        if c not in self:
            return self
        if c[0] == 'R':
            self.resistors.remove(c)
        elif c[0] == 'C':
            self.capacitors.remove(c)
        elif c[0] == 'L':
            self.inductors.remove(c)
        else:
            self.transistors.remove(c)
        return self



class Project:
    
    def __init__(self,ID,participants,circuits):
        self.ID = ID #UUID string
        if len(participants)>0 and isinstance(participants[0],Student):
            self.participants = participants #list of Student instances
        else:
            raise ValueError("")
        if len(circuits)>0 and isinstance(circuits[0],Circuit):
            self.circuits = circuits #list of Circuit instances
        else:
            raise ValueError("")
        return
    
    def __str__(self):
        ID = str(self.ID)
        return '{}: {:02d} Circuits, {:02d} Participants'.format(self.ID,len(self.circuits),len(self.participants))
        
    def getDetails(self):
        s = str(self.ID) + '\n\nParticipants:\n'
        tempP = sorted(self.participants,key = lambda x:x.ID)
        tempC = sorted(self.circuits,key = lambda x: x.ID)
        for p in tempP:
            s+=str(p) + '\n'
        s+= '\nCircuits:'
        for c in tempC:
            s+='\n' + str(c.getDetails())
        return s
    
    def __contains__(self,other):
        if isinstance(other,str):
            if other[0] not in ('R','C','L','T'):
                raise ValueError("")
            for circuit in self.circuits:
                if other in circuit:
                    return True
            return False
        elif isinstance(other,Student):
            for stud in self.participants:
                if stud.ID == other.ID:
                    return True
            return False
        elif isinstance(other,Circuit):
            for circuit in self.circuits:
                if circuit.ID == other.ID:
                    return True
            return False
        else:
            raise TypeError("")

    def __add__(self,other):
        if isinstance(other,Circuit):
            if other in self:
                return self
            else:
                self.circuits.append(other)
                return self
        elif isinstance(other,Student):
            if other in self:
                return self
            else:
                self.participants.append(other)
                return self
        else:
            raise TypeError("")

    def __sub__(self,other):
        if isinstance(other,Circuit):
            if other in self:
                self.circuits.remove(other)
            return self
        elif isinstance(other,Student):
            if other in self:
                self.participants.remove(other)
            return self
        else:
            raise TypeError("")
        
class Capstone(Project):
    def __init__(self,ID,p,c):
        for student in p:
            if student.level != Level.senior:
                raise ValueError("")
        super().__init__(ID,p,c)

    def __add__(self,other):
        if isinstance(other,Circuit):
            if other in self:
                return self
            else:
                self.circuits.append(other)
                return self
        elif isinstance(other,Student):
            if other.level != Level.senior:
                raise ValueError("")
            elif other in self:
                return self
            else:
                self.participants.append(other)
                return self
        else:
            raise TypeError("")
            



if  __name__ == "__main__":
    S = Student('15487-79431', 'John', 'Smith', Level.freshman)
    S1 = Student('15487-79430', 'John', 'Smith', Level.freshman)
    S2 = Student('15487-79410', 'John', 'Smith', Level.freshman)
    print(S)
    r = ['R123.02','R234.98','R2345.8']
    c = ['C123.02','C234.98','C2345.8']
    i = ['L123.02','L234.98','L2345.8']
    t = ['T123.02','T234.98','T2345.8'] 
    C = Circuit('12345',r,c,i,t)
    print(C)
    print(C.getDetails())
    component = 'L100.00'
    if component not in C:
        print("NOPE")
    C = component + C 
    if component in C:
        print("YAS")
    C = C-component 
    if component not in C:
        print("NOPE")

    r2 = ['R123.02','R234.98','R2345.8']
    c2 = ['C123.03','C234.98','C2345.8']
    i2 = ['L123.03','L234.98','L2345.8']
    i2 = []
    t2 = ['T123.03','T234.98','T2345.8'] 
    C2 = Circuit('23432',r2,c2,i2,t2)
    C3 = C + C2
    arrS = [S,S1,S2]
    arrC = [C,C2,C3]
    P = Project('future uuid',arrS,arrC)
    print(P)
    print(P.getDetails())
    
    #Test adding and subtracting and contains
    C4 = Circuit('99999',r2,c2,i2,t2)
    S3 = Student('123456789','Kushol','is cool',Level.junior)
    P = P + C4
    P = P + S3
    print(P.getDetails())

    P = P - C4
    P = P - S3
    print(P.getDetails())



    r = ['R12.34']
    c = []
    l = ['L34.57', 'L34.56']
    t = ['T39.53', 'T21.11', 'T11.11']

    c = Circuit('00001', r, c, l, t)
    print(c.getDetails())



