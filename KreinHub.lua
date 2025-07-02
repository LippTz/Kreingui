--// Alif's Custom Script Hub (Modular Base) - Draggable UI Ready

-- UI Library Base (KreinHub.lua)
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

-- GUI Title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "KreinHub"
TitleLabel.Font = TitleStyle.Font
TitleLabel.TextSize = TitleStyle.Size
TitleLabel.TextColor3 = TitleStyle.Color
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.PaddingLeft = UDim.new(0, 10)
TitleLabel.Parent = MainFrame

-- Minimize & Close Buttons
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
CloseButton.Parent = MainFrame

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -70, 0, 5)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MinimizeButton.Parent = MainFrame

local isMinimized = false
local originalSize = MainFrame.Size
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    MainFrame.Size = isMinimized and UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 40) or originalSize
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Tab Container
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 120, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
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

-- Scrollable container helper
function addScrollable(parent)
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.ScrollBarThickness = 6
    scroll.BackgroundTransparency = 1
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.ClipsDescendants = true
    scroll.Parent = parent

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = scroll

    return scroll
end

-- Global reference
_G.KreinBase = {
    ScreenGui = ScreenGui,
    MainFrame = MainFrame,
    TabContainer = TabContainer,
    ContentContainer = ContentContainer,
    TextStyle = TextStyle,
    TitleStyle = TitleStyle,
    addList = addList,
    addScrollable = addScrollable
}

print("✅ KreinBase initialized.")
