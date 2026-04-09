--// Credits: Windows81(https://github.com/Windows81/Personal-Roblox-Client-Scripts/blob/main/no-render.lua) for white-screen. And credits Windows81 again for the animation disabler/destroyer(https://github.com/Windows81/Personal-Roblox-Client-Scripts/blob/main/anim.lua) --//
--[[
    These fflags always availvable in any executors. You can use your executor's fflag bypasses to gain access more into fflag but it has a lots of vulnerabilities so i wouldn't recommend doing that, unless you really need to.
	And lastly, this norender removes all gui/ui so, i recommended you to use it when using some scripts like bloxfruits sailor piece. This one designed for using exploits to farm without consuming much resources of your devices, in return gui/ui/terrain/fog are removed or modified.
	But you also can edit it into a minimal no render where it doesn't destroy guis, and has fullbright or whatever you wanted it to be. Again, ts is open-sourced n forkable so i don't rlly cares if you gonna skid it since ts is availvable everywhere.
]]

setfpscap(9 * 9)
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

hookfunction(print, function(...) end)
hookfunction(warn, function(...) end)
local oldError
oldError = hookfunction(error, function(msg, lvl)
	return oldError("", 0)
end)

pcall(function()
	settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end)

local args = _E and _E.ARGS or {}
local SET_DISABLED = args[1]
if SET_DISABLED == nil then
	SET_DISABLED = not _G.rndr_dis
end

local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local plrs = game:GetService("Players")
local lighting = game:GetService("Lighting")
local ss = game:GetService("SoundService")
local stgui = game:GetService("StarterGui")
local cam = workspace.CurrentCamera
local lp = plrs.LocalPlayer
local gui = lp:FindFirstChildOfClass("PlayerGui")

local Iwilldestroyem = {
	ParticleEmitter = true,
	Beam = true,
	Trail = true,
	PointLight = true,
	SpotLight = true,
	SurfaceLight = true,
}

local doyouthinkyoucanrunningawayfrome_questionmarked = {
	Decal = true,
	Texture = true,
	SurfaceAppearance = true,
}

local function noguiplease()
	if not gui then
		return
	end
	for _, v in next, gui:GetChildren() do
		pcall(function()
			v.Enabled = false
		end)
	end
	pcall(function()
		stgui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
	end)
end

local function nosoundspleasenga()
	for _, v in next, workspace:GetDescendants() do
		if v:IsA("Sound") then
			v:Stop()
			v.Volume = 0
		end
	end

	ss.RespectFilteringEnabled = true
	for _, v in next, ss:GetChildren() do
		if v:IsA("Sound") then
			v:Stop()
			v.Volume = 0
		end
	end
end

local function nofrog()
	local lighting2 = game:GetService("Lighting")
	lighting2.FogEnd = 1e10
	lighting2.FogStart = 1e10
	lighting2.FogColor = Color3.new(0.5, 0.5, 0.5)
end

nofrog()

game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(nofrog)
game:GetService("Lighting"):GetPropertyChangedSignal("FogStart"):Connect(nofrog)
game:GetService("Lighting"):GetPropertyChangedSignal("FogColor"):Connect(nofrog)

local function nolightyagami() --// I actually loves light yagami, no hate. //
	for _, v in next, lighting:GetChildren() do
		v:Destroy()
	end
	
	lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
	lighting.Brightness = 1
	lighting.ClockTime = 12
	lighting.GlobalShadows = false
end

local function noterrian()
	local terrain = workspace:FindFirstChildOfClass("Terrain")
	if not terrain then
		return nil
	end

	terrain:Clear()
	terrain.WaterWaveSize = 0
	terrain.WaterWaveSpeed = 0
end

local function noanimationstungtung(charac)
	charac = charac or lp.Character
	if not charac then
		return
	end
	local humanoid = charac:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		return
	end
	local anim = humanoid:FindFirstChildOfClass("Animator")
	if not anim then
		return
	end
	for _, t in next, anim:GetPlayingAnimationTracks() do
		t:Stop(0)
	end
end

lp.CharacterAdded:Connect(function(char)
	char:WaitForChild("Humanoid").AnimationPlayed:Connect(function(track)
		track:Stop()
	end)
end)

local function applying()
	cam.CameraType = Enum.CameraType.Scriptable
	for _, v in next, workspace:GetDescendants() do
		if Iwilldestroyem[v.ClassName] then
			v.Enabled = false
		elseif doyouthinkyoucanrunningawayfrome_questionmarked[v.ClassName] then
			v.Transparency = 1
		elseif v:IsA("BasePart") or v:IsA("Part") then
			v.Material = Enum.Material.ForceField
			v.Color = Color3.new(0, 0, 0)
			v.Transparency = 1
			v.CastShadow = false
			v.Reflectance = 0
		elseif v:IsA("Sound") then
			v:Stop()
			v.Volume = 0
		end
	end
	noanimationstungtung()
	rs:Set3dRenderingEnabled(false)
end

local function restorerenderers()
	rs:Set3dRenderingEnabled(true)
	cam.CameraType = Enum.CameraType.Custom
end

workspace.DescendantAdded:Connect(function(v)
	if not _G.rndr_dis then
		return
	end

	if v:IsA("BasePart") then
		v.Material = Enum.Material.ForceField
		v.Color = Color3.new(0, 0, 0)
		v.Transparency = 1
		v.CastShadow = false
	elseif v:IsA("Decal") or v:IsA("Texture") then
		v.Transparency = 1
	elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
		v.Enabled = false
	elseif v:IsA("Sound") then
		v:Stop()
		v.Volume = 0
	end
end)

if SET_DISABLED then
	noguiplease()
	nolightyagami()
	nosoundspleasenga()
	noterrian()
	gui.ChildAdded:Connect(function(v)
		pcall(function()
			v.Enabled = false
		end)
	end)
	lp.CharacterAdded:Connect(function(charac)
		task.defer(noanimationstungtung, charac)
	end)
	uis.WindowFocusReleased:Connect(applying)
	uis.WindowFocused:Connect(restorerenderers)
else
	restorerenderers()
end

_G.rndr_dis = SET_DISABLED
