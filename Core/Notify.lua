return function(text)
	local msg = Instance.new("Hint", workspace)
	msg.Text = text
	
	task.delay(2,function()
		msg:Destroy()
	end)
end
