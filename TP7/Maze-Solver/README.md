# prolog
## Maze solver in prolog

### Running:
```
$ swipl
> ['load']
```
- Puedes usar:
```
%% Imprime el laberinto
print_maze.

%% Encuentra la ruta más corta de [4,10] a [19,7] (que tiene varias rutas más cortas, use ';' para verlas todas)
%% Sustituye estas coordenadas para encontrar otras rutas. Las coordenadas son [Fila, Columna]
solve([4,10],[19,7],Path). 
```

### Cambio de laberinto:
- En ** load.pl ** puedes cambiar el laberinto comentando / descomentando las líneas del laberinto, actualmente está configurado en ** maze-big.pl **.
- También puedes hacer tu propio archivo de laberinto. Simplemente declare * maze_size / 2 * y * barrera / 2 * p.
```
:- module(myMaze, [maze_size/2, barrier/2]).
maze_size(3, 3).
barrier(2, 2).
barrier(2, 3).
```