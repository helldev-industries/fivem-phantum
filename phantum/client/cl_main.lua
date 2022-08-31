PhantumUtils = {}

PhantumUtils.Thread = function(fn)
    Citizen.CreateThread(fn)
end

PhantumUtils.Tick = function(a, b)
	local fn, t;
	
	if type(a) == 'function' then fn = a else t = a end;
	if type(b) == 'function' then fn = b else t = b end;
	if type(t) ~= 'number' then t = 0; end;
	
    PhantumUtils.Thread(function()
        while true do
            Wait(t);
            fn();
        end
    end)
end