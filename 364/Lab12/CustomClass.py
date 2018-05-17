#! /user/local/bin/python3.4
from pprint import pprint as pp

class Element:
    def __init__(self,intKey,strVal):
        if type(intKey) != int or type(strVal) != str:
            raise TypeError('Not string or int')
        self.IntegerKey = intKey
        self.StringValue = strVal

    def __str__(self):
        return '({}: "{}")'.format(self.IntegerKey,self.StringValue)

    def __hash__(self):
        return hash(self.IntegerKey)

class StrongDictionary:
    
    def __init__(self,name):
        if name == '':
            raise ValueError('name is not allowed to be empty')
        self._backend = {}
        self._name = name

    def __str__(self):
        s = '["{}": {:02d} Elements]'.format(self._name, len(self._backend))
        return s

    def add(self,E):
        if hash(E) in self._backend.keys():
            raise ValueError('Element already present in dictionary')
        self._backend[hash(E)] = E

    def remove(self,E):
        if hash(E) not in self._backend.keys():
            raise KeyError('Element not present in dictionary')
        del self._backend[hash(E)]

    def get(self,i):
        try:
            return self._backend[i]
        except:
            raise KeyError('Element not in dict')

    def getAll(self):
        final = {}
        for k,E in self._backend.items():
            final[k] = E.StringValue
        return final

if __name__ == '__main__':
    E1 = Element(1,'hello')
    E2 = Element(42,'awesme')
    E6 = Element(6,'hellos')
    E5 = Element(5,'hello')
    E3 = Element(3,'hel')
    E4 = Element(4,'hell')
    print(E1)
    SD = StrongDictionary('Hola')
    SD.add(E1)
    SD.add(E2)
    SD.add(E3)
    SD.add(E4)
    SD.add(E5)
    SD.add(E6)
    SD.remove(E5)
    print(SD)

    x = SD.get(42)
    print(x)

    print(SD.getAll())

