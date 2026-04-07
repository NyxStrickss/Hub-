--// LOADER

local Modules = {}

Modules.Config = loadstring(game:HttpGet("URL_Config"))()
Modules.UI = loadstring(game:HttpGet("URL_UI"))()
Modules.Notify = loadstring(game:HttpGet("URL_Notify"))()

-- Init UI
local UI = Modules.UI:Init(Modules.Config)

-- Load Modules
loadstring(game:HttpGet("URL_Visual"))()(UI, Modules)
loadstring(game:HttpGet("URL_Radar"))()(UI, Modules)
loadstring(game:HttpGet("URL_Player"))()(UI, Modules)

Modules.Notify("Hub cargado correctamente 🧠")
