:- use_module(library(strings)).
:- use_module(library(odbc)).

% Predicado para establecer una conexion a la base de datos
%:- dynamic restaurante_db/1.
conectar_base_de_datos :-
    odbc_connect('restaurante', Connection,
        [ user('root'),
          password('My.SQL.24041507'),
          alias(restaurante_db),
          open(once)
        ]).

desconectar_base_de_datos :- odbc_disconnect(restaurante_db).


%%%%%%%%%%%%%%%%%%%%%Bebidas%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Predicado para obtener bebidas segun el tiempo de comida y temperatura
obtener_bebidas(TiempoComida, Bebidas) :-
    % Comprobar si la temperatura es "fria" o "caliente"
    write('¿Que temperatura prefieres para las bebidas, fria o caliente (fria/caliente)? '),
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

% Predicado para elegir entre bebidas frÃ­as carbonatadas o naturales
elegir_tipo_bebida_fria(TiempoComida, Tipo) :-
    write('¿Deseas bebidas frias carbonatadas o naturales (carbonatadas/naturales)? '),
    read(TipoEleccion),
    (TipoEleccion == 'carbonatadas' ->
        obtener_bebidas_frias(TiempoComida, 'carbonatadas', Tipo)
    ;
        obtener_bebidas_frias(TiempoComida, 'naturales', Tipo)
    ).

% Predicado para obtener bebidas frias carbonatadas o naturales
obtener_bebidas_frias(TiempoComida, Tipo, Bebidas) :-
    % Construir la consulta SQL basada en los para¡metros
    atomic_list_concat(['SELECT nombre FROM bebida WHERE', TiempoComida, '= ''Si'' AND temperatura = ''Fria'' AND', Tipo, '= ''Si'''], ' ', Query),
    % Ejecutar la consulta SQL y obtener los resultados
    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Bebidas).

elegir_tipo_bebida_caliente(TiempoComida, Tipo) :-
    write('¿Deseas bebidas calientes carbonatadas o naturales (carbonatadas/naturales)? '),
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
    

%ejemplo de uso: ?- obtener_bebidas('almuerzo', 'Caliente', Bebidas).


%%%%%%%%%%%%%%%%%%%%%%%%Proteinas%%%%%%%%%%%%%%%%%%%%%

% Predicado para las proteinas

%obtener_proteina(TiempoComida, Registros) :-
    % Construir la consulta SQL basada en los parametros
%    atomic_list_concat(['SELECT (nombre) FROM proteina WHERE',
%    TiempoComida, '= ''Si'''], ' ', Query),

    % Ejecutar la consulta y obtener la lista de nombres


% Predicado para obtener proteinas según el tipo ingresado por el usuario
obtener_proteina(TiempoComida, Registros) :-
    % Preguntar al usuario por el tipo de proteina
    write('¿Que tipo de proteina deseas (pollo, mariscos, carnes_rojas)? '),
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
        Registros = [] % Otra acción en caso de tipo desconocido
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

% Predicado para obtener acompannamientos segun el tiempo de comida y
% un numero aleatorio entre 1 y 3
% obtener_acompannamientos(TiempoComida, NumAcompannamientos, Acompannamientos) :-
    % Obtiene la lista de acompaÃ±amientos para el tiempo de comida dado
%    atomic_list_concat(['SELECT nombre FROM acompannamiento WHERE',
%    TiempoComida, '= ''Si'''], ' ', Query), Ejecuta la consulta SQL y
%    obtiene los nombres de los acompaÃ±amientos
    %findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), TodosAcompannamientos),
    % Obtiene una seleccion aleatoria de acompaÃ±amientos segÃºn NumAcompannamientos
    %length(TodosAcompannamientos, TotalAcompannamientos),
    %random_permutation(TodosAcompannamientos, AcompannamientosAleatorios),
    %take(NumAcompannamientos, AcompannamientosAleatorios, Acompannamientos).

% Predicado para tomar los primeros N elementos de una lista
%take(0, _, []).
%take(N, [X | Xs], [X | Ys]) :-
%    N > 0,
%    N1 is N - 1,
%    take(N1, Xs, Ys).
%take(_, _, []).

%ejemplo de uso: obtener_acompannamientos('desayuno', 2, Acompannamientos).

% Predicado para obtener acompannamientos segun el tiempo de comida y
% temperatura
%
% Predicado para obtener acompannamientos segun el tiempo de comida y
% temperatura
% Predicado para obtener la cantidad de acompañamientos
obtener_cantidad_acompannamientos(Cantidad) :-
    write('¿Cuantos acompañamientos deseas (1-3)? '),
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
    write('¿Que temperatura prefieres para los acompannamientos, fria o caliente (fria/caliente)? '),
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

% Predicado para obtener acompañamientos calientes
obtener_acompannamientos_calientes(TiempoComida, CantidadAcompannamientos, Acompannamientos) :-
    write('¿Deseas acompañamientos con vegetales (si/no)? '),
    read(EleccionVegetales),

    write('¿Deseas acompañamientos con carbohidratos (si/no)? '),
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

    % Incluir la restricción de cantidad de acompañamientos
    atomic_list_concat([Query, VegetalesCondition, CarbohidratosCondition], ' ', BaseQuery),
    format(atom(FinalQuery), 'LIMIT ~d', [CantidadAcompannamientos]),
    atomic_list_concat([BaseQuery, FinalQuery], ' ', FullQuery),

    % Ejecutar la consulta SQL y obtener los resultados
    findall(Nombre, (odbc_query(restaurante_db, FullQuery, row(Nombre))), Acompannamientos).

% Predicado para obtener acompañamientos frios
obtener_acompannamientos_frios(TiempoComida, CantidadAcompannamientos, Acompannamientos) :-
    write('¿Deseas acompañamientos con vegetales (si/no)? '),
    read(EleccionVegetales),

    write('¿Deseas acompañamientos con carbohidratos (si/no)? '),
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

    % Incluir la restricción de cantidad de acompañamientos
    atomic_list_concat([Query, VegetalesCondition, CarbohidratosCondition], ' ', BaseQuery),
    format(atom(FinalQuery), 'LIMIT ~d', [CantidadAcompannamientos]),
    atomic_list_concat([BaseQuery, FinalQuery], ' ', FullQuery),

    % Ejecutar la consulta SQL y obtener los resultados
    findall(Nombre, (odbc_query(restaurante_db, FullQuery, row(Nombre))), Acompannamientos).

%%%%%%%%%%%%%%%%%%%%%%%%Postres%%%%%%%%%%%%%%%%%%

% Predicado para obtener postres segun el tiempo de comida
%obtener_postres(TiempoComida, 'si', Postres) :-
    % Construye la consulta SQL basada en el tiempo de comida
%    atomic_list_concat(['SELECT nombre FROM postre WHERE',
%    TiempoComida, '= ''Si'''], ' ', Query),
    % Ejecuta la consulta SQL y obtiene los nombres de los postres
%    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))),
%    Postres).

% Predicado para obtener postres segun el tiempo de comida sin retornar
% la lista de postres
%obtener_postres(_, 'no', []).

% Predicado para obtener postres segun el tiempo de comida sin
% especificar si se desea o no
%obtener_postres(TiempoComida, Postres) :-
%    obtener_postres(TiempoComida, 'si', Postres).

obtener_postres(TiempoComida, Postres) :-
    % Preguntar si se desea un postre con lacteos (si/no)
    write('¿Deseas un postre con lacteos (si/no)? '),
    read(EleccionLacteos),

    % Llamar a la función correspondiente según la elección
    (EleccionLacteos == 'si' ->
        obtener_postres_con_lacteo(TiempoComida, Postres)
    ;
        obtener_postres_sin_lacteo(TiempoComida, Postres)
    ).


obtener_postres_con_lacteo(TiempoComida,Postres) :-
    write('¿Deseas el postre con frutas (si/no)? '),
    read(EleccionFrutas),

    % Construir la consulta SQL basada en los parametros
    atomic_list_concat(['SELECT nombre FROM postre WHERE', TiempoComida, '= ''Si'' AND lacteo = ''Si'''], ' ', Query),
    write(EleccionFrutas),
    % Agregar la condición de EleccionFrutas si es "Si" o "No"
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
    write('¿Deseas el postre con frutas (si/no)? '),
    read(EleccionFrutas),

    % Construir la consulta SQL basada en los parametros
    atomic_list_concat(['SELECT nombre FROM postre WHERE', TiempoComida, '= ''Si'' AND lacteo = ''No'''], ' ', Query),
    write(EleccionFrutas),
    % Agregar la condición de EleccionFrutas si es "Si" o "No"
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

% Definición del formulario hacer_menu
obtener_menu :-
    write('Por favor, seleccione el tiempo de comida (desayuno, almuerzo o cena): '),
    read(TiempoComida),
    nl,
    obtener_bebidas(TiempoComida, Bebidas),
    obtener_proteina(TiempoComida, Proteinas),
    obtener_acompannamientos(TiempoComida, Acompannamientos),
    obtener_postres(TiempoComida, Postres),
    % Mostrar resultados
    write('*** Menú para '), write(TiempoComida), write(' ***'), nl,
    write('Bebidas: '), write(Bebidas), nl,
    write('Proteinas: '), write(Proteinas), nl,
    write('Acompañamientos: '), write(Acompannamientos), nl,
    write('Postres: '), write(Postres), nl.

% Genera todas las combinaciones posibles de los resultados de las funciones
%obtener_combinaciones(TiempoComida, Combinaciones) :-
%    obtener_bebidas(TiempoComida, Bebidas),
%    obtener_proteina(TiempoComida, Proteinas),
%    obtener_acompannamientos(TiempoComida, Acompannamientos),
%    obtener_postres(TiempoComida, Postres),
    % Combinar los acompañamientos en una sola lista
%    flatten(Acompannamientos, AcompannamientosFlatten),

    % Crear el menú combinando elementos de cada categoria
%    findall([Bebida, Proteina, AcompannamientosFlatten, Postre], (
%        member(Bebida, Bebidas),
%        member(Proteina, Proteinas),
%        member(Acompannamiento, Acompannamientos),
%        member(Postre, Postres)
%    ), Combinaciones).


% Predicado para preguntar al usuario si desea un postre
elegir_postre(PostreElegido) :-
    write('¿Deseas un postre (si/no)? '),
    read(PostreElegido).


% Predicado para obtener combinaciones de menú con o sin postre
obtener_combinaciones(TiempoComida, Combinaciones) :-
    elegir_postre(PostreElegido), % Preguntar si se desea postre
    obtener_bebidas(TiempoComida, Bebidas),
    obtener_proteina(TiempoComida, Proteinas),
    obtener_acompannamientos(TiempoComida, Acompannamientos),
    (PostreElegido == 'si' ->
        obtener_postres(TiempoComida, Postres),
        % Combinar los acompañamientos en una sola lista
        flatten(Acompannamientos, AcompannamientosFlatten),
        % Crear el menú combinando elementos de cada categoria
        findall([Bebida, Proteina, AcompannamientosFlatten, Postre], (
            member(Bebida, Bebidas),
            member(Proteina, Proteinas),
            member(Acompannamiento, Acompannamientos),
            member(Postre, Postres)
        ), Combinaciones)
    ;
        % Combinar los acompañamientos en una sola lista
        flatten(Acompannamientos, AcompannamientosFlatten),
        % Crear el menú combinando elementos de cada categoria sin postre
        findall([Bebida, Proteina, AcompannamientosFlatten], (
            member(Bebida, Bebidas),
            member(Proteina, Proteinas),
            member(Acompannamiento, Acompannamientos)
        ), Combinaciones)
    ).


% Ejemplo de uso
% obtener_combinaciones('almuerzo', Combinaciones).


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

    % Consulta para el acompañamiento
    atomic_list_concat(['SELECT nombre FROM acompannamiento WHERE id = ', IDAcompannamiento], ' ', QueryAcompannamiento),
    % Ejecutar la consulta SQL y obtener el resultado
    odbc_query(restaurante_db, QueryAcompannamiento, row(Acompannamiento)),

    % Consulta para el postre
    atomic_list_concat(['SELECT nombre FROM postre WHERE id = ', IDPostre], ' ', QueryPostre),
    % Ejecutar la consulta SQL y obtener el resultado
    odbc_query(restaurante_db, QueryPostre, row(Postre)),

    % Devolver el menú completo
    Menu = [Bebida, Proteina, Acompannamiento, Postre].
%obtener_menu_por_id(1,2,9,4,Menu).

% Predicado para obtener un número aleatorio entre 1 y 3
obtener_numero_aleatorio_Opcion1(Numero) :-
    random(1, 4, Numero).

% Predicado para obtener un menú aleatorio
obtener_menu_aleatorio_Opcion1(Menu) :-
    obtener_numero_aleatorio_Opcion1(IDBebida),
    obtener_numero_aleatorio_Opcion1(IDProteina),
    obtener_numero_aleatorio_Opcion1(IDAcompannamiento),
    obtener_numero_aleatorio_Opcion1(IDPostre),
    obtener_menu_por_id(IDBebida, IDProteina, IDAcompannamiento, IDPostre, Menu).

obtener_numero_aleatorio_Opcion2(Numero) :-
    random(4, 7, Numero).

% Predicado para obtener un menú aleatorio
obtener_menu_aleatorio_Opcion2(Menu) :-
    obtener_numero_aleatorio_Opcion2(IDBebida),
    obtener_numero_aleatorio_Opcion2(IDProteina),
    obtener_numero_aleatorio_Opcion2(IDAcompannamiento),
    obtener_numero_aleatorio_Opcion2(IDPostre),
    obtener_menu_por_id(IDBebida, IDProteina, IDAcompannamiento, IDPostre, Menu).

obtener_numero_aleatorio_Opcion3(Numero) :-
    random(7, 9, Numero).

% Predicado para obtener un menú aleatorio
obtener_menu_aleatorio_Opcion3(Menu) :-
    obtener_numero_aleatorio_Opcion3(IDBebida),
    obtener_numero_aleatorio_Opcion3(IDProteina),
    obtener_numero_aleatorio_Opcion3(IDAcompannamiento),
    obtener_numero_aleatorio_Opcion3(IDPostre),
    obtener_menu_por_id(IDBebida, IDProteina, IDAcompannamiento, IDPostre, Menu).

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

menu(['Jugo de Naranja', 'Pechuga de pollo', ['Ensalada Verde', 'Ensalada Cesar'], 'Flan de caramelo']). %esto era una prueba

% Calcular el total de calorias del menú prueba
%calcular_total_menu(TotalCalorias) :-
    %menu(Menu),
    %flatten(Menu, Alimentos), % Aplanar la lista anidada
    %calcular_total_calorias(Alimentos, TotalCalorias).

% Ejemplo de uso para calcular el total de calorias del menú
%?- calcular_total_menu(Total).

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
    writeln('Menú: '), writeln(Menu),
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

% Flujo de programa para generar menús con un limite de calorias
generar_menus_con_limite(TiempoComida) :-
    % Preguntar por el limite de calorias
    write('¿Cual es el limite de calorias deseado? '), read(LimiteCalorias),
    obtener_combinaciones(TiempoComida, Combinaciones),
    mostrar_menus_con_limite(Combinaciones, LimiteCalorias).

% Predicado para mostrar los menús con un limite de calorias
mostrar_menus_con_limite([], _). % Caso base: no hay mas menús
mostrar_menus_con_limite([Menu|RestoMenus], LimiteCalorias) :-
    calcular_total_menu(Menu, TotalCalorias), % Calcula las calorias del menú actual
    (TotalCalorias =< LimiteCalorias -> % Comprobar si el menú esta dentro del limite
        writeln('Menú: '), writeln(Menu),
        writeln('Total de calorias: '), writeln(TotalCalorias)
    ; true
    ),
    mostrar_menus_con_limite(RestoMenus, LimiteCalorias).

%generar_menus_con_limite('cena')












