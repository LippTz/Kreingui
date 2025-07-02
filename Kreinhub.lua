--// Alif's Custom Script Hub (Editable Base) - Full Control Style + Background Dropdown in Settings Tab + Loading Animation

-- UI Library
local player = game.Players.LocalPlayer
local guiService = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KreinHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = guiService

-- Gaya Text Global (bisa diubah langsung)
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
MainFrame.Size = UDim2.new(0.35, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Header (berisi nama GUI + tombol)
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundTransparency = 1
Header.Name = "Header"
Header.Parent = MainFrame

-- Nama GUI
local Title = Instance.new("TextLabel")
Title.Text = "KreinGui"
Title.Font = TitleStyle.Font
Title.TextSize = TitleStyle.Size
Title.TextColor3 = TitleStyle.Color
Title.BackgroundTransparency = 1
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.Position = UDim2.new(0.5, 0, 0.5, 0)
Title.Size = UDim2.new(0.6, 0, 1, 0)
Title.Parent = Header

-- Tombol Minimize
local Minimize = Instance.new("TextButton")
Minimize.Text = "-"
Minimize.Font = TextStyle.Font
Minimize.TextSize = 22
Minimize.TextColor3 = TextStyle.Color
Minimize.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Minimize.Size = UDim2.new(0, 30, 0, 30)
Minimize.Position = UDim2.new(1, -65, 0.5, -15)
Minimize.AnchorPoint = Vector2.new(0, 0)
Minimize.Parent = Header

-- Tombol Close
local Close = Instance.new("TextButton")
Close.Text = "X"
Close.Font = TextStyle.Font
Close.TextSize = 22
Close.TextColor3 = TextStyle.Color
Close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -30, 0.5, -15)
Close.AnchorPoint = Vector2.new(0, 0)
Close.Parent = Header

-- Tab Container
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0.25, 0, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabContainer.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout")
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 4)
TabLayout.Parent = TabContainer

-- Content Container
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(0.75, 0, 1, -40)
ContentContainer.Position = UDim2.new(0.25, 0, 0, 40)
ContentContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ContentContainer.Parent = MainFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Padding = UDim.new(0, 6)
ContentLayout.Parent = ContentContainer

-- Sistem Minimize
local originalSize = MainFrame.Size
local minimized = false

Minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        -- minimize: hanya tinggi header
        MainFrame:TweenSize(UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 40), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        TabContainer.Visible = false
        ContentContainer.Visible = false
    else
        MainFrame:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        TabContainer.Visible = true
        ContentContainer.Visible = true
    end
end)

-- Sistem Close
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Modul Kustomisasi Tab
local KreinHub = {}

function KreinHub:CreateTab(tabName)
    local newTab = Instance.new("TextButton")
    newTab.Text = tabName
    newTab.Font = TextStyle.Font
    newTab.TextSize = TextStyle.Size
    newTab.TextColor3 = TextStyle.Color
    newTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    newTab.Size = UDim2.new(1, -10, 0, 30)
    newTab.Parent = TabContainer

    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.Visible = false
    container.Parent = ContentContainer

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)
    layout.Parent = container

    newTab.MouseButton1Click:Connect(function()
        for _, frame in ipairs(ContentContainer:GetChildren()) do
            if frame:IsA("Frame") then
                frame.Visible = false
            end
        end
        container.Visible = true
    end)

    return container
end

function KreinHub:AddButton(container, text, callback)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Font = TextStyle.Font
    button.TextSize = TextStyle.Size
    button.TextColor3 = TextStyle.Color
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Parent = container

    button.MouseButton1Click:Connect(callback)
end

function KreinHub:AddToggle(container, text, callback)
    local toggle = Instance.new("TextButton")
    toggle.Text = text .. ": OFF"
    toggle.Font = TextStyle.Font
    toggle.TextSize = TextStyle.Size
    toggle.TextColor3 = TextStyle.Color
    toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    toggle.Size = UDim2.new(1, -10, 0, 30)
    toggle.Parent = container

    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = text .. ": " .. (state and "ON" or "OFF")
        callback(state)
    end)
end

return KreinHub
