---------------------------------------------------------------
-------------- Remove Items ox_inventory (Fancy) --------------
---------------------------------------------------------------

function Wipe()
    MySQL.Async.fetchAll("SELECT `identifier`, `inventory` FROM `users`", {}, function(result)
        if not result or #result <= 0 then return end
        for i=1, #Config.RemoveItems, 1 do
            local data = result[i].inventory
            local identifier = result[i].identifier
            if identifier == Config.BypassedIdentifiers[i] then return end
            if data[i].name == Config.RemoveItems[i] then
                local dataVerify = data
                table.remove(i, dataVerify)
                local dataCleaned = dataVerify
                MySQL.Sync.execute("UPDATE `users` SET `inventory`= @inventory WHERE `identifier` = @identifier", {
                    ["@inventory"] = dataCleaned,
                    ["@identifier"] = identifier
                })
            end
        end
    end)
end

RegisterCommand("itemwipe", function(src, args)
    if src ~= 0 then return print("^1This command can only be run via the console.") end
    Wipe()
end, true)
