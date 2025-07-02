-- Loader.lua

-- Load GUI Base
local KreinHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/LippTz/Kreingui/main/Base.lua"))()

-- Tambahkan Tab
local combatTab = KreinHub:CreateTab("Combat")

-- Tambahkan Button ke Combat Tab
KreinHub:AddButton(combatTab, "Auto Kill", function()
    print("Auto Kill Aktif!")
end)

-- Tambahkan Toggle ke Combat Tab
KreinHub:AddToggle(combatTab, "God Mode", function(state)
    print("God Mode: ", state)
end)

-- Tab lainnya
local miscTab = KreinHub:CreateTab("Misc")
KreinHub:AddButton(miscTab, "Fly", function()
    print("Fly Mode!")
end)

-- Tambahkan tab atau tombol/toggle lainnya sesuai kebutuhanmu
