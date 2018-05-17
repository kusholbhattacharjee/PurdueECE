import re

def getNumberPattern():
    return r'[2][0-5][0-5]|[01][0-9][0-9]|[^0-9]([0-9]{2})[^0-9]|[^0-9]([0-9]{1})[^0-9]'

def getLinkPattern():
    return r'<a[ ]*href=\"(?P<url>((http)|(ftp))s?://.*?)\">(?P<text>.+?)</a'
 
def parseFile(fileName):


if __name__ == '__main__':
    s1 = "We can get less than 300, not 005"
    s2 = "The point is (512,189,290)"
    m = re.search(getNumberPattern(),s2)
    print(m.group(0))
    print()

    s = '<a href="ftps://local.files.io">The Repository</a> or you can search here <a> </a>'
    p = getLinkPattern()
    m = re.search(p,s)
    print(m.group('url'))
    print(m.group('text'))
    
