PhantumUtils = {}

PhantumUtils.Thread = function(fn)
    Citizen.CreateThread(fn)
end

PhantumUtils.Tick = function(time, fn)
    PhantumUtils.Thread(function()
        while true do
            Citizen.Wait(time)
            fn()
        end
    end)
end