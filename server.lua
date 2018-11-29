-----------------------------------
--- Vote to Kick, Made by FAXES ---
-----------------------------------

local voteCount = 0
local canStartVote = true
local voteActive = false
local tPlayer = nil

local svrSeconds = 0
local svrMinutes = 0

RegisterCommand(voteCmd, function(source, args, rawCommand)
    local tID = args[1]

    if canStartVote == true then
        if tID then 
            if GetPlayerName(args[1]) then
                TriggerClientEvent("chatMessage", -1, "^*^1VOTE TO KICK ^7 Kick Player ^3" .. GetPlayerName(args[1]) .. "^7? Use /" .. voteYesCmd .. " & /" .. voteNoCmd)
                voteActive = true
                voteCount = 0
                canStartVote = false
                svrSeconds = 0
                svrMinutes = 0
                tPlayer = tID
            else
                TriggerClientEvent("chatMessage", source, "Please specify a valid player.")
            end
        else
            TriggerClientEvent("chatMessage", source, "Please specify a player /" .. voteCmd .. " <ID>.")
        end
    else
        TriggerClientEvent("chatMessage", source, "Please wait before starting another kick-to-vote.")
    end
end)

RegisterCommand(voteYesCmd, function(source, args, rawCommand)
    if voteActive then
        TriggerClientEvent("FaxVTK:SubmitVote", source, "yes")
    else
        TriggerClientEvent("chatMessage", source, "There is no active vote-to-kick.")
    end
end)

RegisterCommand(voteNoCmd, function(source, args, rawCommand)
    if voteActive then
        TriggerClientEvent("FaxVTK:SubmitVote", source, "no")
    else
        TriggerClientEvent("chatMessage", source, "There is no active vote-to-kick.")
    end
end)

RegisterCommand(CancelCmd, function(source, args, rawCommand)
    if faxCore then
        if IsPlayerAceAllowed(source, "owner") or IsPlayerAceAllowed(source, "snradmin") or IsPlayerAceAllowed(source, "fadmin") then
            voteActive = false;voteCount = 0;canStartVote = false
            svrSeconds = 0;svrMinutes = 0
            TriggerClientEvent("chatMessage", source, "^*^1VOTE TO KICK ^7was canceled by an admin")
        else
            TriggerClientEvent('Fax-Core:NoPerms', source)
        end
    else
        if IsPlayerAceAllowed(source, "VTKBypass") then
            voteActive = false;voteCount = 0;canStartVote = false
            svrSeconds = 0;svrMinutes = 0
        else
            TriggerClientEvent("chatMessage", source, "^1Insufficient Permissions.")
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		svrSeconds = svrSeconds + 1
		if svrSeconds == 60 then
			svrSeconds = 0
            svrMinutes = svrMinutes + 1
        end
        if svrMinutes == voteWaitTime then
            canStartVote = true
            svrSeconds = 0
            svrMinutes = 0
        end
	end
end)

RegisterServerEvent("FaxVTK:SendVote")
AddEventHandler("FaxVTK:SendVote", function()
    voteCount = voteCount + 1
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(1000)
        if voteActive then
            if voteCount == minVoteAmt then
                if tPlayer ~= nil then
                    DropPlayer(tPlayer, kickMessage)
                    if playerKickMessages then
                    TriggerClientEvent("chatMessage", -1, "^*^3Player: " .. GetPlayerName(tPlayer) .. " was vote ^1kicked ^3from the server")
                    end
                end
                voteActive = false
                voteCount = 0
                tPlayer = nil
                TriggerClientEvent("FaxVTK:ResetVotes", -1)
            end
        end
	end
end)