
//	@file Version: 1.0
//	@file Name: onKeyPress.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:


private["_handled", "_faceCP", "_faceVP"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = false;

if(isstunned) exitwith

	{

	if(_key == 50)then{_handled = true};
	if(_key == 11)then{_handled = true};

	_handled

	};

switch _key do
{      
    // U key
    case 22:
    {
		execVM "client\systems\adminPanel\checkAdmin.sqf";
    };
	
	// INS key
	case 210:
	{
		execVM "client\systems\adminPanel\checkAdminVehicle.sqf";
	};
    
	// DEL key
	case 211:
	{
		execVM "client\systems\adminPanel\checkAdminDeleteVehicle.sqf";
	};
	
    // Tilde
    case 41:
    {
        [] call loadPlayerMenu;
    };
	
	// T key
	case 20:
	{
		execVM "client\systems\adminPanel\checkAdminTeleport.sqf";
	};
	
	// Y key
	case 21:
	{
		execVM "client\systems\adminPanel\checkAdminSattelite.sqf";
	};
	
	/*
	// Free keys
	// <> = 86
	// H = 35
	// Home = 199
	// End = 207
	*/
};

_handled;



