#pragma once

#include <stdio.h>
#include <string.h>

#define BLOCK_SIZE 0x100

char input[1000];

void splitIntoBlocks(const char* input) {
    int inputLenght = strlen(input);
    int numBlocks = (inputLenght / BLOCK_SIZE);
    int remainingBytes = inputLenght % BLOCK_SIZE;

    int i, j;

    for(i = 0; i < numBlocks; i++)
    {
        printf("\nBlock %d: ", i + 1);
        for(j = 0; j < BLOCK_SIZE; j++)
        {
            printf("%c", input[i * BLOCK_SIZE + j]);
        }
        printf("\n");
    }

    if(remainingBytes > 0)
    {
        printf("\nBlock %d: ", numBlocks + 1);
        for(i = 0; i < remainingBytes; i++)
        {
            printf("%c", input[numBlocks * BLOCK_SIZE + i]);
        }
        printf("\n");
    }
}
