arc(a,b).		arc(b,c).
arc(a,c).		arc(a,d).
arc(b,e).		arc(e,f).
arc(b,f).		arc(f,g).

path(X,Y):- arc(X,Y).
path(X,Y):- arc(X,Z),path(Z,Y).

pathall(X,X,[]).

pathall(X,Y,[X,Z|L]):- arc(X,Z),pathall(Z,Y,L).
