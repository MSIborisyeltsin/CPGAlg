/*
========== General Info ==========
Author: Sheo
Additional labels: Training (Encryption, Discrete mathematics, C language specification)

Copyleft (c) 2019-2024 DigitalHazard Holdings Ltd,
All Rights Reserved.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../include/hashmap.h"
#include "../include/puts.h"

int main()
{
    HashMap* encryptionMap = createHashMap();
    addValues(encryptionMap);

    unsigned char input[255];
    printf("Enter a string: ");
    fgets(input, 255, stdin);

    // Remove newline character from input
    input[strcspn(input, "\n")] = 0;

    int inputLength = strlen(input);
    int numBlocks = inputLength / 255;
    if (inputLength % 255 != 0){ numBlocks++; }

    for (int block = 0; block < numBlocks; block++) {
        int startIndex = block * 255;
        int endIndex = (block + 1) * 255;
        if (endIndex > inputLength) {
            endIndex = inputLength;
        }

        // Iterate through the characters in the input string block
        for (int i = startIndex; i < endIndex; i++) {
            char key[2];
            key[0] = input[i];
            key[1] = '\0';

            int value = get(encryptionMap, key);
            printf("Value for key %c: %d\n", input[i], value);
        }
    }

    destroyHashMap(encryptionMap);
    return 0;
}
