homme(odilon).
homme(vincent).
homme(roger).
homme(arnaud).
homme(marcel).
homme(blaise).
homme(edouard).
homme(marius).

femme(genevieve).
femme(melanie).
femme(roseline).
femme(agnes).
femme(paule).
femme(martine).
femme(pauline).
femme(tatiana).
femme(prisca).

couple(1,odilon,genevieve).
couple(2,roger,melanie).
couple(3,edouard,tatiana).
couple(4,vincent,roseline).
couple(5,marcel,paule).

enfant(1,melanie).
enfant(1,pauline).
enfant(1,edouard).
enfant(2,marcel).
enfant(2,roseline).
enfant(3,marius).
enfant(3,prisca).
enfant(4,agnes).
enfant(4,arnaud).
enfant(5,martine).
enfant(5,blaise).

pere(X,Y):-homme(X),enfant(N,Y),couple(N,X,_).
mere(X,Y):-femme(X),enfant(N,Y),couple(N,_,X).
soeur(X,Y):-femme(X),enfant(N,X),enfant(N,Y),X\=Y.
frere(X,Y):-homme(X),enfant(N,X),enfant(N,Y),X\=Y.
frere_ou_soeur(X,Y):-enfant(N,X),enfant(N,Y),X\=Y.
oncle(X,Y):-homme(X),frere_ou_soeur(X,Z),pere(Z,Y).
oncle(X,Y):-homme(X),frere_ou_soeur(X,Z),mere(Z,Y).
tante(X,Y):-femme(X),frere_ou_soeur(X,Z),pere(Z,Y).
tante(X,Y):-femme(X),frere_ou_soeur(X,Z),mere(Z,Y).
grand_parent(X,Y):-pere(X,Z),pere(Z,Y).
grand_parent(X,Y):-mere(X,Z),pere(Z,Y).
grand_parent(X,Y):-pere(X,Z),mere(Z,Y).
grand_parent(X,Y):-mere(X,Z),mere(Z,Y).
cousin_cousine(X,Y):-oncle(X,Z),pere(Z,Y).
cousin_cousine(X,Y):-tante(X,Z),mere(Z,Y).
