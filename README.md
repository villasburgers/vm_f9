# 🛒 VM F9 - Tilføj/Fjern Rank med ox_lib

DOCS: https://vm-store.gitbook.io/vm-store-docs

VM Tilføj/Fjern Rank er et avanceret F9 admin script til FiveM 🚀  
Det gør det muligt at **tilføje og fjerne ranks via en moderne ox_lib dropdown menu** 🔧🔥

Ranks bliver automatisk hentet fra:
`cfg/groups.lua`

---

# ✨ Features

- 🧑‍💼 F9 menu integration
- 🏷️ Tilføj / fjern ranks
- 📜 Dropdown menu via ox_lib
- ⚙️ Auto-henter grupper fra `groups_cfg.groups`
- 🔒 Permission system (vRP)
- ⚡ Let og hurtig UI
- 🎯 Admin venligt system

---

# 📥 Installation

## 1. Download scriptet
Placer mappen i dine resources:

```
resources/[vm]/vm_f9 -- Valfri sti
```

# Start i server.cfg
```
ensure vm_f9
ensure vrp
ensure oxmysql
```

# Replace admin functions

Gå til:

vrp/modules/admin.lua

Fjern alle funktioner med:

ch_addgroup_staff
ch_removegroup_staff

og indsæt denne kode i stedet: (Eller gå til filen jeg har uploaded vrp/modules/admin.lua og kopier der.)

```
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
```

# Groups config

Ranks bliver hentet fra:

``cfg/groups.lua``

Alle grupper i filen bliver automatisk vist i dropdown menuen.


# 🎮 UI System (ox_lib)

Når en admin trykker:

➕ Tilføj rank
➖ Fjern rank

Åbnes en ox_lib dropdown menu med alle ranks fra config.

# 🔐 Permissions

Systemet bruger vRP permissions:

player.group.add.staff
player.group.remove.staff

Sørg for at disse er sat korrekt i din permissions fil.

# ⚙️ Requirements
- vRP framework
- ox_lib
- oxmysql

# 🚀 Usage
1. Tryk på F9 menuen
2. Vælg "Tilføj rank" eller "Fjern rank"
3. Vælg rank i dropdown
4. Bekræft handling

# 🧠 Notes
Ranks opdateres automatisk fra cfg/groups.lua (Genstart server først hvis du opdater filen.)
Ingen manuel config nødvendig for ranks
UI er lavet i ox_lib for moderne look
Sikkert server/client flow

# 🛠 Support

Hvis du har problemer:

Opret issue på GitHub
Kontakt support via Discord

# 📜 License

## Du må:

Bruge scriptet på din server
Ændre det til eget brug

## Du må ikke:

Sælge det videre
Lække det
Tage credit for scriptet
Bruge noget fra scriptet i et andet script.


# ❤️ Credits

Udviklet af VM Store / villas.burgers.alt
