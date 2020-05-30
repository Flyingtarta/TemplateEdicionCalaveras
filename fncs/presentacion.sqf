//Script para mostrar un texto al inicio de la mision
//_info --> un texto solo o pueden ser multiples en forma de ARRAY, por ejemplo "Hola Mundo" o ["MISION A","POR TU VIEJA"];
//_fecha --> booleano (true o false) dice si se muestra la fecha usada en la mision
//_pos --> booleano (true o false) dice si quieren mostrar la coordenada del jugador al arranque de la mision
params["_info",["_fecha", false], ["_hora", false], ["_pos", false]];

if(typeName _info isEqualTo "ARRAY") exitWith{
	if(_fecha) then{
	_fecha = format ["%1-%2-%3", date select 2, date select 1, date select 0];
	_info append [_fecha];
	};

	if(_hora) then{
		//Trabajo para poner la hora en formato militar
		_horario = "";
		_hora = date select 3;
		_minuto = date select 4;
		if(_hora < 10) then {
			_horario = format ["0%1%2",_hora,_minuto];
		}else{
			_horario = format ["%1%2",_hora,_minuto];
		};
		_info append [_horario];
	};
	if(_pos) then {
		_info append [mapGridPosition player];
	};
	_info spawn BIS_fnc_infoText;
};

if(typeName _info isEqualTo "STRING") exitWith{
	_texto = [_info];
	if(_fecha) then{
		_fecha = format ["%1-%2-%3", date select 2, date select 1, date select 0];
		_texto append [_fecha];
	};

	if(_hora) then{
		//Trabajo para poner la hora en formato militar
		_horario = "";
		_hora = date select 3;
		_minuto = date select 4;
		if(_hora < 10) then {
			_horario = format ["0%1%2",_hora,_minuto];
		}else{
			_horario = format ["%1%2",_hora,_minuto];
		};
		_texto append [_horario];
	};
	if(_pos) then {
		_texto append [mapGridPosition player];
	};
	_texto spawn BIS_fnc_infoText;
};
