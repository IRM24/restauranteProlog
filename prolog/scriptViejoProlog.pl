% Predicado para obtener bebidas segun el tiempo de comida y temperatura
% obtener_bebidas(TiempoComida, Bebidas) :-
%     % Comprobar si la temperatura es "fria" o "caliente"
%     %write('�Que temperatura prefieres para las bebidas, fria o caliente (fria/caliente)? '),
%     read(Temperatura),

%     (Temperatura == 'fria' ->
%         % Si es fria, preguntar por el tipo (carbonatadas o naturales)
%         elegir_tipo_bebida_fria(TiempoComida, Tipo),
%         Bebidas = Tipo
%     ;
%         % Si es caliente, preguntar si se desea carbonatadas, naturales o todas
%         elegir_tipo_bebida_caliente(TiempoComida, Tipo),
%         Bebidas = Tipo
%     ).

% % Predicado para elegir entre bebidas frías carbonatadas o naturales
% elegir_tipo_bebida_fria(TiempoComida, Tipo) :-
%     %write('�Deseas bebidas frias carbonatadas o naturales (carbonatadas/naturales)? '),
%     read(TipoEleccion),
%     (TipoEleccion == 'carbonatadas' ->
%         obtener_bebidas_frias(TiempoComida, 'carbonatadas', Tipo)
%     ;
%         obtener_bebidas_frias(TiempoComida, 'naturales', Tipo)
%     ).

% % Predicado para obtener bebidas frias carbonatadas o naturales
% obtener_bebidas_frias(TiempoComida, Tipo, Bebidas) :-
%     % Construir la consulta SQL basada en los para�metros
%     atomic_list_concat(['SELECT nombre FROM bebida WHERE', TiempoComida, '= ''Si'' AND temperatura = ''Fria'' AND', Tipo, '= ''Si'''], ' ', Query),
%     % Ejecutar la consulta SQL y obtener los resultados
%     findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Bebidas).

% elegir_tipo_bebida_caliente(TiempoComida, Tipo) :-
%     %write('�Deseas bebidas calientes carbonatadas o naturales (carbonatadas/naturales)? '),
%     read(TipoEleccion),
%     (TipoEleccion == 'carbonatadas' ->
%         obtener_bebidas_calientes(TiempoComida, 'carbonatadas', Tipo)
%     ;
%         obtener_bebidas_calientes(TiempoComida, 'naturales', Tipo)
%     ).

% % Predicado para obtener bebidas calientes carbonatadas o naturales
% obtener_bebidas_calientes(TiempoComida, Tipo, Bebidas) :-
%     % Construir la consulta SQL basada en los parametros
%     atomic_list_concat(['SELECT nombre FROM bebida WHERE', TiempoComida, '= ''Si'' AND temperatura = ''Caliente'' AND', Tipo, '= ''Si'''], ' ', Query),
%     % Ejecutar la consulta SQL y obtener los resultados
%     write(Query),
%     findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Bebidas).
% Predicado para obtener bebidas según el tiempo de comida y temperatura



% % Predicado para obtener proteinas seg�n el tipo ingresado por el usuario
% obtener_proteina(TiempoComida, Registros) :-
%     % Preguntar al usuario por el tipo de proteina
%     %write('�Que tipo de proteina deseas (pollo, mariscos, carnes_rojas)? '),
%     read(TipoProteina),

%     % Verificar el tipo de proteina y llamar al predicado correspondiente
%     (TipoProteina == 'pollo' ->
%         obtener_proteina_pollo(TiempoComida, Registros)
%     ; TipoProteina == 'mariscos' ->
%         obtener_proteina_mariscos(TiempoComida, Registros)
%     ; TipoProteina == 'carnes_rojas' ->
%         obtener_proteina_carnesRojas(TiempoComida, Registros)
%     ; % Manejo de otro caso (por ejemplo, tipo desconocido)
%         write('Tipo de proteina desconocido'),
%         Registros = [] % Otra acci�n en caso de tipo desconocido
%     ).


% % Predicado para las proteinas de pollo
% obtener_proteina_pollo(TiempoComida, Registros) :-
%         % Construir la consulta SQL basada en los parametros
%     atomic_list_concat(['SELECT (nombre) FROM proteina WHERE', TiempoComida, '= ''Si'' AND tipo = ''Pollo'''], ' ', Query),

%     % Ejecutar la consulta y obtener la lista de nombres
%     findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Registros).

% % Predicado para las proteinas de mariscos
% obtener_proteina_mariscos(TiempoComida, Registros) :-
%         % Construir la consulta SQL basada en los parametros
%     atomic_list_concat(['SELECT (nombre) FROM proteina WHERE', TiempoComida, '= ''Si'' AND tipo = ''Mariscos'''], ' ', Query),

%     % Ejecutar la consulta y obtener la lista de nombres
%     findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Registros).

% obtener_proteina_carnesRojas(TiempoComida, Registros) :-
%         % Construir la consulta SQL basada en los parametros
%     atomic_list_concat(['SELECT (nombre) FROM proteina WHERE', TiempoComida, '= ''Si'' AND tipo = ''Carnes Rojas'''], ' ', Query),

%     % Ejecutar la consulta y obtener la lista de nombres
%     findall(Nombre, (odbc_query(restaurante_db, Query, row(Nombre))), Registros).




% Predicado para obtener la cantidad de acompa�amientos
% obtener_cantidad_acompannamientos(Cantidad) :-
%     %write('�Cuantos acompa�amientos deseas (1-3)? '),
%     read(Cantidad),
%     % Verificar que la cantidad este en el rango permitido
%     (Cantidad >= 1, Cantidad =< 3 ->
%         true
%     ;
%         write('Por favor, ingresa una cantidad valida entre 1 y 3.\n'),
%         obtener_cantidad_acompannamientos(Cantidad)
%     ).

% obtener_acompannamientos(TiempoComida, Acompannamientos) :-

%     obtener_cantidad_acompannamientos(CantidadAcompannamientos),

%     % Comprobar si la temperatura es "fria" o "caliente"
%     %write('�Que temperatura prefieres para los acompannamientos, fria o caliente (fria/caliente)? '),
%     read(Temperatura),

%     (Temperatura == 'fria' ->
%         % Si es fria, preguntar por el tipo (carbonatadas o naturales)
%         obtener_acompannamientos_frios(TiempoComida, CantidadAcompannamientos,Tipo),
%         Acompannamientos = Tipo
%     ;
%         % Si es caliente, preguntar si se desea carbonatadas, naturales o todas
%         obtener_acompannamientos_calientes(TiempoComida, CantidadAcompannamientos, Tipo),
%         Acompannamientos = Tipo
%     ).

% % Predicado para obtener acompa�amientos calientes
% obtener_acompannamientos_calientes(TiempoComida, CantidadAcompannamientos, Acompannamientos) :-
%     %write('�Deseas acompa�amientos con vegetales (si/no)? '),
%     read(EleccionVegetales),

%     %write('�Deseas acompa�amientos con carbohidratos (si/no)? '),
%     read(EleccionCarbohidratos),

%     % Construir la consulta SQL basada en los parametros
%     atomic_list_concat(['SELECT nombre FROM acompannamiento WHERE', TiempoComida, '= ''Si'' AND temperatura = ''Caliente'''], ' ', Query),

%     % Agregar las condiciones de EleccionVegetales y EleccionCarbohidratos si son "Si"
%     (EleccionVegetales = 'si' ->
%         atomic_list_concat([' AND vegetales = ''Si'''], '', VegetalesCondition)
%     ;
%     EleccionVegetales = 'no' ->
%         atomic_list_concat([' AND vegetales = ''No'''], '', VegetalesCondition)
%     ;
%         VegetalesCondition = ''
%     ),

%     (EleccionCarbohidratos = 'si' ->
%         atomic_list_concat([' AND carbohidratos = ''Si'''], '', CarbohidratosCondition)
%     ;
%     EleccionVegetales = 'no' ->
%        atomic_list_concat([' AND carbohidratos = ''No'''], '', CarbohidratosCondition)
%     ;
%         CarbohidratosCondition = ''
%     ),

%     % Incluir la restricci�n de cantidad de acompa�amientos
%     atomic_list_concat([Query, VegetalesCondition, CarbohidratosCondition], ' ', BaseQuery),
%     format(atom(FinalQuery), 'LIMIT ~d', [CantidadAcompannamientos]),
%     atomic_list_concat([BaseQuery, FinalQuery], ' ', FullQuery),

%     % Ejecutar la consulta SQL y obtener los resultados
%     findall(Nombre, (odbc_query(restaurante_db, FullQuery, row(Nombre))), Acompannamientos).

% % Predicado para obtener acompa�amientos frios
% obtener_acompannamientos_frios(TiempoComida, CantidadAcompannamientos, Acompannamientos) :-
%     %write('�Deseas acompa�amientos con vegetales (si/no)? '),
%     read(EleccionVegetales),

%     %write('�Deseas acompa�amientos con carbohidratos (si/no)? '),
%     read(EleccionCarbohidratos),

%     % Construir la consulta SQL basada en los parametros
%     atomic_list_concat(['SELECT nombre FROM acompannamiento WHERE', TiempoComida, '= ''Si'' AND temperatura = ''Frio'''], ' ', Query),

%     % Agregar las condiciones de EleccionVegetales y EleccionCarbohidratos si son "Si"
%     (EleccionVegetales = 'si' ->
%         atomic_list_concat([' AND vegetales = ''Si'''], '', VegetalesCondition)
%     ;
%     EleccionVegetales = 'no' ->
%         atomic_list_concat([' AND vegetales = ''No'''], '', VegetalesCondition)
%     ;
%         VegetalesCondition = ''
%     ),

%     (EleccionCarbohidratos = 'si' ->
%         atomic_list_concat([' AND carbohidratos = ''Si'''], '', CarbohidratosCondition)
%     ;
%     EleccionVegetales = 'no' ->
%        atomic_list_concat([' AND carbohidratos = ''No'''], '', CarbohidratosCondition)
%     ;
%         CarbohidratosCondition = ''
%     ),

%     % Incluir la restricci�n de cantidad de acompa�amientos
%     atomic_list_concat([Query, VegetalesCondition, CarbohidratosCondition], ' ', BaseQuery),
%     format(atom(FinalQuery), 'LIMIT ~d', [CantidadAcompannamientos]),
%     atomic_list_concat([BaseQuery, FinalQuery], ' ', FullQuery),

%     % Ejecutar la consulta SQL y obtener los resultados
%     findall(Nombre, (odbc_query(restaurante_db, FullQuery, row(Nombre))), Acompannamientos).


%obtener_postres(TiempoComida, Postres) :-
%     % Preguntar si se desea un postre con lacteos (si/no)
%     %write('�Deseas un postre con lacteos (si/no)? '),
%     read(EleccionLacteos),

%     % Llamar a la funci�n correspondiente seg�n la elecci�n
%     (EleccionLacteos == 'si' ->
%         obtener_postres_con_lacteo(TiempoComida, Postres)
%     ;
%         obtener_postres_sin_lacteo(TiempoComida, Postres)
%     ).


% obtener_postres_con_lacteo(TiempoComida,Postres) :-
%     %write('�Deseas el postre con frutas (si/no)? '),
%     read(EleccionFrutas),

%     % Construir la consulta SQL basada en los parametros
%     atomic_list_concat(['SELECT nombre FROM postre WHERE', TiempoComida, '= ''Si'' AND lacteo = ''Si'''], ' ', Query),
%     write(EleccionFrutas),
%     % Agregar la condici�n de EleccionFrutas si es "Si" o "No"
%     (EleccionFrutas = 'si' ->
%         atomic_list_concat([' AND frutas = ''Si'''], '', FrutasCondition)
%     ;
%         FrutasCondition = ''
%     ),

%     % Completar la consulta SQL
%     atomic_concat(Query, FrutasCondition, FullQuery),

%     % Ejecutar la consulta SQL y obtener los resultados
%     findall(Nombre, (odbc_query(restaurante_db, FullQuery, row(Nombre))), Postres).

% obtener_postres_sin_lacteo(TiempoComida,Postres) :-
%     %write('�Deseas el postre con frutas (si/no)? '),
%     read(EleccionFrutas),

%     % Construir la consulta SQL basada en los parametros
%     atomic_list_concat(['SELECT nombre FROM postre WHERE', TiempoComida, '= ''Si'' AND lacteo = ''No'''], ' ', Query),
%     write(EleccionFrutas),
%     % Agregar la condici�n de EleccionFrutas si es "Si" o "No"
%     (EleccionFrutas = 'si' ->
%         atomic_list_concat([' AND frutas = ''Si'''], '', FrutasCondition)
%     ;
%         FrutasCondition = ''
%     ),

%     % Completar la consulta SQL
%     atomic_concat(Query, FrutasCondition, FullQuery),

%     % Ejecutar la consulta SQL y obtener los resultados
%     findall(Nombre, (odbc_query(restaurante_db, FullQuery, row(Nombre))), Postres).