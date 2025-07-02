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
LoadingFrame.ZIndex = 11
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
LoadingText.ZIndex = 12
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
SubText.ZIndex = 12
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
MainFrame.Size = UDim2.new(0.32, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

-- Header Area
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Header.BorderSizePixel = 0
Header.Name = "Header"
Header.Parent = MainFrame

-- GUI Title
local GuiTitle = Instance.new("TextLabel")
GuiTitle.Text = "KreinGui"
GuiTitle.Font = TitleStyle.Font
GuiTitle.TextSize = TitleStyle.Size
GuiTitle.TextColor3 = TitleStyle.Color
GuiTitle.BackgroundTransparency = 1
GuiTitle.Size = UDim2.new(1, -90, 1, 0)
GuiTitle.Position = UDim2.new(0, 45, 0, 0)
GuiTitle.TextXAlignment = Enum.TextXAlignment.Left
GuiTitle.Name = "GuiTitle"
GuiTitle.Parent = Header

-- Minimize and Close Buttons
local function createHeaderButton(text, pos, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 40, 1, 0)
    button.Position = pos
    button.Text = text
    button.Font = TextStyle.Font
    button.TextSize = 18
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundTransparency = 1
    button.Name = text .. "Button"
    button.Parent = Header
    button.MouseButton1Click:Connect(callback)
    return button
end

local isMinimized = false
local originalSize = MainFrame.Size

local Minimize = createHeaderButton("_", UDim2.new(1, -80, 0, 0), function()
    isMinimized = not isMinimized
    if isMinimized then
        for _, obj in ipairs(MainFrame:GetChildren()) do
            if obj ~= Header then
                obj.Visible = false
            end
        end
        MainFrame:TweenSize(UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 40), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
    else
        MainFrame:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        task.delay(0.3, function()
            for _, obj in ipairs(MainFrame:GetChildren()) do
                if obj ~= Header then
                    obj.Visible = true
                end
            end
        end)
    end
end)

local Close = createHeaderButton("X", UDim2.new(1, -40, 0, 0), function()
    ScreenGui:Destroy()
end)

-- GUI muncul dengan animasi
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Visible = true
MainFrame:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1.2, true)

-- Tab Container dan Konten
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 120, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainFrame

local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -120, 1, -40)
ContentContainer.Position = UDim2.new(0, 120, 0, 40)
ContentContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ContentContainer.BorderSizePixel = 0
ContentContainer.ClipsDescendants = true
ContentContainer.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 5)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Parent = TabContainer

local ContentUI = Instance.new("UIListLayout")
ContentUI.Padding = UDim.new(0, 4)
ContentUI.SortOrder = Enum.SortOrder.LayoutOrder
ContentUI.Parent = ContentContainer

-- Table untuk menyimpan referensi tab dan konten
local KreinHub = {}
KreinHub.Tabs = {}
KreinHub.CurrentTab = nil

function KreinHub:CreateTab(name)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(1, 0, 0, 30)
    tabBtn.Text = name
    tabBtn.Font = TextStyle.Font
    tabBtn.TextSize = 16
    tabBtn.TextColor3 = Color3.new(1, 1, 1)
    tabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabBtn.Parent = TabContainer

    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 0, 0)
    contentFrame.AutomaticSize = Enum.AutomaticSize.Y
    contentFrame.BackgroundTransparency = 1
    contentFrame.Visible = false
    contentFrame.Parent = ContentContainer

    tabBtn.MouseButton1Click:Connect(function()
        if KreinHub.CurrentTab then
            KreinHub.CurrentTab.Visible = false
        end
        contentFrame.Visible = true
        KreinHub.CurrentTab = contentFrame
    end)

    KreinHub.Tabs[name] = contentFrame
    return name
end

function KreinHub:AddButton(tabName, text, callback)
    local parent = KreinHub.Tabs[tabName]
    if not parent then return end

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Text = text
    btn.Font = TextStyle.Font
    btn.TextSize = 16
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.BorderSizePixel = 0
    btn.Parent = parent

    btn.MouseButton1Click:Connect(callback)
end

function KreinHub:AddToggle(tabName, text, callback)
    local parent = KreinHub.Tabs[tabName]
    if not parent then return end

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(1, -10, 0, 30)
    toggle.Text = text .. ": OFF"
    toggle.Font = TextStyle.Font
    toggle.TextSize = 16
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    toggle.BorderSizePixel = 0
    toggle.Parent = parent

    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = text .. (state and ": ON" or ": OFF")
        callback(state)
    end)
end

return KreinHub
