/*1.- La siguiente línea añade reglas de nivel superior, es muy importante para poner en ejecución sin el cual SWI-Prolog nos dará error.*/
[user].

/*2.- nreinas (+N,?Sol). El primer predicado y el cual llamamos desde el intérprete de Prolog . Se satisface si Sol es la solución al problema de las N-Reinas en un tablero de tamaño N.*/
nreinas(N,Sol) :- generarTablero(N,Tablero), permutar(Tablero,Sol), buenTablero(Sol).

/*3.- Este predicado generar un tablero de dimensión N, generar una permutación de ese tablero y por último comprueba si esa permutación contiene reinas es posiciones que no se amenacen unas a otras.
generarTablero(+X,?Y). se verifica si Y es una lista de X elementos que contiene los naturales comprendidos entre 1 y X, ambos inclusive. Nótese que: Como cada reina habrá de ocupar una columna distinta, el tablero (o tableros) solución será (serán) una permutación de un tablero así generado.
Este predicado genera un tablero de la forma [N,N-1,N-2,….,1].*/
generarTablero(0,[]).
generarTablero(X,[X|R]) :- XMenos1 is X - 1, XMenos1 >= 0, generarTablero(XMenos1,R).

/*4.- permutar(?LX,?LY). se verifica si LY es una permutación de los elementos de LX, la única permutación de la lista vacía es la lista vacía.
Para realizar la permutación de la lista de entrada, se seleccióna el primer valore de la lista y se permuta con el resto de la lista.*/
permutar([],[]).
permutar(X,[C|Z]) :- seleccionar(X,C,R), permutar(R,Z).

/*5.- seleccionar(L,X,R). se verifica si X es un elemento de L y R es la lista L sin el elemento X.*/
seleccionar([X|R],X,R).
seleccionar([C|R],X,[C|Y]) :- seleccionar(R,X,Y).

/*6.- buenTablero(+X). se verifica si en el tablero X, ninguna reina amenaza a otra. Hay que tener en cuenta que:
>> Amenazar es una relación simétrica, es decir, lo mismo da amenazar que ser amenazada.
>> Lo que se ha llamado Tablero es una lista de n elementos con los naturales de 1 a n donde cada elemento especifica la columna que ocupa la reina en el tablero, y la fila se especifica por el orden del elemento en la lista. (En resumidas cuentas, acorde a las especificaciones de la práctica).
Se comprueba que la reina C no amenaza a las del resto del tablero y despues se comprueba el resto del tablero.*/
buenTablero([]).
buenTablero([C|R]) :- not(amenaza(C,R)), buenTablero(R).

/*7.- amenaza(X,Y). se verifica si una reina colocada en la columna X de la fila n de un tablero amenaza a cualquiera de las demás reinas colocadas en las filas 0..n-1 del resto del tablero, y cuyas columnas vienen especificadas en la lista Y. Utiliza para comprobar todo esto el predicado análogo amenaza(X,Prof,L), que se cumple cuando X y otro elemento de la lista L se encuentran en la misma columna (mismo valor) o especifican reinas situadas en diagonal.*/
amenaza(X,Prof,[C|_]) :- X is C+Prof;
X is C-Prof;
X = C.
amenaza(X,Prof,[_|R]) :- ProfMas1 is Prof + 1, amenaza(X,ProfMas1,R).
amenaza(_,[]) :- fail.
amenaza(X,Y) :- amenaza(X,1,Y).


