return function(UI, Modules)

	local page = UI:CreateTab("Visual")
	page.Visible = true
	
	UI:Toggle(page,"Crosshair",true,function(v)
		print("Crosshair:",v)
	end)

end
