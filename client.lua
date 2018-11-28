-----------------------------------
--- Vote to Kick, Made by FAXES ---
-----------------------------------

local playerVoted = false

RegisterNetEvent('FaxVTK:SubmitVote')
AddEventHandler('FaxVTK:SubmitVote', function(vote)
    local src = source
    if playerVoted then
        TriggerEvent("chatMessage", "^*^1You have already voted!")
    else
        if vote == "yes" then
            TriggerServerEvent("FaxVTK:SendVote")
            TriggerEvent("chatMessage", "^2You have voted!")
        elseif vote == "no" then
            TriggerEvent("chatMessage", "^2You have voted!")
        end
        playerVoted = true
    end
end)

RegisterNetEvent('FaxVTK:ResetVotes')
AddEventHandler('FaxVTK:ResetVotes', function()
    playerVoted = false
end)