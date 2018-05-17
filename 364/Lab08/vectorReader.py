#! /usr/local/bin/python3.4

from simpleVector import Vector
from pprint import pprint as pp

def loadVectors(fileName):
    l = []
    with open (fileName,'r') as myFile:
        all_lines = myFile.readlines()
    for line in all_lines:
        try:
            l.append(Vector(line))
        except:
            l.append(None)
    return l





if __name__ == "__main__":
    pp(loadVectors('values.txt'))
