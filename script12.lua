-- [[ LEFIX-GPT: SERVER-SIDE GAMEPASS CRACKER - NZM4 PRIVATE ]] --
-- WARNING: INI BAKAL NYARI REMOTE YANG BISA DITEMBAK. JANGAN SEMBARANG PAKE! --

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- FUNGSI CRACKER
local function attemptGrant()
    print("MENCARI CELAH GAMEPASS DI SERVER...")
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") then
            local name = v.Name:lower()
            -- Nyari nama remote yang mencurigakan (biasanya dev pake nama gampang)
            if name:find("gamepass") or name:find("vip") or name:find("buy") or name:find("purchase") then
                print("DITEMUKAN TARGET: " .. v.Name .. ". MENCOBA MENEMBAK...")
                
                -- Nembak data palsu biar server ngira lu udah beli
                pcall(function()
                    v:FireServer(true)
                    v:FireServer("true")
                    v:FireServer(1)
                    v:FireServer(999999)
                end)
            end
        end
    end
    print("EKSEKUSI SELESAI. CEK APAKAH AKSES VIP TERBUKA.")
end

-- Tambahin ini ke tombol di panel lu
addBtn("CRACK ALL GAMEPASSES", UDim2.new(0.05, 0, 0.7, 0), Color3.fromRGB(200, 0, 0), attemptGrant)
