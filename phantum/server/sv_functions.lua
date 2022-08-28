local ScriptsTable = {
    ['phant_backups'] = 'https://raw.githubusercontent.com/helldev-industries/fivem-police-backups/main/phant_backups/pkg.json',
    ['phant_holdup'] = 'https://raw.githubusercontent.com/helldev-industries/fivem-holdup/main/phant_holdup/pkg.json'
}

function RegisterPhantumResource(scriptName)
    StartResource(scriptName);
    local v, c = CheckUpdates(scriptName, function(data)
        if not data then
            print('[PHANTUM VERSION CHECKER]: Script outdated! Download it from github: https://github.com/helldev-industries');
            return;
        end
        
        print(data);

    end);
end

function CheckUpdates(script, cb)
    if not ScriptsTable[script] then
        cb(nil);
        return;
    end

    local script_v = json.decode(LoadResourceFile(script, 'pkg.json'))

    if not script_v then cb(nil); return; end

    PerformHttpRequest(
        ScriptsTable[script],
        function(errorCode, resultData, resultHeaders)
            if errorCode ~= 200 then
                cb(nil);
                return;
            end

            local data = json.decode(tostring(resultData))

            if (data.version ~= script_v.version) then
                cb(string.format(
                    '[PHANTUM VERSION CHECKER] Script %s is outdated. Current version: %s. Newest version: %s. Download it from github: https://github.com/helldev-industries',
                    script,
                    script_v.version,
                    data.version
                ))
                return;
            end

            cb(string.format('[PHANTUM VERSION CHECKER] Script %s has the latest version', script));
        end
    )
end
