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

-- Speed Slider
Tab:CreateSlider({
    Name = "Speed of the light DO NOT ABUSE",
    Range = {16, 1500},
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
    Name = "Noclip ",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        NoclipEnabled = Value
        print("Noclip (Self): " .. (Value and "ENABLED" or "DISABLED"))
    end,
})

-- Admin Panel Buttons
Tab:CreateButton({
    Name = "God Mode",
    Callback = function()
        Humanoid.MaxHealth = math.huge
        Humanoid.Health = math.huge
        print("God Mode now  GET OUT OF HERE!")
    end,
})

Tab:CreateButton({
    Name = "Infinite Jump",
    Callback = function()
        local InfiniteJumpEnabled = true
        
        spawn(function()
            while InfiniteJumpEnabled do
                if UIS:IsKeyDown(Enum.KeyCode.Space) then
                    Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    wait(0.1)
                end
                wait()
            end
        end)
        
        print("BRUHHHHHHH!")
    end,
})

Tab:CreateButton({
    Name = "Heal full ",
    Callback = function()
        Humanoid.Health = Humanoid.MaxHealth
        print("why u are chehking!")
    end,
})

Tab:CreateButton({
    Name = "Teleport to Spawn",
    Callback = function()
        RootPart.CFrame = CFrame.new(0, 10, 0)
        print("CE  CREDEAI CA VA FIIIII!")
    end,
})

Tab:CreateButton({
    Name = "Kill you",
    Callback = function()
        Humanoid.Health = 0
        print("you died")
    end,
})

-- Admin Info Tab
local InfoTab = Window:CreateTab("Info", 1)

InfoTab:CreateLabel("Admin Panel Features:")
InfoTab:CreateLabel("✓ Speed Control")
InfoTab:CreateLabel("✓ Noclip Toggle")
InfoTab:CreateLabel("✓ God Mode")
InfoTab:CreateLabel("✓ Infinite Jump")
InfoTab:CreateLabel("✓ Heal Button")
InfoTab:CreateLabel("✓ Teleport")
InfoTab:CreateLabel("✓ Kill Self")

-- Continuous Noclip Check
spawn(function()
    while true do
        wait(0.1)
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
    end
end)

print("GG!")
