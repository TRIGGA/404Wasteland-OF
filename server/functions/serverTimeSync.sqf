//	@file Version: 1.0
//	@file Name: serverTimeSync.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

_startDate = Date;
_startTime = time;

// Always day

while{true} do
{
	if(time - _startTime > 900) then
    {
        setDate _startDate;
    };	    
};
