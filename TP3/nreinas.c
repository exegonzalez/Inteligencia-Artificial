#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/time.h>
#define TRUE 1
#define FALSE 0
#define MAX_REINAS 25

//gcc nreinas.c -o nreinas
//./nreinas N

//-------------------------------------------------------------------+
// VARIABLES GLOBALES |
//-------------------------------------------------------------------+
// Se indexa por columna e indica fila en la que hay reina

int reinaEnFila[MAX_REINAS];
int numReinas, soluciones=0;

//-------------------------------------------------------------------+

int aceptable (int reinaFila, int reinaColumna) {
int col;
    if (reinaEnFila[reinaColumna]!=0)
        return FALSE; // Reina en la misma columna
    for(col=1; col<=numReinas; col++)
    // Si hay una reina que me come en diagonal no es aceptable
        if ( ((reinaEnFila[col] != 0)
            && (abs(reinaEnFila[col]-reinaFila))==(abs(reinaColumna-col))))
          return FALSE;
    return TRUE;
}

//-------------------------------------------------------------------+
void NReinas(int reina) {
int fila,columna,col;
    for(col=1;col<=numReinas;col++) {
        if(aceptable(reina,col)) {
            reinaEnFila[col]=reina; // Reina i siempre se ubica en fila i
            if (reina==numReinas) {
                if (soluciones==0) {
                    printf("\n\n");
                    for (fila=1;fila<=numReinas;fila++) {
                        for(columna=1;columna<=numReinas;columna++) {
                            if (fila!=reinaEnFila[columna]) printf(" *");
                            else printf(" Q");
                        }
                        printf("\n");
                    }
                }
                soluciones++;
            }
        else NReinas(reina+1);
        reinaEnFila[col]=0;
        }
    }
}
//-------------------------------------------------------------------+
int main (int argc, char *argv[]) {
int i;
struct timeval t0, tf, t;
    for (i=0; i<MAX_REINAS; i++) reinaEnFila[i] = 0;
    soluciones=0;
    if (argc != 2) {
        printf ("Uso: nreinas numReinas\n");
        return 0;
    }
    numReinas = atoi(argv[1]);
    if (numReinas >= MAX_REINAS) {
        printf ("Error: El numero de reinas no puede superar %d\n",
        (MAX_REINAS-1));
        return 0;
    }
    gettimeofday (&t0, NULL);
    NReinas(1);
    gettimeofday (&tf, NULL);
    printf("Numero de soluciones: %d \n",soluciones);
    timersub (&tf, &t0, &t);
    printf ("Tiempo total => %ld:%ld seg:miliseg\n", t.tv_sec,
    t.tv_usec/1000);
    return 0;
}

