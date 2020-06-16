% Desarrollo una gramatica bnf (como la del video) para validar una
% direccion ipv4 asi como una mascara de red.
% https://es.wikipedia.org/wiki/M%C3%A1scara_de_red#Tabla_de_m%C3%A1scaras_de_red
% Realice la implementacion de dicha gramatica en prolog donde
% se pueda validar la cadena donde esta esa ip o mascara ejemplo
% ip("192.168.1.1").
% true.
% ip("256.168.1.1").
% false.
% maskR("255.255.255.0").
% true.
% maskR("255.255.255.1").
% false.

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
   
rR(R):- R == "0"; R == "1"; R == "2"; R == "4"; R == "5"; R == "8".
%%%%%%%%%%%%%%%%%%%%% IP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ip(IP) :- split_string(IP,".",",",L), sepip(L).
sepip([F|[]]) :- vip(F).
sepip([F|C])  :- vip(F), sepip(C).

vip(D) :- string_length(D,3),preparar_string(D,S), opip1(S);
          string_length(D,2),preparar_string(D,S), opip2(S);
          string_length(D,1),preparar_string(D,S), opip2(S).
		  
opip1([F|C]) :- F == "2", oct([F|C]); F == "1", opip2([F|C]).
opip2([F|[]]) :- digito(F).
opip2([F|C])  :- digito(F), opip2(C).

oct([F|[]]) :- rR(F).
oct([F|C])  :- rR(F), oct(C).

%%%%%%%%%%%%%%%%%%%%% MASCARA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maskR(MASCARA) :- split_string(MASCARA,".",",",M), vmsk(M).
mmsk([F|[]])  :- opmsk2(F).
mmsk([F|C])  :- opmsk2(F), mmsk(C).

vmsk([F|[]]) :- string_length(F,3),opmsk1(F);
                      string_length(F,1),opmsk2(F).
vmsk([F|C]) :- string_length(F,3),opmsk1(F),vmsk(C);
                     string_length(F,1),opmsk2(F),mmsk(C).
					 
opmsk1(N):- N == "128"; N == "192"; N == "224"; N == "240";
            N == "248"; N == "252"; N == "254"; N == "255".
opmsk2(MC):- MC == "0".