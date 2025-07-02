-- KreinHub Base GUI (Modular)
-- Upload this to GitHub and call it via loadstring()

local KreinHub = {}
local Tabs = {}

local player = game.Players.LocalPlayer
local guiService = player:WaitForChild("PlayerGui")

-- UI Base
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KreinHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = guiService

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TopBar.Parent = MainFrame

local GuiName = Instance.new("TextLabel")
GuiName.Size = UDim2.new(1, 0, 1, 0)
GuiName.Text = "KreinHub"
GuiName.Font = Enum.Font.SourceSansBold
GuiName.TextSize = 20
GuiName.TextColor3 = Color3.new(1, 1, 1)
GuiName.BackgroundTransparency = 1
GuiName.Parent = TopBar

-- Tab Container
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 120, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabContainer.Parent = MainFrame

local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -120, 1, -40)
ContentContainer.Position = UDim2.new(0, 120, 0, 40)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

-- Text style
local TextStyle = {
    Font = Enum.Font.SourceSans,
    Size = 18,
    Color = Color3.new(1, 1, 1)
}

-- Utility for vertical layout
local function addList(parent)
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = parent
end

-- Create Tab
function KreinHub:CreateTab(name)
    if Tabs[name] then return Tabs[name].button, Tabs[name].content end

    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Position = UDim2.new(0, 5, 0, #TabContainer:GetChildren() * 35)
    btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
    btn.TextColor3 = TextStyle.Color
    btn.Font = TextStyle.Font
    btn.TextSize = TextStyle.Size
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

-- Add Button
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
    b.BackgroundColor3 = Color3.fromRGB(60,60,60)
    b.TextColor3 = TextStyle.Color
    b.Font = TextStyle.Font
    b.TextSize = TextStyle.Size
    b.Parent = tab.content

    b.MouseButton1Click:Connect(func)
    tab.count += 1
end

-- Add Toggle
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
    t.BackgroundColor3 = Color3.fromRGB(60,60,60)
    t.TextColor3 = TextStyle.Color
    t.Font = TextStyle.Font
    t.TextSize = TextStyle.Size
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
