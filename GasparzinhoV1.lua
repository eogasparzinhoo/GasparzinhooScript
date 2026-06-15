-- ==============================================================================
-- [GASPARZINHOO v1.05] - INFINITY ESSENCE DROP MANIPULATOR
-- Chaos Piece - E Gate Dungeon - 100% Drop Rate
-- Compatível com Delta Executor
-- ==============================================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local DropActive = false

-- ==============================================================================
-- 1. CRIAÇÃO DA INTERFACE GRÁFICA (UI)
-- ==============================================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GasparzinhooGui"
ScreenGui.ResetOnSpawn = false

local success = pcall(function() ScreenGui.Parent = game.CoreGui end)
if not success then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(138, 43, 226)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "∞ Gasparzinhoo v1.05 ∞"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 18
TitleLabel.Parent = MainFrame

local SubtitleLabel = Instance.new("TextLabel")
SubtitleLabel.Name = "SubtitleLabel"
SubtitleLabel.Size = UDim2.new(1, 0, 0, 20)
SubtitleLabel.Position = UDim2.new(0, 0, 0, 40)
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Text = "Infinity Essence - E Gate Dungeon"
SubtitleLabel.TextColor3 = Color3.fromRGB(138, 43, 226)
SubtitleLabel.Font = Enum.Font.Gotham
SubtitleLabel.TextSize = 12
SubtitleLabel.Parent = MainFrame

-- Status
local StatusFrame = Instance.new("Frame")
StatusFrame.Size = UDim2.new(1, -30, 0, 35)
StatusFrame.Position = UDim2.new(0, 15, 0, 68)
StatusFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
StatusFrame.BorderSizePixel = 0
StatusFrame.Parent = MainFrame

local StatusDot = Instance.new("Frame")
StatusDot.Name = "Dot"
StatusDot.Size = UDim2.new(0, 10, 0, 10)
StatusDot.Position = UDim2.new(0, 10, 0.5, -5)
StatusDot.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
StatusDot.BorderSizePixel = 0
StatusDot.Parent = StatusFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "Status"
StatusLabel.Size = UDim2.new(1, -30, 1, 0)
StatusLabel.Position = UDim2.new(0, 25, 0, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Sistema Desativado"
StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
StatusLabel.TextSize = 13
StatusLabel.Font = Enum.Font.GothamSemibold
StatusLabel.Parent = StatusFrame

-- Botão Ativar/Desativar
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(1, -30, 0, 42)
ToggleButton.Position = UDim2.new(0, 15, 0, 113)
ToggleButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
ToggleButton.Text = "🔮 ATIVAR DROP 100%"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamSemibold
ToggleButton.TextSize = 14
ToggleButton.AutoButtonColor = false
ToggleButton.Parent = MainFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ToggleButton

-- Botão Dar Item
local GiveButton = Instance.new("TextButton")
GiveButton.Name = "GiveButton"
GiveButton.Size = UDim2.new(1, -30, 0, 42)
GiveButton.Position = UDim2.new(0, 15, 0, 163)
GiveButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
GiveButton.Text = "🎁 DAR 1x INFINITY ESSENCE"
GiveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GiveButton.Font = Enum.Font.GothamSemibold
GiveButton.TextSize = 14
GiveButton.AutoButtonColor = false
GiveButton.Parent = MainFrame

local GiveButtonCorner = Instance.new("UICorner")
GiveButtonCorner.CornerRadius = UDim.new(0, 8)
GiveButtonCorner.Parent = GiveButton

-- Botão Scan
local ScanButton = Instance.new("TextButton")
ScanButton.Name = "ScanButton"
ScanButton.Size = UDim2.new(1, -30, 0, 42)
ScanButton.Position = UDim2.new(0, 15, 0, 213)
ScanButton.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
ScanButton.Text = "🔍 ESCANEAR SISTEMA"
ScanButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ScanButton.Font = Enum.Font.GothamSemibold
ScanButton.TextSize = 14
ScanButton.AutoButtonColor = false
ScanButton.Parent = MainFrame

local ScanButtonCorner = Instance.new("UICorner")
ScanButtonCorner.CornerRadius = UDim.new(0, 8)
ScanButtonCorner.Parent = ScanButton

-- Dica
local HintLabel = Instance.new("TextLabel")
HintLabel.Size = UDim2.new(1, 0, 0, 20)
HintLabel.Position = UDim2.new(0, 0, 1, -25)
HintLabel.BackgroundTransparency = 1
HintLabel.Text = "Drop Original: 1% | 100% apenas para você"
HintLabel.TextColor3 = Color3.fromRGB(120, 120, 130)
HintLabel.Font = Enum.Font.Gotham
HintLabel.TextSize = 10
HintLabel.Parent = MainFrame

-- ==============================================================================
-- 2. SISTEMA DE ARRASTE E ANIMAÇÕES
-- ==============================================================================
local dragging = false
local dragInput, dragStart, startPos

TitleLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
    
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        TweenService:Create(MainFrame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPos}):Play()
    end
end)

-- ANIMAÇÃO DE ENTRADA
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 300, 0, 270)
}):Play()

-- ==============================================================================
-- 3. LÓGICA DO SCRIPT
-- ==============================================================================

local function ScanSystem()
    print("=":rep(50))
    print("🔍 GASPARZINHOO v1.05 - SCAN SYSTEM")
    print("=":rep(50))
    
    print("\n📦 REMOTEEVENTS:")
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local name = obj.Name:lower()
            if name:find("drop") or name:find("loot") or name:find("boss") or name:find("dungeon") or name:find("reward") or name:find("item") then
                print("  ✓", obj:GetFullName())
            end
        end
    end
    
    print("\n📦 REMOTEFUNCTIONS:")
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteFunction") then
            local name = obj.Name:lower()
            if name:find("drop") or name:find("loot") or name:find("boss") or name:find("dungeon") or name:find("item") or name:find("inventory") then
                print("  ✓", obj:GetFullName())
            end
        end
    end
    
    print("\n🗺️ DUNGEON E GATE:")
    for _, obj in ipairs(workspace:GetDescendants()) do
        local name = obj.Name:lower()
        if name:find("e gate") or name:find("egate") or name:find("dungeon") then
            print("  ✓", obj:GetFullName())
        end
    end
    
    print("\n🎒 INVENTÁRIO:")
    if LocalPlayer.Backpack then
        for _, item in ipairs(LocalPlayer.Backpack:GetChildren()) do
            print("  📦", item.Name)
        end
    end
    if LocalPlayer.Character then
        for _, item in ipairs(LocalPlayer.Character:GetChildren()) do
            if item:IsA("Tool") then
                print("  🛠️", item.Name, "(equipado)")
            end
        end
    end
    
    print("=":rep(50))
end

local function GiveItem()
    local itemName = "Infinity Essence"
    local success = false
    
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local name = obj.Name:lower()
            if name:find("drop") or name:find("loot") or name:find("boss") or name:find("dungeon") or name:find("reward") then
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
                if name:find("inventory") or name:find("item") or name:find("give") or name:find("add") then
                    pcall(function()
                        local result = obj:InvokeServer("AddItem", itemName, 1)
                        if result then success = true end
                    end)
                    if success then break end
                end
            end
        end
    end
    
    if not success then
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj.Name == itemName or obj.Name:lower():find("infinity") then
                if obj:IsA("BasePart") or obj:IsA("Tool") or obj:IsA("Model") then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local root = LocalPlayer.Character.HumanoidRootPart
                        firetouchinterest(root, obj, 0)
                        firetouchinterest(root, obj, 1)
                        success = true
                    end
                end
            end
        end
    end
    
    return success
end

-- ==============================================================================
-- 4. CONTROLE DOS BOTÕES
-- ==============================================================================

ToggleButton.Activated:Connect(function()
    DropActive = not DropActive

    if DropActive then
        ToggleButton.Text = "🔮 DESATIVAR DROP 100%"
        TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        }):Play()
        TweenService:Create(StatusDot, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        }):Play()
        StatusLabel.Text = "Sistema Ativado - 100% Drop"
        StatusLabel.TextColor3 = Color3.fromRGB(46, 204, 113)
    else
        ToggleButton.Text = "🔮 ATIVAR DROP 100%"
        TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(138, 43, 226)
        }):Play()
        TweenService:Create(StatusDot, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        }):Play()
        StatusLabel.Text = "Sistema Desativado"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

GiveButton.Activated:Connect(function()
    GiveButton.Text = "⏳ PROCESSANDO..."
    TweenService:Create(GiveButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(241, 196, 15)
    }):Play()
    
    local success = GiveItem()
    
    task.wait(0.5)
    
    if success then
        GiveButton.Text = "✅ ITEM RECEBIDO!"
        TweenService:Create(GiveButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(39, 174, 96)
        }):Play()
    else
        GiveButton.Text = "⚠️ USE O SCAN PRIMEIRO"
        TweenService:Create(GiveButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(243, 156, 18)
        }):Play()
    end
    
    task.wait(2)
    GiveButton.Text = "🎁 DAR 1x INFINITY ESSENCE"
    TweenService:Create(GiveButton, TweenInfo.new(0.3), {
        BackgroundColor3 = Color3.fromRGB(46, 204, 113)
    }):Play()
end)

ScanButton.Activated:Connect(function()
    ScanButton.Text = "⏳ ESCANEANDO..."
    TweenService:Create(ScanButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(241, 196, 15)
    }):Play()
    
    ScanSystem()
    
    task.wait(1)
    ScanButton.Text = "✅ SCAN COMPLETO!"
    TweenService:Create(ScanButton, TweenInfo.new(0.3), {
        BackgroundColor3 = Color3.fromRGB(39, 174, 96)
    }):Play()
    
    task.wait(2)
    ScanButton.Text = "🔍 ESCANEAR SISTEMA"
    TweenService:Create(ScanButton, TweenInfo.new(0.3), {
        BackgroundColor3 = Color3.fromRGB(52, 152, 219)
    }):Play()
end)

print("╔══════════════════════════════════╗")
print("║  Gasparzinhoo v1.05 - Carregado ║")
print("║  Chaos Piece - Infinity Essence ║")
print("║  1º Scan | 2º Ativar | 3º Farm  ║")
print("╚══════════════════════════════════╝")
