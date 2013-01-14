//	@file Version: 1.0
//	@file Name: kickFromGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

#define groupManagementDialog 55510
#define groupManagementGroupList 55512

disableSerialization;

private["_dialog","_playerListBox","_groupInvite","_target","_index","_playerData","_check","_unitCount"];

_dialog = findDisplay groupManagementDialog;
_groupListBox = _dialog displayCtrl groupManagementGroupList;

_index = lbCurSel _groupListBox;
_playerData = _groupListBox lbData _index;
_check = 0;

//Check selected data is valid            			
{if (str(_x) == _playerData) then {_target = _x;_check = 1;};}forEach playableUnits;

{
	_owner = _x select 0;
	if(_owner == name vehicle _target) then {
		_target setVariable["gSpawnBeacon",1,true];
		_target setVehicleInit format["if (name player == ""%1"") then {player globalChat ""You were from the group, your group spawn beacon has been returned"";};",name _target,name player];
		processInitCommands;
		clearVehicleInit _target;
		[getPlayerUID _target, true] execVM "client\functions\cleanBeaconArrays.sqf";
	};
		 
}forEach pvar_groupBeaconList;

//Checks
if(_target == player) exitWith {player globalChat "you can't kick yourself";};
if (_check == 0) exitWith {player globalChat "you must select someone to kick first";};
	
[_target] join grpNull;
_target setVehicleInit format["if (name player == ""%1"") then {player globalChat ""%1 kicked you from the group."";};",name _target,name player];
processInitCommands;
clearVehicleInit _target;
player globalChat format["you have kicked %1 from the group",name _target];

