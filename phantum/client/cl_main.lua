PhantumUtils = {}

PhantumUtils.Thread = function(fn)
    Citizen.CreateThread(fn)
end

PhantumUtils.Tick = function(time, fn)
	if not time then time = 0 end;
    PhantumUtils.Thread(function()
        while true do
            Citizen.Wait(time)
            fn()
        end
    end)
end