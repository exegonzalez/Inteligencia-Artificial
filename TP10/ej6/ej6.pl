% this is a prolog rule file
% This is a declarative solver which generates solutions for a asymmetric travelling salesman problem

% solution(+Path, +RoadNetwork, -SolutionCost, -SolutionPath).
% Path is a list of cities in reverse order of being visited
% RoadNetwork is an adjacency list of the cities in the road network
% SolutionCost is the cost of a tour
% SolutionPath is the tour for which the SolutionCost was calculated

% solution(
%     [colon],
%     [
%         (colon,     [ (ubajay, 65),       (tala, 124),        (villaelisa, 38)   ]),
%         (ubajay,    [ (colon, 65),        (villaguay, 92)     ]),
%         (villaguay, [ (ubajay, 92),       (tala, 83),         (villaelisa, 70),   (nogoya, 146)]),
%         (tala,      [ (colon, 124),       (villaguay, 83),    (villaelisa, 145),  (nogoya, 66), (lapaz, 211)  ]),
%         (villaelisa,[ (colon, 38),        (villaguay, 71),    (tala, 145)   ]),
%         (nogoya,    [ (villaguay, 146),   (tala, 66),         (lapaz, 253),  (victoria, 45)   ]),
%         (lapaz,     [ (tala, 211),        (nogoya, 253),      (victoria, 282) ]),
%         (victoria,  [ (nogoya, 45),       (lapaz, 282)    ])
%     ], 
%     SolutionCost, 
%     SolutionPath
% ).

solution(Path, RoadNetwork, SolutionCost, SolutionPath):-
    length(RoadNetwork,1),
    member(Start,Path),
    member((Start,[]),RoadNetwork),
    SolutionCost = 0,
    SolutionPath = [Start,Start].

solution(Path, RoadNetwork, SolutionCost, SolutionPath):-
    Costs = [],
    solution(Path, RoadNetwork, Costs, SolutionCost, SolutionPath).

solution(Path, RoadNetwork, Costs, SolutionCost, SolutionPath):-
    length(RoadNetwork,Length),
    length(Path,Length),
    [End|_] = Path,
    last(Path,Start),
    member((End,Roads), RoadNetwork),
    member((Start,Cost),Roads),
    sumlist([Cost|Costs], SolutionCost),
    reverse([Start|Path], SolutionPath).


solution(Path, RoadNetwork, Costs, SolutionCost, SolutionPath):-
    length(RoadNetwork,CityLength),
    length(Path,PathLength),
    PathLength < CityLength,
    [City|_] = Path,
    member((City,Roads), RoadNetwork),
    member((NewCity,NewCost),Roads),
    member((NewCity,_),RoadNetwork),
    is_set([NewCity|Path]),
    solution([NewCity|Path],RoadNetwork, [NewCost|Costs], SolutionCost, SolutionPath).