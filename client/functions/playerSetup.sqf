
//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_player = _this;
_uid = getPlayerUID _player;

//Player initialization
enableSentences false;
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";
removeAllWeapons _player;
removeBackpack _player;

//Default case means something fucked up.
_player addMagazine "17Rnd_9x19_glock17";
_player addWeapon "glock17_EP1";
_player selectWeapon "glock17_EP1";

if(str(playerSide) in ["WEST"]) then
{
    removeAllWeapons _player;
    _player addMagazine "17Rnd_9x19_glock17";
	_player addWeapon "glock17_EP1";
	_player selectWeapon "glock17_EP1";
};

if(str(playerSide) in ["EAST"]) then
{
    removeAllWeapons _player;
    _player addMagazine "17Rnd_9x19_glock17";
	_player addWeapon "glock17_EP1";
	_player selectWeapon "glock17_EP1";
};

if(str(playerSide) in ["GUER"]) then
{
    removeAllWeapons _player;
    _player addMagazine "17Rnd_9x19_glock17";
	_player addWeapon "glock17_EP1";
	_player selectWeapon "glock17_EP1";
};

_player addrating 1000000;
_player switchMove "amovpknlmstpsraswpstdnon_gear";

thirstLevel = 100;
hungerLevel = 100; 
 
// Stop duping money, user cannot drop money until 5 minutes have passed.
_player setVariable["waitdrop",true,true];

_player setVariable["premium",false,true];
_player setVariable["lite",false,true];

// Give extra money to premium/lite users
if ((_uid in premium) OR (_uid in lite)) then {
    if ((_uid in premium)) then {
		_player setVariable["cmoney",premiummoney,false];
		_player setVariable["premium",true];
        hint "Welcome Premium user";		
	};
    if ((_uid in lite)) then { 
		_player setVariable["cmoney",litemoney,false];
		_player setVariable["lite",true];
        hint "Welcome Lite user";		

	};
} else {
    _player setVariable["cmoney",100,false];
};

_player setVariable["canfood",2,false];
_player setVariable["medkits",0,false];
_player setVariable["water",2,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", 0, false];
_player setVariable["fuelEmpty", 1, false];
_player setVariable["bombs",false,false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];

// Custom items
_player setVariable["2uaig",0,true];
_player setVariable["gSpawnBeacon",0,true];

[] execVM "client\functions\playerActions.sqf";

playerSetupComplete = true;