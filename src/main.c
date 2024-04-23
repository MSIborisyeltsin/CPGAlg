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

int main() {
    HashMap* encryptionMap = createHashMap();
    addValues(encryptionMap);

    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    if (input[strlen(input) - 1] == '\n') input[strlen(input) - 1] = '\0';

    splitIntoBlocks(input);

    destroyHashMap(encryptionMap);
    return 0;
}
