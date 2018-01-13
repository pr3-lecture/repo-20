#include <memory.h>
#include <stdio.h>
#include "crypto.h"

int main(int args, char** argv) {
    KEY k;
    /* 1. Parameter: KEY */
    k.chars = argv[1];

    /* Wenn Key nicht vorhanden ist, wird die Routine abgebrochen */
    if (argv[1] == NULL) {
        printf("KEY fehlt!");
        return -1;
    }

    /* 2. Parameter vorhanden? */
    char eingabe[100];
    if (argv[2] != NULL) {
        FILE* f = fopen(argv[2], "r");

        if (f != NULL) {
            fgets(eingabe, 100, f);
            fclose(f);
        }
    } else {
        printf("Bitte Nachricht eingeben: ");
        scanf("%s", eingabe);
    }

    char ergebnis[strlen(eingabe)];

#ifdef DEBUG
    printf("Modus: %s\n", argv[0]);
#endif

    /* Encrypt */
    if (strstr(argv[0], "encrypt")) {
        if (encrypt(k, eingabe, ergebnis) == 0) {
            printf("Nachricht: %s\nKey: %s\nErgebnis: %s\n", eingabe, argv[1], ergebnis);
        }
    }
    /* Decrypt */
    else if (strstr(argv[0], "decrypt")) {
        if (decrypt(k, eingabe, ergebnis) == 0) {
            printf("Nachricht: %s\nKey: %s\nErgebnis: %s\n", eingabe, argv[1], ergebnis);
        }
    }

    return 0;
}