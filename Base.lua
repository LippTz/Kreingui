-- Base.lua - KreinHub Modular GUI Base (by Alif)

local KreinHub = {}
local Tabs = {}

local player = game.Players.LocalPlayer
local guiService = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KreinHub"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiService

-- Gaya Text
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

-- Main UI
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 480, 0, 300)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Text = "KreinGui"
Title.Font = TitleStyle.Font
Title.TextSize = TitleStyle.Size
Title.TextColor3 = TitleStyle.Color
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -80, 0, 30)
Title.Position = UDim2.new(0.5, -80, 0, 0)
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.Parent = MainFrame

-- Minimize & Close Buttons
local MinBtn = Instance.new("TextButton")
MinBtn.Text = "-"
MinBtn.Font = TextStyle.Font
MinBtn.TextSize = 18
MinBtn.TextColor3 = TextStyle.Color
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -60, 0, 0)
MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinBtn.Parent = MainFrame

local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "x"
CloseBtn.Font = TextStyle.Font
CloseBtn.TextSize = 18
CloseBtn.TextColor3 = TextStyle.Color
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseBtn.Parent = MainFrame

local TabContainer = Instance.new("Frame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(0, 120, 1, -30)
TabContainer.Position = UDim2.new(0, 0, 0, 30)
TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabContainer.Parent = MainFrame

local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -120, 1, -30)
ContentContainer.Position = UDim2.new(0, 120, 0, 30)
ContentContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ContentContainer.Parent = MainFrame

-- Minimize logic
local isMinimized = false
local fullHeight = MainFrame.Size.Y.Offset

MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        TabContainer.Visible = false
        ContentContainer.Visible = false
        MainFrame.Size = UDim2.new(MainFrame.Size.X.Scale, MainFrame.Size.X.Offset, 0, 30)
    else
        TabContainer.Visible = true
        ContentContainer.Visible = true
        MainFrame.Size = UDim2.new(MainFrame.Size.X.Scale, MainFrame.Size.X.Offset, 0, fullHeight)
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Function to create tab and logic
function KreinHub:CreateTab(name)
    if Tabs[name] then return Tabs[name].button, Tabs[name].content end

    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Position = UDim2.new(0, 5, 0, #TabContainer:GetChildren() * 35)
    btn.Parent = TabContainer
    btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
    btn.TextColor3 = TextStyle.Color
    btn.Font = TextStyle.Font
    btn.TextSize = TextStyle.Size

    local content = Instance.new("Frame")
    content.Name = name .. "Content"
    content.Size = UDim2.new(1, -10, 1, -10)
    content.Position = UDim2.new(0, 5, 0, 5)
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = ContentContainer

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
    b.Position = UDim2.new(0, 5, 0, tab.count * 35)
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
    t.Position = UDim2.new(0, 5, 0, tab.count * 35)
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

return KreinHub
