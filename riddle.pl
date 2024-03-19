% toggle between bank0 and bank1
other_bank(1,0).
other_bank(0,1).
% farmer,wolf,goat,cabbage
% lower case values are constants
% Variables start with an uppercase letter
move([X,X,Goat,Cabbage],wolf,[Y,Y,Goat,Cabbage]) :- other_bank(X,Y).
move([X,Wolf,X,Cabbage],goat,[Y,Wolf,Y,Cabbage]) :- other_bank(X,Y).
move([X,Wolf,Goat,X],cabbage,[Y,Wolf,Goat,Y]) :- other_bank(X,Y).
move([X,Wolf,Goat,Cabbage],human,[Y,Wolf,Goat,Cabbage]):-other_bank(X,Y).

check_valid(X,X,_). % the first and the second argument are the same
check_valid(X,_,X). % first and third are the same
valid_state([Human,Wolf,Goat,Cabbage]):-
    check_valid(Human,Goat,Wolf),  %human and goat are on the same bank
    check_valid(Human,Goat,Cabbage). %human and cabbage same bank
    
solution([1,1,1,1],[]). % all on bank1
solution(State,[Move|OtherMoves]):-
    move(State,Move,NextState),
    valid_state(NextState),
    solution(NextState,OtherMoves).


%This is your query. Start from bank0.
%length(X,7),solution([0,0,0,0],X).

% Try changing the length of X to any integer other than 7, see what happened?