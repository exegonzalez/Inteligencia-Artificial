in_mind([d,a,n,i,e,l,a]).

start:- write('Guess first letter'),read(X),
	(in_mind([X|T]),write('OK. '),guess(T);
    writeln('Fail. Try again!'),start).

guess([]):- write('Congratulations! The word is '),in_mind(W),write(W),!.
guess(L):-  repeat,write('Next letter'),read(X),
		 ((L=[X|T1],write('OK. '),guess(T1));
/** <examples>
?- kll
*/
		 (write('Fail. Try again!'),guess(L))).
