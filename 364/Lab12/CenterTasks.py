#! /user/local/bin/python3.4
from pprint import pprint as pp



def getDetails():
    final = {}

    s = ['','','MET136','MET139','MET153','MET209','MET225','MET226','MET290','MET300','MET318','MET321','MET344','MET377','MET388','MET451','MET475']
    with open ('community.txt','r') as myFile:
        lines = myFile.readlines()
        for line in lines[3:]:
            line = line.replace('|','').strip().split()
            n = line[0] + ' ' + line[1]
            final[n] = []
            for i in range(2,len(line)):
                if line[i] != '-':
                    t = (s[i],float(line[i]))
                    final[n].append(t)
    return final

def getPerformance():
    final = {}
    students = getDetails()
    s = ['MET136','MET139','MET153','MET209','MET225','MET226','MET290','MET300','MET318','MET321','MET344','MET377','MET388','MET451','MET475']
    for course in s:
        final[course] = []
        for student,grades in students.items():
            for c,g in grades:
                if c == course:
                    t = (student,g)
                    final[course].append(t)
        final[course] = sorted(final[course])
    return final
            
def getHighest(course):
    d = getPerformance()
    course_data = d[course]
    max_value = 0.0
    t_final = ()
    for t in course_data:
        if t[1] > max_value:
            max_value = t[1]
            t_final = t
    return t_final


def getMean(course):
    d = getPerformance()
    course_data = d[course]
    total = 0.0
    for n,s in course_data:
        total += s
    return round(float(total/len(course_data)),2)

def getCumulativeScore(name):
    credits = {}
    with open ('hours.txt','r') as myFile:
        all_lines = myFile.readlines()
        for line in all_lines[2:]:
            line = line.strip().split()
            credits[line[0]] = float(line[1])
    
    details = getDetails()
    data = details[name]
    total_score = 0.0
    total_credits = 0.0
    for course,score in data:
        total_score += (credits[course] * score)
        total_credits += credits[course]
    return round(total_score/total_credits,2)




if __name__ == '__main__':
    final = getDetails()
    print(final['Trent Niccum'])
    print(final['Sadie Farkas'])
    final = getPerformance()
    print(len(final['MET136']))
    h = getHighest('MET290')
    print(h)
    h = getHighest('MET388')
    print(h)
    h = getMean('MET475')
    print(h)
    h = getMean('MET344')
    print(h)
    c = getCumulativeScore('Floria Uribe')
    print(c)
    c = getCumulativeScore('Melba Gist')
    print(c)


    

