/*
if(!local player) exitwith {};

//Create and set the warning level to 0
if(isNil {gsFire}) then {gsFire = 0};

{
	_distance = (getMarkerPos _x) distance player;
	if(_distance < 200) then {
		//If we are in the Gun Store range. We then
		//increment the value with 1 as a warning
		gsFire = gsFire + 1;

		//Now we check on what level the warning is
		//and then execute a command based on the 
		//warning level.

		if(gsFire == 1) then {}

		if(gsFire == 2) then {removeAllWeapons player};

		if(gsFire == 3) then {endMission "LOSER"};

		//Display the warning message
		hint format["You are firing 200m of a gun store. Keep this up and you'll be removed.\n\n %1/3 Attempts ", gsFire];
	};
} foreach ["gs1","gs2","gs3","gs4"];
*/