local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local DropActive = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GasparzinhooGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 270)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(138, 43, 226)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Gasparzinhoo v1.06"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 18
TitleLabel.Parent = MainFrame

local SubtitleLabel = Instance.new("TextLabel")
SubtitleLabel.Size = UDim2.new(1, 0, 0, 20)
SubtitleLabel.Position = UDim2.new(0, 0, 0, 40)
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Text = "Infinity Essence - E Gate"
SubtitleLabel.TextColor3 = Color3.fromRGB(138, 43, 226)
SubtitleLabel.Font = Enum.Font.Gotham
SubtitleLabel.TextSize = 12
SubtitleLabel.Parent = MainFrame

local StatusFrame = Instance.new("Frame")
StatusFrame.Size = UDim2.new(1, -30, 0, 35)
StatusFrame.Position = UDim2.new(0, 15, 0, 70)
StatusFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
StatusFrame.BorderSizePixel = 0
StatusFrame.Parent = MainFrame

local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.new(0, 10, 0, 10)
StatusDot.Position = UDim2.new(0, 10, 0.5, -5)
StatusDot.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
StatusDot.BorderSizePixel = 0
StatusDot.Parent = StatusFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -30, 1, 0)
StatusLabel.Position = UDim2.new(0, 25, 0, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Desativado"
StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
StatusLabel.TextSize = 13
StatusLabel.Font = Enum.Font.GothamSemibold
StatusLabel.Parent = StatusFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(1, -30, 0, 42)
ToggleButton.Position = UDim2.new(0, 15, 0, 115)
ToggleButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
ToggleButton.Text = "ATIVAR DROP 100%"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamSemibold
ToggleButton.TextSize = 14
ToggleButton.AutoButtonColor = false
ToggleButton.Parent = MainFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ToggleButton

local GiveButton = Instance.new("TextButton")
GiveButton.Size = UDim2.new(1, -30, 0, 42)
GiveButton.Position = UDim2.new(0, 15, 0, 165)
GiveButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
GiveButton.Text = "DAR 1x INFINITY ESSENCE"
GiveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GiveButton.Font = Enum.Font.GothamSemibold
GiveButton.TextSize = 14
GiveButton.AutoButtonColor = false
GiveButton.Parent = MainFrame

local GiveButtonCorner = Instance.new("UICorner")
GiveButtonCorner.CornerRadius = UDim.new(0, 8)
GiveButtonCorner.Parent = GiveButton

local ScanButton = Instance.new("TextButton")
ScanButton.Size = UDim2.new(1, -30, 0, 42)
ScanButton.Position = UDim2.new(0, 15, 0, 215)
ScanButton.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
ScanButton.Text = "ESCANEAR SISTEMA"
ScanButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ScanButton.Font = Enum.Font.GothamSemibold
ScanButton.TextSize = 14
ScanButton.AutoButtonColor = false
ScanButton.Parent = MainFrame

local ScanButtonCorner = Instance.new("UICorner")
ScanButtonCorner.CornerRadius = UDim.new(0, 8)
ScanButtonCorner.Parent = ScanButton

local function ScanSystem()
    print("=":rep(50))
    print("SCAN - CHAOS PIECE")
    print("=":rep(50))
    
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local name = obj.Name:lower()
            if name:find("drop") or name:find("loot") or name:find("boss") or name:find("dungeon") then
                print("📦", obj:GetFullName())
            end
        end
    end
    
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteFunction") then
            local name = obj.Name:lower()
            if name:find("inventory") or name:find("item") then
                print("📦", obj:GetFullName())
            end
        end
    end
    
    print("✅ Scan Completo!")
    print("=":rep(50))
end

local function GiveItem()
    local itemName = "Infinity Essence"
    local success = false
    
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local name = obj.Name:lower()
            if name:find("drop") or name:find("loot") or name:find("boss") or name:find("dungeon") then
                pcall(function()
                    obj:FireServer(itemName, 1)
                    success = true
                end)
                if success then break end
            end
        end
    end
    
    if not success then
        for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
            if obj:IsA("RemoteFunction") then
                local name = obj.Name:lower()
                if name:find("inventory") or name:find("item") then
                    pcall(function()
                        local result = obj:InvokeServer("AddItem", itemName, 1)
                        if result then success = true end
                    end)
                    if success then break end
                end
            end
        end
    end
    
    return success
end

ToggleButton.Activated:Connect(function()
    DropActive = not DropActive

    if DropActive then
        ToggleButton.Text = "DESATIVAR DROP 100%"
        TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        }):Play()
        StatusDot.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        StatusLabel.Text = "Ativado - 100% Drop"
        StatusLabel.TextColor3 = Color3.fromRGB(46, 204, 113)
    else
        ToggleButton.Text = "ATIVAR DROP 100%"
        TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(138, 43, 226)
        }):Play()
        StatusDot.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        StatusLabel.Text = "Desativado"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

GiveButton.Activated:Connect(function()
    GiveButton.Text = "PROCESSANDO..."
    GiveButton.BackgroundColor3 = Color3.fromRGB(241, 196, 15)
    
    local success = GiveItem()
    
    task.wait(0.5)
    
    if success then
        GiveButton.Text = "ITEM RECEBIDO!"
        GiveButton.BackgroundColor3 = Color3.fromRGB(39, 174, 96)
    else
        GiveButton.Text = "USE O SCAN PRIMEIRO"
        GiveButton.BackgroundColor3 = Color3.fromRGB(243, 156, 18)
    end
    
    task.wait(2)
    GiveButton.Text = "DAR 1x INFINITY ESSENCE"
    GiveButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
end)

ScanButton.Activated:Connect(function()
    ScanButton.Text = "ESCANEANDO..."
    ScanButton.BackgroundColor3 = Color3.fromRGB(241, 196, 15)
    
    ScanSystem()
    
    task.wait(1)
    ScanButton.Text = "SCAN COMPLETO!"
    ScanButton.BackgroundColor3 = Color3.fromRGB(39, 174, 96)
    
    task.wait(2)
    ScanButton.Text = "ESCANEAR SISTEMA"
    ScanButton.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
end)

print("Gasparzinhoo v1.06 - Carregado")
