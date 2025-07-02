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
MainFrame.Size = UDim2.new(0.6, 0, 0.6, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Visible = true
MainFrame:TweenSize(UDim2.new(0.6, 0, 0.6, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1.2, true)
task.wait(0.3)

-- Header (Nama GUI dan Tombol)
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 30)
Header.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Text = "KreinGui"
Title.Font = TitleStyle.Font
Title.TextSize = TitleStyle.Size
Title.TextColor3 = TitleStyle.Color
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, 0, 0, 0)
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Parent = Header

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 30, 1, 0)
Close.Position = UDim2.new(1, -30, 0, 0)
Close.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
Close.Text = "X"
Close.Font = Enum.Font.SourceSansBold
Close.TextSize = 18
Close.TextColor3 = Color3.new(1, 1, 1)
Close.Parent = Header

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0, 30, 1, 0)
Minimize.Position = UDim2.new(1, -60, 0, 0)
Minimize.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
Minimize.Text = "-"
Minimize.Font = Enum.Font.SourceSansBold
Minimize.TextSize = 18
Minimize.TextColor3 = Color3.new(1, 1, 1)
Minimize.Parent = Header

-- Fungsi tombol
local minimized = false
local originalSize = MainFrame.Size

Minimize.MouseButton1Click:Connect(function()
    if minimized then
        MainFrame:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
    else
        MainFrame:TweenSize(UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 30), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
    end
    minimized = not minimized
end)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Tab dan Kontainer Isi
local TabsFrame = Instance.new("Frame")
TabsFrame.Name = "TabsFrame"
TabsFrame.Size = UDim2.new(0, 120, 1, -30)
TabsFrame.Position = UDim2.new(0, 0, 0, 30)
TabsFrame.BackgroundTransparency = 1
TabsFrame.Parent = MainFrame

local UIList = Instance.new("UIListLayout", TabsFrame)
UIList.FillDirection = Enum.FillDirection.Vertical
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 4)

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -130, 1, -30)
ContentFrame.Position = UDim2.new(0, 130, 0, 30)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local KreinHub = {}
KreinHub.Tabs = {}

function KreinHub:CreateTab(name)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(1, -10, 0, 30)
    tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabButton.TextColor3 = Color3.new(1, 1, 1)
    tabButton.Font = Enum.Font.SourceSansBold
    tabButton.TextSize = 18
    tabButton.Text = name
    tabButton.Parent = TabsFrame

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, 0, 1, 0)
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = ContentFrame

    local layout = Instance.new("UIListLayout", content)
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder

    tabButton.MouseButton1Click:Connect(function()
        for _, v in pairs(ContentFrame:GetChildren()) do
            if v:IsA("Frame") then
                v.Visible = false
            end
        end
        content.Visible = true
    end)

    self.Tabs[name] = content
    return name
end

function KreinHub:AddButton(tabName, text, callback)
    local content = self.Tabs[tabName]
    if not content then return end

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 16
    btn.Text = text
    btn.Parent = content

    btn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
end

function KreinHub:AddToggle(tabName, text, callback)
    local content = self.Tabs[tabName]
    if not content then return end

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(1, -10, 0, 30)
    toggle.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.Font = Enum.Font.SourceSans
    toggle.TextSize = 16
    toggle.Text = text .. " [OFF]"
    toggle.Parent = content

    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = text .. (state and " [ON]" or " [OFF]")
        pcall(callback, state)
    end)
end

return KreinHub
