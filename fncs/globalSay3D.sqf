/*

Ejecuta el say3D para todos los jugadores y da la posiblidad de poner subtitulos

input:
			[Emisor ,sonido , distancia] call clv_fnc_globalSay3d;

			Emisor 			= 	objeto al cual queremos que se ejecute el sonido
			Sonido 			=	 	(string) nombre del sonido definido en el destription.ext
			Distancia 	= 	(Numero)
*/

params["_obj", "_sonido", "_dist", ["_name", ""], "_text", ["_distSub",5]];

if!(isServer) exitWith {"globalSay3D SE INTENTO EJECUTAR EN UN AMBIENTE QUE NO ES EL SERVIDOR" remoteExec ["systemchat", -2]; };

[_obj, [_sonido, _dist]] remoteExec ["say3D", [0,-2] select isDedicated];

//Muestro subtitulos para el audio

/* lo desactivo porque menem no lo documento

if!(_name isEqualTo "") then {
	//Filtro jugadores cerca
	private _units = playableUnits select {alive _x && _x distance2d _obj < _distSub};
	[_name, _text] remoteExec ["BIS_fnc_showSubtitle", _units];
};
