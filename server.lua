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

print('Version. 1.0')
print('This is my very first script that I uploaded to github')
print('thank you for using my scripts')
print('https://github.com/Vacedcc/SIMPLE-ANTICHEAT')
print('Join my Discord for more https://discord.gg/pQbu9QUgbN')

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function sendToDiscord(color, name, title, message, footer)
	local embed = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. title .."**",
			  ["description"] = message,
			  ["footer"] = {
				  ["text"] = footer,
			  },
		  }
	  }  
	PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('simple-anticheat:senddiscord')
AddEventHandler('simple-anticheat:senddiscord', function(msg)
    sendToDiscord("12745742", "ANTICHEAT", GetPlayerName(source) .." | ID: ".. source .."", "\n**Reason:** The player pressed a suspicious key checks if this player is modding (INS, DEL)", "Vaced - https://github.com/Vacedcc/SIMPLE-ANTICHEAT")
end)

RegisterServerEvent('simple-anticheat:kick')
AddEventHandler('simple-anticheat:kick', function(msg)
    DropPlayer(source, "You have been kicked from the server")
end)
