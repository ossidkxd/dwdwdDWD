--[[ 
Lavet af TeNtE
 ]]

male_models = {'mp_m_freemode_01'}
female_models = {'mp_f_freemode_01'}

RegisterNetEvent("vrp_spawn_screen:spawn")
AddEventHandler("vrp_spawn_screen:spawn", function(source, gender)
    if gender == "1" then
      model = GetHashKey(male_models[ math.random( #male_models ) ] )
    elseif gender == "0" then
      model = GetHashKey(female_models[ math.random( #female_models ) ] )
    end

    RequestModel(model)
    while not HasModelLoaded(model) do
      Citizen.Wait(1000)
    end
    SetPlayerModel(PlayerId(), model)
   -- SetPedRandomComponentVariation(GetPlayerPed(-1), true)
    SetModelAsNoLongerNeeded(model)
		
    SetEntityCoords(GetPlayerPed(-1), tonumber("482.07513427734"), tonumber("-125.39147949219"), tonumber("61.178573608398"), 1, 0, 0, 1) --482.07513427734,-125.39147949219,61.178573608398
end)
