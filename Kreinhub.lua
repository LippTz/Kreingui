
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

-- Notifikasi Awal
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
SubText.Font = TextStyle.Font
SubText.TextSize = 20
SubText.TextColor3 = Color3.new(1, 1, 1)
SubText.BackgroundTransparency = 1
SubText.Size = UDim2.new(1, 0, 0, 30)
SubText.Position = UDim2.new(0.5, 0, 0.65, 0)
SubText.AnchorPoint = Vector2.new(0.5, 0.5)
SubText.Parent = LoadingFrame

LoadingFrame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1.5, true)
task.wait(1.2)

for _ = 1, 3 do
    for i = 1, #"Loading..." do
        SubText.Text = string.sub("Loading...", 1, i)
        task.wait(0.05)
    end
    task.wait(0.4)
end

LoadingFrame:Destroy()
task.wait(1)

-- GUI UTAMA
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.4, 0, 0.6, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local originalMainSize = MainFrame.Size
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Visible = true
MainFrame:TweenSize(originalMainSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1.2, true)
task.wait(0.3)

-- HEADER
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local GuiTitle = Instance.new("TextLabel")
GuiTitle.Text = "KreinGui"
GuiTitle.Font = TitleStyle.Font
GuiTitle.TextSize = TitleStyle.Size
GuiTitle.TextColor3 = TitleStyle.Color
GuiTitle.BackgroundTransparency = 1
GuiTitle.Size = UDim2.new(0, 200, 1, 0)
GuiTitle.Position = UDim2.new(0.5, -100, 0, 0)
GuiTitle.TextXAlignment = Enum.TextXAlignment.Center
GuiTitle.Parent = Header

local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "X"
CloseBtn.Font = TextStyle.Font
CloseBtn.TextSize = TextStyle.Size
CloseBtn.TextColor3 = TextStyle.Color
CloseBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
CloseBtn.Size = UDim2.new(0, 40, 0, 30)
CloseBtn.Position = UDim2.new(1, -45, 0, 5)
CloseBtn.Parent = Header

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Text = "-"
MinimizeBtn.Font = TextStyle.Font
MinimizeBtn.TextSize = TextStyle.Size
MinimizeBtn.TextColor3 = TextStyle.Color
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 0)
MinimizeBtn.Size = UDim2.new(0, 40, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -90, 0, 5)
MinimizeBtn.Parent = Header

local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        MainFrame.Size = UDim2.new(MainFrame.Size.X.Scale, MainFrame.Size.X.Offset, 0, Header.Size.Y.Offset)
        for _, child in ipairs(MainFrame:GetChildren()) do
            if child:IsA("Frame") and child.Name ~= "Header" then
                child.Visible = false
            end
        end
    else
        MainFrame.Size = originalMainSize
        for _, child in ipairs(MainFrame:GetChildren()) do
            if child:IsA("Frame") then
                child.Visible = true
            end
        end
    end
end)

-- TabContainer & Content
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0.25, 0, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabContainer.BorderSizePixel = 0
TabContainer.Name = "TabContainer"
TabContainer.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout")
TabLayout.Padding = UDim.new(0, 4)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Parent = TabContainer

local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(0.75, 0, 1, -40)
ContentContainer.Position = UDim2.new(0.25, 0, 0, 40)
ContentContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ContentContainer.BorderSizePixel = 0
ContentContainer.Name = "ContentContainer"
ContentContainer.Parent = MainFrame

-- Fungsi membuat Tab
function CreateTab(tabName)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(1, -10, 0, 30)
    tabBtn.Text = tabName
    tabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabBtn.TextColor3 = Color3.new(1, 1, 1)
    tabBtn.Font = TextStyle.Font
    tabBtn.TextSize = TextStyle.Size
    tabBtn.Parent = TabContainer

    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "Content_" .. tabName
    contentFrame.Size = UDim2.new(1, -10, 1, -10)
    contentFrame.Position = UDim2.new(0, 5, 0, 5)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Visible = false
    contentFrame.Parent = ContentContainer

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 4)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = contentFrame

    tabBtn.MouseButton1Click:Connect(function()
        for _, content in ipairs(ContentContainer:GetChildren()) do
            if content:IsA("Frame") then
                content.Visible = false
            end
        end
        contentFrame.Visible = true
    end)

    return contentFrame
end

-- Fungsi menambahkan tombol ke tab
function AddButton(parentTab, buttonText, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Text = buttonText
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = TextStyle.Font
    button.TextSize = TextStyle.Size
    button.Parent = parentTab
    button.MouseButton1Click:Connect(callback)
end

-- Fungsi menambahkan toggle ke tab
function AddToggle(parentTab, toggleText, callback)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(1, -10, 0, 30)
    toggle.Text = toggleText .. ": OFF"
    toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.Font = TextStyle.Font
    toggle.TextSize = TextStyle.Size
    toggle.Parent = parentTab

    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = toggleText .. ": " .. (state and "ON" or "OFF")
        callback(state)
    end)
end
