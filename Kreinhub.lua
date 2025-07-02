--// Alif's Custom Script Hub (Editable Base) - Responsive Tabs Fix

-- UI Library
local player = game.Players.LocalPlayer
local guiService = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KreinHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = guiService

-- Gaya Text Global
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

-- Notifikasi
local notif = Instance.new("TextLabel")
notif.Text = "Script Loading..."
notif.Font = Enum.Font.SourceSansBold
notif.TextSize = 16
notif.TextColor3 = Color3.new(1, 1, 1)
notif.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
notif.BackgroundTransparency = 0.4
notif.AnchorPoint = Vector2.new(1, 1)
notif.Position = UDim2.new(1, -10, 1, -10)
notif.Size = UDim2.new(0, 160, 0, 30)
notif.ZIndex = 10
notif.Parent = ScreenGui
Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 6)
task.delay(2.5, function()
    notif:Destroy()
end)
task.wait(2.3)

-- Loading Animation
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Size = UDim2.new(0, 0, 0, 0)
LoadingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingFrame.BackgroundColor3 = Color3.new(0, 0, 0)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Parent = ScreenGui

local LoadingText = Instance.new("TextLabel")
LoadingText.Text = "KreinGui"
LoadingText.Font = TitleStyle.Font
LoadingText.TextSize = 28
LoadingText.TextColor3 = Color3.new(1, 1, 1)
LoadingText.BackgroundTransparency = 1
LoadingText.Size = UDim2.new(1, 0, 0, 50)
LoadingText.Position = UDim2.new(0.5, 0, 0.4, 0)
LoadingText.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingText.Parent = LoadingFrame

local SubText = Instance.new("TextLabel")
SubText.Text = ""
SubText.Font = TextStyle.Font
SubText.TextSize = 20
SubText.TextColor3 = Color3.new(1, 1, 1)
SubText.BackgroundTransparency = 1
SubText.Size = UDim2.new(1, 0, 0, 30)
SubText.Position = UDim2.new(0.5, 0, 0.65, 0)
SubText.AnchorPoint = Vector2.new(0.5, 0.5)
SubText.Parent = LoadingFrame

-- Animate loading popup
LoadingFrame:TweenSize(UDim2.new(0.35, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1.5, true)
task.wait(1.2)

local function Typewrite(text, label)
    label.Text = ""
    for i = 1, #text do
        label.Text = string.sub(text, 1, i)
        task.wait(0.05)
    end
end

for i = 1, 3 do
    Typewrite("Loading...", SubText)
    task.wait(0.4)
end

LoadingFrame:Destroy()
task.wait(1)

-- GUI UTAMA
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.6, 0, 0.6, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Header
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Text = "KreinGui"
Title.Font = TitleStyle.Font
Title.TextSize = TitleStyle.Size
Title.TextColor3 = TitleStyle.Color
Title.BackgroundTransparency = 1
Title.AnchorPoint = Vector2.new(0, 0.5)
Title.Position = UDim2.new(0, 10, 0.5, 0)
Title.Size = UDim2.new(0.5, 0, 1, 0)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Tombol Close dan Minimize
local Close = Instance.new("TextButton")
Close.Text = "X"
Close.Size = UDim2.new(0, 40, 1, 0)
Close.Position = UDim2.new(1, -40, 0, 0)
Close.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
Close.TextColor3 = Color3.new(1,1,1)
Close.Parent = Header

local Minimize = Instance.new("TextButton")
Minimize.Text = "-"
Minimize.Size = UDim2.new(0, 40, 1, 0)
Minimize.Position = UDim2.new(1, -80, 0, 0)
Minimize.BackgroundColor3 = Color3.fromRGB(60, 255, 60)
Minimize.TextColor3 = Color3.new(1,1,1)
Minimize.Parent = Header

-- Container
local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(1, 0, 1, -40)
Container.Position = UDim2.new(0, 0, 0, 40)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local Tabs = Instance.new("Frame")
Tabs.Name = "Tabs"
Tabs.Size = UDim2.new(0, 120, 1, 0)
Tabs.Position = UDim2.new(0, 0, 0, 0)
Tabs.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Tabs.Parent = Container

local Pages = Instance.new("Frame")
Pages.Name = "Pages"
Pages.Size = UDim2.new(1, -120, 1, 0)
Pages.Position = UDim2.new(0, 120, 0, 0)
Pages.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Pages.Parent = Container

-- Responsive layout
local UIList = Instance.new("UIListLayout")
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 4)
UIList.Parent = Tabs

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 6)
UIPadding.PaddingLeft = UDim.new(0, 6)
UIPadding.Parent = Tabs

-- Responsive Pages Layout
local PageLayout = Instance.new("UIListLayout")
PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
PageLayout.Padding = UDim.new(0, 6)
PageLayout.Parent = Pages

-- Fungsionalitas
local originalSize = MainFrame.Size
local minimized = false

Minimize.MouseButton1Click:Connect(function()
    if minimized then
        MainFrame:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        Container.Visible = true
        minimized = false
    else
        MainFrame:TweenSize(UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, Header.Size.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        Container.Visible = false
        minimized = true
    end
end)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- SISTEM ADD TAB DAN ISI
local KreinHub = {}

function KreinHub:CreateTab(tabName)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(1, -12, 0, 30)
    tabBtn.Text = tabName
    tabBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    tabBtn.TextColor3 = Color3.new(1, 1, 1)
    tabBtn.Parent = Tabs

    local page = Instance.new("Frame")
    page.Size = UDim2.new(1, -12, 1, -12)
    page.BackgroundTransparency = 1
    page.Name = tabName
    page.Visible = false
    page.Parent = Pages

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page

    tabBtn.MouseButton1Click:Connect(function()
        for _, child in ipairs(Pages:GetChildren()) do
            if child:IsA("Frame") then
                child.Visible = false
            end
        end
        page.Visible = true
    end)

    return page
end

function KreinHub:AddButton(tabPage, text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -12, 0, 30)
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Parent = tabPage
    button.MouseButton1Click:Connect(callback)
end

function KreinHub:AddToggle(tabPage, text, callback)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(1, -12, 0, 30)
    toggle.Text = text .. ": OFF"
    toggle.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.Parent = tabPage
    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = text .. ": " .. (state and "ON" or "OFF")
        callback(state)
    end)
end

return KreinHub
