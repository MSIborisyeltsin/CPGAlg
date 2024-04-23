# designed for simplifed algorithm dev.

import sys
import os

BLOCK_SIZE = 256 # bytes

class KeyValuePair:
    def __init__(self, key, value):
        self.key = key
        self.value = value

class HashMap:
    def __init__(self):
        self.pairs = []
        self.size = 0
        self.capacity = 0
    
    def put(self, key, value):
        for pair in self.pairs:
            if pair.key == key:
                pair.value = value
                return
        
        pair = KeyValuePair(key, value)
        self.pairs.append(pair)
        self.size += 1
        if self.size >= self.capacity:
            self.capacity = 1 if self.capacity == 0 else self.capacity * 2
            self.pairs = self.pairs
    
    def get(self, key):
        for pair in self.pairs:
            if pair.key == key:
                return pair.value
        return 0
    
    def destroy(self):
        for pair in self.pairs:
            del pair
        del self.pairs
        del self
    
def add_values(encryption_map):
        encryption_map.put("A", 57767)
        encryption_map.put("a", 53643)
        encryption_map.put("B", 49741)
        encryption_map.put("b", 21327)
        encryption_map.put("C", 71088)
        encryption_map.put("c", 15358)
        encryption_map.put("D", 63796)
        encryption_map.put("d", 72015)
        encryption_map.put("E", 47139)
        encryption_map.put("e", 31868)
        encryption_map.put("F", 21455)
        encryption_map.put("f", 10095)
        encryption_map.put("G", 54063)
        encryption_map.put("g", 16096)
        encryption_map.put("H", 98257)
        encryption_map.put("h", 73011)
        encryption_map.put("I", 50928)
        encryption_map.put("i", 91478)
        encryption_map.put("J", 83904)
        encryption_map.put("j", 33500)
        encryption_map.put("K", 53115)
        encryption_map.put("k", 54985)
        encryption_map.put("L", 23596)
        encryption_map.put("l", 24453)
        encryption_map.put("M", 94676)
        encryption_map.put("m", 70985)
        encryption_map.put("N", 28476)
        encryption_map.put("n", 20088)
        encryption_map.put("O", 51801)
        encryption_map.put("o", 44214)
        encryption_map.put("P", 91807)
        encryption_map.put("p", 88295)
        encryption_map.put("Q", 88259)
        encryption_map.put("q", 14737)
        encryption_map.put("R", 17900)
        encryption_map.put("r", 69114)
        encryption_map.put("S", 97759)
        encryption_map.put("s", 53618)
        encryption_map.put("T", 81881)
        encryption_map.put("t", 67886)
        encryption_map.put("U", 31503)
        encryption_map.put("u", 17987)
        encryption_map.put("V", 29962)
        encryption_map.put("v", 11238)
        encryption_map.put("W", 21709)
        encryption_map.put("w", 10229)
        encryption_map.put("X", 25297)
        encryption_map.put("x", 33515)
        encryption_map.put("Y", 65943)
        encryption_map.put("y", 76477)
        encryption_map.put("Z", 94433)
        encryption_map.put("z", 31275)
        encryption_map.put("0", 10001)
        encryption_map.put("1", 10002)
        encryption_map.put("2", 10003)
        encryption_map.put("3", 10004)
        encryption_map.put("4", 10005)
        encryption_map.put("5", 10006)
        encryption_map.put("6", 10007)
        encryption_map.put("7", 10008)
        encryption_map.put("8", 10009)
        encryption_map.put("9", 10010)
        encryption_map.put(" ", 24106)
        encryption_map.put("!", 12373)
        encryption_map.put("\"", 26241)
        encryption_map.put("#", 58901)
        encryption_map.put("$", 34131)
        encryption_map.put("%", 43289)
        encryption_map.put("&", 12930)
        encryption_map.put("'", 12940)
        encryption_map.put("(", 29052)
        encryption_map.put(")", 19403)
        encryption_map.put("*", 10429)
        encryption_map.put("+", 18492)
        encryption_map.put(",", 19418)
        encryption_map.put(".", 14193)
        encryption_map.put("/", 52904)
        encryption_map.put(":", 12389)
        encryption_map.put("-", 94285)
        encryption_map.put(";", 28905)
        encryption_map.put("<", 12390)
        encryption_map.put("=", 47128)
        encryption_map.put(">", 18494)
        encryption_map.put("?", 12894)
        encryption_map.put("@", 31289)
        encryption_map.put("[", 23849)
        encryption_map.put("\\", 12392)
        encryption_map.put("]", 12305)
        encryption_map.put("^", 21049)
        encryption_map.put("_", 12032)
        encryption_map.put("`", 75924)
        encryption_map.put("{", 23950)
        encryption_map.put("|", 45891)
        encryption_map.put("}", 23005)
        encryption_map.put("~", 39012)

def split_into_blocks(input_str):
    input_lenght = len(input_str)
    num_blocks = input_lenght // BLOCK_SIZE
    remaining_bytes = input_lenght % BLOCK_SIZE

    for i in range(num_blocks):
        print(f"\nBlock {i + 1}:{input_str[i * BLOCK_SIZE:(i + 1) * BLOCK_SIZE]}")
    
    if remaining_bytes > 0:
        print(f"\nBlock {num_blocks + 1}: {input_str[num_blocks * BLOCK_SIZE:]}")

def main():
    encryption_map = HashMap()
    add_values(encryption_map)

    input_str = input("Enter a string: ")

    split_into_blocks(input_str)

    encryption_map.destroy()

# и заветное
if __name__ == "__main__":
    main()
