%:- use_module(library(odbc)).

% Predicado para establecer una conexi�n a la base de datos
%:- dynamic restaurante_db/1.
conectar_base_de_datos :-
    odbc_connect('restaurante', Connection,
        [ user('root'),
          password('My.SQL.24041507'),
          alias(restaurante_db),
          open(once)
        ]).

desconectar_base_de_datos :- odbc_disconnect(restaurante_db).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Bebidas%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicado para obtener bebidas según el tiempo de comida y temperatura
obtener_bebidas(TiempoComida, Temperatura, Bebidas) :-
    % Comprobar si la temperatura es "fría" o "caliente"
    (Temperatura == 'Fria' ->
        % Si es fría, preguntar por el tipo (carbonatadas o naturales)
        elegir_tipo_bebida_fria(TiempoComida, Tipo),
        Bebidas = Tipo
    ;
        % Si es caliente, preguntar si se desea carbonatadas, naturales o todas
        elegir_tipo_bebida_caliente(TiempoComida, Tipo),
        Bebidas = Tipo
    ).

% Predicado para elegir entre bebidas frías carbonatadas o naturales
elegir_tipo_bebida_fria(TiempoComida, Tipo) :-
    write('¿Deseas bebidas frías carbonatadas o naturales (carbonatadas/naturales)? '),
    read(TipoEleccion),
    (TipoEleccion == 'carbonatadas' ->
        obtener_bebidas_frias(TiempoComida, 'carbonatadas', Tipo)
    ;
        obtener_bebidas_frias(TiempoComida, 'naturales', Tipo)
    ).

% Predicado para obtener bebidas frías carbonatadas o naturales
obtener_bebidas_frias(TiempoComida, Tipo, Bebidas) :-
    % Construir la consulta SQL basada en los parámetros
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
    % Construir la consulta SQL basada en los parámetros
    atomic_list_concat(['SELECT nombre FROM bebida WHERE', TiempoComida, '= ''Si'' AND temperatura = ''Caliente'' AND', Tipo, '= ''Si'''], ' ', Query),
    % Ejecutar la consulta SQL y obtener los resultados
    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Bebidas).

%ejemplo de uso: ?- obtener_bebidas('almuerzo', 'Caliente', Bebidas).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Proteinas%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicado para las proteinas
obtener_proteina(TiempoComida, Registros) :-
    % Construir la consulta SQL basada en los parámetros
    atomic_list_concat(['SELECT (nombre) FROM proteina WHERE', TiempoComida, '= ''Si'''], ' ', Query),
    
    % Ejecutar la consulta y obtener la lista de nombres
    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Registros).

%ejemplo de uso: obtener_proteina('cena', Registros)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Acompannamientos%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicado para obtener acompañamientos según el tiempo de comida y un número aleatorio entre 1 y 3
obtener_acompannamientos(TiempoComida, NumAcompannamientos, Acompannamientos) :-
    % Obtiene la lista de acompañamientos para el tiempo de comida dado
    atomic_list_concat(['SELECT nombre FROM acompannamiento WHERE', TiempoComida, '= ''Si'''], ' ', Query),
    % Ejecuta la consulta SQL y obtiene los nombres de los acompañamientos
    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), TodosAcompannamientos),
    % Obtiene una selección aleatoria de acompañamientos según NumAcompannamientos
    length(TodosAcompannamientos, TotalAcompannamientos),
    random_permutation(TodosAcompannamientos, AcompannamientosAleatorios),
    take(NumAcompannamientos, AcompannamientosAleatorios, Acompannamientos).

% Predicado para tomar los primeros N elementos de una lista
take(0, _, []).
take(N, [X | Xs], [X | Ys]) :-
    N > 0,
    N1 is N - 1,
    take(N1, Xs, Ys).
take(_, _, []).

%ejemplo de uso: obtener_acompannamientos('desayuno', 2, Acompannamientos).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Postres%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicado para obtener postres según el tiempo de comida
obtener_postres(TiempoComida, 'si', Postres) :-
    % Construye la consulta SQL basada en el tiempo de comida
    atomic_list_concat(['SELECT nombre FROM postre WHERE', TiempoComida, '= ''Si'''], ' ', Query),
    % Ejecuta la consulta SQL y obtiene los nombres de los postres
    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Postres).

% Predicado para obtener postres según el tiempo de comida sin retornar la lista de postres
obtener_postres(_, 'no', []).

% Predicado para obtener postres según el tiempo de comida sin especificar si se desea o no
obtener_postres(TiempoComida, Postres) :-
    obtener_postres(TiempoComida, 'si', Postres).

%ejemplo de uso: obtener_postres('almuerzo', 'si', Postres).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
