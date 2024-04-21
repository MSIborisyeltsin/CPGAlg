#include <stdio.h>
#include <stdlib.h>
#include <string.h>

KeyValuePair* createKeyValuePair(char* key, int value) {
    KeyValuePair* pair = (KeyValuePair*)malloc(sizeof(KeyValuePair));
    pair->key = strdup(key);
    pair->value = value;
    return pair;
}

void destroyKeyValuePair(KeyValuePair* pair) {
    free(pair->key);
    free(pair);
}

HashMap* createHashMap() {
    HashMap* map = (HashMap*)malloc(sizeof(HashMap));
    map->pairs = NULL;
    map->size = 0;
    map->capacity = 0;
    return map;
}

void destroyHashMap(HashMap* map) {
    for (int i = 0; i < map->size; i++) {
        destroyKeyValuePair(map->pairs[i]);
    }
    free(map->pairs);
    free(map);
}

void put(HashMap* map, char* key, int value) {
    for (int i = 0; i < map->size; i++) {
        if (strcmp(map->pairs[i]->key, key) == 0) {
            map->pairs[i]->value = value;
            return;
        }
    }
    KeyValuePair* pair = createKeyValuePair(key, value);
    if (map->size >= map->capacity) {
        map->capacity = (map->capacity == 0) ? 1 : map->capacity * 2;
        map->pairs = (KeyValuePair**)realloc(map->pairs, map->capacity * sizeof(KeyValuePair*));
    }
    map->pairs[map->size++] = pair;
}

int get(HashMap* map, char* key) {
    for (int i = 0; i < map->size; i++) {
        if (strcmp(map->pairs[i]->key, key) == 0) {
            return map->pairs[i]->value;
        }
    }
    return 0; // Return a default value if key not found
}
