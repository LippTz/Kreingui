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

-- Global base export for loader
_G.KreinBase = {
    ScreenGui = ScreenGui,
    MainFrame = MainFrame,
    TabContainer = TabContainer,
    ContentContainer = ContentContainer,
    TextStyle = TextStyle,
    TitleStyle = TitleStyle,
    addList = addList
}

-- Exposed API to allow external use
local Tabs = {}
local KreinHub = {}

function KreinHub:CreateTab(name)
    if Tabs[name] then return Tabs[name].button, Tabs[name].content end

    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Parent = TabContainer
    btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
    btn.TextColor3 = TextStyle.Color
    btn.Font = TextStyle.Font
    btn.TextSize = TextStyle.Size

    local content = Instance.new("Frame")
    content.Name = name .. "Content"
    content.Size = UDim2.new(1, -10, 1, -10)
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = ContentContainer
    addList(content)

    btn.MouseButton1Click:Connect(function()
        for _, v in pairs(ContentContainer:GetChildren()) do
            if v:IsA("Frame") then v.Visible = false end
        end
        content.Visible = true
    end)

    Tabs[name] = { button = btn, content = content, count = 0 }
    return btn
end

function KreinHub:AddButton(tabBtn, text, func)
    local tab = nil
    for _, v in pairs(Tabs) do
        if v.button == tabBtn then tab = v; break end
    end
    if not tab then return end

    local b = Instance.new("TextButton")
    b.Text = text
    b.Size = UDim2.new(1, -10, 0, 30)
    b.Position = UDim2.new(0, 5, 0, tab.count * 35 + 5)
    b.Parent = tab.content
    b.BackgroundColor3 = Color3.fromRGB(60,60,60)
    b.TextColor3 = TextStyle.Color
    b.Font = TextStyle.Font
    b.TextSize = TextStyle.Size
    b.MouseButton1Click:Connect(func)

    tab.count += 1
end

function KreinHub:AddToggle(tabBtn, text, func)
    local tab = nil
    for _, v in pairs(Tabs) do
        if v.button == tabBtn then tab = v; break end
    end
    if not tab then return end

    local t = Instance.new("TextButton")
    t.Text = text .. ": OFF"
    t.Size = UDim2.new(1, -10, 0, 30)
    t.Position = UDim2.new(0, 5, 0, tab.count * 35 + 5)
    t.Parent = tab.content
    t.BackgroundColor3 = Color3.fromRGB(60,60,60)
    t.TextColor3 = TextStyle.Color
    t.Font = TextStyle.Font
    t.TextSize = TextStyle.Size

    local state = false
    t.MouseButton1Click:Connect(function()
        state = not state
        t.Text = text .. ": " .. (state and "ON" or "OFF")
        func(state)
    end)

    tab.count += 1
end

print("✅ KreinHub fully initialized.")

-- Return full API
return {
    CreateTab = function(name)
        return KreinHub:CreateTab(name)
    end,

    AddButton = function(tab, text, func)
        return KreinHub:AddButton(tab, text, func)
    end,

    AddToggle = function(tab, text, func)
        return KreinHub:AddToggle(tab, text, func)
    end
}
