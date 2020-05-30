/*

Script para hacer global el addaction:
  [objeto, titulo , script , condicion ] call clv_fnc_mpAddaction

objeto = (obj) Objeto al cual pegarle el addaction
titulo = (str) Lo que los jugadores ven el el addaction
script = (str o code) ruta al script a usar o codigo a ejecutar al usar el addaction.
condition = {code} condicion para que se vea el addaction (Opcional: si no se usa, por default se usara distancia menor a 2 metros)

*/
params[["_obj", objNull], "_titulo", ["_script", {0=0}],["_condition", '_this distance _target < 2']];

if(_obj isEqualto objNull) exitWith {Hint "La accion no tiene un objeto al cual adherirse"};

[_obj,[_titulo,_script,[],1,false,true,'',_condition]] remoteExec ['addAction',[0,-2] select isDedicated,true];
