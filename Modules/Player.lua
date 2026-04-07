return function(UI, Modules)

	local page = UI:CreateTab("Player")
	
	UI:Toggle(page,"Fast Mode",false,function(v)
		print("Speed toggle:",v)
	end)

end
