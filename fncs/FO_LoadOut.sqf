params["_unit"];

if (!local _unit) exitWith {};

if(side _unit == east) then {
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add weapons";
	_unit addWeapon "rhs_weap_aks74u";
	_unit addPrimaryWeaponItem "rhs_acc_pgs64_74u";
	_unit addPrimaryWeaponItem "rhs_30Rnd_545x39_7N6M_AK";
	_unit addWeapon "hgun_P07_F";
	_unit addHandgunItem "16Rnd_9x21_Mag";

	comment "Add containers";
	_unit forceAddUniform "rhs_uniform_emr_patchless";
	_unit addVest "rhs_6b23_6sh116";
	_unit addBackpack "B_RadioBag_01_wdl_F";

	comment "Add binoculars";
	_unit addWeapon "Rangefinder";

	comment "Add items to containers";
	for "_i" from 1 to 10 do {_unit addItemToVest "ACE_fieldDressing";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_7N6M_AK";};
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
	_unit addHeadgear "rhsusf_opscore_mar_fg_pelt";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";
	_unit linkItem "ItemGPS";

	comment "Set identity";
	[_unit,"RussianHead_5","male03rus"] call BIS_fnc_setIdentity;
}
else{
	comment "Exported from Arsenal by Federico";

	comment "[!] UNIT MUST BE LOCAL [!]";
	if (!local _unit) exitWith {};

	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add weapons";
	_unit addWeapon "rhs_weap_mk18_d";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_d";
	_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855_PMAG_Tan";
	_unit addWeapon "hgun_P07_F";
	_unit addHandgunItem "16Rnd_9x21_Mag";

	comment "Add containers";
	_unit forceAddUniform "rhs_uniform_acu_oefcp";
	_unit addVest "rhsusf_iotv_ocp_Teamleader";
	_unit addBackpack "tf_rt1523g_big";

	comment "Add items to containers";
	for "_i" from 1 to 11 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addItemToUniform "ACE_morphine";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_EPM_Pull";};
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addHeadgear "rhsusf_ach_helmet_headset_ocp_alt";
	_unit addGoggles "rhsusf_oakley_goggles_clr";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";
	_unit linkItem "rhsusf_ANPVS_15";

	comment "Set identity";
	[_unit,"Sturrock","male10eng"] call BIS_fnc_setIdentity;
}




