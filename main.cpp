#include <iostream>
#include <cstdlib>
#include "windows.h"

using namespace std;

void prestitoSemplice (void) {
    float principale, saldoRimanente, rata, tassoInteresse, ammontare;
    int numeroRate;
    printf("Principale EUR ");
    scanf ("%f", &principale);
    printf ("\nNumero Rate : ");
    scanf ("%d", &numeroRate);
    printf ("\nTasso di interesse %% ");
    scanf ("%f", &tassoInteresse);
    printf("\n");
    saldoRimanente = principale;
    for (int i=0; i<numeroRate; i++) {
        rata = 0;
        rata = (principale/numeroRate) + ((tassoInteresse/100) * saldoRimanente);
        printf("Rata %d : EUR %.2f\n", (i+1), rata);
        saldoRimanente = saldoRimanente-(principale/numeroRate);
        ammontare = (ammontare+rata);
    }
    printf("\nIl totale pagato e' di EUR %.2f \nIl principale ha subito un aumento di EUR %.2f\n", ammontare, (ammontare-principale));
}

int main()
{
    SetConsoleTitle("Il Calcolatore Del Dottore");
    char run = '1';
    while (run == '1') {
        run = '0';
        system ("cls");
        prestitoSemplice();
        system("pause");
        printf("\n Desideri calcolare un altro valore? 1/0 ->");
        scanf("%s", &run);
    }
    system ("cls");
    return 0;
}
