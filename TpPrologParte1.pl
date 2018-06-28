%pareja(Persona, Persona)
pareja(marsellus, mia).
pareja(pumkin,honeyBunny).
%(2)
pareja(bernardo,bianca).
pareja(bernardo,charo).

%trabajaPara(Empleador, Empleado)
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).
%(3)
trabajaPara(Empleador,bernardo):-
    trabajaPara(marsellus,Empleador),
    Empleador \= jules.
trabajaPara(Empleador,george):-
    saleCon(bernardo,Empleador).

%(1)
%saleCon(Persona,Persona)
saleCon(Persona1,Persona2):-
    pareja(Persona1,Persona2).
%La cláusula no es recursiva, ya que no se consulta a sí misma.

%(4)
esFiel(Persona):-
    saleCon(Persona,Pareja1),
   	forall(saleCon(Persona,Pareja),Pareja = Pareja1).

%(5)
acataOrdenes(Ordenador,Empleado):-
    trabajaPara(Ordenador,Empleado).
acataOrdenes(Ordenador,Empleado):-
    trabajaPara(Jefaso,Empleado),
    acataOrdenes(Ordenador,Jefaso).
%La clausula es recursiva. El caso base es que el empleado trabaje directamente para el Ordenador, el caso recursivo es que alguno de los sucesivos
%jefes del empleado trabaje para el ordenador.
