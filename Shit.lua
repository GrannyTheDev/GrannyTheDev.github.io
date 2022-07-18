for i,v in pairs(game.CoreGui:GetChildren()) do
	if v:IsA("ScreenGui") and v.Name == "DarkLib" then
		v:Destroy()
	end
	if v:IsA("ScreenGui") and v.Name == "Gui" then
		v:Destroy()
	end
	if v:IsA("ScreenGui") and v.Name == "ScreenGui" then
		v:Destroy()
	end
end

repeat wait() until game and game:IsLoaded()
local Library = {}

local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local site = "https://GrannyTheDev.github.io/"

function Library:CreateWindow(title)
	local DarkLib = Instance.new("ScreenGui")
	local Header = Instance.new("Frame")
	local MainFrame = Instance.new("Frame")
	local TabHolder = Instance.new("ScrollingFrame")
	local TabListen = Instance.new("UIListLayout")
	local CloseButton = Instance.new("ImageButton")
	local Title = Instance.new("TextLabel")
	local Pages = Instance.new("Folder")

	DarkLib.Name = "DarkLib"
	DarkLib.Parent = game.CoreGui
	DarkLib.ResetOnSpawn = false

	game:GetService("UserInputService").InputBegan:connect(function(current, ok) 
		if not ok then 
			if current.KeyCode == Enum.KeyCode.RightAlt then 
				if DarkLib.Enabled == true then
					DarkLib.Enabled = false
				else
					DarkLib.Enabled = true
				end
			end
		end
	end)

	Header.Name = "Header"
	Header.Parent = DarkLib
	Header.BackgroundColor3 = Color3.fromRGB(85, 170, 127)
	Header.BorderSizePixel = 0
	Header.Position = UDim2.new(0, 552, 0, 159)
	Header.Size = UDim2.new(0, 470, 0, 30)

	local hi = loadstring(game:HttpGet(site.."Modules/DragModule.lua"))()
	local drag = hi.new(Header)
	drag:Enable()

	Instance.new("UICorner", Header)

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Header
	MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0, 0, 0, 30)
	MainFrame.Size = UDim2.new(0, 470, 0, 280)

	Instance.new("UICorner", MainFrame)

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = MainFrame
	TabHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TabHolder.BorderSizePixel = 0
	TabHolder.Position = UDim2.new(0, 10, 0, 10)
	TabHolder.Size = UDim2.new(0, 120, 0, 260)
	TabHolder.ScrollBarThickness = 5

	Instance.new("UICorner", TabHolder)

	TabListen.Name = "TabListen"
	TabListen.Parent = TabHolder
	TabListen.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabListen.SortOrder = Enum.SortOrder.LayoutOrder
	TabListen.Padding = UDim.new(0, 4)
	TabListen.Changed:Connect(function()
		TabHolder.CanvasSize = UDim2.new(0, 0, 0, TabListen.AbsoluteContentSize.Y)
	end)

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = Header
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(0.95, 0,0.016, 0)
	CloseButton.Size = UDim2.new(0, 25, 0, 25)
	CloseButton.Image = "rbxassetid://6236220207"
	CloseButton.MouseButton1Click:Connect(function()
		DarkLib:Destroy()
	end)

	Title.Name = "Title"
	Title.Parent = Header
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.016, 0,0, 0)
	Title.Size = UDim2.new(0, 255, 0, 32)
	Title.Font = Enum.Font.SourceSans
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 28.000
	Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Pages.Name = "Pages"
	Pages.Parent = MainFrame

	local Page = {}

	function Page:Page(txt)
		local Container = Instance.new("ScrollingFrame")
		local PageButton = Instance.new("TextButton")
		local ListContainer = Instance.new("UIListLayout")

		PageButton.Name = txt
		PageButton.Parent = TabHolder
		PageButton.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		PageButton.BorderSizePixel = 0
		PageButton.Size = UDim2.new(0, 100, 0, 25)
		PageButton.Font = Enum.Font.SourceSansLight
		PageButton.Text = txt
		PageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		PageButton.TextSize = 22.000
		PageButton.MouseButton1Click:Connect(function()
			for i,v in next, Pages:GetChildren() do
				v.Visible = false
			end
			Container.Visible = true
			for i,v in next, TabHolder:GetChildren() do
				if v:IsA("TextButton") then
					v.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
				end
			end
			PageButton.BackgroundColor3 = Color3.fromRGB(85, 170, 127)
		end)

		Instance.new("UICorner", PageButton)

		Container.Name = txt
		Container.Parent = Pages
		Container.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
		Container.BorderSizePixel = 0
		Container.Position = UDim2.new(0, 140, 0, 10)
		Container.Size = UDim2.new(0, 320, 0, 260)
		Container.ScrollBarThickness = 5
		Container.Visible = false

		ListContainer.Parent = Container
		ListContainer.HorizontalAlignment = Enum.HorizontalAlignment.Center
		ListContainer.SortOrder = Enum.SortOrder.LayoutOrder
		ListContainer.Padding = UDim.new(0, 6)
		ListContainer.Changed:Connect(function()
			Container.CanvasSize = UDim2.new(0, 0, 0, ListContainer.AbsoluteContentSize.Y)
		end)

		for i,v in next, Pages:GetChildren() do
			v.Visible = false
		end
		Container.Visible = true
		for i,v in next, TabHolder:GetChildren() do
			if v:IsA("TextButton") then
				v.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			end
		end
		PageButton.BackgroundColor3 = Color3.fromRGB(85, 170, 127)

		local Elements = {}

		function Elements:Button(txt, callback)
			local ButtonFunction = {}
			local callback = callback or function() end

			local ButtonFrame = Instance.new("Frame")
			local Click = Instance.new("TextButton")
			local Touch = Instance.new("ImageLabel")

			ButtonFrame.Name = txt
			ButtonFrame.Parent = Container
			ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonFrame.BackgroundTransparency = 1.000
			ButtonFrame.BorderSizePixel = 0
			ButtonFrame.Size = UDim2.new(0, 300, 0, 35)

			Click.Name = "Click"
			Click.Parent = ButtonFrame
			Click.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			Click.BorderSizePixel = 0
			Click.Size = UDim2.new(0, 300, 0, 35)
			Click.Font = Enum.Font.SourceSans
			Click.TextColor3 = Color3.fromRGB(255, 255, 255)
			Click.TextSize = 18.000
			Click.Text = txt or "Button"

			Touch.Name = "Touch"
			Touch.Parent = Click
			Touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Touch.BackgroundTransparency = 1.000
			Touch.BorderSizePixel = 0
			Touch.Position = UDim2.new(0.899999976, 0, 0, 2)
			Touch.Size = UDim2.new(0, 40, 0, 32)
			Touch.Image = "rbxassetid://1013090763"

			Instance.new("UICorner", Click)

			Click.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
			function ButtonFunction:UpdateText(txt)
				Click.Text = txt or "NewText"
			end
			function ButtonFunction:Keybind(Bind)
				UIS.InputBegan:Connect(function(key, gameProcessedEvent)
					if key.KeyCode == Bind then
						pcall(callback)
					end
				end)
			end
			function ButtonFunction:Active()
				pcall(callback)
			end
			return ButtonFunction
		end
		function Elements:Box(txt, hint, callback)
			local boxFunction = {}
			local Box = Instance.new("Frame")
			local Title = Instance.new("TextLabel")
			local Input = Instance.new("TextBox")

			local callback = callback or function() end

			Box.Name = "Box"
			Box.Parent = Container
			Box.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			Box.BorderSizePixel = 0
			Box.Size = UDim2.new(0, 300, 0, 35)

			Instance.new("UICorner", Box)

			Title.Name = "Title"
			Title.Parent = Box
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0, -5, 0, 0)
			Title.Size = UDim2.new(0, 128, 0, 33)
			Title.Font = Enum.Font.SourceSans
			Title.Text = txt or "box"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 18.000
			Title.TextWrapped = true

			Input.Name = "Input"
			Input.Parent = Box
			Input.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
			Input.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Input.BorderSizePixel = 0
			Input.Position = UDim2.new(0, 150, 0, 8)
			Input.Size = UDim2.new(0, 124, 0, 21)
			Input.Font = Enum.Font.SourceSansSemibold
			Input.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
			Input.PlaceholderText = hint or "hint"
			Input.Text = txt
			Input.TextColor3 = Color3.fromRGB(255, 255, 255)
			Input.TextSize = 18.000
			Input.TextWrapped = true

			Instance.new("UICorner", Input)

			Input.FocusLost:Connect(function(EnterPressed)
				if not EnterPressed then 
					return
				else
					callback(Input.Text)
					wait(0.18)
					Input.PlaceholderText = hint
				end
			end)
			function boxFunction:ChangeText(txt)
				Input.Text = txt
			end
			return boxFunction
		end

		function Elements:Toggle(txt, callback)
			local ToggleFunction = {}

			local callback = callback or function() end

			local ToggleElement = Instance.new("Frame")
			local Title = Instance.new("TextLabel")
			local Background = Instance.new("TextButton")
			local Toggle = Instance.new("TextButton")
			local Border = Instance.new("UIStroke")
			local Click = Instance.new("TextButton")

			ToggleElement.Name = txt
			ToggleElement.Parent = Container
			ToggleElement.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			ToggleElement.BorderSizePixel = 0
			ToggleElement.Size = UDim2.new(0, 300, 0, 35)
			
			Click.Name = "Click"
			Click.Parent = ToggleElement
			Click.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			Click.BorderSizePixel = 0
			Click.Size = UDim2.new(0, 300, 0, 35)
			Click.BackgroundTransparency = 1
			Click.Text = ""

			Instance.new("UICorner", ToggleElement)

			Title.Name = "Title"
			Title.Parent = ToggleElement
			Title.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			Title.BorderSizePixel = 0
			Title.Position = UDim2.new(0.0430107526, 0, 0, 0)
			Title.Size = UDim2.new(0, 100, 0, 35)
			Title.Font = Enum.Font.SourceSans
			Title.Text = txt or "Label"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 18.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			Toggle.Name = "Toggle"
			Toggle.Parent = ToggleElement
			Toggle.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			Toggle.BorderSizePixel = 0
			Toggle.Position = UDim2.new(0, 260, 0, 10)
			Toggle.Size = UDim2.new(0, 20, 0, 20)
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.TextScaled = true
			Toggle.TextSize = 14.000
			Toggle.TextWrapped = true

			Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 4)

			Border.Name = "Border"
			Border.Parent = Toggle
			Border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Border.Color = Color3.fromRGB(255, 255, 255)
			Border.LineJoinMode = Enum.LineJoinMode.Round
			Border.Thickness = 1

			local toggled = false
			Click.MouseButton1Down:Connect(function()
				if toggled == false then
					TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(46, 250, 88)}):Play()
					TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
				elseif toggled == true then
					TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(21, 21, 21)}):Play()
					TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
				end
				toggled = not toggled
	 			Toggle.Text = toggled and utf8.char(10003) or ""
				pcall(callback, toggled)
			end)
			function ToggleFunction:UpdateText(txt)
				Title.Text = txt
			end
			function ToggleFunction:ChangeState(state)
				if state == true then
					TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(46, 250, 88)}):Play()
					TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
				elseif state == false then
					TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(21, 21, 21)}):Play()
					TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
				end
				toggled = not toggled
				Toggle.Text = toggled and utf8.char(10003) or ""
				pcall(callback, toggled)
			end
			function ToggleFunction:Keybind(Bind)
				UIS.InputBegan:Connect(function(key, gameProcessedEvent)
					if key.KeyCode == Bind then
						if toggled == false then
							TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(46, 250, 88)}):Play()
							TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()							
						elseif toggled == true then
							TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(21, 21, 21)}):Play()
							TS:Create(Toggle, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
						end
						toggled = not toggled
						Toggle.Text = toggled and utf8.char(10003) or ""
						pcall(callback, toggled)
					end
				end)
			end
			return ToggleFunction
		end
		function Elements:Label(txt)
			local LabelFunction = {}
			local Button = Instance.new("Frame")
			local TextButton = Instance.new("TextLabel")

			Button.Name = txt
			Button.Parent = Container
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 300, 0, 35)

			TextButton.Parent = Button
			TextButton.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
			TextButton.BorderSizePixel = 0
			TextButton.BackgroundTransparency = 1.000
			TextButton.Size = UDim2.new(0, 300, 0, 35)
			TextButton.Font = Enum.Font.SourceSans
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 18.000
			TextButton.Text = txt or "Text"

			Instance.new("UICorner", TextButton)

			function LabelFunction:UpdateText(txt)
				TextButton.Text = txt or "NewText"
			end
			return LabelFunction
		end
		return Elements
	end
	return Page
end
return Library