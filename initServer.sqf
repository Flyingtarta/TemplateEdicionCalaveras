/*
initServer.sqf

todo lo que este aca se va a ejecutar cuando arranque la mision, pero solo en el servidor

*/

//                   \/ distancia que se cachea la ia
#define DISTANCIA  1500

[west, 100] call BIS_fnc_respawnTickets; // tickets de respawn, bando y cantidad
//[east, 100] call BIS_fnc_respawnTickets;
//[independent, 100] call BIS_fnc_respawnTickets;
[DISTANCIA] spawn clv_fnc_aiCache; //cacheo por script ( esta puesto a 1500 metros por defecto, modifiquen arriba donde dice 1500)
