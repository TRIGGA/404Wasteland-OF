//	@file Version: 1.0
//	@file Name: checkAdmin.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private ["_uid","_handle"];

_uid = getPlayerUID player;
if ((_uid in moderators) OR (_uid in administrators) OR (_uid in serverAdministrators)) then {
    execVM "client\systems\adminPanel\vehicleManagement.sqf";
} else {
    sleep 1;
    _handle = player execVM "client\systems\adminPanel\checkAdmin2.sqf"; 
    waitUntil {scriptDone _handle};
};