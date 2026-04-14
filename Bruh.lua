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
local JumpPowerValue = 50

-- Jump Power Slider
local JumpPowerSlider = Tab:CreateSlider({
    Name = "jump power (OP)",
    Range = {0, 10000},
    Increment = 1,
    Suffix = " Studs",
    CurrentValue = 50,
    Flag = "JumpPowerSlider",
    Callback = function(Value)
        JumpPowerValue = Value
        print("Jump Power has bennseted to: " .. Value)
    end,
})

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

-- Apply Speed only (simpler and works!)
spawn(function()
    while Character do
        wait(0.1)
        if Humanoid and Humanoid.Health > 0 then
            Humanoid.WalkSpeed = SpeedValue
        end
    end
end)

print("GG!")
