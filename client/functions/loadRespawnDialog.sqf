//	@file Version: 1.0
//	@file Name: loadRespawnDialog.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define respawn_Content_Text 3401
#define respawn_MissionUptime_Text 3402
#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407
waitUntil{!isnil "bis_fnc_init"};
disableSerialization;

private["_player","_city","_radius","_name","_enemyCount","_friendlyCount","_side","_buttonArray", "_enemyPresent","_inGroup","_tempArray"];

createDialog "RespawnSelectionDialog";
_display = uiNamespace getVariable "RespawnSelectionDialog";
_display displayAddEventHandler ["KeyDown", "_return = false; if(respawnDialogActive && (_this select 1) == 1) then {_return = true;}; _return"];
_respawnText = _display displayCtrl respawn_Content_Text;
_missionUptimeText = _display displayCtrl respawn_MissionUptime_Text;

if(playerSide in [west]) then {_side = "Blufor"};
if(playerSide in [east]) then {_side = "Opfor"};
if(str(playerSide) == "GUER") then {_side = "Independent"};
_respawnText ctrlSetStructuredText parseText (format["You are on %1.<br/>Please select a spawn point.",_side]);
respawnDialogActive = true;

_buttonArray = [respawn_Town_Button0,respawn_Town_Button1,respawn_Town_Button2,respawn_Town_Button3,respawn_Town_Button4];

{
    _button = _display displayCtrl _x;
    _button ctrlSetText format[""];
    _button ctrlShow false;
}foreach _buttonArray;

_friendlyTowns = [];
_tempArray = [];
showBeacons = false;
_inGroup = false;
while {respawnDialogActive} do
{
    sleep 0.5;
    _timeText = [time/60/60] call BIS_fnc_timeToString;
    _missionUptimeText ctrlSetText format["Mission Uptime: %1", _timeText];
       
    if(_side != "Independent") then
    {  
        if(!showBeacons) then {
            {
                _pos = getMarkerPos (_x select 0);
                _name = _x select 2;
                _rad = _x select 1;

                {
                    if((getPos _x distance _pos) < _rad) then
                    {
                        if(side _x == playerSide) then
                        {
                            _friendlyCount = _friendlyCount + 1;
                        }else{
                            _enemyCount = _enemyCount + 1;
                        };
                    };
                }forEach playableUnits;

                if((_friendlyCount > 0) AND (_enemyCount == 0)) then
                {
                    _friendlyTowns set [count _friendlyTowns, _name];
                };
                _friendlyCount = 0;
                _enemyCount = 0; 
            }forEach cityList; 

            {
                _button = _display displayCtrl _x;
                if(_forEachIndex <= count _friendlyTowns -1) then
                {
                    _button ctrlShow true;
                    _name = _friendlyTowns select _forEachIndex;
                    _button ctrlSetText	format["%1",_name];  
                } else {
                    _name = "";
                    _button ctrlSetText _name;
                    _button ctrlShow false; 
                };          
            }forEach _buttonArray;
            _friendlyTowns = [];
        } else {
            _enemyCount = 0;
            {
                _button = _display displayCtrl _x;
                _button ctrlSetText format[""];
                _button ctrlShow false;    
            }foreach _buttonArray;

            {
                if(_side == "Blufor") then {
                    _button = _display displayCtrl (_buttonArray select _forEachIndex);
                    _centrePos = (pvar_beaconListBlu select _forEachIndex) select 1;

                    {
                        _onTeam = str(side _x) in ["EAST","GUER"];   
                        if(_onTeam) then {
                            if((getPos _x distance _centrePos) < 100) then {
                                if(!(side _x == playerSide)) then {
                                    _enemyCount = _enemyCount + 1; 
                                };   
                            }; 
                        };  
                    }forEach playableUnits;

                    if(_enemyCount == 0) then {
                        _button ctrlShow true;   
                        _name = (pvar_beaconListBlu select _forEachIndex) select 0;
                        _button ctrlSetText	format["%1",_name]; 
                    } else {
                        _name = "";
                        _button ctrlSetText _name;
                        _button ctrlShow false; 
                    };
                }; 
                _enemyCount = 0;         
            }forEach pvar_beaconListBlu;

            {
                if(_side == "Opfor") then {
                    _button = _display displayCtrl (_buttonArray select _forEachIndex);
                    _centrePos = (pvar_beaconListRed select _forEachIndex) select 1;

                    {
                        _onTeam = str(side _x) in ["WEST","GUER"];   
                        if(_onTeam) then {
                            if((getPos _x distance _centrePos) < 100) then {
                                if(!(side _x == playerSide)) then {
                                    _enemyCount = _enemyCount + 1; 
                                };   
                            }; 
                        };  
                    }forEach playableUnits;


                    if(_enemyCount == 0) then {
                        _button ctrlShow true;   
                        _name = (pvar_beaconListRed select _forEachIndex) select 0;
                        _button ctrlSetText	format["%1",_name]; 
                    } else {
                        _name = "";
                        _button ctrlSetText _name;
                        _button ctrlShow false; 
                    };   
                };
                _enemyCount = 0;                   
            }forEach pvar_beaconListRed;  

			{
				
				_button = _display displayCtrl (_buttonArray select _forEachIndex);
				_centrePos = (pvar_groupBeaconList select _forEachIndex) select 1;

				{
					if(_side == "Blufor") then {
						_onTeam = str(side _x) in ["EAST","GUER"];
					} else {
						_onTeam = str(side _x) in ["WEST","GUER"];
					};
					if(_onTeam) then {
						if((getPos _x distance _centrePos) < 100) then {
							if(!(side _x == playerSide)) then {
								_enemyCount = _enemyCount + 1; 
							};   
						}; 
					};  
				}forEach playableUnits;


				if(_enemyCount == 0) then {
					_group = (pvar_groupBeaconList select _forEachIndex) select 4;
					if(group player == _group) then {
						_button ctrlShow true;   
						_name = (pvar_groupBeaconList select _forEachIndex) select 0;
						_button ctrlSetText	format["Group: %1",_name];
					};
				} else {
					_name = "";
					_button ctrlSetText _name;
					_button ctrlShow false; 
				};   
                _enemyCount = 0;                   
            }forEach pvar_groupBeaconList;
			
        };
    };
    
    if((count units group player > 1) AND (_side == "Independent")) then
    {
        _tempArray = [];
        {
        	_tempArray set [count _tempArray,getPlayerUID _x];    
        }forEach units player;
                    
        //Towns
    	if(!showBeacons) then 
        {
        	{
                _pos = getMarkerPos (_x select 0);
                _name = _x select 2;
                _rad = _x select 1;

                {
                    if((getPos _x distance _pos) < _rad) then
                    {
                        if(getPlayerUID _x in _tempArray) then
                        {
                            _friendlyCount = _friendlyCount + 1;
                        }else{
                            _enemyCount = _enemyCount + 1;
                        };
                    };
                }forEach playableUnits;

                if((_friendlyCount > 0) AND (_enemyCount == 0)) then
                {
                    _friendlyTowns set [count _friendlyTowns, _name];
                };
                _friendlyCount = 0;
                _enemyCount = 0; 
            }forEach cityList; 

            {
                _button = _display displayCtrl _x;
                if(_forEachIndex <= count _friendlyTowns -1) then
                {
                    _button ctrlShow true;
                    _name = _friendlyTowns select _forEachIndex;
                    _button ctrlSetText	format["%1",_name];  
                } else {
                    _name = "";
                    _button ctrlSetText _name;
                    _button ctrlShow false; 
                };          
            }forEach _buttonArray;
            _friendlyTowns = [];    
        } else { //Beacons
            
        };	    
    };
};