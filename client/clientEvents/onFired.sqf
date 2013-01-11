/*
Taken from createGunStoreMarkers.sqf
*/

//Create and set the warning level to 0
if(isNil {gsFireC}) then {gsFireC = 0};
 
 
_radiusC = 200;
_gunStoresC = ["gs1", "gs2", "gs3", "gs4"];

{
	_unitC = missionNamespace getVariable (_gunStoresC select _forEachIndex);

	if(player distance _unitC <= _radiusC) then {
		//If we are in the Gun Store range. We then
		//increment the value with 1 as a warning
		gsFireC = gsFireC + 1;

		//Now we check on what level the warning is
		//and then execute a command based on the 
		//warning level.

		if(gsFireC == 1) then {};

		if(gsFireC == 2) then {removeAllWeapons player};

		if(gsFireC == 3) then {endMission "LOSER"};

		//Display the warning message
		hint format["You are firing 200m of a gun store. Keep this up and you'll be removed.\n\n %1/3 Attempts ", gsFireC];
	};	
} forEach _gunStoresC;