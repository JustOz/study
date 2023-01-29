#include <stdio.h>
#include <stdlib.h>


int main(){
    FILE* fp = popen("@curl http://example.com/search.php?s=coffee 2> nul", "r");
    char response[4096];

    if (fp == NULL) {
        printf("Failed to execute curl\n");
        return -1;
    }

    while (fgets(response, sizeof(response), fp) != NULL) {
        if (response != NULL) {
            printf("%s", response);
        }
    }

    pclose(fp);    
    return 0;
}