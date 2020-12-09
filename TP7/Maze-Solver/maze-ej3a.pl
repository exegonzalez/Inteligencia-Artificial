:- module(maze, [maze_size/2, barrier/2]).
 
maze_size(7, 9).
 
barrier(1, 8).
barrier(2, 1).
barrier(2, 2).
barrier(2, 8).
barrier(3, 3).
barrier(3, 4).
barrier(3, 5).
barrier(3, 6).
barrier(3, 8).
barrier(4, 4).
barrier(4, 5).
barrier(4, 8).
barrier(5, 2).
barrier(5, 3).
barrier(5, 8).
barrier(6, 2).
barrier(6, 3).
barrier(6, 4).
barrier(6, 6).
barrier(6, 7).
barrier(6, 8).
barrier(7, 3).
barrier(7, 4).
barrier(7, 7).
barrier(7, 8).
 
%%    1 2 3 4 5 6 7 8 9
%%   +------------------+
%% 1 |. . . . . . . x * |
%% 2 |x x . . . . . x . |
%% 3 |. . x x x x . x . |
%% 4 |. . . x x . . x . |
%% 5 |. x x . . . . x . |
%% 6 |. x x x . x x x . |
%% 7 |# . x x . . x x . |
%%   +------------------+