#! usr/local/bin/python3.4
import re

def extractValues(sentence):
    p_int = r"[+-]?[0-9]+"
    p_float = r"[+-]?[0-9]+\.[0-9]+"
    p_sci = r"[+-]?[0-9]{1}\.[0-9]+[eE]{1}[+-]?[0-9]+"
    p = re.compile(p_int)
    search = p_sci + r'|' + p_float + r'|' + p_int
    p = re.compile(search)
    return p.findall(sentence)

def getSwitches(commandline):
    p = re.compile(r"[\+\\]([a-z])\s+([^\+\\\s]\S*)")
    return p.findall(commandline)

if __name__ == "__main__":
    s = "With the electron's charge being -1.6022e-19 some choices you have are -110, -32.0, and +55. Assume pi equals 3.1415, 'e' equals 2.7 and Na is +6.0221E+023."
    print(extractValues(s))

    s = "myscript.bash +v \i 2  +p   /local/bin"
    print(getSwitches(s))

