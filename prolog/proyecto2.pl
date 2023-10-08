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
%Funcion para obtener todas las bebidas
consultar_bebidas(Bebida) :- odbc_query(restaurante_db,
                                'select * from bebida',
                                 Bebida).

%Funcion para obtener todas las bebidad frias
consultar_bebidas_fria(Bebida) :-
    odbc_query(restaurante_db,
        'SELECT (nombre) FROM bebida WHERE temperatura = ''Fria''',
        Bebida).

%Funcion para obtener todas las bebidas caliente
consultar_bebidas_caliente(Bebida) :-
    odbc_query(restaurante_db,
        'SELECT (nombre) FROM bebida WHERE temperatura = ''Caliente''',
        Bebida).

%Funcion para obtener todas las bebidas carbonatadas
consultar_bebidas_carbonatadas(Bebida) :-
    odbc_query(restaurante_db,
        'SELECT (nombre) FROM bebida WHERE carbonatadas = ''Si''',
        Bebida).

%Funcion para obtener todas las bebidas naturales
consultar_bebidas_naturales(Bebida) :-
    odbc_query(restaurante_db,
        'SELECT (nombre) FROM bebida WHERE naturales = ''Si''',
        Bebida).

%Funcion para obtener todas las bebidas recomendadas para desayuno
consultar_bebidas_desayuno(Bebida) :-
    odbc_query(restaurante_db,
        'SELECT (nombre) FROM bebida WHERE desayuno = ''Si''',
        Bebida).

%Funcion para obtener todas las bebidas recomendadas para almuerzo
consultar_bebidas_almuerzo(Bebida) :-
    odbc_query(restaurante_db,
        'SELECT (nombre) FROM bebida WHERE almuerzo = ''Si''',
        Bebida).

%Funcion para obtener todas las bebidas recomendadas para la cena
consultar_bebidas_cena(Bebida) :-
    odbc_query(restaurante_db,
        'SELECT (nombre) FROM bebida WHERE cena = ''Si''',
        Bebida).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificar la función consultar_bebidas_calienteMOD para devolver una lista de nombres de bebidas calientes
consultar_bebidas_calienteMOD(BebidasCalientes) :-
    findall(Nombre, (odbc_query(restaurante_db, 'SELECT (nombre) FROM bebida WHERE temperatura = ''Caliente''', row(Nombre))), BebidasCalientes).

% Modificar la función consultar_bebidas_desayunoMOD para devolver una lista de nombres de bebidas recomendadas para el desayuno
consultar_bebidas_desayunoMOD(BebidasDesayuno) :-
    findall(Nombre, (odbc_query(restaurante_db, 'SELECT (nombre) FROM bebida WHERE desayuno = ''Si''', row(Nombre))), BebidasDesayuno).


% Funci�n para obtener todas las bebidas calientes y recomendadas para el desayuno
consultar_bebidas_calientes_desayuno(Bebidas) :-
    conectar_base_de_datos,
    consultar_bebidas_calienteMOD(BebidasCalientes),
    consultar_bebidas_desayunoMOD(BebidasDesayuno),
    intersection(BebidasCalientes, BebidasDesayuno, Bebidas).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Predicado para obtener registros de una tabla según el tiempo de comida
% y el nombre de la tabla (bebida, proteina, acompannamiento, postre)
consultar_registros_tiempo_comida(NombreTabla, TiempoComida, Registros) :-
    % Construir la consulta SQL basada en los parámetros
    atomic_list_concat(['SELECT (nombre) FROM', NombreTabla, 'WHERE', TiempoComida, '= ''Si'''], ' ', Query),
    
    % Ejecutar la consulta y obtener la lista de nombres
    findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Registros).

% Ejemplo de uso:
% Obtener bebidas recomendadas para el desayuno






