/*
Avanzado: si vas a tocar aca, consulta primero

lo que esta aca abajo son los script ya pre-compliados para que al arrancar la mision ya esten listos para usarse
de esta manera corren mucho mejor y mas rapido y se los puede llamar con "call " o "spawn" y no solamente con "execVM" que es una poronga


*/
class CLV
{
	tag = "clv";
	class Funciones
	{
		class aiCache 					{file = "fncs\aiCache.sqf"};
		class presentacion 			{file = "fncs\presentacion.sqf"};
    class crearFO 					{file = "fncs\CrearFO.sqf"};
    class loadoutFO 				{file = "fncs\FO_LoadOut.sqf"};
    class gridToPos 				{file = "fncs\gridToPos.sqf"};
    class globalAddaction 	{file = "fncs\mpAddaction.sqf"};
		class globalSay3D 			{file = "fncs\globalSay3D.sqf"};
		class globalSwitchMove	{file = "fncs\globalSM.sqf"};
		/* si queres agregar tu funcion aca abajo tenes que poner lo siguiente:
		class <nombrefuncion> { file = "< Ruta al script>"};

		Recomendaciones:
			- Lo mejor es que el nombre de la funcion EsteEscritaDeEstaManera para que sea mas legible
			- para llamar esta funcion se debe agregar adelante: [] call clv_fnc_nombreDeLaFuncion
		*/
	};
};
