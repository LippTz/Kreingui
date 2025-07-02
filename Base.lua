--// KreinHub Base UI
local Krein = {}
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", gethui and gethui() or game.CoreGui)
ScreenGui.Name = "KreinHub"
ScreenGui.ResetOnSpawn = false

local Main = Instance.new("Frame", ScreenGui)
Main.Name = "Main"
Main.Size = UDim2.new(0, 600, 0, 400)
Main.Position = UDim2.new(0.5, -300, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Visible = true

local UICorner = Instance.new("UICorner", Main)
UICorner.CornerRadius = UDim.new(0, 8)

-- Hacker-style title
local Title = Instance.new("TextLabel", Main)
Title.Text = "KreinHub - Hacker Control"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(0, 255, 100)
Title.Font = Enum.Font.Code
Title.TextSize = 22

-- Tab Container
local TabContainer = Instance.new("Frame", Main)
TabContainer.Name = "TabContainer"
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.Size = UDim2.new(0, 120, 1, -40)
TabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

-- Content Container
local ContentContainer = Instance.new("Frame", Main)
ContentContainer.Name = "ContentContainer"
ContentContainer.Position = UDim2.new(0, 120, 0, 40)
ContentContainer.Size = UDim2.new(1, -120, 1, -40)
ContentContainer.BackgroundColor3 = Color3.fromRGB(10, 10, 10)

-- Notification System
local function Notify(title, message)
	local Notif = Instance.new("TextLabel", ScreenGui)
	Notif.Text = "[" .. title .. "] " .. message
	Notif.TextColor3 = Color3.fromRGB(0, 255, 100)
	Notif.Font = Enum.Font.Code
	Notif.TextSize = 18
	Notif.BackgroundTransparency = 0.3
	Notif.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Notif.Position = UDim2.new(1, -300, 1, -40)
	Notif.Size = UDim2.new(0, 280, 0, 30)
	Notif.AnchorPoint = Vector2.new(0, 1)

	game:GetService("TweenService"):Create(Notif, TweenInfo.new(0.5), {
		Position = UDim2.new(1, -300, 1, -80)
	}):Play()
	
	task.delay(3, function()
		Notif:Destroy()
	end)
end

-- Save/Load Config
local ConfigFile = "KreinHub_Config.json"
function Krein:SaveConfig(data)
	writefile(ConfigFile, HttpService:JSONEncode(data))
	Notify("Config", "Disimpan.")
end
function Krein:LoadConfig()
	if isfile(ConfigFile) then
		local raw = readfile(ConfigFile)
		return HttpService:JSONDecode(raw)
	else
		return {}
	end
end

-- Toggle Key
UserInputService.InputBegan:Connect(function(input, gpe)
	if not gpe and input.KeyCode == Enum.KeyCode.RightControl then
		Main.Visible = not Main.Visible
	end
end)

-- API: Create Tab
function Krein:CreateTab(name)
	local Tab = Instance.new("TextButton", TabContainer)
	Tab.Text = name
	Tab.Size = UDim2.new(1, 0, 0, 30)
	Tab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Tab.TextColor3 = Color3.fromRGB(0, 255, 100)
	Tab.Font = Enum.Font.Code
	Tab.TextSize = 18

	local Content = Instance.new("ScrollingFrame", ContentContainer)
	Content.Size = UDim2.new(1, 0, 1, 0)
	Content.Visible = false
	Content.Name = name
	Content.CanvasSize = UDim2.new(0, 0, 0, 500)
	Content.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 100)

	Tab.MouseButton1Click:Connect(function()
		for _, c in pairs(ContentContainer:GetChildren()) do
			if c:IsA("ScrollingFrame") then
				c.Visible = false
			end
		end
		Content.Visible = true
	end)

	return {
		AddButton = function(self, text, callback)
			local Btn = Instance.new("TextButton", Content)
			Btn.Text = text
			Btn.Size = UDim2.new(1, -10, 0, 30)
			Btn.Position = UDim2.new(0, 5, 0, #Content:GetChildren() * 35)
			Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Btn.TextColor3 = Color3.fromRGB(0, 255, 100)
			Btn.Font = Enum.Font.Code
			Btn.TextSize = 18
			Btn.MouseButton1Click:Connect(callback)
		end,
		
		AddToggle = function(self, text, callback)
			local Toggle = Instance.new("TextButton", Content)
			Toggle.Text = "[OFF] " .. text
			Toggle.Size = UDim2.new(1, -10, 0, 30)
			Toggle.Position = UDim2.new(0, 5, 0, #Content:GetChildren() * 35)
			Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Toggle.TextColor3 = Color3.fromRGB(0, 255, 100)
			Toggle.Font = Enum.Font.Code
			Toggle.TextSize = 18

			local state = false
			Toggle.MouseButton1Click:Connect(function()
				state = not state
				Toggle.Text = (state and "[ON] " or "[OFF] ") .. text
				callback(state)
			end)
		end
	}
end

return Krein
