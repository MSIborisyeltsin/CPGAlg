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

    // Iterate through the characters in the input string
    for (int i = 0; i < strlen(input); i++) {
        char key[2];
        key[0] = input[i];
        key[1] = '\0';

        int value = get(encryptionMap, key);
        printf("Value for key %c: %d\n", input[i], value);
    }

    destroyHashMap(encryptionMap);
    return 0;
}
