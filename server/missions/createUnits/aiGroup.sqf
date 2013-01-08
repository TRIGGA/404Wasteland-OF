//	@file Version: 1.0
//	@file Name: aiGroup.sqf
//	@file Author: Xstasy
//	@file Created: 08/01/2013 11:25
//	@file Args:

private ["_group","_pos","_leader","_man2"];

_group = _this select 0;
_pos = _this select 1;

// Leader
_leader = _group createunit ["Pilot_EP1", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addWeapon "M4A1_AIM_CAMO";

// Rifle_man
_man2 = _group createunit ["CIV_EuroMan02_EP1", [_pos select 0, (_pos select 1) + 10, 0], [], 0.5, "Form"];
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addWeapon "M4A1_AIM_CAMO";


_leader = leader _group;
_man1 setVehicleInit "null = [group this,(getPos this)] execVM 'server\functions\defendArea.sqf'";
processInitCommands;