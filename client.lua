RegisterNetEvent("revivePlayer")
AddEventHandler("revivePlayer", function()
    local playerPed = PlayerPedId()
    SetEntityHealth(playerPed, 200)
    ClearPedBloodDamage(playerPed)
    ResetPedVisibleDamage(playerPed)
    ClearPedLastWeaponDamage(playerPed)
    print("You have been revived!")
end)

RegisterNetEvent("respawnPlayer")
AddEventHandler("respawnPlayer", function()
    local playerPed = PlayerPedId()
    local coords = vector3(307.87, -584.54, 43.28) -- Default respawn at a hospital
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, 0.0, true, false)
    SetEntityHealth(playerPed, 200)
    ClearPedBloodDamage(playerPed)
    print("You have been respawned!")
end)
