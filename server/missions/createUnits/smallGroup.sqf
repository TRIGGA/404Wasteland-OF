//	@file Version: 1.0
//	@file Name: smallGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 21:58
//	@file Args:

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7"];

_group = _this select 0;
_pos = _this select 1;

//Anti Vehicle
_leader = _group createunit ["Citizen2_EP1", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "PG7V";
_leader addMagazine "PG7V";
_leader addWeapon "RPG7V";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addWeapon "AKS_74_U";

//Support
_man2 = _group createunit ["Citizen2_EP1", [(_pos select 0) - 60, _pos select 1, 0], [], 0.5, "Form"];
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addWeapon "RPK_74";

//Rifleman
_man3 = _group createunit ["CIV_EuroMan02_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addWeapon "AK_47_M";

//Sniper
_man4 = _group createunit ["CIV_EuroMan02_EP1", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man4 addMagazine "10Rnd_762x54_SVD";
_man4 addMagazine "10Rnd_762x54_SVD";
_man4 addMagazine "10Rnd_762x54_SVD";
_man4 addWeapon "SVD";

//Rifleman
_man5 = _group createunit ["CIV_EuroMan01_EP1", [_pos select 0, (_pos select 1) + 60, 0], [], 0.5, "Form"];
_man5 addMagazine "30Rnd_762x39_AK47";
_man5 addMagazine "30Rnd_762x39_AK47";
_man5 addMagazine "30Rnd_762x39_AK47";
_man5 addWeapon "AK_47_M";

//Rifleman
_man6 = _group createunit ["CIV_EuroMan01_EP1", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man6 addMagazine "30Rnd_762x39_AK47";
_man6 addMagazine "30Rnd_762x39_AK47";
_man6 addMagazine "30Rnd_762x39_AK47";
_man6 addWeapon "AK_47_M";

//Rifleman
_man7 = _group createunit ["CIV_EuroMan01_EP1", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man7 addMagazine "30Rnd_762x39_AK47";
_man7 addMagazine "30Rnd_762x39_AK47";
_man7 addMagazine "30Rnd_762x39_AK47";
_man7 addWeapon "AK_47_M";

_leader = leader _group;
_man1 setVehicleInit "null = [group this,(getPos this)] execVM 'server\functions\defendArea.sqf'";
processInitCommands;