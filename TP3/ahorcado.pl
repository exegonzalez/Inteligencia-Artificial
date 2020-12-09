gess([], Lives) :- format('¡Felicitaciones ganaste!, te quedaron ~w vidas sobrantes!', [Lives]).
gess(Letter, WordToGuess, Lives, GessedLetters) :- 
    wordToGess(WordToGuess), reverse(GessedLetters, GessedLettersReverse),
    format('Las letras ingresadas hasta ahora son: ~w\n', [GessedLettersReverse]),
    member(Letter, WordToGuess), writeln('Buen trabajo continua!\n'),
    delete(WordToGuess, Letter, Result), lifeControl(Result, Lives, GessedLetters);
    writeln('Opps fallaste, intenta de nuevo!\n'), LivesRest is Lives-1, lifeControl(WordToGuess, LivesRest, GessedLetters).

lifeControl([], Lives, GessedLetters) :- 
    format('¡Felicitaciones ganaste! Te quedaron ~w vidas sobrantes. Las letras que ingresaste fueron: ~w\n', [Lives, GessedLetters]).

lifeControl(WordToGuess, Lives, GessedLetters) :- 
    format('Tienes ~w vidas!\n', [Lives]),
    Lives=:=0, format('¡Ooops has perdido!\n');
    Lives=<10, write('Ingrese una letra: '),
    read(Letter),
    (member(Letter, GessedLetters), format('\n¡Ooops ya probaste con esta letra!\n'), 
    lifeControl(WordToGuess, Lives, GessedLetters);
    gess(Letter, WordToGuess, Lives, [Letter|GessedLetters])).

wordToGess(WordToGuess) :- length(WordToGuess, Length), format('\n¡Faltan ~w letras por adivinar!\n', [Length]).

play :- writeln('¡Comencemos!\n'), start([a,h,o,r,c,a,d,o]).

start(WordToGuess) :- 
    lifeControl(WordToGuess, 10, []), 
    atomics_to_string(WordToGuess, Word), 
    format('La palabra es: ~w', [Word]).


