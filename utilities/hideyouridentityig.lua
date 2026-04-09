local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local LocalPlayerName = LocalPlayer.Name
local LocalPlayerDisplayName = LocalPlayer.DisplayName
local enableme = 1

bitdancer999 = function()
	pcall(function()
		local allSpace = game:GetDescendants()
		for i = 1, #allSpace do
			if allSpace[i].ClassName == "TextLabel" then
				if string.find(allSpace[i].Text, LocalPlayerName) then
					allSpace[i].Text = string.gsub(allSpace[i].Text, LocalPlayerName, "Bitdancer")
					allSpace[i].Changed:Connect(function()
						allSpace[i].Text =
							string.gsub(allSpace[i].Text, LocalPlayerName, "Bitdancer")
					end)
				end
				if string.find(allSpace[i].Text, LocalPlayerDisplayName) then
					allSpace[i].Text =
						string.gsub(allSpace[i].Text, LocalPlayerDisplayName, "Bitdancer")
					allSpace[i].Changed:Connect(function()
						allSpace[i].Text =
							string.gsub(allSpace[i].Text, LocalPlayerDisplayName, "Bitdancer")
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
					descendant.Text =
						string.gsub(descendant.Text, LocalPlayerDisplayName, "Bitdancer")
					descendant.Changed:Connect(function()
						descendant.Text =
							string.gsub(descendant.Text, LocalPlayerDisplayName, "Bitdancer")
					end)
				end
			end
		end)
	end)
end

if enableme == 1 then
    bitdancer999()
    warn('good boy')
elseif enableme == 0 then
    print('ok nga.')
end

--// Retarded code, please don't mind. Ts might be helpful //--
