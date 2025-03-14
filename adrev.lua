RegisterCommand("adrev", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "admin.revive") then
        local target = tonumber(args[1])
        if target and GetPlayerPing(target) > 0 then
            TriggerClientEvent("revivePlayer", target)
            sendToDiscord("Admin Revive", "Player **" .. GetPlayerName(source) .. "** revived **" .. GetPlayerName(target) .. "**.")
        else
            TriggerClientEvent("chat:addMessage", source, { args = { "^1Invalid player ID!" } })
        end
    else
        TriggerClientEvent("chat:addMessage", source, { args = { "^1Insufficient permissions!" } })
    end
end, false)

function sendToDiscord(title, message)
    local webhook = "Put Webhook Here"
    local embed = {
    {
        ["title"] = title,
        ["description"] = message,
        ["color"] = 16711680,
        ["footer"] = { ["text"] = os.date("%Y-%m-%d %H:%M:%S") }
    }
}
PerformHttpRequest(webhook, function(err, text, headers) end, "POST", json.encode({username = "Admin Logs", embeds = embed}), { ["Content-Type"] = "application/json" })
end 
