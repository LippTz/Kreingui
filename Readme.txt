HOW TO BUILD MY HUB

-- Get the library first
local KreinHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/LippTz/Kreingui/refs/heads/main/Kreinhub.lua"))()

-- Create a new Tab
local combatTab = KreinHub:CreateTab("Combat") -- You can change this "combat" section to your liking

-- Add Button
KreinHub:AddButton(combatTab, "Auto Kill", function() -- You can change this "Auto Kill" section to your liking
    print("Auto Kill Aktif!") -- change your function here
end)

-- Add Toggle
KreinHub:AddToggle(combatTab, "God Mode", function(state) -- You can change this "God Mode" section to your liking
    print("God Mode: ", state) -- change your function here
end)

-- To Add new Tab again
local miscTab = KreinHub:CreateTab("Misc") -- You can change this "Misc" section to your liking

KreinHub:AddButton(miscTab, "Fly", function() -- You can change this "Fly" section to your liking
    print("Fly Mode!") -- change your function here
end)

-- You can add more tabs or buttons/toggles as you wish.
