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
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Subtitle",
        Note = "Note",
        FileName = "Key",
        SaveKey = true,
        FixKeyUi = true
    }
})

-- Create Tab
local Tab = Window:CreateTab("Player Settings", 0)

-- Variables
local SpeedValue = 30
local NoclipEnabled = false

-- Speed Slider
local SpeedSlider = Tab:CreateSlider({
    Name = "Speed of the light DO NOT ABUSE ",
    Range = {0, 10000000000004905686458904568900},
    Increment = 1,
    Suffix = " Studs/s",
    CurrentValue = 30,
    Flag = "SpeedSlider",
    Callback = function(Value)
        SpeedValue = Value
        print("Speed hase benn seted  to: " .. Value)
    end,
})

-- Noclip Toggle
local NoclipToggle = Tab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        NoclipEnabled = Value
        print("Noclip: " .. (Value and "ENABLED" or "DISABLED"))
    end,
})

-- Apply Speed and Noclip in loop
spawn(function()
    while Character do
        wait(0.05)
        if Humanoid and Humanoid.Health > 0 then
            -- Apply Speed (more powerful!)
            Humanoid.WalkSpeed = SpeedValue / 10
            
            -- Apply Noclip
            if NoclipEnabled then
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
        end
    end
end)

print("GG!")
