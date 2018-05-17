import re

def getPhone(line):
    p = re.compile(r'[\W]([0-9]{10})[\W]|^([0-9]{10})[\W]')
    m = p.search(line)
    if m:
        if m.group(1) != None:
            return m.group(1)
        elif m.group(2) != None:
            return m.group(2)
    p = re.compile(r'[\W]([0-9]{3}-[0-9]{3}-[0-9]{4})[\W]|^([0-9]{3}-[0-9]{3}-[0-9]{4})[\W]')
    m = p.search(line)
    if m:
        if m.group(1) != None:
            return m.group(1)
        elif m.group(2) != None:
            return m.group(2)
    return "Nothing found."


if __name__ == '__main__':
    
    line = "I got 343-434-433398 a call today from 765-890-3823 that I did not recognize 432342342343243-3424324-2343."
    n = getPhone(line)
    print(n)

    line = "Phone:1234567890."
    n = getPhone(line)
    print(n)
