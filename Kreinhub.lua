--// Alif's Custom Script Hub (Editable Base) - Full Control Style + Background Dropdown in Settings Tab + Loading Animation

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

-- Animate loading popup
LoadingFrame:TweenSize(UDim2.new(0.35, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1.5, true)
task.wait(1.2)

-- Tulis animasi "Loading..." satu per satu, 3 kali
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

-- Sembunyikan loading dan lanjutkan ke GUI utama
LoadingFrame:Destroy()
task.wait(1)

-- GUI UTAMA
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.5, 0, 0.55, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Text = "KreinGui"
Title.Font = TitleStyle.Font
Title.TextSize = TitleStyle.Size
Title.TextColor3 = TitleStyle.Color
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Parent = Header

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.Text = "X"
CloseButton.Font = TextStyle.Font
CloseButton.TextSize = 20
CloseButton.TextColor3 = TextStyle.Color
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Parent = Header

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
MinimizeButton.Position = UDim2.new(1, -80, 0, 0)
MinimizeButton.Text = "-"
MinimizeButton.Font = TextStyle.Font
MinimizeButton.TextSize = 20
MinimizeButton.TextColor3 = TextStyle.Color
MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.Parent = Header

-- Tab Container Kiri
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 100, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabContainer.BorderSizePixel = 0
TabContainer.Name = "TabContainer"
TabContainer.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout")
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 4)
TabLayout.Parent = TabContainer

-- Content Container Kanan
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -100, 1, -40)
ContentContainer.Position = UDim2.new(0, 100, 0, 40)
ContentContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ContentContainer.BorderSizePixel = 0
ContentContainer.Name = "ContentContainer"
ContentContainer.Parent = MainFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Padding = UDim.new(0, 4)
ContentLayout.Parent = ContentContainer

-- Resize responsif
local function updateResponsive()
    TabContainer.Size = UDim2.new(0, 100, 1, -40)
    ContentContainer.Size = UDim2.new(1, -100, 1, -40)
end
updateResponsive()

-- Sistem Minimize
local originalSize = MainFrame.Size
local minimized = false

MinimizeButton.MouseButton1Click:Connect(function()
    if minimized then
        MainFrame:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        TabContainer.Visible = true
        ContentContainer.Visible = true
        minimized = false
    else
        MainFrame:TweenSize(UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 40), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        TabContainer.Visible = false
        ContentContainer.Visible = false
        minimized = true
    end
end)

-- Sistem Close
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Animasi tampil GUI utama
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Visible = true
MainFrame:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1.2, true)

-- Sistem Eksternal API
local KreinHub = {}

function KreinHub:CreateTab(name)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(1, 0, 0, 30)
    tabButton.Text = name
    tabButton.Font = TextStyle.Font
    tabButton.TextSize = TextStyle.Size
    tabButton.TextColor3 = TextStyle.Color
    tabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tabButton.Parent = TabContainer

    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 0, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Name = name .. "_Content"
    contentFrame.Visible = false
    contentFrame.Parent = ContentContainer

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = contentFrame

    tabButton.MouseButton1Click:Connect(function()
        for _, frame in ipairs(ContentContainer:GetChildren()) do
            if frame:IsA("Frame") then
                frame.Visible = false
            end
        end
        contentFrame.Visible = true
    end)

    return contentFrame
end

function KreinHub:AddButton(tab, text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Text = text
    button.Font = TextStyle.Font
    button.TextSize = TextStyle.Size
    button.TextColor3 = TextStyle.Color
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.Parent = tab

    button.MouseButton1Click:Connect(callback)

    return button
end

function KreinHub:AddToggle(tab, text, callback)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(1, -10, 0, 30)
    toggle.Text = text .. ": OFF"
    toggle.Font = TextStyle.Font
    toggle.TextSize = TextStyle.Size
    toggle.TextColor3 = TextStyle.Color
    toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    toggle.Parent = tab

    local state = false

    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = text .. ": " .. (state and "ON" or "OFF")
        callback(state)
    end)

    return toggle
end

return KreinHub
