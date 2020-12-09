adjetivo([fruta]).

articulo([el]).
articulo([la]).

nombre([gato]).
nombre([perro]).
nombre([pescado]).
nombre([carne]).
nombre([mosca]).
nombre([banana]).

verbo([come]).
verbo([gusta]).

oracion(O) :- sintagma_verbal(O).

oracion(O) :- sintagma_nominal(SN),
sintagma_verbal(SV),
append(SN,SV,O).

sintagma_nominal(SN) :- nombre(SN).
sintagma_nominal(SN) :- articulo(A),
			nombre(N),
    			append(A, N, SN).

sintagma_verbal(V) :- verbo(V).
sintagma_verbal(SV) :- verbo(V),
    				   sintagma_nominal(SN),
    				   append(V, SN, SV).

