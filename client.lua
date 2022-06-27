--   _   _   ___   _____  _____ ______  _____  _____ 
--  | | | | / _ \ /  __ \|  ___||  _  \/  __ \/  __ \
--  | | | |/ /_\ \| /  \/| |__  | | | || /  \/| /  \/
--  | | | ||  _  || |    |  __| | | | || |    | |    
--  \ \_/ /| | | || \__/\| |___ | |/ / | \__/\| \__/\
--   \___/ \_| |_/ \____/\____/ |___/   \____/ \____/
--   

-- Version. 1.0
-- This is my very first script that I uploaded to github
-- thank you for using my scripts
--
-- https://discord.gg/pQbu9QUgbN

ESX = nil

Citizen.CreateThread(function ()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
       PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

Citizen.CreateThread(function()

    local del_key = 178 -- if you want to change (https://docs.fivem.net/docs/game-references/controls/)

    while true do
        Citizen.Wait(1)
        if IsControlJustReleased(1, del_key) then -- Die Taste ist DEL
        TriggerServerEvent('simple-anticheat:senddiscord')
        Citizen.Wait(20)
        TriggerServerEvent('simple-anticheat:kick')
        end
    end     
end)

Citizen.CreateThread(function()

    local ins_key = 121 -- if you want to change (https://docs.fivem.net/docs/game-references/controls/)

    while true do
        Citizen.Wait(1)
        if IsControlJustReleased(1, ins_key) then -- Die Taste ist INS 
        TriggerServerEvent('simple-anticheat:senddiscord')
        Citizen.Wait(20)
        TriggerServerEvent('simple-anticheat:kick')
        end
    end     
end)