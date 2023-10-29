
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
% Predicado para seleccionar N menús al azar de una lista
% Flujo de programa para generar menús con un límite de calorías
generar_menus_con_limite(TiempoComida, MenuSeleccionado) :-
    % Preguntar por el límite de calorías
    %write('¿Cuál es el límite de calorías deseado? '), 
    read(LimiteCalorias),
    obtener_combinaciones(TiempoComida, Combinaciones),
    
    % Llamar a mostrar_menus_con_limite para agregar menús dentro del límite a MenusLimitados
    mostrar_menus_con_limiteMod(Combinaciones, LimiteCalorias, Menus),
    %writeln('Menús dentro del límite: '), writeln(Menus),
    read(N),
    seleccionar_menus_al_azar(Menus, N, MenusSeleccionados),
    %writeln('Menús al azar dentro del límite: '), writeln(MenusSeleccionados).
    %writeln('Cual menu desea')
    imprimir_menus(MenusSeleccionados),
    read(Indice),

    length(MenusSeleccionados, Longitud),
    (Indice >= 1, Indice =< Longitud ->
        seleccionar_menu_por_indice(MenusSeleccionados, Indice, MenuSeleccionadoSinPrecioCalorias, LimiteCalorias),
        calcular_total_menuPrecio(MenuSeleccionadoSinPrecioCalorias, TotalPrecio), % Calcular el precio del menú seleccionado
        calcular_total_menu(MenuSeleccionadoSinPrecioCalorias, TotalCalorias), % Calcular las calorías del menú seleccionado
        append(MenuSeleccionadoSinPrecioCalorias, [TotalPrecio, TotalCalorias], MenuSeleccionado)
        %mostrar_menu(MenuSeleccionado)
    ).

% Predicado para imprimir una lista de menús
imprimir_menus([]). % Caso base: no hay más menús que imprimir
imprimir_menus([Menu|RestoMenus]) :-
    calcular_total_menu(Menu, TotalCalorias),
    calcular_total_menuPrecio(Menu, TotalPrecio),
    writeln('-----------------------------------'),
    writeln('Menú: '), writeln(Menu),
    writeln('Precio total: '), writeln(TotalPrecio),
    writeln('Calorias: '), writeln(TotalCalorias),
    writeln('-----------------------------------'),% Imprimir el menú actual
    imprimir_menus(RestoMenus). % Recursivamente imprimir el resto de los menús



% Predicado para seleccionar un menú dado un índice
seleccionar_menu_por_indice([Menu|_], 1, Menu, LimiteCalorias) :-
    calcular_total_menu(Menu, TotalCalorias),
    TotalCalorias =< LimiteCalorias.

seleccionar_menu_por_indice([_|RestoMenus], Indice, MenuSeleccionado, LimiteCalorias) :-
    Indice > 1,
    NuevaIndice is Indice - 1,
    seleccionar_menu_por_indice(RestoMenus, NuevaIndice, MenuSeleccionado, LimiteCalorias).

% Predicado para mostrar un menú
mostrar_menu(Menu) :-
    %writeln('Menu seleccionado'),
    calcular_total_menuPrecio(Menu, TotalPrecio),
    %writeln('Menú: '), 
    writeln(Menu).
    %writeln('Precio total: '), 
    %writeln(TotalPrecio).

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

% % Predicado para seleccionar N menús al azar de una lista
seleccionar_menus_al_azar(Combinaciones, N, MenusSeleccionados) :-
    length(Combinaciones, L),
    L >= N, % Asegurarse de que hay suficientes menús
    random_permutation(Combinaciones, CombinacionesAleatorias),
    length(MenusSeleccionados, N),
    append(MenusSeleccionados, _, CombinacionesAleatorias).

% Predicado para mostrar los menús con un limite de calorias
% mostrar_menus_con_limite([], _). % Caso base: no hay mas menús
% mostrar_menus_con_limite([Menu|RestoMenus], LimiteCalorias) :-
%     calcular_total_menu(Menu, TotalCalorias), % Calcula las calorias del menú actual
%     (TotalCalorias =< LimiteCalorias -> % Comprobar si el menú esta dentro del limite
%         writeln('Menu: '), writeln(Menu),
%         writeln('Total de calorias: '), writeln(TotalCalorias)
%     ; true
%     ),
%     mostrar_menus_con_limite(RestoMenus, LimiteCalorias).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%












