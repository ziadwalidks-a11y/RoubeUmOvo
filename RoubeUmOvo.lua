
-- PRIME HUB 🎃
-- Edição Halloween
-- Interface Lua

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer

local GUI = Instance.new("ScreenGui")
GUI.Name = "PRIME_HUB"
GUI.ResetOnSpawn = false
GUI.Parent = game:GetService("CoreGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 400, 0, 330)
Main.Position = UDim2.new(0.5, -200, 0.5, -165)
Main.BackgroundColor3 = Color3.fromRGB(15, 10, 22)
Main.Parent = GUI

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(160, 50, 255)
Stroke.Thickness = 2
Stroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(65, 20, 100)
Title.Text = "🎃 PRIME HUB"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 23
Title.Font = Enum.Font.GothamBold
Title.Parent = Main

local function criarBotao(nome, posicao, funcao)
    local Botao = Instance.new("TextButton")
    Botao.Size = UDim2.new(0, 175, 0, 38)
    Botao.Position = posicao
    Botao.BackgroundColor3 = Color3.fromRGB(75, 25, 115)
    Botao.TextColor3 = Color3.new(1,1,1)
    Botao.Text = nome
    Botao.TextSize = 13
    Botao.Font = Enum.Font.GothamBold
    Botao.Parent = Main

    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 7)
    C.Parent = Botao

    Botao.MouseButton1Click:Connect(funcao)
    return Botao
end

local antiAFK = false

criarBotao("Anti-Ausência: DESLIGADO",
    UDim2.new(0, 15, 0, 65), function()
        antiAFK = not antiAFK
        print("Anti-Ausência:", antiAFK)
    end)

criarBotao("Teleportar para minha base",
    UDim2.new(0, 205, 0, 65), function()
        print("Base selecionada")
    end)

criarBotao("Mostrar raridades",
    UDim2.new(0, 15, 0, 115), function()
        print("Comum | Raro | Épico | Lendário")
    end)

criarBotao("Velocidade: 1 segundo",
    UDim2.new(0, 205, 0, 115), function()
        print("Intervalo selecionado: 1 segundo")
    end)

criarBotao("Mostrar inventário",
    UDim2.new(0, 15, 0, 165), function()
        print("Inventário de teste")
    end)

criarBotao("Fechar PRIME HUB",
    UDim2.new(0, 205, 0, 165), function()
        GUI:Destroy()
    end)

-- Arrastar janela
local dragging = false
local dragStart, startPos

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

print("PRIME HUB carregado!")
