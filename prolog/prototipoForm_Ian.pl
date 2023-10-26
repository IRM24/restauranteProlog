
:- use_module(library(strings)).
:- use_module(library(odbc)).

% Predicado para establecer una conexion a la base de datos
%:- dynamic restaurante_db/1.
conectar_base_de_datos :-
    odbc_connect('conexioncami', Connection,
        [ user('root'),
          password('Coquito21'),
          alias(restaurante_db),
          open(once)
        ]).

desconectar_base_de_datos :- odbc_disconnect(restaurante_db).

%%%%%%%%%%%%%%%%%%%%%Bebidas%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicado para obtener bebidas segun el tiempo de comida y temperatura
obtener_bebidas(TiempoComida, Bebidas) :-
    % Comprobar si la temperatura es "fria" o "caliente"
    %write('�Que temperatura prefieres para las bebidas, fria o caliente (fria/caliente)? '),
    read(Temperatura),

    (Temperatura == 'fria' ->
        % Si es fria, preguntar por el tipo (carbonatadas o naturales)
        elegir_tipo_bebida_fria(TiempoComida, Tipo),
        Bebidas = Tipo
    ;
        % Si es caliente, preguntar si se desea carbonatadas, naturales o todas
        elegir_tipo_bebida_caliente(TiempoComida, Tipo),
        Bebidas = Tipo
    ).

% Predicado para elegir entre bebidas frías carbonatadas o naturales
elegir_tipo_bebida_fria(TiempoComida, Tipo) :-
    %write('�Deseas bebidas frias carbonatadas o naturales (carbonatadas/naturales)? '),
    read(TipoEleccion),
    (TipoEleccion == 'carbonatadas' ->
        obtener_bebidas_frias(TiempoComida, 'carbonatadas', Tipo)
    ;
        obtener_bebidas_frias(TiempoComida, 'naturales', Tipo)
    ).

% Predicado para obtener bebidas frias carbonatadas o naturales
obtener_bebidas_frias(TiempoComida, Tipo, Bebidas) :-
    % Construir la consulta SQL basada en los para�metros
    atomic_list_concat(['SELECT nombre FROM bebida WHERE', TiempoComida, '= ''Si'' AND temperatura = ''Fria'' AND', Tipo, '= ''Si'''], ' ', Query),
    % Ejecutar la consulta SQL y obtener los resultados
    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Bebidas).

elegir_tipo_bebida_caliente(TiempoComida, Tipo) :-
    %write('�Deseas bebidas calientes carbonatadas o naturales (carbonatadas/naturales)? '),
    read(TipoEleccion),
    (TipoEleccion == 'carbonatadas' ->
        obtener_bebidas_calientes(TiempoComida, 'carbonatadas', Tipo)
    ;
        obtener_bebidas_calientes(TiempoComida, 'naturales', Tipo)
    ).

% Predicado para obtener bebidas calientes carbonatadas o naturales
obtener_bebidas_calientes(TiempoComida, Tipo, Bebidas) :-
    % Construir la consulta SQL basada en los parametros
    atomic_list_concat(['SELECT nombre FROM bebida WHERE', TiempoComida, '= ''Si'' AND temperatura = ''Caliente'' AND', Tipo, '= ''Si'''], ' ', Query),
    % Ejecutar la consulta SQL y obtener los resultados
    write(Query),
    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Bebidas).


%%%%%%%%%%%%%%%%%%%%%%%%Proteinas%%%%%%%%%%%%%%%%%%%%%
% Predicado para obtener proteinas seg�n el tipo ingresado por el usuario
obtener_proteina(TiempoComida, Registros) :-
    % Preguntar al usuario por el tipo de proteina
    %write('�Que tipo de proteina deseas (pollo, mariscos, carnes_rojas)? '),
    read(TipoProteina),

    % Verificar el tipo de proteina y llamar al predicado correspondiente
    (TipoProteina == 'pollo' ->
        obtener_proteina_pollo(TiempoComida, Registros)
    ; TipoProteina == 'mariscos' ->
        obtener_proteina_mariscos(TiempoComida, Registros)
    ; TipoProteina == 'carnes_rojas' ->
        obtener_proteina_carnesRojas(TiempoComida, Registros)
    ; % Manejo de otro caso (por ejemplo, tipo desconocido)
        write('Tipo de proteina desconocido'),
        Registros = [] % Otra acci�n en caso de tipo desconocido
    ).


% Predicado para las proteinas de pollo
obtener_proteina_pollo(TiempoComida, Registros) :-
        % Construir la consulta SQL basada en los parametros
    atomic_list_concat(['SELECT (nombre) FROM proteina WHERE', TiempoComida, '= ''Si'' AND tipo = ''Pollo'''], ' ', Query),

    % Ejecutar la consulta y obtener la lista de nombres
    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Registros).

% Predicado para las proteinas de mariscos
obtener_proteina_mariscos(TiempoComida, Registros) :-
        % Construir la consulta SQL basada en los parametros
    atomic_list_concat(['SELECT (nombre) FROM proteina WHERE', TiempoComida, '= ''Si'' AND tipo = ''Mariscos'''], ' ', Query),

    % Ejecutar la consulta y obtener la lista de nombres
    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Registros).

obtener_proteina_carnesRojas(TiempoComida, Registros) :-
        % Construir la consulta SQL basada en los parametros
    atomic_list_concat(['SELECT (nombre) FROM proteina WHERE', TiempoComida, '= ''Si'' AND tipo = ''Carnes Rojas'''], ' ', Query),

    % Ejecutar la consulta y obtener la lista de nombres
    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Registros).


%%%%%%%%%%%%%%%%%%%%%Acompannamientos%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicado para obtener la cantidad de acompa�amientos
obtener_cantidad_acompannamientos(Cantidad) :-
    %write('�Cuantos acompa�amientos deseas (1-3)? '),
    read(Cantidad),
    % Verificar que la cantidad este en el rango permitido
    (Cantidad >= 1, Cantidad =< 3 ->
        true
    ;
        write('Por favor, ingresa una cantidad valida entre 1 y 3.\n'),
        obtener_cantidad_acompannamientos(Cantidad)
    ).

obtener_acompannamientos(TiempoComida, Acompannamientos) :-

    obtener_cantidad_acompannamientos(CantidadAcompannamientos),

    % Comprobar si la temperatura es "fria" o "caliente"
    %write('�Que temperatura prefieres para los acompannamientos, fria o caliente (fria/caliente)? '),
    read(Temperatura),

    (Temperatura == 'fria' ->
        % Si es fria, preguntar por el tipo (carbonatadas o naturales)
        obtener_acompannamientos_frios(TiempoComida, CantidadAcompannamientos,Tipo),
        Acompannamientos = Tipo
    ;
        % Si es caliente, preguntar si se desea carbonatadas, naturales o todas
        obtener_acompannamientos_calientes(TiempoComida, CantidadAcompannamientos, Tipo),
        Acompannamientos = Tipo
    ).

% Predicado para obtener acompa�amientos calientes
obtener_acompannamientos_calientes(TiempoComida, CantidadAcompannamientos, Acompannamientos) :-
    %write('�Deseas acompa�amientos con vegetales (si/no)? '),
    read(EleccionVegetales),

    %write('�Deseas acompa�amientos con carbohidratos (si/no)? '),
    read(EleccionCarbohidratos),

    % Construir la consulta SQL basada en los parametros
    atomic_list_concat(['SELECT nombre FROM acompannamiento WHERE', TiempoComida, '= ''Si'' AND temperatura = ''Caliente'''], ' ', Query),

    % Agregar las condiciones de EleccionVegetales y EleccionCarbohidratos si son "Si"
    (EleccionVegetales = 'si' ->
        atomic_list_concat([' AND vegetales = ''Si'''], '', VegetalesCondition)
    ;
    EleccionVegetales = 'no' ->
        atomic_list_concat([' AND vegetales = ''No'''], '', VegetalesCondition)
    ;
        VegetalesCondition = ''
    ),

    (EleccionCarbohidratos = 'si' ->
        atomic_list_concat([' AND carbohidratos = ''Si'''], '', CarbohidratosCondition)
    ;
    EleccionVegetales = 'no' ->
       atomic_list_concat([' AND carbohidratos = ''No'''], '', CarbohidratosCondition)
    ;
        CarbohidratosCondition = ''
    ),

    % Incluir la restricci�n de cantidad de acompa�amientos
    atomic_list_concat([Query, VegetalesCondition, CarbohidratosCondition], ' ', BaseQuery),
    format(atom(FinalQuery), 'LIMIT ~d', [CantidadAcompannamientos]),
    atomic_list_concat([BaseQuery, FinalQuery], ' ', FullQuery),

    % Ejecutar la consulta SQL y obtener los resultados
    findall(Nombre, (odbc_query(restaurante_db, FullQuery, row(Nombre))), Acompannamientos).

% Predicado para obtener acompa�amientos frios
obtener_acompannamientos_frios(TiempoComida, CantidadAcompannamientos, Acompannamientos) :-
    %write('�Deseas acompa�amientos con vegetales (si/no)? '),
    read(EleccionVegetales),

    %write('�Deseas acompa�amientos con carbohidratos (si/no)? '),
    read(EleccionCarbohidratos),

    % Construir la consulta SQL basada en los parametros
    atomic_list_concat(['SELECT nombre FROM acompannamiento WHERE', TiempoComida, '= ''Si'' AND temperatura = ''Frio'''], ' ', Query),

    % Agregar las condiciones de EleccionVegetales y EleccionCarbohidratos si son "Si"
    (EleccionVegetales = 'si' ->
        atomic_list_concat([' AND vegetales = ''Si'''], '', VegetalesCondition)
    ;
    EleccionVegetales = 'no' ->
        atomic_list_concat([' AND vegetales = ''No'''], '', VegetalesCondition)
    ;
        VegetalesCondition = ''
    ),

    (EleccionCarbohidratos = 'si' ->
        atomic_list_concat([' AND carbohidratos = ''Si'''], '', CarbohidratosCondition)
    ;
    EleccionVegetales = 'no' ->
       atomic_list_concat([' AND carbohidratos = ''No'''], '', CarbohidratosCondition)
    ;
        CarbohidratosCondition = ''
    ),

    % Incluir la restricci�n de cantidad de acompa�amientos
    atomic_list_concat([Query, VegetalesCondition, CarbohidratosCondition], ' ', BaseQuery),
    format(atom(FinalQuery), 'LIMIT ~d', [CantidadAcompannamientos]),
    atomic_list_concat([BaseQuery, FinalQuery], ' ', FullQuery),

    % Ejecutar la consulta SQL y obtener los resultados
    findall(Nombre, (odbc_query(restaurante_db, FullQuery, row(Nombre))), Acompannamientos).

%%%%%%%%%%%%%%%%%%%%%%%%Postres%%%%%%%%%%%%%%%%%%
obtener_postres(TiempoComida, Postres) :-
    % Preguntar si se desea un postre con lacteos (si/no)
    %write('�Deseas un postre con lacteos (si/no)? '),
    read(EleccionLacteos),

    % Llamar a la funci�n correspondiente seg�n la elecci�n
    (EleccionLacteos == 'si' ->
        obtener_postres_con_lacteo(TiempoComida, Postres)
    ;
        obtener_postres_sin_lacteo(TiempoComida, Postres)
    ).


obtener_postres_con_lacteo(TiempoComida,Postres) :-
    %write('�Deseas el postre con frutas (si/no)? '),
    read(EleccionFrutas),

    % Construir la consulta SQL basada en los parametros
    atomic_list_concat(['SELECT nombre FROM postre WHERE', TiempoComida, '= ''Si'' AND lacteo = ''Si'''], ' ', Query),
    write(EleccionFrutas),
    % Agregar la condici�n de EleccionFrutas si es "Si" o "No"
    (EleccionFrutas = 'si' ->
        atomic_list_concat([' AND frutas = ''Si'''], '', FrutasCondition)
    ;
        FrutasCondition = ''
    ),

    % Completar la consulta SQL
    atomic_concat(Query, FrutasCondition, FullQuery),

    % Ejecutar la consulta SQL y obtener los resultados
    findall(Nombre, (odbc_query(restaurante_db, FullQuery, row(Nombre))), Postres).

obtener_postres_sin_lacteo(TiempoComida,Postres) :-
    %write('�Deseas el postre con frutas (si/no)? '),
    read(EleccionFrutas),

    % Construir la consulta SQL basada en los parametros
    atomic_list_concat(['SELECT nombre FROM postre WHERE', TiempoComida, '= ''Si'' AND lacteo = ''No'''], ' ', Query),
    write(EleccionFrutas),
    % Agregar la condici�n de EleccionFrutas si es "Si" o "No"
    (EleccionFrutas = 'si' ->
        atomic_list_concat([' AND frutas = ''Si'''], '', FrutasCondition)
    ;
        FrutasCondition = ''
    ),

    % Completar la consulta SQL
    atomic_concat(Query, FrutasCondition, FullQuery),

    % Ejecutar la consulta SQL y obtener los resultados
    findall(Nombre, (odbc_query(restaurante_db, FullQuery, row(Nombre))), Postres).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Definici�n del formulario hacer_menu
obtener_menu :-
    write('Por favor, seleccione el tiempo de comida (desayuno, almuerzo o cena): '),
    read(TiempoComida),
    nl,
    obtener_bebidas(TiempoComida, Bebidas),
    obtener_proteina(TiempoComida, Proteinas),
    obtener_acompannamientos(TiempoComida, Acompannamientos),
    obtener_postres(TiempoComida, Postres),
    % Mostrar resultados
    write('*** Men� para '), write(TiempoComida), write(' ***'), nl,
    write('Bebidas: '), write(Bebidas), nl,
    write('Proteinas: '), write(Proteinas), nl,
    write('Acompa�amientos: '), write(Acompannamientos), nl,
    write('Postres: '), write(Postres), nl.

% Predicado para preguntar al usuario si desea un postre
elegir_postre(PostreElegido) :-
    %write('�Deseas un postre (si/no)? '),
    read(PostreElegido).


% Predicado para obtener combinaciones sin duplicados
obtener_combinaciones(TiempoComida, Combinaciones) :-
    elegir_postre(PostreElegido), % Preguntar si se desea postre
    obtener_bebidas(TiempoComida, Bebidas),
    obtener_proteina(TiempoComida, Proteinas),
    obtener_acompannamientos(TiempoComida, Acompannamientos),
    (PostreElegido == 'si' ->
        obtener_postres(TiempoComida, Postres),
        % Combinar los acompa�amientos en una sola lista
        flatten(Acompannamientos, AcompannamientosFlatten),
        % Usar un conjunto para evitar duplicados
        setof([Bebida, Proteina, AcompannamientosFlatten, Postre], (
            member(Bebida, Bebidas),
            member(Proteina, Proteinas),
            member(Acompannamiento, Acompannamientos),
            member(Postre, Postres)
        ), Combinaciones)
    ;
        % Combinar los acompa�amientos en una sola lista
        flatten(Acompannamientos, AcompannamientosFlatten),
        % Usar un conjunto para evitar duplicados
        setof([Bebida, Proteina, AcompannamientosFlatten], (
            member(Bebida, Bebidas),
            member(Proteina, Proteinas),
            member(Acompannamiento, Acompannamientos)
        ), Combinaciones)
    ).


% Ejemplo de uso
% obtener_combinaciones('almuerzo', Combinaciones).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% AVANCE IAN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Predicado para obtener las calorias de un alimento en la tabla de bebida
obtener_calorias_bebida(Alimento, Calorias) :-
    atomic_list_concat(['SELECT calorias FROM bebida WHERE nombre = ''', Alimento, ''''], '', Query),
    odbc_query(restaurante_db, Query, row(Calorias)).

% Predicado para obtener las calorias de un alimento en la tabla de proteina
obtener_calorias_proteina(Alimento, Calorias) :-
    atomic_list_concat(['SELECT calorias FROM proteina WHERE nombre = ''', Alimento, ''''], '', Query),
    odbc_query(restaurante_db, Query, row(Calorias)).

% Predicado para obtener las calorias de un alimento en la tabla de acompannamiento
obtener_calorias_acompannamiento(Alimento, Calorias) :-
    atomic_list_concat(['SELECT calorias FROM acompannamiento WHERE nombre = ''', Alimento, ''''], '', Query),
    odbc_query(restaurante_db, Query, row(Calorias)).

% Predicado para obtener las calorias de un alimento en la tabla de postre
obtener_calorias_postre(Alimento, Calorias) :-
    atomic_list_concat(['SELECT calorias FROM postre WHERE nombre = ''', Alimento, ''''], '', Query),
    odbc_query(restaurante_db, Query, row(Calorias)).

% Predicado final para obtener las calorias de un alimento
obtener_calorias(Alimento, Calorias) :-
    (
        obtener_calorias_bebida(Alimento, Calorias), !
        ;
        obtener_calorias_proteina(Alimento, Calorias), !
        ;
        obtener_calorias_acompannamiento(Alimento, Calorias), !
        ;
        obtener_calorias_postre(Alimento, Calorias), !
    ).

% Predicado para calcular el total de calorias de un menú
calcular_total_calorias([], 0). % Caso base: la lista esta vacia, el total es 0
calcular_total_calorias([Alimento|RestoMenu], TotalCalorias) :-
    obtener_calorias(Alimento, CaloriasAlimento),
    calcular_total_calorias(RestoMenu, TotalCaloriasResto),
    TotalCalorias is CaloriasAlimento + TotalCaloriasResto.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Flujo de programa para generar menús
generar_menus(TiempoComida) :-
    obtener_combinaciones(TiempoComida, Combinaciones),
    calcular_y_mostrar_calorias_de_menus(Combinaciones).

% Predicado para calcular y mostrar las calorias de los menús
calcular_y_mostrar_calorias_de_menus([]). % Caso base: no hay mas menús
calcular_y_mostrar_calorias_de_menus([Menu|RestoMenus]) :-
    calcular_total_menu(Menu, TotalCalorias), % Calcula las calorias del menú actual
    writeln('Menu: '), writeln(Menu),
    writeln('Total de calorias: '), writeln(TotalCalorias),
    calcular_y_mostrar_calorias_de_menus(RestoMenus).

% Predicado para calcular el total de calorias de un menú
calcular_total_menu(Menu, TotalCalorias) :-
    flatten(Menu, Alimentos), % Aplanar la lista anidada
    calcular_total_calorias(Alimentos, TotalCalorias).

%generar_menus('cena')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicado para seleccionar N menús al azar de una lista
% Flujo de programa para generar menús con un límite de calorías
generar_menus_con_limite(TiempoComida) :-
    % Preguntar por el límite de calorías
    %write('¿Cuál es el límite de calorías deseado? '),
    read(LimiteCalorias),
    obtener_combinaciones(TiempoComida, Combinaciones),
    % Preguntar por el número de menús a seleccionar
    %write('¿Cuántos menús deseas seleccionar? '),
    read(N),

    seleccionar_menus_al_azar(Combinaciones, N, MenusSeleccionados),

    mostrar_menus_con_limite(MenusSeleccionados, LimiteCalorias).


% Predicado para mostrar los menús con un limite de calorias
mostrar_menus_con_limite([], _). % Caso base: no hay mas menús
mostrar_menus_con_limite([Menu|RestoMenus], LimiteCalorias) :-
    calcular_total_menu(Menu, TotalCalorias), % Calcula las calorias del menú actual
    (TotalCalorias =< LimiteCalorias -> % Comprobar si el menú esta dentro del limite
        writeln('Menu: '), writeln(Menu),
        writeln('Total de calorias: '), writeln(TotalCalorias)
    ; true
    ),
    mostrar_menus_con_limite(RestoMenus, LimiteCalorias).

%generar_menus_con_limite('cena')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicado para mostrar una lista de menús
mostrar_menus([]). % Caso base: no hay más menús
mostrar_menus([Menu|RestoMenus]) :-
    writeln('Menu: '), writeln(Menu),
    mostrar_menus(RestoMenus).


% Predicado para seleccionar N menús al azar de una lista
seleccionar_menus_al_azar(Combinaciones, N, MenusSeleccionados) :-
    length(Combinaciones, L),
    L >= N, % Asegurarse de que hay suficientes menús
    random_permutation(Combinaciones, CombinacionesAleatorias),
    length(MenusSeleccionados, N),
    append(MenusSeleccionados, _, CombinacionesAleatorias).

%%%%%%%%%%%%%%%menus predefinidos%%%%%%%%%
obtener_menu_por_id(IDBebida, IDProteina, IDAcompannamiento, IDPostre, Menu) :-
    % Consulta para la bebida
    atomic_list_concat(['SELECT nombre FROM bebida WHERE id = ', IDBebida], ' ', QueryBebida),
    % Ejecutar la consulta SQL y obtener el resultado
    odbc_query(restaurante_db, QueryBebida, row(Bebida)),

    % Consulta para la proteina
    atomic_list_concat(['SELECT nombre FROM proteina WHERE id = ', IDProteina], ' ', QueryProteina),
    % Ejecutar la consulta SQL y obtener el resultado
    odbc_query(restaurante_db, QueryProteina, row(Proteina)),

    % Consulta para el acompa�amiento
    atomic_list_concat(['SELECT nombre FROM acompannamiento WHERE id = ', IDAcompannamiento], ' ', QueryAcompannamiento),
    % Ejecutar la consulta SQL y obtener el resultado
    odbc_query(restaurante_db, QueryAcompannamiento, row(Acompannamiento)),

    % Consulta para el postre
    atomic_list_concat(['SELECT nombre FROM postre WHERE id = ', IDPostre], ' ', QueryPostre),
    % Ejecutar la consulta SQL y obtener el resultado
    odbc_query(restaurante_db, QueryPostre, row(Postre)),

    % Devolver el men� completo
    Menu = [Bebida, Proteina, Acompannamiento, Postre].
%obtener_menu_por_id(1,2,9,4,Menu).

% Predicado para obtener un n�mero aleatorio entre 1 y 3
obtener_numero_aleatorio_Opcion1(Numero) :-
    random(1, 4, Numero).

% Predicado para obtener un men� aleatorio
obtener_menu_aleatorio_Opcion1(Menu) :-
    obtener_numero_aleatorio_Opcion1(IDBebida),
    obtener_numero_aleatorio_Opcion1(IDProteina),
    obtener_numero_aleatorio_Opcion1(IDAcompannamiento),
    obtener_numero_aleatorio_Opcion1(IDPostre),
    obtener_menu_por_id(IDBebida, IDProteina, IDAcompannamiento, IDPostre, Menu).

obtener_numero_aleatorio_Opcion2(Numero) :-
    random(4, 7, Numero).

% Predicado para obtener un men� aleatorio
obtener_menu_aleatorio_Opcion2(Menu) :-
    obtener_numero_aleatorio_Opcion2(IDBebida),
    obtener_numero_aleatorio_Opcion2(IDProteina),
    obtener_numero_aleatorio_Opcion2(IDAcompannamiento),
    obtener_numero_aleatorio_Opcion2(IDPostre),
    obtener_menu_por_id(IDBebida, IDProteina, IDAcompannamiento, IDPostre, Menu).

obtener_numero_aleatorio_Opcion3(Numero) :-
    random(7, 9, Numero).

% Predicado para obtener un men� aleatorio
obtener_menu_aleatorio_Opcion3(Menu) :-
    obtener_numero_aleatorio_Opcion3(IDBebida),
    obtener_numero_aleatorio_Opcion3(IDProteina),
    obtener_numero_aleatorio_Opcion3(IDAcompannamiento),
    obtener_numero_aleatorio_Opcion3(IDPostre),
    obtener_menu_por_id(IDBebida, IDProteina, IDAcompannamiento, IDPostre, Menu).
