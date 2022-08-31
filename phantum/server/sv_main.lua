PhantumUtils = {}

local DebugBool = false

exports('Debug', function(bool)
    DebugBool = bool;
end)

PhantumUtils.Thread = function(fn)
    CreateThread(fn)
end

PhantumUtils.Tick = function(time, fn)
	if not time then time = 0 end;
    PhantumUtils.Thread(function()
        while true do
            Wait(time)
            fn()
        end
    end)
end


PhantumUtils.BanCheater = function(s, reason)
    if not reason then reason = 'N/A' end

    DropPlayer(s, 'IDIOTA DETECTED');

    -- export do banow mozesz se tu wpierdolic i pyrra
    -- bany w tym skrypcie beda pozniej


    if not PhantumServerConfig.Webhooks.Cheaters then return end

    local ip, discord, steam = GetPlayerEndpoint(source), 'N/A', 'N/A';
     
    if not ip then ip = 'N/A' end

    for k,v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steam = v;
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v;
        end
    end

    local embeds = {
        {
            ['title'] = 'Cheater Detected',
            ['description'] = string.format('Steam: `%s`\nDiscord: `%s`\nIP: ||`%s`||\nReason: `%s`', steam, discord, ip, reason),
            ['color'] = 16384000,
        }
    }

    PetformHttpRequest(PhantumServerConfig.Webhooks.Cheaters, function(err, text, headers) end, 'POST', json.encode({username = niggas5, embeds = embeds }), { ['Content-Type'] = 'application/json' })
end