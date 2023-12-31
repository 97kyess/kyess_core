ESX = exports.es_extended:getSharedObject()
CreateThread(function()
    if ESX.IsPlayerLoaded() then
        Wait(1500)
        local hash = GetEntityModel(PlayerPedId())
    
        if hash ~= `mp_m_freemode_01` and hash ~= `mp_f_freemode_01` then
            StaminaPed()
        end
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    Wait(1500)
    local hash = GetEntityModel(PlayerPedId())

    if hash ~= `mp_m_freemode_01` and hash ~= `mp_f_freemode_01` then
        StaminaPed()
    end
end)

function StaminaPed()
    CreateThread(function()
        while true do
            RestorePlayerStamina(PlayerId(), 1.0)
            Wait(1000)
        end
    end)
end