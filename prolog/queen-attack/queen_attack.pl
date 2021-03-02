% Please visit https://exercism.io/tracks/prolog/installation
% for instructions on setting up prolog.
% Visit https://exercism.io/tracks/prolog/tests
% for help running the tests for prolog exercises.

% Replace the goal below with
% your implementation.

on_board(Coord) :-
  Coord >= 0, Coord < 8.

can_attack((X1, Y1), (X2, Y2)) :-
  X1 == X2;
  Y1 == Y2;
  abs(X2 - X1) =:= abs(Y2 - Y1).

create((X, Y)) :-
  on_board(X),
  on_board(Y).

attack(A, B) :-
  create(A),
  create(B),
  can_attack(A, B).
