--// LOADER

local Modules = {}

Modules.Config = loadstring(game:HttpGet("https://raw.githubusercontent.com/NyxStrickss/Hub-/refs/heads/main/Core/Config.lua"))()
Modules.UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NyxStrickss/Hub-/refs/heads/main/Core/UI.lua"))()
Modules.Notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/NyxStrickss/Hub-/refs/heads/main/Core/Notify.lua"))()

-- Init UI
local UI = Modules.UI:Init(Modules.Config)

-- Load Modules
loadstring(game:HttpGet("https://raw.githubusercontent.com/NyxStrickss/Hub-/refs/heads/main/Modules/Visual.lua"))()(UI, Modules)
loadstring(game:HttpGet("URL_Radar"))()(UI, Modules)
loadstring(game:HttpGet("URL_Player"))()(UI, Modules)

Modules.Notify("Hub cargado correctamente 🧠")
