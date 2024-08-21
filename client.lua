ESX = exports["es_extended"]:getSharedObject()


function createBlip(coords)
    local blip = AddBlipForCoord(coords)

    SetBlipSprite(blip, 643)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 3)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Car Repair")
    EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
    for _, coords in pairs(Config.blipCoords) do
        createBlip(coords)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local isNearAnyBlip = false
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if vehicle ~= 0 then
            for _, coords in pairs(Config.blipCoords) do
                local distance = #(playerCoords - coords)

                if distance < 5.0 then
                    isNearAnyBlip = true
                    local engineHealth = GetVehicleEngineHealth(vehicle)
                    local bodyHealth = GetVehicleBodyHealth(vehicle)
                    if engineHealth < 1000 or bodyHealth < 1000 then
                        lib.showTextUI('[E] - repair vehicle')

                        if IsControlJustReleased(0, 38) then
                            ESX.TriggerServerCallback('tbrepairshop:repairVehicle', function(repaired)
                                if repaired then
                                    lib.progressBar({
                                        duration = Config.RepairTime,
                                        label = 'Repair in progress',
                                        useWhileDead = false,
                                        canCancel = false,
                                        disable = {
                                            car = true,
                                        },
                                    })
                                    SetVehicleFixed(vehicle)
                                    SetVehicleDeformationFixed(vehicle)
                                    ESX.ShowNotification("Your vehicle has been repaired.")
                                else
                                    ESX.ShowNotification("You don't have enough money.")
                                end
                            end)
                        end
                    else
                        lib.showTextUI("Your vehicle doesn't need any repairs.")
                    end
                end
            end

            if not isNearAnyBlip then
                lib.hideTextUI()
            end

            while not isNearAnyBlip do
                Citizen.Wait(500)
                playerCoords = GetEntityCoords(PlayerPedId())
                for _, coords in pairs(Config.blipCoords) do
                    local distance = #(playerCoords - coords)
                    if distance < 5.0 then
                        isNearAnyBlip = true
                        break
                    end
                end
            end
        else
            lib.hideTextUI()
            Citizen.Wait(500)
        end
    end
end)
