//	@file Version: 1.0
//	@file Name: leaveGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

{
	_owner = _x select 0;
	if(_owner == name vehicle player) then {
		player setVariable["gSpawnBeacon",1,true];
		hint "You had a group spawn beacon you left the group, it's now in your player inventory";
	}; 
}forEach pvar_groupBeaconList;
[getPlayerUID player, true] execVM "client\functions\cleanBeaconArrays.sqf";
[player] join grpNull;