--// LOADER FINAL PRO (FIXED LINKS)

local Modules = {}

Modules.Login = loadstring(game:HttpGet("https://raw.githubusercontent.com/NyxStrickss/Hub-/main/Core/Login.lua"))()
Modules.Config = loadstring(game:HttpGet("https://raw.githubusercontent.com/NyxStrickss/Hub-/main/Core/Config.lua"))()
Modules.UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NyxStrickss/Hub-/main/Core/UI.lua"))()
Modules.Notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/NyxStrickss/Hub-/main/Core/Notify.lua"))()

-- 🔐 LOGIN
Modules.Login:Start(function()

	-- 🚀 INIT UI
	local UI = Modules.UI:Init(Modules.Config)

	-- 📦 LOAD MODULES
	loadstring(game:HttpGet("https://raw.githubusercontent.com/NyxStrickss/Hub-/main/Modules/Visual.lua"))()(UI, Modules)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/NyxStrickss/Hub-/main/Modules/Radar.lua"))()(UI, Modules)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/NyxStrickss/Hub-/main/Modules/Player.lua"))()(UI, Modules)

	Modules.Notify("Hub cargado correctamente 🧠")

end)
