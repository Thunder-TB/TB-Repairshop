ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('tbrepairshop:repairVehicle', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= Config.repairCost then
        xPlayer.removeMoney(Config.repairCost)
        cb(true)
    else
        cb(false)
    end
end)