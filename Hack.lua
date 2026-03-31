-- [[ Weda ULTIMATE REVENGE V4 ]] --
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

-- UI SETUP (DARK REVENGE THEME)
local sg = Instance.new("ScreenGui")
sg.Name = "LefixV4_NZM4"
sg.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 260, 0, 450)
frame.Position = UDim2.new(0.1, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.Active = true
frame.Draggable = true
frame.Parent = sg

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "LEFIX - PLAYER HUNTER"
title.TextColor3 = Color3.new(1, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22
title.Parent = frame

-- INPUT BOX BUAT TELEPORT
local targetInput = Instance.new("TextBox")
targetInput.Size = UDim2.new(0.9, 0, 0, 35)
targetInput.Position = UDim2.new(0.05, 0, 0.12, 0)
targetInput.PlaceholderText = "Nama Player (Target)..."
targetInput.Text = ""
targetInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
targetInput.TextColor3 = Color3.new(1, 1, 1)
targetInput.Parent = frame

local function addBtn(txt, pos, color, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.9, 0, 0, 35)
    b.Position = pos
    b.Text = txt
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.SourceSansBold
    b.Parent = frame
    b.MouseButton1Click:Connect(callback)
end

-- [ 1. TELEPORT TO PLAYER ]
addBtn("TELEPORT KE TARGET", UDim2.new(0.05, 0, 0.22, 0), Color3.fromRGB(100, 0, 100), function()
    local targetName = targetInput.Text:lower()
    for _, v in pairs(Players:GetPlayers()) do
        if v.Name:lower():find(targetName) and v ~= lp then
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                lp.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
            end
            break
        end
    end
end)

-- [ 2. FLING (NGAMUK) ]
addBtn("AKTIFKAN FLING", UDim2.new(0.05, 0, 0.32, 0), Color3.fromRGB(150, 0, 0), function()
    local bV = Instance.new("BodyAngularVelocity", lp.Character.HumanoidRootPart)
    bV.AngularVelocity = Vector3.new(99999, 99999, 99999)
    bV.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    RunService.Stepped:Connect(function()
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end)
end)

-- [ 3. SPEED ]
addBtn("SPEED HACK (500)", UDim2.new(0.05, 0, 0.42, 0), Color3.fromRGB(50, 50, 50), function()
    lp.Character.Humanoid.WalkSpeed = 500
end)

-- [ 4. FLY ]
local flying = false
addBtn("FLY (TOGGLE)", UDim2.new(0.05, 0, 0.52, 0), Color3.fromRGB(50, 50, 50), function()
    flying = not flying
    local bv = Instance.new("BodyVelocity", lp.Character.PrimaryPart)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    task.spawn(function()
        while flying do
            bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 150
            task.wait()
        end
        bv:Destroy()
    end)
end)

-- [ 5. NOCLIP ]
addBtn("NOCLIP (TEMBUS)", UDim2.new(0.05, 0, 0.62, 0), Color3.fromRGB(50, 50, 50), function()
    RunService.Stepped:Connect(function()
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end)
end)

-- [ 6. INF JUMP ]
addBtn("INFINITE JUMP", UDim2.new(0.05, 0, 0.72, 0), Color3.fromRGB(50, 50, 50), function()
    game:GetService("UserInputService").JumpRequest:Connect(function()
        lp.Character.Humanoid:ChangeState("Jumping")
    end)
end)

-- [ 7. CLOSE ]
addBtn("HANCURKAN MENU", UDim2.new(0.05, 0, 0.88, 0), Color3.fromRGB(0, 0, 0), function()
    sg:Destroy()
end)
