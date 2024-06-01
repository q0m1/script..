local FlixGlitch = {}
FlixGlitch.log = ""

FlixGlitch.Notify = function (source,attacker_id)
    --  الاشعارات العادية
    TriggerClientEvent("pNotify:SendNotification", source, {
        text = "أستخدام ثغرة لتكريش اللعبة عليك [ " .. attacker_id .. " ] لقد حاول",
        queue = "lmao",
        type = "success",
        progressBar = false,
        timeout = 2500,
        layout = "bottomCenter",
        animation = {open = "gta_effects_open_left",close = "gta_effects_close"}
    })
    ---------------
end


return FlixGlitch