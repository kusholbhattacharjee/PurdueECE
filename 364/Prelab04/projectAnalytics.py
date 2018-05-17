#! /user/local/bin/python3.4
import glob
import os
from pprint import pprint as pp

def getCircuitInfo(num):
    participants = []
    components = []
    with open ('Circuits/circuit_'+num+'.txt','r') as myFile:
        lines = myFile.readlines()
    participants = lines[1].rstrip('\n').split(', ')
    components = lines[4].rstrip('\n').split(', ')
    #print(participants)
    #print(components)
    return participants, components

def getSPC():
    #returns all dictionaries of info needed
    # 1. students.txt: Dict of form "Name":"ID"
    studentsToKeys = {}
    with open ('students.txt','r') as myFile:
        lines = myFile.readlines()
    for line in lines[2:]:
        line = line.split('|')
        studentsToKeys[line[0].strip()] = line[1].rstrip('\n').strip()
    # 2. projects.txt : Dict of form "projectID":["circuitID1", "circuitID2", ...]
    projects = {}
    with open ('projects.txt','r') as myFile:
        lines = myFile.readlines()
    for line in lines[2:]:
        line = line.split(' ')
        if line[14].rstrip('\n').strip(' ') in projects:
            projects[line[14].rstrip('\n').strip(' ')].append(line[5].rstrip('\n').strip())
        else:
            projects[line[14].rstrip('\n').strip(' ')] = [line[5].rstrip('\n').strip()]
    
    # 3. All people ID and which circuits they appear in 
    # {'ID':["circuitID", "circuitID2"]}
    IDtoCircuits = {}
    for person,ID in studentsToKeys.items():
        IDtoCircuits[ID] = []
    for filename in os.listdir('Circuits/'):
        cID = filename[8:13]
        participants,components = getCircuitInfo(cID) 
        for p in participants:
            if p in IDtoCircuits:
                IDtoCircuits[p].append(cID)

    #pp(studentsToKeys)
    #pp(projects)
    #pp(IDtoCircuits)
    return studentsToKeys, projects, IDtoCircuits


def getComponentCountByProject(projectID):
    d = {'R':0, 'L':0, 'C':0, 'T':0}
    setc = []
    students,projects,temp = getSPC()
    if projectID not in projects:
        return None
    circuits = projects[projectID]
    for circuit in circuits:
        p,c = getCircuitInfo(circuit)
        for part in c:
            if part not in setc:
                setc.append(part)
    for thing in setc:
        d[thing[0]] += 1
    return (d['R'], d['L'], d['C'], d['T'])

def getComponentCountByStudent(studentName):
    d = {'R':0, 'L':0, 'C':0, 'T':0}
    t = ()
    emptyset = ()
    tmp = set()
    students, projects, circuits = getSPC()
    if studentName not in students.keys():
        return None
    sID = students[studentName]
    for circ in circuits[sID]:
        p,c = getCircuitInfo(circ)
        for part in c:
            tmp.add(part)
    for thing in tmp:
        d[thing[0]] += 1
    t = (d['R'], d['L'], d['C'], d['T'])
    if t == (0,0,0,0):
        return emptyset
    return t  

def getParticipationByStudent(studentName):
    students, projects, circuits = getSPC()
    final = set()
    temp = []
    if studentName not in students:
        return None
    sID = students[studentName]
    for project,cIDs in projects.items():
        for cID in cIDs:
            p,c = getCircuitInfo(cID)
            if sID in p:
                final.add(project)
    return final
    

def getParticipationByProject(projectID):
    final = set()
    students, projects, circuits = getSPC()
    if projectID not in projects:
        return None
    for project,cIDs in projects.items():
        for cID in cIDs:
            p,c = getCircuitInfo(cID)
            for s,sID in students.items(): 
                if sID in p:
                    final.add(s)
    return final

def getProjectByComponent(components):
    final = {}
    students, projects, circuits = getSPC()
    for component in components:
        final[component] = set()
        for pID,cIDs in projects.items():
            for cID in cIDs:
                p,c = getCircuitInfo(cID)
                if component in c:
                    final[component].add(pID)
    return final

def getStudentByComponent(components):
    #takes in a set of component strings and returns {string: set of str}
    #where key is the component from input and set of all student names
    #that has used the component
    final = {}
    students, projects, circuits = getSPC()
    for component in components:
        final[component] = set()

    for sID,cIDs in circuits.items():
        for stud,studID in students.items():
            if sID == studID:
                studentName = stud
        for cID in cIDs:
            p,c = getCircuitInfo(cID)
            if sID in p:
                for comp in c:
                    if comp in final:
                        final[comp].add(studentName)
    return final
    

def getComponentByStudent(studentNames):
    #same thing as above but for all students in input, return dict
    #where val is set of all components used by that student in all projs
    final = {}
    students, projects, circuits = getSPC()
    for student in studentNames:
        studentID = students[student]
        final[student] = set()
        cList = circuits[studentID]

        for c in cList:
            ppl,things = getCircuitInfo(c)
            for thing in things:
                final[student].add(thing)
    return final


def getCommonByProject(projectID1, projectID2):
    #returns sorted list of all the distinct components used in both proj
    final = []
    temp = []
    students, projects, circuits = getSPC()
    if projectID1 not in projects or projectID2 not in projects:
        return None
    circuitList1 = projects[projectID1]
    circuitList2 = projects[projectID2]
    for cID in circuitList1:
        p,c = getCircuitInfo(cID)
        temp += c
    for cID in circuitList2:
        p,c = getCircuitInfo(cID)
        for comp in c:
            if comp in temp and comp not in final:
                final.append(comp)
    return sorted(final)
    

def getCommonByStudent(studentName1, studentName2):
    #sorted list of all distinct components used by both students
    final = []
    temp = []
    students, projects, circuits = getSPC()
    if studentName1 not in students or studentName2 not in students:
        return None
    student1 = students[studentName1]
    student2 = students[studentName2]
    circuitList1 = circuits[student1]
    circuitList2 = circuits[student2]
    for cID in circuitList1:
        p,c = getCircuitInfo(cID)
        temp += c
    for cID in circuitList2:
        p,c = getCircuitInfo(cID)
        for comp in c:
            if comp in temp and comp not in final:
                final.append(comp)
    return sorted(final)


def getProjectByCircuit():
    #go through each circuit ID and return sorted list of all 
    #proj IDs that the circuit is a part of
    final = {}
    students, projects, circuits = getSPC()
    for filename in os.listdir('Circuits/'):
        cID = filename[8:13]
        final[cID] = []
    for projectID, circs in projects.items():
        for c in circs:
            final[c].append(projectID)
    for k,i in final.items():
        final[k] = sorted(i)
    return final
    

def getCircuitByStudent():
    #return all distinct circuit ID that each student has worked on
    final = {}
    students, projects, circuits = getSPC()
    for student,ID in students.items():
        final[student] = sorted(circuits[ID])
    return final

def getCircuitByStudentPartial(studentName):
    final = {}
    students, projects, circuits = getSPC()
    for student, ID in students.items():
        if studentName in student:
            for sid,c in circuits.items():
                if ID == sid:
                    final[student] = sorted(c)
    return final


#if __name__ == "__main__":
    #getSPC()
    #getCircuitInfo('52593')

#1.
    #print(getComponentCountByProject(''))
    #print(getComponentCountByProject('bad project name'))
    #print(getComponentCountByProject('082D6241-40EE-432E-A635-65EA8AA374B6'))
    #print()

#2.
    #pp(getComponentCountByStudent(''))
    #pp(getComponentCountByStudent('bad student name'))
    #pp(getComponentCountByStudent('Miller, Aaron'))
    #pp(getComponentCountByStudent('Miller, Adam'))
    #print()

#3.
    #print(getParticipationByStudent(''))
    #print(getParticipationByStudent('not a student'))
    #pp(getParticipationByStudent('Miller, Aaron'))
    #print(getParticipationByStudent('Miller, Adam'))
    #print()

#4.     
    #print(getParticipationByProject(''))
    #print(getParticipationByProject(''))
    #pp(getParticipationByProject('90BE0D09-1438-414A-A38B-8309A49C02EF'))
    #print()
    
#5.
    #pp(getProjectByComponent(set(['T361.094'])))
    #print()
    #pp(getProjectByComponent(set(['T361.094', 'C601.704', 'R317.149', 'L517.423'])))
    #print()

#6. SOMETHING WRONG HERE!!!!!!!
    #pp(getStudentByComponent(set(['T361.094'])))
    #print()
    #pp(getStudentByComponent(set(['T361.094', 'C601.704', 'R317.149', 'L517.423'])))
    #print()

#7.
    #pp(getComponentByStudent(set(['Miller, Aaron'])))
    #pp(getComponentByStudent(set(['Miller, Adam'])))
    #pp(getComponentByStudent(set(['Miller, Aaron', 'Lee, Julie'])))
    #print()
    

#8. 
    #print(getCommonByProject('', ''))
    #print(getCommonByProject('', '17A946D3-A1B0-4335-8808-8594D9FBD62C'))
    #print(getCommonByProject('17A946D3-A1B0-4335-8808-8594D9FBD62C', 'notaproject'))
    #pp(getCommonByProject('17A946D3-A1B0-4335-8808-8594D9FBD62C', 'D88C2930-9DA4-431F-8CDB-99A2AA2C7A05'))

#9.
    #print(getCommonByStudent('', ''))
    #print(getCommonByStudent('', 'Jenkins, Paul'))
    #print(getCommonByStudent('Jenkins, Paul', ''))
    #pp(getCommonByStudent('Jenkins, Paul', 'Peterson, Daniel'))
    #pp(getCommonByStudent('Jenkins, Paul', 'Miller, Adam'))
    #print()

#10. 
    #pp(getProjectByCircuit())
    #print()

#11.
    #pp(getCircuitByStudent())
    #print()

#12.
    #pp(getCircuitByStudentPartial('notastudentname'))
    #pp(getCircuitByStudentPartial('Miller'))
    #pp(getCircuitByStudentPartial('Anne'))
    #pp(getCircuitByStudentPartial('Joe'))





