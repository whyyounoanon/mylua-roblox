--[[
    Credits:
    https://raw.githubusercontent.com/wh0asked1/Script-Holder_wh0/refs/heads/main/TSBG-FIXLAGS
    https://github.com/Exunys/Remove-Surface-Textures-and-Effects/blob/main/Main.lua
]]
--// Forked version of https://raw.githubusercontent.com/wh0asked1/Script-Holder_wh0/refs/heads/main/TSBG-FIXLAGS \\--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
Workspace.StreamingEnabled = true
--print("StreamingEnabled:", Workspace.StreamingEnabled)--
local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Thrown = Workspace:FindFirstChild("Thrown")
local ToDisable = {
	Textures = true,
	VisualEffects = true,
	Parts = true,
	Particles = true,
	Sky = true,
}

local ToEnable = {
	FullBright = false,
}

local effectstoremove = {
	ParticleEmitter = true,
	Trail = true,
	Fire = true,
	Smoke = true,
	Sparkles = true,
	Beam = true,
	Explosion = true,
}

local Stuff = {}
for _, v in ipairs(game:GetDescendants()) do
	if ToDisable.Parts and v:IsA("BasePart") and v:IsA("Part") then
		v.Material = Enum.Material.SmoothPlastic
		v.Reflectance = 0
	end

	if ToDisable.Particles and effectstoremove[v.ClassName] then
		v:Destroy()
	end

	if
		ToDisable.VisualEffects
		and (v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect"))
	then
		v.Enabled = false
	end

	if ToDisable.Textures and (v:IsA("Decal") or v:IsA("Texture")) then
		v.Texture = ""
	end

	if ToDisable.Sky and v:IsA("Sky") then
		v:Destroy()
	end
end

if ToEnable.FullBright then
	Lighting.GlobalShadows = false
	Lighting.FogEnd = math.huge
	Lighting.FogStart = math.huge
	Lighting.Brightness = 5
	Lighting.GlobalShadows = false
	Lighting.Ambient = Color3.new(1, 1, 1)
	Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
end

local function rmefp(part)
	if part then
		for _, d in ipairs(part:GetDescendants()) do
			if effectstoremove[d.ClassName] then
				d:Destroy()
			end
		end
	end
end

task.spawn(function()
	while true do
		for _, player in ipairs(Players:GetPlayers()) do
			local char = player.Character
			if char then
				for _, part in ipairs(char:GetChildren()) do
					if part:IsA("BasePart") then
						rmefp(part)
					end
				end
			end
		end

		local npc = Workspace:FindFirstChild("Weakest Dummy")
		if npc then
			rmefp(npc)
		end

		local terrain = Workspace:FindFirstChild("Terrain")
		if terrain then
			for _, d in ipairs(terrain:GetDescendants()) do
				if d.Name == "SmokeBack" or d.Name == "Attachment" then
					d:Destroy()
				end
			end
		end

		task.wait(0.65)
	end
end)

if Thrown then
	RunService.Heartbeat:Connect(function()
		for _, obj in ipairs(Thrown:GetChildren()) do
			if obj:IsA("Model") then
				if obj.Name ~= "Aurora" and obj.Name ~= "Donation Leaderboard" then
					obj:Destroy()
				end
			end
		end
	end)
end

pcall(function()
	setfpscap(9 * 9)
	setfflag("DFIntPhysicsReceiverMaxBandwidthBps", "1")
	setfflag("DFIntTextureQualityOverride", "0")
	setfflag("FIntFRMMinGrassDistance", "0")
	setfflag("DFIntDebugRestrictGCDistance", "1")
	setfflag("FFlagDebugDisplayFPS", "true")
	setfflag("FIntRenderShadowIntensity", "0")
	setfflag("DFIntCSGLevelOfDetailSwitchingDistance", "0")
	setfflag("DFIntCSGLevelOfDetailSwitchingDistanceL12", "0")
	setfflag("DFIntCSGLevelOfDetailSwitchingDistanceL23", "0")
	setfflag("DFIntCSGLevelOfDetailSwitchingDistanceL34", "0")
	setfflag("DFIntNetworkPrediction", "1")
	setfflag("DFIntPhysicsStepsPerFrame", "1")
	setfflag("FFlagDisableDepthOfField", "true")
	settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end)
--// Ts basically just combination of those lua i skidded, will improve this later --\\
