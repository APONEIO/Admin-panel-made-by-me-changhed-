local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

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

-- Jump Power Slider
local JumpPowerSlider = Tab:CreateSlider({
    Name = "jump power (OP)",
    Range = {0, 10000},
    Increment = 1,
    Suffix = " Studs",
    CurrentValue = 50,
    Flag = "JumpPowerSlider",
    Callback = function(Value)
        Humanoid.JumpPower = Value
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
        -- Apply speed multiplier
        local Humanoid = Character:FindFirstChild("Humanoid")
        if Humanoid then
            -- You can adjust speed using a loop or by modifying movement scripts
            print("Speed hase benn seted  to: " .. Value)
        end
    end,
})

-- Speed application (run this in a loop)
spawn(function()
    local SpeedValue = 16
    while true do
        wait()
        if Character and Character:FindFirstChild("Humanoid") then
            -- Get current speed value from slider
            SpeedValue = Window.Flags.SpeedSlider or 30
            
            -- Apply speed by moving character
            local UserInputService = game:GetService("UserInputService")
            local Camera = workspace.CurrentCamera
            local Direction = Vector3.new(0, 0, 0)
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then Direction = Direction + (Camera.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then Direction = Direction - Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then Direction = Direction - (Camera.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then Direction = Direction + Camera.CFrame.RightVector end
            
            if Direction.Magnitude > 0 then
                Direction = Direction.Unit
            end
            
            local Humanoid = Character:FindFirstChild("Humanoid")
            if Humanoid then
                Humanoid:Move(Direction * SpeedValue)
            end
        end
    end
end)

print("GG!")
