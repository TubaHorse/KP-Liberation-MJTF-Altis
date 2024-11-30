/*
    Spawning of start vehicles at placeholder objects

    This file spawns the so called "start vehicles" like boats
    and little birds at the starting base/carrier.

    The array at the end can be used to add start vehicles
    by using the variable name of the grasscutter placeholder
    and the variable defined in the preset or a direct classname.

    Format: [<variable name of placeholder without number>, <variable from preset or a classname>]

    E.g. the variables of the grasscutter placeholder objects for the
    little birds are named "littlebird_0", "littlebird_1", etc.
    while the variable from the preset is KP_liberation_little_bird_classname.
    This leads to the entry below.

    You can also remove unwanted start vehicles by deleting the corresponding line
    in the array below. Just keep the correct comma separation in mind.
    Refer to: https://github.com/KillahPotatoes/KP-Liberation/wiki/EN_ImportantHints#commas-inside-an-array
*/

waitUntil {!isNil "save_is_loaded"};
waitUntil {save_is_loaded};

private _placeholder = objNull;
private _spawnPos = [];
private _veh = objNull;
{
    _x params ["_id", "_classname"];

    for [{_i = 0}, {!isNil ([_id, _i] joinString "")}, {_i = _i + 1}] do {
        _placeholder = missionNamespace getVariable ([_id, _i] joinString "");
        _spawnPos = getPosATL _placeholder;
        _veh = _classname createVehicle [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2) + 0.2];
        _veh enableSimulationGlobal false;
        _veh allowDamage false;
        _veh setDir (getDir _placeholder);
        _veh setPosATL _spawnPos;
        [_veh] call KPLIB_fnc_clearCargo;
        sleep 1;
        _veh enableSimulationGlobal true;
        _veh setDamage 0;
        _veh allowDamage true;
        _veh setVariable ["KP_liberation_preplaced", true, true];
        [_veh] call KPLIB_fnc_addObjectInit;
        _veh setDamage 0;
    };
} forEach [
    ["littlebird_", KP_liberation_little_bird_classname],
    //["boat_", KP_liberation_boat_classname],
    ["bigboat_", KP_liberation_bigboat_classname]
];

boatr_0 = objNull;
boatr_1 = objNull;

boatr_0 = KP_liberation_boat_classname createVehicle [(getposATL boat_0) select 0, (getposATL boat_0) select 1, ((getposATL boat_0) select 2) + 0.2];
boatr_0 enableSimulationGlobal false;
boatr_0 allowdamage false;
boatr_0 setDir (getDir boat_0);
boatr_0 setPosATL (getposATL boat_0);
boatr_0 setDamage 0;
sleep 0.5;
boatr_0 enableSimulationGlobal true;
boatr_0 setDamage 0;
boatr_0 allowdamage true;
[boatr_0] call KPLIB_fnc_addObjectInit;
[boatr_0] call KPLIB_fnc_clearCargo;
publicVariable "boatr_0";

boatr_1 = KP_liberation_boat_classname createVehicle [(getposATL boat_1) select 0, (getposATL boat_1) select 1, ((getposATL boat_1) select 2) + 0.2];
boatr_1 enableSimulationGlobal false;
boatr_1 allowdamage false;
boatr_1 setDir (getDir boat_1);
boatr_1 setPosATL (getposATL boat_1);
boatr_1 setDamage 0;
sleep 0.5;
boatr_1 enableSimulationGlobal true;
boatr_1 setDamage 0;
boatr_1 allowdamage true;
[boatr_1] call KPLIB_fnc_addObjectInit;
[boatr_1] call KPLIB_fnc_clearCargo;
publicVariable "boatr_1";

br0 setVehicleCargo boatr_0;
br1 setVehicleCargo boatr_1;