PLUGIN.name = "Player Count"
PLUGIN.author = "Usuariozombie"
PLUGIN.description = "Counts the players connected to the server in a JSON file and displays it on the website."

timer.Create("PlayerCount", 10, 0, function()

    local playerData = {}
    local charData = {}

    for k, v in pairs(player.GetAll()) do
        if v:GetCharacter() then
            table.insert(charData, {
                charname = v:GetCharacter():GetName(),
                faction = ix.faction.Get(v:Team()).name,
                id = v:SteamID64(),
                flags = v:GetCharacter():GetFlags(),
                money = v:GetCharacter():GetMoney(),
                eweapons = v:GetWeapons(),
                model = v:GetModel(),
                health = v:Health(),
                armor = v:Armor(),
                steamid = v:SteamID(),

                -- Get the player's position
                position = {
                    x = v:GetPos().x,
                    y = v:GetPos().y,
                    z = v:GetPos().z
                },
            })
        end
    end

    local playerCount = player.GetCount()


    -- Only send post if player data is not nil
    if playerData then
        if playerCount > 0 then
            HTTP({
                method = "POST",
                url = "https://yourapi.com",
                type = "application/json",
                body = util.TableToJSON({playerCount = playerCount, charData = charData}),
                failed = function(code)
                    print("Failed to send player count to the API. Error code: " .. code)
                end,
                success = function(code, body, headers)
                    print("Player count sent to the API.")
                    print("Response: " .. body)
                end
            })
        else
            HTTP({
                method = "POST",
                url = "https://yourapi.com",
                type = "application/json",
                body = util.TableToJSON({playerCount = playerCount}),
                failed = function(code)
                    print("Failed to send player count to the API. Error code: " .. code)
                end,
                success = function(code, body, headers)
                    print("Player count sent to the API.")
                    print("Response: " .. body)
                end
            })
        end
    else
        print("Player data is nil.")
    end
end)