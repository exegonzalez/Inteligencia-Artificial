# prolog
## ej6 problema del viajante

### Running:

```
Cargue el programa en la memoria prolog:
```

$ swipl

```Realice la siguiente consulta:

% solution(+Path, +RoadNetwork, -SolutionCost, -SolutionPath).
% Path is a list of cities in reverse order of being visited
% RoadNetwork is an adjacency list of the cities in the road network
% SolutionCost is the cost of a tour
% SolutionPath is the tour for which the SolutionCost was calculated
```

?- solution(
    [colon],
    [
        (colon,     [ (ubajay, 65),       (tala, 124),        (villaelisa, 38)   ]),
        (ubajay,    [ (colon, 65),        (villaguay, 92)     ]),
        (villaguay, [ (ubajay, 92),       (tala, 83),         (villaelisa, 70),   (nogoya, 146)]),
        (tala,      [ (colon, 124),       (villaguay, 83),    (villaelisa, 145),  (nogoya, 66), (lapaz, 211)  ]),
        (villaelisa,[ (colon, 38),        (villaguay, 71),    (tala, 145)   ]),
        (nogoya,    [ (villaguay, 146),   (tala, 66),         (lapaz, 253),  (victoria, 45)   ]),
        (lapaz,     [ (tala, 211),        (nogoya, 253),      (victoria, 282) ]),
        (victoria,  [ (nogoya, 45),       (lapaz, 282)    ])
    ], 
    SolutionCost, 
    SolutionPath
).