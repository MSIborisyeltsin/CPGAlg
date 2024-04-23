#pragma once

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void checkKeySize(char str[])
{
    int bits = strlen(str) * 8;

    if(bits != 64 && bits != 128 && bits != 256){
        printf("Error: String size must be 64, 128, or 256 bits.\n");
        exit(1);
    }

    printf("KeySize: %d\n", bits);
}
