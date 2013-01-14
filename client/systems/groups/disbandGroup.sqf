//	@file Version: 1.0
//	@file Name: disbandGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

{
	_unit = _x;
	{
		_owner = _x select 0;
		if(_owner == name vehicle _unit) then {
			_unit setVariable["gSpawnBeacon",1,true];
			_unit setVehicleInit format["if (name player == ""%1"") then {player globalChat ""The group was disbanded, your group spawn beacon was returned."";};",name _unit,name player];
			processInitCommands;
			clearVehicleInit _unit;
			[getPlayerUID _unit, true] execVM "client\functions\cleanBeaconArrays.sqf";
		};
			 
	}forEach pvar_groupBeaconList;	
	[_x] join grpNull;    
}forEach units group player;