--[[
Lavet af TeNtE
 ]]

local servername = "Crystal Community"; 

local menuEnabled = false 

AddEventHandler("playerSpawned", function(spawn)
	SetEntityInvincible(GetPlayerPed(-1),true)
	SetEntityVisible(GetPlayerPed(-1),false)
	FreezeEntityPosition(GetPlayerPed(-1),true)
	DoScreenFadeOut(2000)
end)

RegisterNetEvent("ToggleSpawnMenu")
AddEventHandler("ToggleSpawnMenu", function()
	ToggleSpawnMenu()
end)

RegisterNetEvent("KillSpawnMenu")
AddEventHandler("KillSpawnMenu", function()
	killSpawnMenu() 
	DoScreenFadeIn(5000)
end)

function ToggleSpawnMenu()
	menuEnabled = not menuEnabled
	if ( menuEnabled ) then
		DoScreenFadeOut(1000)
		SetNuiFocus( true, true ) 
		SendNUIMessage({
			showPlayerMenu = true 
		})
	else 
		SetNuiFocus( false )
		SendNUIMessage({
			showPlayerMenu = false
		})
	end 
end 

function killSpawnMenu()
	SetEntityInvincible(GetPlayerPed(-1),false)
	SetEntityVisible(GetPlayerPed(-1),true)
	FreezeEntityPosition(GetPlayerPed(-1),false) 
	SetNuiFocus( false )
	SendNUIMessage({
		showPlayerMenu = false
	})
	menuEnabled = false

end

RegisterNUICallback('close', function(data, cb)  
  ToggleSpawnMenu()
  cb('ok')
end)

RegisterNUICallback('spawnButton', function(data, cb)
	if not (#data.firstname>0) and not (#data.lastname>0) and not (#data.age>0) then
		ToggleSpawnMenu()
		ToggleSpawnMenu()
	else
		local source = source
		local gender = data.gender
		Citizen.Wait(10000)
		TriggerServerEvent("vrp_spawn_screen:updateinfo", data)
		TriggerEvent("vrp_spawn_screen:spawn", source, gender)
		SetNotificationTextEntry("STRING")
  		AddTextComponentString("~g~Velkommen til ~w~Crystal Community ~b~".. servername .."~w~!")
		DrawNotification(true, false)
		Citizen.Wait(5000)
  		killSpawnMenu()
		DoScreenFadeIn(5000)
  		cb('ok')
	end
end)
