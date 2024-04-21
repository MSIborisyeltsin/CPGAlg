/*
========== General Info ==========
Author: Sheo
Additional labels: Training (Encryption, Discrete mathematics, C language specification)

Copyleft (c) 2019-2024 DigitalHazard Holdings Ltd,
All Rights Reserved.

========== Description ==========
This algorithm allows to encrypt the input string by breaking it into blocks of 255 characters
and obtaining the corresponding values from the hash map for each character in the block.

========== Expected code algorithm ==========
1. Create an encryption hash map (encryptionMap) using the createHashMap() function.
2. Add values to the hash map using the addValues(encryptionMap) function.
3. Prompt the user to enter a string using the fgets() function and store the entered string in the input array.
4. Remove newline character from input if present.
5. Calculate the length of the input string (inputLength) and the number of blocks (numBlocks) of 255 characters.
6. If the length of the entered string is not a multiple of 255, increase the number of blocks by 1.
7. For each block from 0 to numBlocks:
    a. Determine the starting and ending indexes of the block.
    b. For each character in the block from startIndex to endIndex:
       i. Create a key from a symbol.
       ii. Get the value from the hash map for a given key.
       iii. Print the value for the given key.
8. Destroy the hash map using the destroyHashMap(encryptionMap) function.
9. End the program.
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
