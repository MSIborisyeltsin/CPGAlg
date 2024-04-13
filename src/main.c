#include <stdio.h>
#include "../include/hashmap.h"
#include "../include/puts.h"

int main()
{
    HashMap* encryptionMap = createHashMap();
    addValues(encryptionMap);

    // Example usage
    char* key = "A";
    int value = get(encryptionMap, key);
    printf("Value for key %s: %d\n", key, value);

    destroyHashMap(encryptionMap);
    return 0;
}
