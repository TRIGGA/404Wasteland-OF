
//	@file Version: 1.0
//	@file Name: cleanBeaconArrays.sqf
//	@file Author: [404] Costlyy
//	@file Created: 08/12/2012 18:30
//	@file Args: [string(ownerUID)]

private["_currBeaconOwnerUID", "_isGroup"];

_currBeaconOwnerUID = _this select 0;
_isGroup = _this select 1;

{
	if(!_isGroup) then {
		if(str(_currBeaconOwnerUID) == str(_x select 3)) then {
			pvar_beaconListBlu set [_forEachIndex, "REMOVETHISCRAP"];
			pvar_beaconListBlu = pvar_beaconListBlu - ["REMOVETHISCRAP"];
			publicVariable "pvar_beaconListBlu";
		};
	};
    
}forEach pvar_beaconListBlu;

{
	if(!_isGroup) then {
		if(str(_currBeaconOwnerUID) == str(_x select 3)) then {
			pvar_beaconListRed set [_forEachIndex, "REMOVETHISCRAP"];
			pvar_beaconListRed = pvar_beaconListRed - ["REMOVETHISCRAP"];
			publicVariable "pvar_beaconListRed";
		};
	};
}forEach pvar_beaconListRed;

{
	if(_isGroup) then { 
		if(str(_currBeaconOwnerUID) == str(_x select 3)) then {
			pvar_groupBeaconList set [_forEachIndex, "REMOVETHISCRAP"];
			pvar_groupBeaconList = pvar_groupBeaconList - ["REMOVETHISCRAP"];
			publicVariable "pvar_groupBeaconList";
		};
	};
}forEach pvar_groupBeaconList;
