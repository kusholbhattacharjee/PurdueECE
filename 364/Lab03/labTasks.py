#! /user/local/bin/python3.4

def filterByLetter(sentence, c):
    final = []
    words = sentence.split(' ')
    for word in words:
        if (c == word[0] or c == word[len(word)-1]) and word not in final:
            final.append(word)
    print(final)
    return final

def getCumulativeSum():
    final = []
    num = 0
    for n in range(1,101):
        num += n
        final.append(num)
    print(final)
    return final

#if __name__ == "__main__":
#    s = "the power of this engine matches that of the one we had last year"
#    filterByLetter(s,'t')
#    filterByLetter(s,'r')
#    filterByLetter(s,'e')
#   getCumulativeSum()

