-- KreinHub UI Library (Base.lua)
-- Upload this to GitHub (raw) and call it with loadstring from Loader.lua

local player = game.Players.LocalPlayer
local guiService = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KreinHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = guiService

-- Global Text Style
_G.KreinTextStyle = {
    Font = Enum.Font.GothamSemibold,
    Size = 16,
    Color = Color3.fromRGB(240, 240, 240)
}

-- Container
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
MainFrame.BorderSizePixel = 0
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Tab Buttons (Left Side)
local TabContainer = Instance.new("Frame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(0, 120, 1, 0)
TabContainer.Position = UDim2.new(0, 0, 0, 0)
TabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
TabContainer.Parent = MainFrame

local tabLayout = Instance.new("UIListLayout")
tabLayout.Padding = UDim.new(0, 4)
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Parent = TabContainer

-- Content Panel
local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -120, 1, -10)
ContentContainer.Position = UDim2.new(0, 125, 0, 5)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

local function addList(parent)
    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0, 5)
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Parent = parent
end

addList(ContentContainer)

local Tabs = {}
local KreinHub = {}

function KreinHub:CreateTab(name)
    if Tabs[name] then return Tabs[name].button, Tabs[name].content end

    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    btn.TextColor3 = _G.KreinTextStyle.Color
    btn.Font = _G.KreinTextStyle.Font
    btn.TextSize = _G.KreinTextStyle.Size
    btn.BorderSizePixel = 0
    btn.Parent = TabContainer

    local content = Instance.new("Frame")
    content.Name = name .. "Content"
    content.Size = UDim2.new(1, 0, 1, 0)
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
        if v.button == tabBtn then tab = v break end
    end
    if not tab then return end

    local b = Instance.new("TextButton")
    b.Text = text
    b.Size = UDim2.new(1, -10, 0, 30)
    b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    b.TextColor3 = _G.KreinTextStyle.Color
    b.Font = _G.KreinTextStyle.Font
    b.TextSize = _G.KreinTextStyle.Size
    b.BorderSizePixel = 0
    b.Parent = tab.content
    b.MouseButton1Click:Connect(func)

    tab.count += 1
end

function KreinHub:AddToggle(tabBtn, text, func)
    local tab = nil
    for _, v in pairs(Tabs) do
        if v.button == tabBtn then tab = v break end
    end
    if not tab then return end

    local t = Instance.new("TextButton")
    t.Text = text .. ": OFF"
    t.Size = UDim2.new(1, -10, 0, 30)
    t.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    t.TextColor3 = _G.KreinTextStyle.Color
    t.Font = _G.KreinTextStyle.Font
    t.TextSize = _G.KreinTextStyle.Size
    t.BorderSizePixel = 0
    t.Parent = tab.content

    local state = false
    t.MouseButton1Click:Connect(function()
        state = not state
        t.Text = text .. ": " .. (state and "ON" or "OFF")
        func(state)
    end)

    tab.count += 1
end

return KreinHub
