#! usr/local/bin/python3.4
import re

def extractValues(sentence):
    p_int = r"[+-]?[0-9]+"
    p_float = r"[+-]?[0-9]+\.[0-9]+"
    p_sci = r"[+-]?[0-9]{1}\.[0-9]++[eE]{1}[+-]?[0-9]+"
    p = re.compile(p_int+r'|'+p_float+'|'+p_sci)
    return p.findall(sentence)

def getSwitches(commandline):
    p = re.compile(r"[\+\\]([a-z])\s+([^\+\\\s]\S*)")
    return p.findall(commandline)


