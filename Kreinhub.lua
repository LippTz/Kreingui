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
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- GUI muncul dengan animasi
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Visible = true
MainFrame:TweenSize(UDim2.new(0.35, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1.2, true)
task.wait(0.3)

-- CONTINUE THE REST OF THE SCRIPT LOGIC BELOW HERE
-- (This is where features like tabs, buttons, toggles, etc. are handled)

-- PLACEHOLDER UNTUK FUNGSI CUSTOM KREINHUB (SESUAIKAN DI LUAR FILE UTAMA):
local KreinHub = {}
local tabs = {}

function KreinHub:CreateTab(name)
    local tab = Instance.new("Frame")
    tab.Name = name
    tab.Size = UDim2.new(1, 0, 1, 0)
    tab.BackgroundTransparency = 1
    tab.Visible = false
    tab.Parent = MainFrame
    tabs[name] = tab
    return tab
end

function KreinHub:AddButton(tab, title, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 150, 0, 30)
    button.Position = UDim2.new(0, 10, 0, #tab:GetChildren() * 35)
    button.Text = title
    button.Font = TextStyle.Font
    button.TextSize = TextStyle.Size
    button.TextColor3 = TextStyle.Color
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Parent = tab
    button.MouseButton1Click:Connect(callback)
end

function KreinHub:AddToggle(tab, title, callback)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 150, 0, 30)
    toggle.Position = UDim2.new(0, 10, 0, #tab:GetChildren() * 35)
    toggle.Text = title .. ": OFF"
    toggle.Font = TextStyle.Font
    toggle.TextSize = TextStyle.Size
    toggle.TextColor3 = TextStyle.Color
    toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    toggle.Parent = tab

    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = title .. ": " .. (state and "ON" or "OFF")
        callback(state)
    end)
end

return KreinHub
