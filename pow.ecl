
%% pow/3

pow(X,0,[1]) :- number(X), X > 0, !.

pow(X,P,[Temp|Tail]) :-
	number(X), 
	number(P),
	Temp is X^P,
	TemP is P - 1,
	pow(X,TemP,Tail).

%% https://stackoverflow.com/questions/8289361/writing-to-file-prolog

loop_through_list(File, List) :-
    member(Element, List),
    write(File, Element),
    write(File, '\n'),
    fail.

write_list_to_file(Filename,List) :-
    open(Filename, write, File),
    \+ loop_through_list(File, List),
    close(File).
	
