local blips = {}

Citizen.CreateThread(function()
    for i = 1, #Config.Blips do
        local confBlip = Config.Blips[i]
        blips[i] = AddBlipForCoord(confBlip.coords.x, confBlip.coords.y, confBlip.coords.z)
        
        SetBlipSprite(blips[i], confBlip.sprite)
        SetBlipScale(blips[i], confBlip.scale)
        SetBlipColour(blips[i], confBlip.color)
        SetBlipAsShortRange(blips[i], true)
        if confBlip.category ~= nil then
            SetBlipCategory(blips[i], confBlip.category)
        end

        AddTextEntry('BLIP_NAME', '<FONT FACE="Russo One">' .. confBlip.label)
        BeginTextCommandSetBlipName('BLIP_NAME')
        EndTextCommandSetBlipName(blips[i])
    end
end)