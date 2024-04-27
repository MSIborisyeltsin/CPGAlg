#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

#define DECIMAL_SIZE 8
#define HEX_SIZE 16

char* generate_key()
{
    char decimal[DECIMAL_SIZE + 1];
    char hex[HEX_SIZE + 1];
    
    srand(time(NULL));

    snprintf(decimal, DECIMAL_SIZE + 1, "%d", rand() % 100000000);

    for (int i = 0; i < HEX_SIZE; i++) {
        int random_digit = rand() % 16;
        
        if (random_digit < 10)
            hex[i] = '0' + random_digit;
        else
            hex[i] = 'A' + random_digit - 10;
    }
    hex[HEX_SIZE] = '\0';
    
    static char inkey[DECIMAL_SIZE + HEX_SIZE + 2];
    snprintf(inkey, sizeof(inkey), "%s:%s\n", decimal, hex);
    
    return inkey;
}
