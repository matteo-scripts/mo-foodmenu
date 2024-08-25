


Citizen.CreateThread(function()
    -- Adding box zones for each restaurant from Config.lua
    for _, restaurant in ipairs(Config.Restaurants) do
        exports.qtarget:AddBoxZone(restaurant.name, restaurant.coords, restaurant.size.x, restaurant.size.y, {
            name = restaurant.name,
            heading = restaurant.heading,
            debugPoly = false,
            minZ = restaurant.coords.z - (restaurant.size.z / 2),
            maxZ = restaurant.coords.z + (restaurant.size.z / 2),
        }, {
            options = {
                {
                    event = "mo_camera:client:use-photo",
                    icon = restaurant.icon,
                    label = restaurant.label,
                    args = {
                        url = restaurant.url
                    }
                }
            },
            distance = restaurant.distance
        })
    end

    -- Adding additional models from Config.lua
    for _, modelData in ipairs(Config.AdditionalModels) do
        exports.qtarget:AddTargetModel({modelData.model}, {
            options = {
                {
                    event = modelData.event,
                    icon = modelData.icon,
                    label = modelData.label,
                    args = {
                        url = modelData.url
                    },
                    distance = modelData.distance
                }
            },
            distance = modelData.distance
        })
    end
end)

-- show the ui

local active = false
local photoactive = false
local cameraprop = nil
local photoprop = nil
local presstake = false

local function SharedRequestAnimDict(animDict, cb)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)

        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(1)
        end
    end
    if cb ~= nil then
        cb()
    end
end

local function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Wait(10)
    end
end

local function FullClose()
    active = false
    presstake = false
    if cameraprop then
        DeleteEntity(cameraprop)
    end
    ClearPedTasks(PlayerPedId())
end

RegisterNetEvent("mo_camera:client:use-photo", function(data)
    local url
    if type(data) == 'table' and data.args and data.args.url then
        url = data.args.url
    end
    if not photoactive then
        photoactive = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "Show",
            photo = url
        })

        local ped = PlayerPedId()
        SharedRequestAnimDict("amb@world_human_tourist_map@male@base", function()
            TaskPlayAnim(ped, "amb@world_human_tourist_map@male@base", "base", 2.0, 2.0, -1, 1, 0, false, false, false)
        end)
        local x, y, z = table.unpack(GetEntityCoords(ped))
        if not HasModelLoaded("prop_tourist_map_01") then
            LoadPropDict("prop_tourist_map_01")
        end
        photoprop = CreateObject(GetHashKey("prop_tourist_map_01"), x, y, z + 0.2, true, true, true)
        AttachEntityToEntity(photoprop, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true,
            false, true, 1, true)
        SetModelAsNoLongerNeeded("prop_tourist_map_01")
        print("Received URL:", url)

    end
end)


RegisterNUICallback("Close", function()
    SetNuiFocus(false, false)
    photoactive = false
    if photoprop then
        DeleteEntity(photoprop)
    end
    ClearPedTasks(PlayerPedId())
end)

