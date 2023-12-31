CreateThread(function()
    local HungerWarning, ThirstWarning = false, false
    while true do
        -- These are only sending the notification once you are below 30%.
        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            if status.val < 300000 then
                if not HungerWarning then
                    exports['mythic_notify']:DoHudText('inform', "Máš hlad, měl by ses najíst", { ['background-color'] = '#007da3', ['color'] = '#fff' })
                    HungerWarning = true
                end
            else
                HungerWarning = false
            end
        end)

        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            if status.val < 300000 then
                if not ThirstWarning then
                    exports['mythic_notify']:DoHudText('inform', "Máš žízěn, měl by ses napít", { ['background-color'] = '#007da3', ['color'] = '#fff' })
                    ThirstWarning = true
                end
            else
                ThirstWarning = false
            end
        end)
        Wait(60000) -- Does one check every 60 seconds
    end
end)