#define RONDAS         5
#define TIEMPORINFO         20
#define TIEMPOCALCULO         30
#define TIEMPOPEDIDO         55
#define COOLDOWN         240

params ["_FO","_bando",["_modifLoadout", false]];


//CREO AL FO
//_FO = _grp createUnit ["O_Soldier_A_F", _pos, [], 0, "FORM"];
//LE PONGO EL LOADOUT
if(_modifLoadout) then {
	0 = [_FO] call clv_fnc_FOLoadout;
};
//LO HAGO NO CACHEABLE
_FO setvariable ["Cacheable", false];

//TRABAJO MIENTRAS ESTE VIVO
0 = [_FO, _bando] spawn {
	params["_FO","_bando"];
	while {alive _FO} do {
	//CONSIGO UNIDADES A SU ALREDEDOR, Y FILTRO SI SON LIDERES Y SI ESTAN VIVOS
	_list = (_FO nearEntities ["Man", 700]) select {(side _x == _bando) && (alive _x) && (leader _x == _x)};
		if (count _list > 0) then{
			//LISTA DE LIDERES
			_trgVeh = [];
			_trgInf = [];
			_arrGrid = [];
			_arrGridUniq = [];
			_arrTotal = [];
			{
				//RECORRO LOS LIDERES QUE TENEMOS EN EL AREA Y VEO LOS BLANCOS QUE TENGAN
				_lead = _x;
				//_trgs = _lead targets [true, 600];
				//_trgs = (_lead neartargets 600) select {(_x select 2) IN (_lead call BIS_fnc_enemySides)};
				_trgs = _lead nearEntities [["Man", "Car", "Tank"], 600] select {(side _x) IN (_lead call BIS_fnc_enemySides)};
				{
					_trg = _x;
					_isVeh = _trg isKindOf "Man";
					_knowledge = (group _lead) knowsAbout _trg;
					//FILTRO BLANCO SEGUN TIPO Y GUARDO EN LISTAS SEPARADAS SU POSICION SOSPECHADA
					if(_knowledge > 1) then{
						_pos = _lead getHideFrom _trg;
						if(_isVeh && !(_pos isEqualTo [0,0,0])) then{
							_trgInf = _trgInf + [(_pos)];
							/*_markerName = createMarker [str (_pos select 0), _pos]; 
							_markerName setMarkerType "hd_dot";
							_markerName setMarkerColor "ColorRed";*/
							_posGrid = mapGridPosition _pos;
							_arrGrid pushBack _posGrid;
							_arrGridUniq pushBackUnique _posGrid;
						}else{
							//[(_lead getHideFrom _trg)]
							/*_markerName = createMarker [str (_pos select 0), _pos]; 
							_markerName setMarkerType "hd_dot";
							_markerName setMarkerColor "ColorGreen";*/
							_trgVeh = _trgVeh + [(_pos)];
							_posGrid = mapGridPosition _pos;
							_arrGrid pushBack _posGrid;
							_arrGridUniq pushBackUnique _posGrid;
						}
					};
				}foreach _trgs;
			}foreach _list;
			if(count _trgInf > 1) then{
				hint "ENTRO EN INF";
				{
					_grid = _x;
					_cnt = { _x isEqualTo _grid } count _arrGrid;
					_arrTotal pushBack _cnt;
				}foreach _arrGridUniq;
				_max = selectMax _arrTotal;
				_ind = _arrTotal find _max;
				sleep TIEMPORINFO;
				_selected = _arrGridUniq select _ind;
				_xyzPos = [_selected] call clv_fnc_gridToPos;
				_posFinal = _xyzPos vectorAdd [50,50,0];
				sleep TIEMPOCALCULO;
				if(_posFinal distance2D _FO && alive _FO> 2000) then{
					hint "OBJETIVO ABSURDO";
					//CANCELO OPERACION Y REINICIO
					_trgVeh = [];
					_trgInf = [];
				}else{
					sleep TIEMPOPEDIDO;
					//PIDO ARTILLERIA
					/*_markerName = createMarker [str (_posFinal select 0), _posFinal]; 
					_markerName setMarkerType "hd_objective";
					_markerName setMarkerColor "ColorRed";*/
					[_posFinal, "Sh_82mm_AMOS", 75, RONDAS, 4, {}, 0, 4000, 1600] call BIS_fnc_fireSupportVirtual;
					_trgVeh = [];
					_trgInf = [];
					sleep COOLDOWN;
				};
			}else{
				sleep 30;
				_trgVeh = [];
				_trgInf = [];
				_posVec = [0,0,0];
			};
		}else{
			//SI SALIO POR ACA ES PORQUE NO HAY MAS BLANCOS
			//POR LAS DUDAS LIMPIO LA LISTA
			//hint "NO HAY BLANCOS";
			_list = [];
			_posVec = [0,0,0];
			sleep 15;
		};
	};
};
