help([]):-!.
help([H|T]):-
member(H,T),!,fail;
help(T).

teacher("Morozov").
teacher("Vasilev").
teacher("Tokarev").

lesson("Biology").
lesson("French").
lesson("Englisg").
lesson("History").
lesson("Mathemathics").
lesson("Geography").

find_solution(S,L1,L2).
solve(Answer):-
Answer= [find_solution(X,XL1,XL2),find_solution(Y,YL1,YL2),find_solution(Z,ZL1,ZL2)],

teacher(X), teacher(Y), teacher(Z), not(X=Y),not(Y=Z),not(X=Z),
lesson(XL1),lesson(XL2),
lesson(YL1),lesson(YL2), 
lesson(ZL1),lesson(ZL2), 
help([XL1,XL2,YL1,YL2,ZL1,ZL2]),
not(member(find_solution(_,"Geography","French"),Answer)),
not(member(find_solution(_,"French","Geography"),Answer)),
not(member(find_solution("Tokarev","Biology";_,"French";_),Answer)),
not(member(find_solution("Tokarev","French";_,"Biology";_),Answer)),
not(member(find_solution(_,"Biology","French"),Answer)),
not(member(find_solution(_,"French","Biology"),Answer)),
not(member(find_solution("Morozov","Biology",_),Answer)),
not(member(find_solution("Morozov",_,"Biology"),Answer)),
not(member(find_solution(_,"Biology","Mathemathics"),Answer)),
not(member(find_solution(_,"Mathemathics","Biology"),Answer)),
not(member(find_solution(_,"Englisg","Mathemathics"),Answer)),
not(member(find_solution(_,"Mathemathics","Englisg"),Answer)),
not(member(find_solution("Morozov",_,"Englisg"),Answer)),
not(member(find_solution("Morozov","Englisg",_),Answer)),
not(member(find_solution("Morozov",_,"Mathemathics"),Answer)),
not(member(find_solution("Morozov","Mathemathics",_),Answer)).


?-solve(X),write(X).