#include <stdio.h>
#include "../include/hashmap.h"

int main()
{
    HashMap* encryptionMap = createHashMap();
    put(encryptionMap, "A", 117);
    put(encryptionMap, "B", 205);

    // Example usage
    char* key = "A";
    int value = get(encryptionMap, key);
    printf("Value for key %s: %d\n", key, value);

    destroyHashMap(encryptionMap);
    return 0;
}
