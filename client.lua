RegisterNetEvent("villas_admin:openRankMenu")
AddEventHandler("villas_admin:openRankMenu",function(data)

    local input = lib.inputDialog(
        data.action == "add" and "Tilføj Rang" or "Fjern Rang",
        {
            {
                type = "number",
                label = "Spiller ID",
                required = true
            },
            {
                type = "select",
                label = "Rank",
                options = data.ranks,
                searchable = true,
                required = true
            }
        }
    )

    if not input then
        return
    end

    TriggerServerEvent("villas_admin:rankAction",{
        id = input[1],
        group = input[2],
        action = data.action
    })
end)