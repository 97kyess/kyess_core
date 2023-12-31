Citizen.CreateThread(function() -- TENTO SCRIPT VAM ODOBERE DEFAULT MAPU ( HP A ARMOR)
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(500)
    SetRadarBigmapEnabled(false, false)
    while true do
        Wait(500)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end)