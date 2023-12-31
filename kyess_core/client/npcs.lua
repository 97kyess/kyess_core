CreateThread(function()
    for k,v in pairs(Config.NPCS) do 
		local model = v[1]
		RequestModel(model)
		while not HasModelLoaded(model) do
			Wait(50)
		end
		while not HasAnimDictLoaded("timetable@reunited@ig_10") or not HasAnimDictLoaded("amb@world_human_drinking@coffee@male@idle_a") or not HasAnimDictLoaded("anim@heists@prison_heiststation@cop_reactions") do
			RequestAnimDict("timetable@reunited@ig_10")
			RequestAnimDict("amb@world_human_drinking@coffee@male@idle_a")
			RequestAnimDict("anim@heists@prison_heiststation@cop_reactions")
			Wait(10)
		end
		spawnedPed = CreatePed(4, model, v[2], v[3], v[4], v[5], false, true)
		SetModelAsNoLongerNeeded(model)
		FreezeEntityPosition(spawnedPed, true)
		SetEntityInvincible(spawnedPed, true)
		SetBlockingOfNonTemporaryEvents(spawnedPed, true)
		if v[6] ~= "Sit" and v[6] ~= "Coffe" and v[6] ~= "KeyboardType" then
			TaskStartScenarioInPlace(spawnedPed, v[6], 0, false)
		elseif v[6] == "Sit" then
			TaskPlayAnim(spawnedPed, "timetable@reunited@ig_10", "base_amanda", 2.0, 2.0, -1, 1, 0, false, false, false)
			RemoveAnimDict("timetable@reunited@ig_10")
		elseif v[6] == "KeyboardType" then
			TaskPlayAnim(spawnedPed, "anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", 2.0, 2.0, -1, 1, 0, false, false, false)
			RemoveAnimDict("anim@heists@prison_heiststation@cop_reactions")
		elseif v[6] == "Coffe" then
			while not HasModelLoaded(`p_amb_coffeecup_01`) do
				RequestModel(`p_amb_coffeecup_01`)
				Wait(10)
			end
			local x,y,z = table.unpack(GetEntityCoords(spawnedPed))
			prop = CreateObject(`p_amb_coffeecup_01`, x, y, z+0.2,  true,  true, true)
			AttachEntityToEntity(prop, spawnedPed, GetPedBoneIndex(spawnedPed, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

			TaskPlayAnim(spawnedPed, "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 2.0, 2.0, -1, 1, 0, false, false, false)
			RemoveAnimDict("amb@world_human_drinking@coffee@male@idle_a")
			SetModelAsNoLongerNeeded("p_amb_coffeecup_01")
		end
	end
end)

