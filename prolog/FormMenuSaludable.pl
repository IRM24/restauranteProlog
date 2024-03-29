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
    read(EleccionVegetales),
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


    atomic_list_concat([Query, VegetalesCondition, CarbohidratosCondition], ' ', BaseQuery),
    format(atom(FinalQuery), 'LIMIT ~d', [CantidadAcompannamientos]),
    atomic_list_concat([BaseQuery, FinalQuery], ' ', FullQuery),

    % Ejecutar la consulta SQL y obtener los resultados
    findall(Nombre, (odbc_query(restaurante_db, FullQuery, row(Nombre))), Acompannamientos).

% Predicado para obtener acompa�amientos frios
obtener_acompannamientos_frios(TiempoComida, CantidadAcompannamientos, Acompannamientos) :-

    read(EleccionVegetales),


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

    read(EleccionLacteos),

    % Llamar a la funci�n correspondiente seg�n la elecci�n
    (EleccionLacteos == 'si' ->
        obtener_postres_con_lacteo(TiempoComida, Postres)
    ;
        obtener_postres_sin_lacteo(TiempoComida, Postres)
    ).


obtener_postres_con_lacteo(TiempoComida,Postres) :-

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
% Predicado para preguntar al usuario si desea un postre
elegir_postre(PostreElegido) :-
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicado para obtener el precio de un alimento en la tabla de bebida
obtener_precio_bebida(Alimento, Precio) :-
    atomic_list_concat(['SELECT precio FROM bebida WHERE nombre = ''', Alimento, ''''], '', Query),
    odbc_query(restaurante_db, Query, row(Precio)).

% Predicado para obtener el precio de un alimento en la tabla de proteina
obtener_precio_proteina(Alimento, Precio) :-
    atomic_list_concat(['SELECT precio FROM proteina WHERE nombre = ''', Alimento, ''''], '', Query),
    odbc_query(restaurante_db, Query, row(Precio)).

% Predicado para obtener el precio de un alimento en la tabla de acompannamiento
obtener_precio_acompannamiento(Alimento, Precio) :-
    atomic_list_concat(['SELECT precio FROM acompannamiento WHERE nombre = ''', Alimento, ''''], '', Query),
    odbc_query(restaurante_db, Query, row(Precio)).

% Predicado para obtener el precio de un alimento en la tabla de postre
obtener_precio_postre(Alimento, Precio) :-
    atomic_list_concat(['SELECT precio FROM postre WHERE nombre = ''', Alimento, ''''], '', Query),
    odbc_query(restaurante_db, Query, row(Precio)).

% Predicado final para obtener el precio de un alimento
obtener_precio(Alimento, Precio) :-
    (
        obtener_precio_bebida(Alimento, Precio), !
        ;
        obtener_precio_proteina(Alimento, Precio), !
        ;
        obtener_precio_acompannamiento(Alimento, Precio), !
        ;
        obtener_precio_postre(Alimento, Precio), !
    ).

calcular_total_precio([], 0). % Caso base: la lista está vacía, el total es 0
calcular_total_precio([Alimento|RestoMenu], TotalPrecio) :-
    obtener_precio(Alimento, PrecioAlimento),
    calcular_total_precio(RestoMenu, TotalPrecioResto),
    TotalPrecio is PrecioAlimento + TotalPrecioResto.

calcular_total_menuPrecio(Menu, TotalPrecio) :-
    flatten(Menu, Alimentos), % Aplanar la lista anidada
    calcular_total_precio(Alimentos, TotalPrecio).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verificar_limite_calorias(Limite) :-
    repeat,
    read(LimiteCalorias),
    (LimiteCalorias > 600 ->
        Limite = LimiteCalorias;
        writeln('El límite de calorías debe ser mayor a 600, por favor ingrese un número válido.')
    ),
    LimiteCalorias > 600.

generar_menus_con_limite(TiempoComida, MenusConInfo) :-
    verificar_limite_calorias(LimiteCalorias),
    obtener_combinaciones(TiempoComida, Combinaciones),
    mostrar_menus_con_limiteMod(Combinaciones, LimiteCalorias, Menus),
    seleccionar_menus_al_azar(Menus, 3, MenusSeleccionados),

    % Calcular calorías y precio de cada menú y agregar la información
    calcular_y_agregar_info_menus(MenusSeleccionados, MenusConInfo, 1).

%Predicado que calcula precio y calorias de un menu y agrega la respectiva info
calcular_y_agregar_info_menus([], [], _).
calcular_y_agregar_info_menus([Menu|RestoMenus], [MenuConInfo|RestoConInfo], NumeroCombo) :-
    calcular_total_menu(Menu, TotalCalorias),
    calcular_total_menuPrecio(Menu, TotalPrecio),
    atom_concat('Menu ', NumeroCombo, ComboTexto),
    append([NumeroCombo, ComboTexto | Menu], [TotalCalorias, TotalPrecio], MenuConInfo),
    SiguienteNumeroCombo is NumeroCombo + 1,
    calcular_y_agregar_info_menus(RestoMenus, RestoConInfo, SiguienteNumeroCombo).

% Predicado para mostrar menús dentro del límite en una lista
mostrar_menus_con_limiteMod([], _, []). % Caso base: no hay más menús
mostrar_menus_con_limiteMod([Menu|RestoMenus], LimiteCalorias, MenusDentroDelLimite) :-
    calcular_total_menu(Menu, TotalCalorias), % Calcula las calorías del menú actual
    (TotalCalorias =< LimiteCalorias -> % Comprobar si el menú está dentro del límite
        % Agregar el menú a la lista de MenusDentroDelLimite
        MenusDentroDelLimite = [Menu | Resto],
        % Llamada recursiva con la nueva lista
        mostrar_menus_con_limiteMod(RestoMenus, LimiteCalorias, Resto)
    ;
        % Si no cumple con el límite, continuar sin agregar a la lista
        mostrar_menus_con_limiteMod(RestoMenus, LimiteCalorias, MenusDentroDelLimite)
    ).

%De toda la lista de combinaciones se toma 3 menus aletorios
seleccionar_menus_al_azar(Combinaciones, 3, MenusSeleccionados) :-
    random_permutation(Combinaciones, CombinacionesAleatorias),
    take(3, CombinacionesAleatorias, MenusSeleccionados).

take(0, _, []).
take(N, [X | Xs], [X | Ys]) :- N > 0, N1 is N - 1, take(N1, Xs, Ys).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





