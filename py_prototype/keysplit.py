# Пример использования:
'''
input_str = "123:abc"
numkey = []
hkey = []

key_manipulation(input_str, numkey, hkey)
print("NumKey:", "".join(numkey))
print("HKey:", "".join(hkey))
'''

def key_manipulation(input_str, numkey=None, hkey=None):
    tokens = input_str.split(":")

    if len(tokens) >= 2:
        KeyNum = tokens[0]
        HKey = tokens[1]

        if numkey is not None:
            numkey.extend(KeyNum)

        if hkey is not None:
            hkey.extend(HKey)
