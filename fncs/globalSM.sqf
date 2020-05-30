//Ejecuto el switchmove de manera global
params["_obj", "_anim"];
/*
Descripcion:
  Funcion para ejectuar en todos los jugadores una animacion determinada

Parametros:
  [objeto , animacion ] call clv_fnc_globalSM;
input:
  objeto: (obj) lo que queremos animar
  animacion: (str) nombre de la animacion
output:
  nada
*/
[_obj, _anim] remoteExec ["switchMove", [0,-2] select isDedicated];
