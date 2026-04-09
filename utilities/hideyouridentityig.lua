local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()

local LocalPlayerName = LocalPlayer.Name
local LocalPlayerDisplayName = LocalPlayer.DisplayName
local enableme = 1

bitdancer999 = function()
	pcall(function()
		local universe = game:GetDescendants()
		for i = 1, #universe do
			if universe[i].ClassName == "TextLabel" then
				if string.find(universe[i].Text, LocalPlayerName) then
					universe[i].Text = string.gsub(universe[i].Text, LocalPlayerName, "Bitdancer")
					universe[i].Changed:Connect(function()
						universe[i].Text = string.gsub(universe[i].Text, LocalPlayerName, "Bitdancer")
					end)
				end

				if string.find(universe[i].Text, LocalPlayerDisplayName) then
					universe[i].Text = string.gsub(universe[i].Text, LocalPlayerDisplayName, "Bitdancer")
					universe[i].Changed:Connect(function()
						universe[i].Text = string.gsub(universe[i].Text, LocalPlayerDisplayName, "Bitdancer")
					end)
				end
			end
		end

		game.DescendantAdded:Connect(function(descendant)
			if descendant.ClassName == "TextLabel" then
				if string.find(descendant.Text, LocalPlayerName) then
					descendant.Text = string.gsub(descendant.Text, LocalPlayerName, "Bitdancer")
					descendant.Changed:Connect(function()
						descendant.Text = string.gsub(descendant.Text, LocalPlayerName, "Bitdancer")
					end)
				end
			end
		end)

		game.DescendantAdded:Connect(function(descendant)
			if descendant.ClassName == "TextLabel" then
				if string.find(descendant.Text, LocalPlayerDisplayName) then
					descendant.Text = string.gsub(descendant.Text, LocalPlayerDisplayName, "Bitdancer")
					descendant.Changed:Connect(function()
						descendant.Text = string.gsub(descendant.Text, LocalPlayerDisplayName, "Bitdancer")
					end)
				end
			end
		end)
	end)
end

if enableme == 1 then
	bitdancer999()
	warn("GOOD BOYYY, YOU'RE BITDANCER NOW BLUD")
elseif enableme == 0 then
	print("FUCK YOU NGAAAAAAAA")
end

--// Retarded code, please don't mind. Ts might be helpful //--
