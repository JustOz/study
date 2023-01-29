#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <time.h>


int minf(int* numbers, int* array_size);
int maxf(int* numbers, int* array_size);
char* revs(char* string);
char* strslice(char* o, int s, int f);


int main() {
    char* string = "retrieving sliced string";
    char* sliced_string = strslice(string, 12, 23);

    printf("Original: %s\nSliced: %s\n", string, sliced_string);
    free(sliced_string);

    return 0;
}

char* strslice(char* o, int s, int f) {
    /*
    This function returns a slice of a string

    @param o stands for original, as in the original string
    @param f stands for finish
    @param s stands for start

    For example:
        slice("IWANNAGOHOME", 3, 7) would return a char* to "ANNAG" 

    NOTE: THE RETURNED ARRAY SHOULD BE FREED AFTERWARDS
    */
    if (f >= strlen(o) || s < 0 || s >= f) {
        return NULL;
    }

    // Calls malloc to allocate memory to the array
    char* slice = (char*)malloc((f - s) * sizeof(char));

    // Checks if memory was indeed allocated    
    if (slice == NULL) {
        return NULL;
    }

    // Slices the string
    for (int i = 0; i <= f - s; i++) {
        slice[i] = o[i + s];
    }
    
    // Marks the end of the string
    slice[f - s + 1] = '\x00';

    return slice;
}

char* revs(char* string) {
    /*
    This function returns a reversed string

    For example:
        "batman" -> "namtab"

    NOTE: THE RETURNED ARRAY SHOULD BE FREED AFTERWARDS
    */
    char* reversed = (char*)malloc(strlen(string) * sizeof(char));

    for (int i = 0; i < strlen(string); i++) {
        reversed[strlen(string) - i - 1] = string[i];
    }

    return reversed;
}

int minf(int* numbers, int* array_size) {
    // Returns the lowest value integer in an integer array
    int min_flag = numbers[0];

    for (int i = 0; i < *array_size; i++) {
        if (min_flag > numbers[i]) {
            min_flag = numbers[i];
        }
    }

    printf("The minimum number in the given array is %d\n", min_flag);

    return min_flag;
}

int maxf(int* numbers, int* array_size) {
    // Returns the highest value integer in an integer array
    int max_flag = numbers[0];

    for (int i = 0; i < *array_size; i++) {
        if (max_flag < numbers[i]) {
            max_flag = numbers[i];
        }
    }

    printf("The maximum number in the given array is %d\n", max_flag);

    return max_flag;
}