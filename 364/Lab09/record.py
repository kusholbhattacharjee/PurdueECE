from institute import Institute

def loadHistory(fileName):
    pass

def getTotalBy(institute,client):
    total = 0.0
    for account in Institute.accounts.values():
        if account.client == client:
            total += account.amount
    return round(total,2)

def getLendingPower(institute):
    balances = {}
    for account in institute.accounts.values():
        cli = str(account.client)
        if client not in balances:
            balances[client] = account.amount
        else:
            balances[client] += account.amount

        balances[client] = round(balances[client],2)

    return balances
