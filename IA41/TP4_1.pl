ns([M,C,1],[M1,C,0]):-M>0, M1 is M-1.
ns([M,C,1],[M1,C,0]):-M>1, M1 is M-2.
ns([M,C,1],[M1,C1,0]):-M>0, C>0, M1 is M-1, C1 is C-1.
ns([M,C,1],[M,C1,0]):-C>1, C1 is C-2.
ns([M,C,1],[M,C1,0]):-C>0, C1 is C-1.
ns([M,C,0],[M1,C,1]):-M<3, M1 is M+1.
ns([M,C,0],[M1,C,1]):-M<2, M1 is M+2.
ns([M,C,0],[M1,C1,1]):-M<3, C<3, M1 is M+1, C1 is C+1.
ns([M,C,0],[M,C1,1]):-C<2, C1 is C+2.
ns([M,C,0],[M,C1,1]):-C<3, C1 is C+1.

fctr(A,B) :- ns(A,B), valid(B).

valid([0,_,_]).
valid([3,_,_]).
valid([M,C,_]):-M=C.

find_path(I,I).
find_path(I,F):-I\=F, find_path_2(I,F,[I]).

find_path_2(I,I,L):-reverse(L, L2), write(L2).
find_path_2(I,F,L):-fctr(I,N), not(test(N,L)), find_path_2(N,F,[N|L]).

test(H, [H|_]).
test(H, [D|T]):-H\=D, test(H, T).
