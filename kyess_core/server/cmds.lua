-- /id
lib.addCommand('id', {
    help = 'Ukáže tvé herní ID'
}, function(source, args, raw)
    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Tvé ID: '..source,
        type = 'info',
        icon = 'user',
        duration = 6000
    })
end)

-- /group
lib.addCommand('group', {
    help = 'Ukáže tvou group'
}, function(source, args, raw)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()

    if group == 'mod' then
        group = 'staff'
    elseif group == 'admin' then
        group = 'admin'
    else
        group = 'hráč'
    end

    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Jsi '..group,
        type = 'info',
        icon = 'user',
        duration = 6000
    })
end)

-- /job
lib.addCommand('job', {
    help = 'Ukáže tvou pracovní pozici'
}, function(source, args, raw)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Pozice',
        description =  xPlayer.getJob().grade_label,
        type = 'info',
        icon = 'user',
        duration = 10000
    })
    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Práce',
        description = xPlayer.getJob().label,
        type = 'info',
        icon = 'user',
        duration = 10000
    })
end)

-- /bank
if Config.BankCommand then
    lib.addCommand('bank', {
        help = 'Ukáže tvůj zůstatek na účtě'
    }, function(source, args, raw)
        local xPlayer = ESX.GetPlayerFromId(source)
        local bank = xPlayer.getAccount("bank")
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Zůstatek: '..bank.money,
            type = 'info',
            icon = 'building-columns',
            duration = 6000
        })
    end)
end

-- /transfer
if Config.TransferCommandAllow then
    lib.addCommand(Config.TransferCommand, {
        help = 'Pošle hráči peníze',
        params = {
            {
                name = 'target',
                type = 'playerId',
                help = 'Číslo účtu',
            },
            {
                name = 'count',
                type = 'number',
                help = 'Částka',
            },
        },
    }, function(source, args, raw)
        tPlayer = ESX.GetPlayerFromId(args.target)
        if args.target == source then
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Převod',
                description = 'Nemůžeš poslat peníze sám sobě',
                type = 'error',
                icon = 'building-columns',
                duration = 6000
            })
        else
            if tPlayer == nil then
                TriggerClientEvent('ox_lib:notify', source, {
                    title = 'Převod',
                    description = 'Číslo účtu je neplatné',
                    type = 'error',
                    icon = 'building-columns',
                    duration = 6000
                })
            else
                xPlayer.removeAccountMoney(source, args.count)
                TriggerClientEvent('ox_lib:notify', source, {
                    title = 'Převod',
                    description = 'Odeslal jsi peníze: '..args.count,
                    type = 'success',
                    icon = 'building-columns',
                    duration = 6000
                })
    
                tPlayer.addAccountMoney(args.target, args.count)
                TriggerClientEvent('ox_lib:notify', args.target, {
                    title = 'Převod',
                    description = 'Přišli ti peníze: '..args.count,
                    type = 'success',
                    icon = 'building-columns',
                    duration = 6000
                })
            end
        end
    end)
end

-- /try
if Config.Try then
    lib.addCommand('try', {
        help = 'Napíše ano/ne',
    }, function(source, args, raw)
        TriggerClientEvent('hoax_basics:try', source)
    end)
end


-- /zde 
if Config.Zde then
    lib.addCommand('zde', {
        help = 'Vytvoří zde text',
        params = {
            {
                name = 'input',
                type = 'string',
                help = 'text',
            },
        },
    }, function(source, args, raw)
        local text = args.input
        TriggerClientEvent('hoax_basics:zde', text)
    end)
end