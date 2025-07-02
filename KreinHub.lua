--// Alif's Custom Script Hub (Modular Base) - Draggable UI Ready

-- UI Library Base (Base.lua)
local player = game.Players.LocalPlayer
local guiService = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KreinHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = guiService

-- Global Text Styles
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

-- GUI Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.4, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 8)

-- Header Menu
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

-- GUI Title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -80, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "KreinGui"
TitleLabel.Font = TitleStyle.Font
TitleLabel.TextSize = TitleStyle.Size
TitleLabel.TextColor3 = TitleStyle.Color
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Header

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -70, 0.5, -15)
MinBtn.Text = "_"
MinBtn.Font = Enum.Font.SourceSansBold
MinBtn.TextSize = 22
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
MinBtn.Parent = Header

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 22
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
CloseBtn.Parent = Header

-- Tab Container
local TabContainer = Instance.new("ScrollingFrame")
TabContainer.Size = UDim2.new(0, 120, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TabContainer.ScrollBarThickness = 4
TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
TabContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
TabContainer.Parent = MainFrame

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 5)
TabListLayout.Parent = TabContainer

-- Content Container
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -130, 1, -50)
ContentContainer.Position = UDim2.new(0, 130, 0, 50)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Name = "ContentContainer"
ContentContainer.Parent = MainFrame

-- Function for vertical layout in content
function addList(parent)
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = parent
end

-- Minimize logic
local originalSize = MainFrame.Size
local isMinimized = false
MinBtn.MouseButton1Click:Connect(function()
    if not isMinimized then
        ContentContainer.Visible = false
        TabContainer.Visible = false
        MainFrame.Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 50)
    else
        ContentContainer.Visible = true
        TabContainer.Visible = true
        MainFrame.Size = originalSize
    end
    isMinimized = not isMinimized
end)

-- Close logic
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

_G.KreinBase = {
    ScreenGui = ScreenGui,
    MainFrame = MainFrame,
    TabContainer = TabContainer,
    ContentContainer = ContentContainer,
    TextStyle = TextStyle,
    TitleStyle = TitleStyle,
    addList = addList
}

print("✅ KreinBase initialized.")
