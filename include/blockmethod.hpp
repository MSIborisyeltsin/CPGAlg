#pragma once

#include <cstdio>
#include <string>
#include <vector>

#define BLOCK_SIZE 0x100

using namespace std;

vector<string> splitIntoBlocks(const string& input) {
    vector<string> blocks;

    int inputLength = input.length();
    int numBlocks = (inputLength / BLOCK_SIZE);
    int remainingBytes = inputLength % BLOCK_SIZE;

    for (int i = 0; i < numBlocks; i++) {
        string block = input.substr(i * BLOCK_SIZE, BLOCK_SIZE);
        blocks.push_back(block);
    }

    if (remainingBytes > 0) {
        string block = input.substr(numBlocks * BLOCK_SIZE, remainingBytes);
        blocks.push_back(block);
    }

    return blocks;
}
