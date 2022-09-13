entree(foiegras).
entree(saladegourmande).
entree(crudites).
entree(tomatemozzarella).

viande(entrecote).
viande(magretdecanard).
viande(dindefermiere).

poisson(truitemeuniere).
poisson(brochetdeloire).
poisson(cubedebarendret).

dessert(mousseauchocolat).
dessert(sorbet).
dessert(ileflottante).
dessert(poirebellehelene).

plat(X) :- viande(X).
plat(X) :- poisson(X).

menu(X, Y, Z) :- entree(X), plat(Y), dessert(Z).

calorie(foiegras, 208).
calorie(saladegourmande, 158).
calorie(crudites, 81).
calorie(tomatemozzarella, 208).
calorie(entrecote, 537).
calorie(dindefermiere, 382).
calorie(magretdecanard, 405).
calorie(truitemeuniere, 260).
calorie(brochetdeloire, 256).
calorie(cubedebarendret, 292).
calorie(mousseauchocolat, 136).
calorie(sorbet, 60).
calorie(ileflottante, 95).
calorie(poirebellehelene, 114).

menu_kc(E, P, D, K) :- menu(E , P, D), calorie(E, K1), calorie(P, K2), calorie(D, K3), K is K1 + K2 + K3.
