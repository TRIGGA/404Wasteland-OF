private ["_allVehicles","_check","_vehicleType","_legit"];
while {true} do {
	_allVehicles = vehicles;
	{
		_check = _x getVariable ["original",0];
		if(_check != 1) then 
		{
			_legit = _x getVariable["legit",0];
			if(_legit != 1) then
			{
				_vehicleType = Format["%1",typeOf _x];
				if(_vehicleType isKindOf "Car") then {
					if(_vehicleType isKindOf "MotorCycle") then {
						deleteVehicle _x;
					};
					if(_vehicleType isKindOf "Truck") then {
						deleteVehicle _x;
					};
					if(!(_vehicleType isKindOf "Truck") AND !(_vehicleType isKindOf "MotorCycle") AND !(_vehicleType isKindOf "Wheeled_APC")) then {
						deleteVehicle _x;   
					};
				};
				if(_vehicleType isKindOf "Helicopter") then {
					deleteVehicle _x;
				};
				if(_vehicleType isKindOf "Plane") then {
					deleteVehicle _x;
				};
				if(_vehicleType isKindOf "Tank") then {
					deleteVehicle _x;
				};
				if(_vehicleType isKindOf "Wheeled_APC") then {
					deleteVehicle _x;
				};
			};
		};
	} forEach _allVehicles;
	sleep 15;
};