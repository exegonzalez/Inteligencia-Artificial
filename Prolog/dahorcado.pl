in_mind([e,x,e,q,u,i,e,l]).

start:- write('Guess first letter'),read(X),
	in_mind([X|T]),write('OK. '),guess(T).

guess([]):- write('Congratulations! The word is '),in_mind(W),write(W),!.
guess(L):-  repeat,write('Next letter'),read(X),
		 ((L=[X|T1],write('OK. '),guess(T1));
/** <examples>
?- kll
*/
		 (write('Fail. Try again!'),guess(L))).
