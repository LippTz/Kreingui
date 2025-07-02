--// Alif's Custom Script Hub (Editable Base) - Finalized Layout + Tab System + Responsive + Loading Animation

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

-- Notifikasi bawah kanan
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

local corner = Instance.new("UICorner", notif)
corner.CornerRadius = UDim.new(0, 6)

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
MainFrame.Size = UDim2.new(0.45, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Header (Nama GUI + Minimize + Close)
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Header.BorderSizePixel = 0
Header.Name = "Header"
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Text = "KreinGui"
Title.Font = TitleStyle.Font
Title.TextSize = TitleStyle.Size
Title.TextColor3 = TitleStyle.Color
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Name = "Title"
Title.Parent = Header

-- Minimize & Close Buttons
local Minimize = Instance.new("TextButton")
Minimize.Text = "_"
Minimize.Size = UDim2.new(0, 30, 0, 30)
Minimize.Position = UDim2.new(1, -65, 0.5, -15)
Minimize.AnchorPoint = Vector2.new(0, 0)
Minimize.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Minimize.TextColor3 = Color3.new(1, 1, 1)
Minimize.Font = TextStyle.Font
Minimize.TextSize = 20
Minimize.Parent = Header

local Close = Instance.new("TextButton")
Close.Text = "X"
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -30, 0.5, -15)
Close.AnchorPoint = Vector2.new(0, 0)
Close.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Close.TextColor3 = Color3.new(1, 1, 1)
Close.Font = TextStyle.Font
Close.TextSize = 20
Close.Parent = Header

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 120, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabContainer.BorderSizePixel = 0
TabContainer.Name = "TabContainer"
TabContainer.Parent = MainFrame

local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -120, 1, -40)
ContentContainer.Position = UDim2.new(0, 120, 0, 40)
ContentContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ContentContainer.BorderSizePixel = 0
ContentContainer.Parent = MainFrame

-- Sistem Minimize
local originalSize = MainFrame.Size
local minimized = false

Minimize.MouseButton1Click:Connect(function()
    if minimized then
        MainFrame.Size = originalSize
        TabContainer.Visible = true
        ContentContainer.Visible = true
    else
        MainFrame.Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, Header.Size.Y.Offset)
        TabContainer.Visible = false
        ContentContainer.Visible = false
    end
    minimized = not minimized
end)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Fungsi Sistem Tab
local KreinHub = {}
local tabs = {}

function KreinHub:CreateTab(name)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Text = name
    tabBtn.Size = UDim2.new(1, 0, 0, 30)
    tabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabBtn.TextColor3 = Color3.new(1, 1, 1)
    tabBtn.Font = TextStyle.Font
    tabBtn.TextSize = TextStyle.Size
    tabBtn.Parent = TabContainer

    local contentFrame = Instance.new("Frame")
    contentFrame.Name = name .. "_Content"
    contentFrame.Size = UDim2.new(1, 0, 1, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Visible = false
    contentFrame.Parent = ContentContainer

    local layout = Instance.new("UIListLayout", contentFrame)
    layout.Padding = UDim.new(0, 5)
    layout.SortOrder = Enum.SortOrder.LayoutOrder

    tabs[tabBtn] = contentFrame

    tabBtn.MouseButton1Click:Connect(function()
        for btn, frame in pairs(tabs) do
            frame.Visible = (btn == tabBtn)
        end
    end)

    return contentFrame
end

function KreinHub:AddButton(tabContent, text, callback)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(1, -10, 0, 30)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = TextStyle.Font
    button.TextSize = TextStyle.Size
    button.Parent = tabContent

    button.MouseButton1Click:Connect(callback)
end

function KreinHub:AddToggle(tabContent, text, callback)
    local toggle = Instance.new("TextButton")
    toggle.Text = text .. ": OFF"
    toggle.Size = UDim2.new(1, -10, 0, 30)
    toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.Font = TextStyle.Font
    toggle.TextSize = TextStyle.Size
    toggle.Parent = tabContent

    local state = false

    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = text .. (state and ": ON" or ": OFF")
        callback(state)
    end)
end

return KreinHub
