-- KreinHub.lua — Modular GUI Base
local player = game.Players.LocalPlayer
local guiService = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KreinHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = guiService

-- Styles
local TextStyle = { Font = Enum.Font.SourceSans, Size = 18, Color = Color3.new(1, 1, 1) }
local TitleStyle = { Font = Enum.Font.SourceSansBold, Size = 24, Color = Color3.new(1, 1, 1) }

-- Loading popup animation omitted (assume same as before)...

-- MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0.45, 0, 0.55, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- HEADER
local Header = Instance.new("Frame", MainFrame)
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local GuiName = Instance.new("TextLabel", Header)
GuiName.Text = "KreinGui"
GuiName.Size = UDim2.new(1, -80, 1, 0)
GuiName.Position = UDim2.new(0, 0, 0, 0)
GuiName.Font = TitleStyle.Font
GuiName.TextSize = TitleStyle.Size
GuiName.TextColor3 = TitleStyle.Color
GuiName.BackgroundTransparency = 1
GuiName.TextXAlignment = Enum.TextXAlignment.Center

local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Text = "✕"
CloseBtn.Size = UDim2.new(0, 40, 1, 0)
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.TextSize = 20
CloseBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
CloseBtn.TextColor3 = Color3.new(1,1,1)

local MinBtn = Instance.new("TextButton", Header)
MinBtn.Text = "–"
MinBtn.Size = UDim2.new(0, 40, 1, 0)
MinBtn.Position = UDim2.new(1, -80, 0, 0)
MinBtn.TextSize = 20
MinBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
MinBtn.TextColor3 = Color3.new(1,1,1)

-- CONTAINERS
local TabContainer = Instance.new("Frame", MainFrame)
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(0, 120, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local ContentContainer = Instance.new("Frame", MainFrame)
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -120, 1, -40)
ContentContainer.Position = UDim2.new(0, 120, 0, 40)
ContentContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

-- Layout
local function addList(parent)
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = parent
end
addList(TabContainer)
addList(ContentContainer)

-- Minimizing & Close
local isMinimized = false
local originalSize = MainFrame.Size

MinBtn.MouseButton1Click:Connect(function()
    if isMinimized then
        MainFrame.Size = originalSize
        TabContainer.Visible = true
        ContentContainer.Visible = true
    else
        MainFrame.Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 40)
        TabContainer.Visible = false
        ContentContainer.Visible = false
    end
    isMinimized = not isMinimized
end)
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Framework API
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
    content.Size = UDim2.new(1, -10, 0, 0)
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
        if v.button == tabBtn then tab = v; break
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
        if v.button == tabBtn then tab = v; break
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

-- Return API
return KreinHub
