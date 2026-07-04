local function ch_addgroup_staff(player,choice)
  local user_id = vRP.getUserId(player)

  if user_id and vRP.hasPermission(user_id,"player.group.add.staff") then

    local ranks = {}

    for groupName,_ in pairs(groups_cfg.groups) do
      table.insert(ranks,{
        value = groupName,
        label = groupName
      })
    end

    TriggerClientEvent("villas_admin:openRankMenu",player,{
      action = "add",
      ranks = ranks
    })
  end
end

local function ch_removegroup_staff(player,choice)
  local user_id = vRP.getUserId(player)

  if user_id and vRP.hasPermission(user_id,"player.group.remove.staff") then

    local ranks = {}

    for groupName,_ in pairs(groups_cfg.groups) do
      table.insert(ranks,{
        value = groupName,
        label = groupName
      })
    end

    TriggerClientEvent("villas_admin:openRankMenu",player,{
      action = "remove",
      ranks = ranks
    })
  end
end
