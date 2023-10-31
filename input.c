#inc <stdio.h>
#inc <stdlib.h>
#inc <string.h>

 v greetUser( ch *name) {
    pf("¡Hola, %s!\n", name);
}

 ch* getUserName() {
    ch* name;
    name = (char*) mll (100);
    i (!name) {
        pf("Error al asignar memoria.\n");
        exit(1);
    }
    pf("Ingrese su nombre: ");
    scanf("%s", name);
    r name;
}

 in main() {
    char* userName;
    userName = getUserName();
    greetUser(userName);
    free(userName);
    r 0;
}