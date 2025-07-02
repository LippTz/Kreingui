--// Alif's Custom Script Hub (Modular Base) - Draggable UI Ready

-- UI Library Base (Base.lua)
local player = game.Players.LocalPlayer
local guiService = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KreinHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = guiService

-- Global Text Styles
local TextStyle = {
    Font = Enum.Font.SourceSans,
    Size = 18,
    Color = Color3.new(1, 1, 1)
}

local TitleStyle = {
    Font = Enum.Font.SourceSansBold,
    Size = 24,
    Color = Color3.new(1, 1, 1)
}

-- GUI Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.4, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 8)

-- GUI Title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "KreinHub"
TitleLabel.Font = TitleStyle.Font
TitleLabel.TextSize = TitleStyle.Size
TitleLabel.TextColor3 = TitleStyle.Color
TitleLabel.Parent = MainFrame

-- Tab Container
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 120, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TabContainer.Parent = MainFrame

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 5)
TabListLayout.Parent = TabContainer

-- Content Container
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -130, 1, -50)
ContentContainer.Position = UDim2.new(0, 130, 0, 50)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Name = "ContentContainer"
ContentContainer.Parent = MainFrame

-- Function for vertical layout in content
function addList(parent)
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = parent
end

_G.KreinBase = {
    ScreenGui = ScreenGui,
    MainFrame = MainFrame,
    TabContainer = TabContainer,
    ContentContainer = ContentContainer,
    TextStyle = TextStyle,
    TitleStyle = TitleStyle,
    addList = addList
}

-- Logic to allow external scripts to add UI elements easily
function _G.KreinBase:CreateTab(name)
    local button = Instance.new("TextButton")
    button.Text = name
    button.Size = UDim2.new(1, -10, 0, 30)
    button.BackgroundColor3 = Color3.fromRGB(60,60,60)
    button.TextColor3 = self.TextStyle.Color
    button.Font = self.TextStyle.Font
    button.TextSize = self.TextStyle.Size
    button.Parent = self.TabContainer

    local content = Instance.new("Frame")
    content.Name = name.."Content"
    content.Size = UDim2.new(1, 0, 1, 0)
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = self.ContentContainer
    self.addList(content)

    button.MouseButton1Click:Connect(function()
        for _, child in pairs(self.ContentContainer:GetChildren()) do
            if child:IsA("Frame") then
                child.Visible = false
            end
        end
        content.Visible = true
    end)

    return button, content
end

function _G.KreinBase:AddButton(contentFrame, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.Text = text
    btn.TextColor3 = self.TextStyle.Color
    btn.Font = self.TextStyle.Font
    btn.TextSize = self.TextStyle.Size
    btn.Parent = contentFrame
    btn.MouseButton1Click:Connect(callback)
end

function _G.KreinBase:AddToggle(contentFrame, text, callback)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(1, -10, 0, 30)
    toggle.BackgroundColor3 = Color3.fromRGB(50,50,50)
    toggle.Text = text .. ": OFF"
    toggle.TextColor3 = self.TextStyle.Color
    toggle.Font = self.TextStyle.Font
    toggle.TextSize = self.TextStyle.Size
    toggle.Parent = contentFrame

    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = text .. ": " .. (state and "ON" or "OFF")
        callback(state)
    end)
end

print("✅ KreinBase initialized.")
return _G.KreinBase
