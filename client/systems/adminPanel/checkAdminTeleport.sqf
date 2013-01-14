//	@file Version: 1.0
//	@file Name: checkAdmin.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private ["_uid","_handle"];

_uid = getPlayerUID player;
if ((_uid in moderators) OR (_uid in administrators) OR (_uid in serverAdministrators)) then {
    if ((_uid in moderators)) then {
		// Do nothing.
	};
    if ((_uid in administrators)) then {
		hint "Click on map to teleport";
		onMapSingleClick "vehicle player setPos [_pos select 0,_pos select 1,0]; onMapSingleClick '';";
		openMap true;
		closeDialog 0;			
	};
    if ((_uid in serverAdministrators)) then {
		hint "Click on map to teleport";
		onMapSingleClick "vehicle player setPos [_pos select 0,_pos select 1,0]; onMapSingleClick '';";
		openMap true;
		closeDialog 0;		
	};	
} else {
    sleep 1;
    _handle = player execVM "client\systems\adminPanel\checkAdmin2.sqf"; 
    waitUntil {scriptDone _handle};
};