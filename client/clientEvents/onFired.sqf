//	@file Version: 1.0
//	@file Name: onFired.sqf
//	@file Author: Zuen
//	@file Contributer: DeepSleep
//	@file Created: 07/01/2013 14:30
//	@file Args: Taken from createGunStoreMarkers.sqf

//Create and set the warning level to 0
if(isNil {gsFireC}) then {gsFireC = 0};
 
_radiusC = 200;																	//The radius from the Gun Stores
_gunStoresC = ["gs1", "gs2", "gs3", "gs4"];										//The Gun Stores Array

{
	_unitC = missionNamespace getVariable (_gunStoresC select _forEachIndex);	//Getting the values of each Gun Store from the mission.sqm file

	if(player distance _unitC <= _radiusC) then {

		//If we are in the Gun Store range. We then
		//increment the value with 1 as a warning.
		gsFireC = gsFireC + 1;

		//Now we check on what level the warning is
		//and then execute a command based on the 
		//warning level.

		if(gsFireC == 1) then {removeAllWeapons player};		//First Warning: Remove Weapons

		if(gsFireC == 2) then {removeAllWeapons player};		//Second Warning: Remove Weapons

		if(gsFireC == 3) then {endMission "LOSER"};				//Third Warning: Kicked from Server

		//Display the warning message
		hint format["You are firing close to the gun store. Keep this up and you'll be kicked from the server.\n\n %1/3 Attempts ", gsFireC];
	};
} forEach _gunStoresC;