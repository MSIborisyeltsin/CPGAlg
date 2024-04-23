#pragma once

typedef struct {
    char* key;
    int value;
} KeyValuePair;

KeyValuePair* createKeyValuePair(char* key, int value);
void destroyKeyValuePair(KeyValuePair* pair);

typedef struct {
    KeyValuePair** pairs;
    int size;
    int capacity;
} HashMap;

HashMap* createHashMap();
void destroyHashMap(HashMap* map);
void put(HashMap* map, char* key, int value);
int get(HashMap* map, char* key);
