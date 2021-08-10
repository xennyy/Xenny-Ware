-- very bad code i know

local StatusScreen = Instance.new("ScreenGui")
local StatusHolder = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local gundrop = Instance.new("TextLabel")
local return1 = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
local murd = Instance.new("TextLabel")
local return_2 = Instance.new("TextLabel")
local sheriff = Instance.new("TextLabel")
local return_3 = Instance.new("TextLabel")
local round = Instance.new("TextLabel")
local return_6 = Instance.new("TextLabel")

StatusScreen.Name = "StatusScreen"
StatusScreen.Parent = game.CoreGui
StatusScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

StatusHolder.Name = "StatusHolder"
StatusHolder.Parent = StatusScreen
StatusHolder.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
StatusHolder.BorderColor3 = Color3.fromRGB(170, 0, 255)
StatusHolder.Position = UDim2.new(0.738300443, 0, 0.0381406434, 0)
StatusHolder.Size = UDim2.new(0, 350,0, 116)
StatusHolder.Draggable = true;
Title.Name = "Title"
Title.Parent = StatusHolder
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.0169491526, 0, 0, 0)
Title.Size = UDim2.new(0, 159, 0, 34)
Title.Font = Enum.Font.SourceSansLight
Title.Text = "    Xenny-Ware Stats"
Title.TextColor3 = Color3.fromRGB(170, 0, 255)
Title.TextSize = 22.000
Title.TextStrokeColor3 = Color3.fromRGB(170, 0, 255)
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

gundrop.Name = "gundrop"
gundrop.Parent = StatusHolder
gundrop.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
gundrop.BorderColor3 = Color3.fromRGB(170, 0, 255)
gundrop.Position = UDim2.new(0.0126596903, 0, 0.165844306, 0)
gundrop.Size = UDim2.new(0, 173, 0, 20)
gundrop.Font = Enum.Font.SourceSansLight
gundrop.Text = "Gun Dropped:"
gundrop.TextColor3 = Color3.fromRGB(170, 0, 255)
gundrop.TextSize = 14.000
gundrop.TextStrokeColor3 = Color3.fromRGB(170, 0, 255)

return1.Name = "return"
return1.Parent = gundrop
return1.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
return1.BorderColor3 = Color3.fromRGB(170, 0, 255)
return1.Position = UDim2.new(0.997750521, 0, -0.00584030151, 0)
return1.Size = UDim2.new(0, 175, 0, 20)
return1.Font = Enum.Font.SourceSansLight
return1.Text = "false"
return1.TextColor3 = Color3.fromRGB(170, 0, 0)
return1.TextSize = 14.000
return1.TextStrokeColor3 = Color3.fromRGB(170, 0, 0)

UIListLayout.Parent = StatusHolder
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

murd.Name = "murd"
murd.Parent = StatusHolder
murd.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
murd.BorderColor3 = Color3.fromRGB(170, 0, 255)
murd.Position = UDim2.new(0.0154845491, 0, 0.119249322, 0)
murd.Size = UDim2.new(0, 173, 0, 20)
murd.Font = Enum.Font.SourceSansLight
murd.Text = "Murderer:"
murd.TextColor3 = Color3.fromRGB(170, 0, 255)
murd.TextSize = 14.000
murd.TextStrokeColor3 = Color3.fromRGB(170, 0, 255)

return_2.Name = "return"
return_2.Parent = murd
return_2.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
return_2.BorderColor3 = Color3.fromRGB(170, 0, 255)
return_2.Position = UDim2.new(0.997750521, 0, -0.00584030151, 0)
return_2.Size = UDim2.new(0, 175, 0, 20)
return_2.Font = Enum.Font.SourceSansLight
return_2.Text = "nil"
return_2.TextColor3 = Color3.fromRGB(170, 0, 0)
return_2.TextSize = 14.000
return_2.TextStrokeColor3 = Color3.fromRGB(170, 0, 0)

sheriff.Name = "sheriff"
sheriff.Parent = StatusHolder
sheriff.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
sheriff.BorderColor3 = Color3.fromRGB(170, 0, 255)
sheriff.Position = UDim2.new(0.0154845491, 0, 0.119249322, 0)
sheriff.Size = UDim2.new(0, 173, 0, 20)
sheriff.Font = Enum.Font.SourceSansLight
sheriff.Text = "Sheriff:"
sheriff.TextColor3 = Color3.fromRGB(170, 0, 255)
sheriff.TextSize = 14.000
sheriff.TextStrokeColor3 = Color3.fromRGB(170, 0, 255)

return_3.Name = "return"
return_3.Parent = sheriff
return_3.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
return_3.BorderColor3 = Color3.fromRGB(170, 0, 255)
return_3.Position = UDim2.new(0.997750521, 0, -0.00584030151, 0)
return_3.Size = UDim2.new(0, 175, 0, 20)
return_3.Font = Enum.Font.SourceSansLight
return_3.Text = "nil"
return_3.TextColor3 = Color3.fromRGB(0, 0, 255)
return_3.TextSize = 14.000
return_3.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)
round.Name = "round"
round.Parent = StatusHolder
round.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
round.BorderColor3 = Color3.fromRGB(170, 0, 255)
round.Position = UDim2.new(0.0154845491, 0, 0.0726543367, 0)
round.Size = UDim2.new(0, 173, 0, 20)
round.Font = Enum.Font.SourceSansLight
round.Text = "Round Started:"
round.TextColor3 = Color3.fromRGB(170, 0, 255)
round.TextSize = 14.000
round.TextStrokeColor3 = Color3.fromRGB(170, 0, 255)

return_6.Name = "return"
return_6.Parent = round
return_6.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
return_6.BorderColor3 = Color3.fromRGB(170, 0, 255)
return_6.Position = UDim2.new(0.997750521, 0, -0.00584030151, 0)
return_6.Size = UDim2.new(0, 175, 0, 20)
return_6.Font = Enum.Font.SourceSansLight
return_6.Text = "false"
return_6.TextColor3 = Color3.fromRGB(170, 0, 0)
return_6.TextSize = 14.000
return_6.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

local function TBMSUBR_fake_script()
	local script = Instance.new('LocalScript', StatusHolder)

	repeat wait() until game.Players.LocalPlayer.Character 
    game.RunService.RenderStepped:Connect(function()
        if game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Waiting.Visible  ~= true then
            script.Parent.round["return"].Text = "true"
            if script.Parent.sheriff["return"].Text == "nil" then
			for i,v in next, game.Players:GetPlayers() do
                if script.Parent.murd["return"].Text ~= v.Name then
					if v.Character:FindFirstChild("Knife") or v.Backpack:FindFirstChild("Knife")  then
						script.Parent.murd["return"].Text = v.Name
            end
            if script.Parent.sheriff["return"].Text ~= v.Name then
					 if v.Character:FindFirstChild("Gun") or v.Backpack:FindFirstChild("Gun") then
					script.Parent.sheriff["return"].Text = v.Name 
                        end
                    end
                end
            end
            end
else
    script.Parent.gundrop["return"].Text = "false"
    script.Parent.sheriff["return"].Text = "nil"
    script.Parent.murd["return"].Text = "nil"
    repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Waiting.Visible  ~= true
        end
                    for i,v in next, workspace:GetChildren() do
				if v.Name == "GunDrop" then script.Parent.gundrop["return"].Text = "true" else script.Parent.gundrop["return"].Text = "false" end
			end
end)
end
coroutine.wrap(TBMSUBR_fake_script)()
