PLUGIN.name = "Gdata"
PLUGIN.author = "Usuariozombie"
PLUGIN.description = "Sends player data to an API."

timer.Create("PlayerCount", 10, 0, function()

    local playerData = {}
    local charData = {}

    for k, v in pairs(player.GetAll()) do
        if v:GetCharacter() then
            charData[v:Name()] = {
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
            }
        end
    end

    local playerCount = player.GetCount()


    -- Only send post if player data is not nil
    if playerData then
        if playerCount > 0 then
            HTTP({
                method = "POST",
                url = "https://your-api-url.com/api",
                type = "application/json",
                body = util.TableToJSON({{playerCount = playerCount}, {charData = charData}}),
                failed = function(code)
                    print("Failed to send player count to the API. Error code: " .. code) -- Just for testing and debugging
                end,
                success = function(code, body, headers)
                    print("Player count sent to the API.") -- Just for testing and debugging
                end
            })
        else
            HTTP({
                method = "POST",
                url = "https://your-api-url.com/api",
                type = "application/json",
                body = util.TableToJSON({{playerCount = playerCount}}),
                failed = function(code)
                    print("Failed to send player count to the API. Error code: " .. code) -- Just for testing and debugging
                end,
                success = function(code, body, headers)
                    print("Player count sent to the API.") -- Just for testing and debugging
                end
            })
        end
    else
        print("Player data is nil.") -- Just for testing and debugging
    end
end)