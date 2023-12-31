RegisterNetEvent("kyess:progress")
AddEventHandler("kyess:progress", function(source)
    lib.progressBar({
        duration = 5000,
        label = 'Rozbaluješ náboje..',
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
        },
    })
end)