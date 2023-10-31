#include <stdio.h>
#include <stdlib.h>
#include <string.h>

 void greetUser( char *name) {
    printf ("¡Hola, %s!\n", name);
}

 char* getUserName() {
    char* name;
    name = (char*) malloc  (100);
    if (!name) {
        printf ("Error al asignar memoria.\n");
        exit(1);
    }
    printf ("Ingrese su nombre: ");
    scanf("%s", name);
    return name;
}

 int main() {
    char* userName;
    userName = getUserName();
    greetUser(userName);
    free(userName);
    return 0;
}