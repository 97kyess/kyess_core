local ragdol = false
local canRag = true
RegisterCommand("rag", function()
    if canRag then
        if not ragdol then
            ragdol = true
            local ped = PlayerPedId()
            CreateThread(function()
                while ragdol do
                    SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
                    Wait(0)
                end
            end)
        else
            ragdol = false
        end
    else
        exports['dpemotes']:EmoteCancel()
    end
end, false)

RegisterKeyMapping('rag', "<FONT FACE='Poppins'>"..'(Animace) Upadnutí na zem', 'keyboard', 'OEM_3')

function toggleRag(bool)
    canRag = bool
end