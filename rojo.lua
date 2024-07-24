-- Gui to Lua
-- Version: 3.2

-- Instances:

local MainGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Bar = Instance.new("Frame")
local HB = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local btn1 = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local btn2 = Instance.new("TextButton")

--Properties:

MainGui.Name = "MainGui"
MainGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = MainGui
Frame.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.346251577, 0, 0.285478562, 0)
Frame.Size = UDim2.new(0, 484, 0, 260)

Bar.Name = "Bar"
Bar.Parent = Frame
Bar.BackgroundColor3 = Color3.fromRGB(127, 0, 0)
Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bar.BorderSizePixel = 0
Bar.Size = UDim2.new(0, 484, 0, 36)

HB.Name = "HB"
HB.Parent = Bar
HB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HB.BackgroundTransparency = 1.000
HB.BorderColor3 = Color3.fromRGB(0, 0, 0)
HB.BorderSizePixel = 0
HB.Position = UDim2.new(0.0185950417, 0, 0.0833333358, 0)
HB.Size = UDim2.new(0, 33, 0, 30)
HB.Font = Enum.Font.DenkOne
HB.Text = "HB"
HB.TextColor3 = Color3.fromRGB(255, 255, 255)
HB.TextScaled = true
HB.TextSize = 14.000
HB.TextWrapped = true

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.0185950417, 0, 0.161538467, 0)
ScrollingFrame.Size = UDim2.new(0, 468, 0, 212)
ScrollingFrame.ScrollBarThickness = 6

btn1.Name = "btn1"
btn1.Parent = ScrollingFrame
btn1.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
btn1.BorderColor3 = Color3.fromRGB(0, 0, 0)
btn1.BorderSizePixel = 0
btn1.Size = UDim2.new(0, 99, 0, 50)
btn1.Font = Enum.Font.Creepster
btn1.Text = "Zombie Doge"
btn1.TextColor3 = Color3.fromRGB(0, 118, 0)
btn1.TextScaled = true
btn1.TextSize = 14.000
btn1.TextWrapped = true

UIListLayout.Parent = ScrollingFrame
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

btn2.Name = "btn2"
btn2.Parent = ScrollingFrame
btn2.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
btn2.BorderColor3 = Color3.fromRGB(0, 0, 0)
btn2.BorderSizePixel = 0
btn2.Size = UDim2.new(0, 99, 0, 50)
btn2.Font = Enum.Font.Arial
btn2.Text = "GOD MODE"
btn2.TextColor3 = Color3.fromRGB(255, 255, 255)
btn2.TextScaled = true
btn2.TextSize = 14.000
btn2.TextWrapped = true

-- Scripts:

local script = Instance.new('LocalScript', Bar)

local frame = script.Parent.Parent
local UIS = game:GetService("UserInputService")

local clicks = 0

UIS.InputBegan:Connect(function(input, GPE)
	if input.KeyCode == Enum.KeyCode.K and not GPE then
		if clicks == 0 then
			clicks += 1
			frame.Visible = false
		elseif clicks == 1 then
			clicks = 0
			frame.Visible = true
		end
	end
end)
[[local function GHTEET_fake_script() -- Frame.DragScript 
	local script1 = Instance.new('LocalScript', Frame)

	script1.Source = [[
		local player = game.Players.LocalPlayer
	local mouse = player:GetMouse()
	local frame = script.Parent
	
	local mouseMovec
	
	local UIS = game:GetService("UserInputService")
	
	local inDrag = false
	
	frame.Bar.MouseEnter:Connect(function()
		inDrag = true
	end)
	
	frame.Bar.MouseLeave:Connect(function()
		inDrag = false
	end)
	
	UIS.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and inDrag then
			local offset = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y)
			
			mouseMovec = mouse.Move:Connect(function()
				frame.Position = UDim2.new(0, mouse.X - offset.X, 0, mouse.Y - offset.Y)
			end)
		end
	end)
	
	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and inDrag then
			mouseMovec:Disconnect()
		end
	end)

end]]

local player = script.Parent.Parent.Parent.Parent.Parent.Parent

local char = player.Character or player.CharacterAdded:Wait()

local model = game.InsertService:LoadAsset(13858020856)

btn2.MouseButton1Click:Connect(function()
	print("act")
	local cln = model:Clone()
	cln.Parent = workspace
	cln:MoveTo(char.HumanoidRootPart.Position)

	for _, v in pairs(cln:GetDescendants()) do
		if v:IsA("Script") then
			v.Enabled = true
		end
	end

	for _, v in pairs(cln:GetDescendants()) do
		if v:IsA("Sound") then
			v.Volume = 1
		end
	end
end)

local player = game.Players.LocalPlayer

local function giveGodMode(player)
	local character = player.Character
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	humanoid.Health = humanoid.MaxHealth
	humanoid:GetPropertyChangedSignal("Health"):Connect(function()
		if humanoid.Health < humanoid.MaxHealth then
			humanoid.Health = humanoid.MaxHealth
		end
	end)
end

btn1.MouseButton1Click:Connect(function()
	giveGodMode(player)
end)
