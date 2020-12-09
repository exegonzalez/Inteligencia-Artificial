:-dynamic
	rpath/2.      % A reversed path

% Example of GUIA 3.1

%		1		2		3		4		5		6		7		8		9		10		11
% 1		-1   	10.2 	9.2 	8.2   	∞ 		6.8 	5.8 	4.8 	3.8 	3.4 	3
% 2		10.8  	9.8 	8.8 	7.8 	6.8 	5.8 	4.8 	4.4   	∞ 		2.4 	2
% 3		10.4  	9.4   	∞  		∞ 		6.4 	5.4 	4.4 	3.4   	∞ 		1.4 	1
% 4		10.8  	9.8 	8.8 	7.8 	6.8   	∞   	4   	3   	2   	1		0
% 5		11.2 	10.2 	9.2 	8.2 	7.8  	∞ 		4.4 	3.4 	2.4 	1.4 	1

% Columna 1
edge(c1f1, c2f1, 10.2).
edge(c1f1, c1f2, 10.8).
edge(c1f1, c2f2, 9.8).
edge(c1f2, c2f1, 10.2).
edge(c1f2, c2f2, 9.8).
edge(c1f2, c1f3, 10.4).
edge(c1f2, c2f3, 9.4).
edge(c1f3, c1f4, 10.8).
edge(c1f3, c2f2, 9.8).
edge(c1f3, c2f3, 9.4).
edge(c1f3, c2f4, 9.8).
edge(c1f4, c1f5, 11.2).
edge(c1f4, c2f3, 9.4).
edge(c1f4, c2f4, 9.8).
edge(c1f4, c2f5, 10.2).
edge(c1f5, c2f4, 9.8).
edge(c1f5, c2f5, 10.2).

%Columna 2
edge(c2f1, c2f2, 9.8).
edge(c2f1, c3f1, 9.2).
edge(c2f1, c3f2, 8.8).
edge(c2f2, c2f3, 9.4).
edge(c2f2, c3f1, 9.2).
edge(c2f2, c3f2, 8.8).
edge(c2f3, c2f4, 9.8).
edge(c2f3, c3f4, 8.8).
edge(c2f3, c3f2, 8.8).
edge(c2f4, c2f5, 10.2).
edge(c2f4, c3f4, 8.8).
edge(c2f4, c3f5, 9.2).

% Columna 3
edge(c3f1, c3f2, 8.8).
edge(c3f1, c4f1, 8.2).
edge(c3f1, c4f2, 7.8).
edge(c3f2, c4f1, 8.2).
edge(c3f2, c4f2, 7.8).
edge(c3f4, c3f5, 9.2).
edge(c3f4, c4f4, 7.8).
edge(c3f4, c4f5, 8.2).
edge(c3f5, c4f4, 7.8).
edge(c3f5, c4f5, 8.2).

% Columna 4
edge(c4f1,c4f2,7.8).
edge(c4f1,c5f2,6.8).
edge(c4f2,c5f2,6.8).
edge(c4f2,c5f3,6.4).
edge(c4f4,c4f5,8.2).
edge(c4f4,c5f3,6.4).
edge(c4f4,c5f4,6.8).
edge(c4f4,c5f5,7.8).
edge(c4f5,c5f4,6.8).
edge(c4f5,c5f5,7.8).

% Columna 5
edge(c5f2,c5f3,6.4).
edge(c5f2,c6f1,6.8).
edge(c5f2,c6f2,5.8).
edge(c5f2,c6f3,5.4).
edge(c5f3,c5f4,6.8).
edge(c5f3,c6f2,5.8).
edge(c5f3,c6f3,5.4).
edge(c5f4,c5f5,7.8).
edge(c5f4,c6f3,5.4).

% Columna 6
edge(c6f1,c6f2,5.8).
edge(c6f1,c7f1,5.8).
edge(c6f1,c7f2,4.8).
edge(c6f2,c6f3,5.4).
edge(c6f2,c7f1,5.8).
edge(c6f2,c7f2,4.8).
edge(c6f2,c7f3,4.4).
edge(c6f3,c7f2,4.8).
edge(c6f3,c7f3,4.4).
edge(c6f3,c7f4,4).

% Columna 7
edge(c7f1,c7f2,4.8).
edge(c7f1,c8f1,4.8).
edge(c7f1,c8f2,4.4).
edge(c7f2,c7f3,4.4).
edge(c7f2,c8f1,4.8).
edge(c7f2,c8f2,4.4).
edge(c7f2,c8f3,3.4).
edge(c7f3,c7f4,4).
edge(c7f3,c8f2,4.4).
edge(c7f3,c8f3,3.4).
edge(c7f3,c8f4,3).
edge(c7f4,c7f5,4.4).
edge(c7f4,c8f3,3.4).
edge(c7f4,c8f4,3).
edge(c7f4,c8f5,3.4).
edge(c7f5,c8f4,3).
edge(c7f5,c8f5,3.4).

% Columna 8
edge(c8f1, c9f1, 3.8).
edge(c8f1, c8f2, 4.4).
edge(c8f2, c8f3, 3.4).
edge(c8f2, c9f1, 3.8).
edge(c8f3, c8f2, 4.4).
edge(c8f3, c8f4, 3).
edge(c8f3, c9f4, 2).
edge(c8f4, c8f5, 3.4).
edge(c8f4, c9f4, 2).
edge(c8f4, c9f5, 2.4).

% Columna 9
edge(c9f1, c10f1, 3.4).
edge(c9f1, c10f2, 2.4).
edge(c9f4, c9f5, 2.4).
edge(c9f4, c10f3, 1.4).
edge(c9f4, c10f4, 1).
edge(c9f4, c10f5, 1.4).
edge(c9f5, c10f4, 1).
edge(c9f5, c10f5, 1.4).

% Columna 10
edge(c10f1, c10f2, 2.4).
edge(c10f1, c11f1, 3).
edge(c10f1, c11f2, 2).
edge(c10f2, c10f3, 1.4).
edge(c10f2, c11f1, 3).
edge(c10f2, c11f2, 2).
edge(c10f2, c11f3, 1).
edge(c10f3, c10f4, 1).
edge(c10f3, c11f2, 2).
edge(c10f3, c11f3, 1).
edge(c10f3, c11f4, 0).
edge(c10f4, c10f5, 1.4).
edge(c10f4, c11f3, 1).
edge(c10f4, c11f4, 0).
edge(c10f4, c11f5, 1).
edge(c10f5, c11f4, 0).
edge(c10f5, c11f5, 1).



path(From,To,Dist) :- edge(To,From,Dist).
path(From,To,Dist) :- edge(From,To,Dist).
 
shorterPath([H|Path], Dist) :-		       % path < stored path? replace it
	rpath([H|T], D), !, Dist < D,          % match target node [H|_]
	retract(rpath([H|_],_)),
	%writef('%w is closer than %w\n', [[H|Path], [H|T]]),
	assert(rpath([H|Path], Dist)).
shorterPath(Path, Dist) :-		       % Otherwise store a new path
	%writef('New path:%w\n', [Path]),
	assert(rpath(Path,Dist)).
 
traverse(From, Path, Dist) :-		    % traverse all reachable nodes
	path(From, T, D),		    % For each neighbor
	not(memberchk(T, Path)),	    %	which is unvisited
	shorterPath([T,From|Path], Dist+D), %	Update shortest path and distance
	traverse(T,[From|Path],Dist+D).	    %	Then traverse the neighbor
 
traverse(From) :-
	retractall(rpath(_,_)),           % Remove solutions
	traverse(From,[],0).              % Traverse from origin
traverse(_).
 
go(From, To) :-
	traverse(From),                   % Find all distances
	rpath([To|RPath], Dist)->         % If the target was reached
	  reverse([To|RPath], Path),      % Report the path and distance
	  Distance is Dist,
	  writef('Shortest path is %w with distance %w = %w\n',
	       [Path, Dist, Distance]);
	writef('There is no route from %w to %w\n', [From, To]).