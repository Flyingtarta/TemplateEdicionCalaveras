//HECHO POR Grumpy Old Man
//funcion para pasar de grid a posicion en el mapa 
params ["_grid"];
_count = count _grid;
_banana = _count / 2;
_multis = [1,10,100];
_counts = [10,8,6];
_multi = _multis select (_counts find _count);
_posX = (parseNumber (_grid select [0,_banana])) * _multi;
_posY = (parseNumber (_grid select [_banana,_banana + _banana])) * _multi;
[_posX,_posY,0]
