homme(paul).
homme(pierre).
homme(jean).

femme(marie).
femme(eva).
femme(lea).

profil(paul, grand, brun, mur).
profil(pierre, moyen, blond, jeune).
profil(jean, petit, brun, mur).
profil(lea, petit, brune, mur).
profil(eva, petit, blond, jeune).
profil(marie, moyen, blond, moyen).

gouts(paul, classique, aventure, natation).
gouts(pierre, rock, scifi, tennis).
gouts(jean, jazz, policiers, tennis).
gouts(marie, X, aventure, natation) :- musique(X).
gouts(eva, rock, scifi, X) :- sport(X),X\=jogging.
gouts(lea, classique, aventure, natation).

sport(tennis).
sport(natation).
sport(jogging).

musique(rock).
musique(classique).
musique(jazz).

preference(paul, grand, roux, jeune).
preference(pierre, X, blond, jeune) :- taille(X), X\=grande.
preference(jean, petit, blond, moyen).
preference(marie, grand, brun, moyen).
preference(eva, moyen, blond, jeune).
preference(lea, moyen, brun, mur).

taille(grand).
taille(moyen).
taille(petit).

convient_physiquement(X, Y) :- homme(X), femme(Y), preference(X, T, C, A), preference(Y, T2, C2, A2), profil(X, T2, C2, A2), profil(Y, T, C, A).
convient_physiquement(X, Y) :- homme(Y), femme(X), preference(X, T, C, A), preference(Y, T2, C2, A2), profil(X, T2, C2, A2), profil(Y, T, C, A).

ont_meme_gout(X, Y) :- gouts(X, M, R, S), gouts(Y, M, R, S).

couple(X, Y) :- convient_physiquement(X, Y), ont_meme_gout(X, Y).
