:- module(maze, [maze_size/2, barrier/2]).
 
maze_size(5, 11).
 
barrier(1, 5).
barrier(2, 9).
barrier(3, 3).
barrier(3, 4).
barrier(3, 9).
barrier(4, 6).
barrier(5, 6).
 
%%    1 2 3 4 5 6 7 8 9 10 11
%%   +-----------------------+
%% 1 |* . . . x . . . .  .  .|
%% 2 |. . . . . . . . x  .  .|
%% 3 |. . x x . . . . x  .  .|
%% 4 |. . . . . x . . .  .  #|
%% 5 |. . . . . x . . .  .  .|
%%   +-----------------------+