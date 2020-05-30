
/*
Funcion para cacheo de IA automatizada por script, al darle un valor, cachea toda ia que no tenga un jugador en el radio definido.

imput:
		_dist = (numero) distancia en la cual chequea si hay jugadores presentes (default 1500)
output:
		nada

*//////////////////////////////////////////////////////
private _dist = 1500;
params["_dist"];
//Comandos de DS
enableDynamicSimulationSystem true;
"Group" setDynamicSimulationDistance 1500;
"Vehicle" setDynamicSimulationDistance 4000;
"IsMoving" setDynamicSimulationDistanceCoef 3;


private ["_unit"];
while {True} do
{
	{
	//Todas las unidades MENOS LOS JUGADORES
	_unit = _x;
		//if (_unit getVariable ["Cacheable",true]) then {
			if ((_unit isKindOf "Man") || (_unit isKindOf "Man") || ( (vehicle _unit) isKindOf "Air") ) then
			{
			//MANEJO REGULAR DE IA
				if (({_x distance _unit < _dist &&  (getPosATL (objectParent _x)) select 2 < 60} count playableUnits) > 0 )
				then
				{
					_unit enableSimulationGlobal True;
					_unit enableAI "ALL";
					_unit hideObjectGlobal False;
				}
				else
				{
					_unit enableSimulationGlobal false;
					_unit disableAI "ALL";
					_unit hideObjectGlobal true;
				};
			};
		//};
	} forEach ((AllUnits + Vehicles) - AllPlayers);
sleep 5;
};
