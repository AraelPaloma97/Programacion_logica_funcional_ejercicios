% Escriba un analizador sintactico que pueda validar las siguientes sentencias
% simples que puedan ser representadas por las siguientes gramaticas 
% Exp ::= "(" ' ' <Operacion> ' ' ")"
% Operacion ::= <Operador>' '<SecNumeros>
% Operador ::= '+' | '-' | '/' | '*'
% SecNumeros ::= <NumerosSigno> | <NumerosSigno> ' ' <SecNumeros>
% NumerosSigno ::= <Digitos> | <Signo> <Digitos>
% Signo ::= '+' | '-'
% Digitos ::= Digito | Digito Digitos
% Digito ::= 0 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
% ( - 9 8 )
% -1
% ( - -9 )
% 9

latom_lstring([],[]).
latom_lstring([F|C],R) :- latom_lstring(C,S), atom_string(F,SF), append([SF],S,R).

preparar_string(Term,LS) :-
        atom(Term),
        atom_string(Term,Str),
        preparar_string(Str,LS).

preparar_string(Str,LS) :-
        string(Str),
        string_chars(Str,LAC),
        latom_lstring(LAC,LS).

digito(N) :-
        N == "0"; N == "1"; N == "2"; N == "3"; N == "4";
        N == "5"; N == "6"; N == "7"; N == "8"; N == "9".

digitos([F|[]]) :- digito(F).
digitos([F|C]) :- digito(F), digitos(C).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
signo("+").
signo("-").
% signo(R) :- R == "+".
operador("*").
operador("/").
operador(O) :- signo(O).

numerosigno([F|C]) :- signo(F), digitos(C).
numerosigno([F|C]) :- digitos([F|C]).

secuencianum([F|[]]) :- preparar_string(F,LS), numerosigno(LS).
secuencianum([F|C]) :- preparar_string(F,LS), numerosigno(LS), secuencianum(C).

operacion([F|C]) :- operador(F), secuencianum(C).

% +12 343 100 )
% expresion_c(["("|C]) :-

abre_parentesis(["("|_]).
cierra_parentesis([_|C]) :- append(_,[")"],C).
expre([F|C]) :- abre_parentesis([F|C]), cierra_parentesis([F|C]), append(OP, [")"],C), operacion(OP).

