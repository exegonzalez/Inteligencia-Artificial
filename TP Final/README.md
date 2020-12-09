# tp-integrador-ia
Trabajo práctico integrador - Guía 5.1. Algoritmos Genéticos (AG)

### Running: python3 n_reinas_ag.py -ti [tamaño individuo] -tp [tamaño poblacion] -g [generaciones] -p [pressure - opcional - default=3] -pm [porcentaje de mutacion] -pc [porcentaje de cruza]

### Help: python3 n_reinas_ag.py --help

### Doc:
En los AG, se define como población al conjunto de soluciones posibles, individuo a cada una de las soluciones del espacio pareto,  unción de fitness a los mecanismos de evaluación sistemática de los individuos para los fines evolutivos. En todos los casos de AG  l objeto final es hallar una optimización y es imprescindible aprender a codificar en los genomas al problema, de lo contrario la solución nunca será apropiada para el problema en cuestión.

1.Determinación del genoma:
Determine el vector que represente al problema de 8 reinas
NOTA: considere que sólo usaremos como lenguaje de representación vectores numéricos

Definiremos como el vector que representa al problema de 8 reinas, un vector "g" de tamaño i, i=[0,7] en el que la posicion  epresenta la columna = i y el valor = g[i] la fila donde se ubica la reina en el tablero.

2.Determinación de la población:
-Cantidad de individuos de la población
-Porcentaje de mutación
-porcentaje de cruza
-cantidad de generaciones que permitirá al algoritmo evolucionar

3.Determine la función de fitness (FF):
-recuerde que debe medir la distancia numérica entre cada individuo y la solución buscada
-recuerde punificar las soluciones que violan las reglas del juego de 8 reinas, que son
    *Una reina no debe ser comida por otra previamente colocada
    *Una reina sólo se puede colocar en una casilla válida para comer a otra pieza
-recuerde la condición de terminación es que se coloquen las 8 reinas: exista o no ubicaciones óptimas para todas las reinas deben siempre colocarse todas.

4.Determine la función de selección: para simplificar el algoritmo escriba sólo la selección de individuos en base a su fitness. Para ello deberá especificar un seudocódigo que permita seleccionar por mejor FF.

5.Determine la función de cruza:
Para simplificar el algoritmo se pondrá solo un punto de corte. Además la cruza es con reemplazo, es decir, un algoritmo donde los  adres ya no son seleccionables si han sido usados para cruzarse durante esa generación.

6.Determine la función de mutación: para simplificar el algoritmo, consiste sólo en el cambio a otra casilla disponible, siempre que supere un umbral de XX %. Es decir, una vez determinado que un par de individuos se cruzarán, se obtiene un número al azar  ntre 0 y 99, y sólo se efectúa la cruza si dicho número supera el umbral de XX.

7.Determine el proceso de inicialización:
a) inicie la población al azar y mida los resultados de la FF al finalizar 5 corridas.
b) inicie la población en una solución trivial y mida los resultados de la FF al finalizar 5 corridas.
c) genere un informe con todos los resultados. compare y justifique.