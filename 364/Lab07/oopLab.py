#!/usr/local/bin/python3.4

import re

class TimeSpan:

    def __init__(self,w,d,h):
        if w < 0 or d < 0 or h < 0:
            raise ValueError("The arguments cannot be negative")
        self.hours = (h % 24)
        self.days = (d % 7) + int(h/24)  
        self.weeks = w + int(d/7)

    def __str__(self):
        return "{:02d}W {:01d}D {:02d}H".format(self.weeks,self.days,self.hours)

    def getTotalHours(self):
        total = self.weeks*(7*24) + self.days*24 + self.hours
        return total

    def __add__(self,other):
        if not isinstance(other,TimeSpan):
            raise TypeError("TimeSpan object expected for add")
        w = self.weeks + other.weeks
        d = self.days + other.days
        h = self.hours + other.hours
        return TimeSpan(w,d,h)

    def __mul__(self,other):
        if not isinstance(other,int):
            raise TypeError("Integer expected for multiply")
        elif other <= 0:
            raise ValueError("Can only multiply by positive ints")
        w = self.weeks*other
        d = self.days*other
        h = self.hours*other
        return TimeSpan(w,d,h)


if __name__ == "__main__":
    T1 = TimeSpan(2,15,49)
    print(T1)
    T2 = TimeSpan(100,6,18)
    print(T2)

    print(T1 * 3)
    print(T1 + T2)

    #print(T1*3.4)
    #print(T1  + 3)


