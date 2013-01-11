//	@file Version: 1.0
//	@file Name: serverTimeSync.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

if(!X_Server) exitWith {};

_dateStamp = Date;
currentDate = _dateStamp;
publicVariable "currentDate";
startDate = Date;

_startTime = time;
while{true} do
{
	if(time - _startTime > 900) then
    {
        setDate startDate;
        currentDate = startDate;
		publicVariable "currentDate";	
    	_startTime = time;    
    };
	sleep 10;
};