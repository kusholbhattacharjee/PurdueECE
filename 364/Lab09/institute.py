#! /usr/local/bin/python3.4

class Action:

    def __init__(self,actionType,amount):
        if actionType not in ['W','D']:
            raise ValueError("Not in W or D")
        self.actionType = actionType
        self.amount = float(amount)


class Client:

    def __init__(self,fn,ln):
        self.firstName = fn
        self.lastName = ln

    def __str__(self):
        return self.firstName + ' ' + self.lastName

class Account:
    def __init__(self,num,cli,a,mT):
        self.accountNumber = num
        self.client = cli
        self.amount = float(a)
        self.minThreshold = float(mT)

    def __str__(self):
        if self.amount < 0:
            amount = round(self.amount * -1,2)
            return "{}, {}, Balance = (${:.2f})".format(self.accountNumber,self.client,float(round(amount,2)))
        return "{}, {}, Balance = ${:.2f}".format(self.accountNumber,self.client,float(round(self.amount,2)))

    def performAction(self,A):
        if A.actionType == 'D':
            self.amount = float(round(self.amount + A.amount,2))
        else:
            result = float(round(self.amount - A.amount,2))
            if result >= 0:
                self.amount = result
                if self.amount < self.minThreshold:
                    self.amount = round(self.amount - 10.00,2)
            else:
                raise ValueError("Account goes negative after withdrawal")

class Institute:

    def __init__(self):
        self.accounts = {}
    
    def createNew(self,first,last,anum):
        if anum in self.accounts:
            return
        newClient = Client(first,last)
        newAccount = Account(anum,newClient,500.00,1000.00)
        self.accounts[anum] = newAccount
        return

    def performAction(self,aN,A):
        if aN not in self.accounts:
            return
        try:
            self.accounts[aN].performAction(A)
        except:
            pass
        return


if __name__ == "__main__":
    action = Action('W',500.00)
    #A1 = Action('F','34')
    actionD = Action('D',430.34)
    
    C = Client('John','Smith')
    print(C)
    
    A1 = Account('15487-79431',C,400.00,1000.00)
    A2 = Account('15487-79432',C,4000,3501.00)
    print(A1)
    print(A2)

    A2.performAction(action)
    print(A2)
    A1.performAction(actionD)
    print(A1)

    I = Institute()
    I.accounts = {'1': A1, '2': A2}

    #I.createNew('Joe','Poop','2')
    I.createNew('Joe','Poop','3')
    for aN,a in I.accounts.items():
        print("{}: {}".format(aN,a))


