ESX = exports["es_extended"]:getSharedObject()
lib.callback.register('rst_givecar:getGroup', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getGroup()
end)

lib.callback.register('rst_givecar:getPlayers', function()
    return GetPlayers()
end)

function RandomPlate(length)
    local charset = "ABCDEFGHIJKLMNOPQRSTUVrstYZ0123456789"
    local result = {}
    local random = math.random

    for i = 1, length do
        local randomChar = charset:sub(random(1, #charset), random(1, #charset))
        table.insert(result, randomChar)
    end

    return table.concat(result)
end

RegisterNetEvent('rst_givecar:giveToPlayer')
AddEventHandler('rst_givecar:giveToPlayer',function (id,model,plate)
    plate = string.upper(plate)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not rst.AdminGroups[xPlayer.getGroup()] then
        rst.BAN(source,"Attempting to exploit rst_givevehicle script [Missing Group]")
        return
    end

    local xTarget = ESX.GetPlayerFromId(id)
    if plate == nil then
        plate = RandomPlate(8)
    end
    local jsontable = {
        model = joaat(model),
        plate = plate,
        fuelLevel = 100.0,
        bodyHealth = 1000.0,
    }
    TriggerClientEvent('spawnv', id, model, plate)
end)

RegisterNetEvent('rst_givevehicle:setOwned')
AddEventHandler('rst_givevehicle:setOwned',function (props,id)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(id)

    if not rst.AdminGroups[xPlayer.getGroup()] then
        rst.BAN(source,"Attempting to exploit rst_givevehicle script [Missing Group]")
        return
    end

    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, stored) VALUES (@owner, @plate, @vehicle, @stored)',
	{
		['@owner']   = xTarget.identifier,
		['@plate']   = props.plate,
		['@vehicle'] = json.encode(props),
		['@stored']  = 1,
	}, function ()
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {
            title = "Success",
            description = "You have successfully given the vehicle "..props.model.." to player "..GetPlayerName(id).."!",
            type = 'success'
        })
        TriggerClientEvent('ox_lib:notify', id, {
            title = "New Vehicle Received",
            description = "You have received the vehicle "..props.model.." with plate "..props.plate.."!",
            type = 'success',
            duration = 8000
        })
	end)
end)