local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "SKkibidi adminul facut de mine",
    LoadingTitle = "Loading Skibidi adminul facut de mine",
    LoadingSubtitle = "de mine",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "RayfieldConfig",
        FileName = "AdminConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false
})

-- Create Tab
local Tab = Window:CreateTab("Player Settings", 0)

-- Variables
local SpeedValue = 30
local NoclipEnabled = false
local SelectedPlayer = nil
local PlayerNoclips = {}

-- Get all players function
local function GetPlayerList()
    local playerList = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    return playerList
end

-- Speed Slider
Tab:CreateSlider({
    Name = "Speed of the light DO NOT ABUSE",
    Range = {16, 500},
    Increment = 1,
    Suffix = " Studs/s",
    CurrentValue = 30,
    Flag = "SpeedSlider",
    Callback = function(Value)
        SpeedValue = Value
        Humanoid.WalkSpeed = Value
        print("Speed set to: " .. Value)
    end,
})

-- Self Noclip Toggle
Tab:CreateToggle({
    Name = "Noclip (Self)",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        NoclipEnabled = Value
        print("Noclip (Self): " .. (Value and "ENABLED" or "DISABLED"))
    end,
})

-- Select Player Dropdown
Tab:CreateDropdown({
    Name = "Select Player",
    Options = GetPlayerList(),
    CurrentOption = {"None"},
    MultipleOptions = false,
    Flag = "PlayerDropdown",
    Callback = function(Option)
        if Option[1] ~= "None" then
            SelectedPlayer = Players:FindFirstChild(Option[1])
            print("Selected Player: " .. (SelectedPlayer and SelectedPlayer.Name or "Not found"))
        else
            SelectedPlayer = nil
            print("No player selected")
        end
    end,
})

-- Add Noclip to Player Button
Tab:CreateButton({
    Name = "Add Noclip to Selected Player",
    Callback = function()
        if SelectedPlayer then
            PlayerNoclips[SelectedPlayer.Name] = true
            print("Noclip ENABLED for " .. SelectedPlayer.Name)
        else
            print("No player selected!")
        end
    end,
})

-- Remove Noclip from Player Button
Tab:CreateButton({
    Name = "Remove Noclip from Selected Player",
    Callback = function()
        if SelectedPlayer then
            PlayerNoclips[SelectedPlayer.Name] = false
            print("Noclip DISABLED for " .. SelectedPlayer.Name)
        else
            print("No player selected!")
        end
    end,
})

-- Main Loop for Noclip and Speed
spawn(function()
    while true do
        wait(0.05)
        
        -- Self Noclip
        if NoclipEnabled and Character then
            for _, part in pairs(Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        else
            for _, part in pairs(Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
        
        -- Apply Speed
        Humanoid.WalkSpeed = SpeedValue
        
        -- Other Players Noclip (Phase through by moving them)
        for playerName, enabled in pairs(PlayerNoclips) do
            local player = Players:FindFirstChild(playerName)
            if player and player.Character then
                local playerChar = player.Character
                local playerHumanoid = playerChar:FindFirstChild("Humanoid")
                local playerRoot = playerChar:FindFirstChild("HumanoidRootPart")
                
                if enabled and playerRoot then
                    -- Disable collisions
                    for _, part in pairs(playerChar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                elseif not enabled and playerRoot then
                    -- Enable collisions
                    for _, part in pairs(playerChar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
            end
        end
    end
end)

print("GG!")
