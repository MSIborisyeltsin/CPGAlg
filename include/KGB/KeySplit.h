/*
KGB - Key Generative Block

Splits the key into a number and a microkey

========== USING_EXAMPLE ==========
int main() {
    char mykey[] = "18012839:A9816C60ED92DCEF";
    char numkey[9];
    char hkey[17];

    // Example of calling a function with storing values
    keyManipulation(mykey, numkey, hkey);
    printf("numkey: %s, hkey: %s\n", numkey, hkey);

    // Example of calling a function without storing values
    keyManipulation(mykey, NULL, NULL);

    return 0;
}
*/

#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void keyManipulation(const char *input, char *numkey, char *hkey) {
    char str[strlen(input) + 1];
    strcpy(str, input);

    char *token;
    char *KeyNum;
    char *HKey;

    token = strtok(str, ":");
    KeyNum = token;

    token = strtok(NULL, ":");
    HKey = token;

    // If pointers are passed, save the values
    if (numkey != NULL)
        strcpy(numkey, KeyNum);

    if (hkey != NULL)
        strcpy(hkey, HKey);
}
