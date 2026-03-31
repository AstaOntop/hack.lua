-- [[ LEFIX-GPT: OMNIPOTENCE V7 - NZM4 PRIVATE ]] --
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local lp = Players.LocalPlayer

-- UI SETUP (BLACK & BLOOD RED)
local sg = Instance.new("ScreenGui", CoreGui)
sg.Name = "LefixV7_Omnipotence"

local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 260, 0, 520)
frame.Position = UDim2.new(0.05, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "LEFIX - NZM4 OMNIPOTENCE"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18

local function addBtn(txt, pos, color, callback)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(0.9, 0, 0, 32)
    b.Position = pos
    b.Text = txt
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.SourceSansBold
    b.MouseButton1Click:Connect(callback)
    return b
end

-- [ 1. NUCLEAR LAG (FITUR BARU) ]
local lagging = false
local lagBtn = addBtn("NUCLEAR LAG: OFF", UDim2.new(0.05, 0, 0.1, 0), Color3.fromRGB(40, 40, 40), function()
    lagging = not lagging
    if lagging then
        print("LAG AKTIF! Server bakal hancur!")
        task.spawn(function()
            while lagging do
                for i = 1, 120 do
                    local p = Instance.new("Part")
                    p.Size = Vector3.new(80, 80, 80)
                    p.Transparency = 1
                    p.Velocity = Vector3.new(math.random(-1000, 1000), 1000, math.random(-1000, 1000))
                    p.Position = lp.Character.HumanoidRootPart.Position + Vector3.new(0, 200, 0)
                    p.Parent = workspace
                    Debris:AddItem(p, 0.1)
                end
                task.wait(0.02)
            end
        end)
    end
end)
RunService.RenderStepped:Connect(function() lagBtn.Text = lagging and "NUCLEAR LAG: ACTIVE" or "NUCLEAR LAG: OFF" lagBtn.BackgroundColor3 = lagging and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 40) end)

-- [ 2. TELEPORT ]
local targetInput = Instance.new("TextBox", frame)
targetInput.Size = UDim2.new(0.9, 0, 0, 30)
targetInput.Position = UDim2.new(0.05, 0, 0.18, 0)
targetInput.PlaceholderText = "Nama Target..."
targetInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
targetInput.TextColor3 = Color3.new(1, 1, 1)

addBtn("TP TO TARGET", UDim2.new(0.05, 0, 0.25, 0), Color3.fromRGB(80, 0, 80), function()
    local target = targetInput.Text:lower()
    for _, v in pairs(Players:GetPlayers()) do
        if v.Name:lower():find(target) and v ~= lp then
            lp.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
            break
        end
    end
end)

-- [ 3. FLING ]
addBtn("ACTIVATE FLING", UDim2.new(0.05, 0, 0.33, 0), Color3.fromRGB(150, 0, 0), function()
    local bV = Instance.new("BodyAngularVelocity", lp.Character.HumanoidRootPart)
    bV.AngularVelocity = Vector3.new(999999, 999999, 999999)
    bV.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
end)

-- [ 4. FLY ]
local flying = false
addBtn("FLY (TOGGLE)", UDim2.new(0.05, 0, 0.41, 0), Color3.fromRGB(40, 40, 40), function()
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

-- [ 5. SPEED & JUMP ]
addBtn("SPEED (500)", UDim2.new(0.05, 0, 0.49, 0), Color3.fromRGB(40, 40, 40), function() lp.Character.Humanoid.WalkSpeed = 500 end)
addBtn("INF JUMP", UDim2.new(0.05, 0, 0.57, 0), Color3.fromRGB(40, 40, 40), function()
    game:GetService("UserInputService").JumpRequest:Connect(function() lp.Character.Humanoid:ChangeState("Jumping") end)
end)

-- [ 6. NOCLIP ]
addBtn("NOCLIP (TEMBUS)", UDim2.new(0.05, 0, 0.65, 0), Color3.fromRGB(40, 40, 40), function()
    RunService.Stepped:Connect(function()
        for _, v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
    end)
end)

-- [ 7. RESET & CLOSE ]
addBtn("RESET CHARACTER", UDim2.new(0.05, 0, 0.73, 0), Color3.fromRGB(30, 30, 30), function() lp.Character.Humanoid.Health = 0 end)
addBtn("DESTROY PANEL", UDim2.new(0.05, 0, 0.88, 0), Color3.fromRGB(0, 0, 0), function() sg:Destroy() end)
