getgenv().Color = Color3.fromRGB(96, 86, 185)

--// Ugly code warning!!! credits to ui library makers becuz i skidded off code.
if game:GetService("CoreGui"):FindFirstChild("ScreenGui") then
    game:GetService("CoreGui").ScreenGui:Destroy()
end

local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local TI = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

local Library = {}

function Library.new(string)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game:GetService('CoreGui')
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Outline = Instance.new("Frame")
    Outline.Name = "Outline"
    Outline.Parent = ScreenGui
    Outline.AnchorPoint = Vector2.new(0.5, 0.5)
    Outline.BackgroundColor3 = getgenv().Color
    Outline.Position = UDim2.new(0.5, 0, 0.5, 0)
    Outline.Size = UDim2.new(0, 527, 0, 302)

    local gui = Outline
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
        v:Disable()
    end

    local UI = Instance.new("Frame")
    UI.Name = "UI"
    UI.Parent = Outline
    UI.AnchorPoint = Vector2.new(0.5, 0.5)
    UI.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    UI.BorderColor3 = Color3.fromRGB(25, 25, 25)
    UI.BorderSizePixel = 0
    UI.Position = UDim2.new(0.5, 0, 0.5, 0)
    UI.Size = UDim2.new(0, 525, 0, 300)

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = UI
    Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.00952380989, 0, 0.0199999996, 0)
    Title.Size = UDim2.new(0, 135, 0, 20)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = string
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 13.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local UIPadding_10 = Instance.new("UIPadding")
    UIPadding_10.Parent = Title
    UIPadding_10.PaddingLeft = UDim.new(0, 5)

    local UICorner_9 = Instance.new("UICorner")
    UICorner_9.CornerRadius = UDim.new(0, 2)
    UICorner_9.Parent = Title

    local Tabs = Instance.new("Frame")
    Tabs.Name = "Tabs"
    Tabs.Parent = UI
    Tabs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0.00952380989, 0, 0.100000001, 0)
    Tabs.Size = UDim2.new(0, 135, 0, 260)
    
    local UIListLayout_4 = Instance.new("UIListLayout")
    UIListLayout_4.Parent = Tabs
    UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_4.Padding = UDim.new(0, 5)
    
    local UIPadding_8 = Instance.new("UIPadding")
    UIPadding_8.Parent = Tabs
    UIPadding_8.PaddingTop = UDim.new(0, 4)

    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Parent = Tabs
    ScrollingFrame.Active = true
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.Size = UDim2.new(0, 127, 0, 252)
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollingFrame.ScrollBarThickness = 0

    local UIPadding_9 = Instance.new("UIPadding")
    UIPadding_9.Parent = ScrollingFrame
    UIPadding_9.PaddingTop = UDim.new(0, 5)
    
    local UIListLayout_5 = Instance.new("UIListLayout")
    UIListLayout_5.Parent = ScrollingFrame
    UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_5.Padding = UDim.new(0, 5)

    local UICorner_27 = Instance.new("UICorner")
    UICorner_27.CornerRadius = UDim.new(0, 4)
    UICorner_27.Parent = UI

    UIListLayout_5:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_5.AbsoluteContentSize.Y + 5)
    end)

    local Tab = {}
    local checkvis = false

    function Tab:CreateTab(string)
        local Main = Instance.new("ScrollingFrame")
        Main.Name = "Main"
        Main.Parent = UI
        Main.Active = true
        Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Main.BorderSizePixel = 0
        Main.Position = UDim2.new(0.285714298, 0, 0.0199999996, 0)
        Main.Size = UDim2.new(0, 365, 0, 284)
        Main.ScrollBarThickness = 0
        Main.Visible = false
        
        local UIListLayout_6 = Instance.new("UIListLayout")
        UIListLayout_6.Parent = Main
        UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_6.Padding = UDim.new(0, 5)

        local UIPadding_18 = Instance.new("UIPadding")
        UIPadding_18.Parent = Main
        UIPadding_18.PaddingTop = UDim.new(0, 5)

        UIListLayout_6:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Main.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_6.AbsoluteContentSize.Y + 10)
        end)

        local TabFrame = Instance.new("Frame")
        TabFrame.Name = "TabFrame"
        TabFrame.Parent = ScrollingFrame
        TabFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        TabFrame.Size = UDim2.new(0, 118, 0, 25)
        
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Parent = TabFrame
        TabButton.AnchorPoint = Vector2.new(0.5, 0.5)
        TabButton.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        TabButton.BackgroundTransparency = 1.000
        TabButton.BorderSizePixel = 0
        TabButton.Position = UDim2.new(0.5, 0, 0.5, 0)
        TabButton.Size = UDim2.new(0, 118, 0, 25)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.Text = string
        TabButton.TextColor3 = Color3.fromRGB(150, 150, 150)
        TabButton.TextSize = 12.000
        
        local UICorner_8 = Instance.new("UICorner")
        UICorner_8.CornerRadius = UDim.new(0, 2)
        UICorner_8.Parent = TabFrame

        if not checkvis then
            checkvis = true
            Main.Visible = true
            TabButton.TextColor3 = getgenv().Color
        end

        TabButton.MouseButton1Down:Connect(function()
            for i,v in pairs(UI:GetChildren()) do
                if v.Name == "Main" then
                    v.Visible = false
                end
            end

            Main.Visible = true

            for i,v in pairs(Tabs:GetDescendants()) do
                if v:IsA("TextButton") then
                    v.TextColor3 = Color3.fromRGB(150, 150, 150)
                end
            end

            TabButton.TextColor3 = getgenv().Color
        end)

        local Section = {}

        function Section:CreateSection(string)
            local Section = Instance.new("Frame")
            local UIListLayout_7 = Instance.new("UIListLayout")
            local TextLabel_5 = Instance.new("TextLabel")
            local UICorner_10 = Instance.new("UICorner")

            Section.Name = "Section"
            Section.Parent = Main
            Section.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Section.BorderSizePixel = 0
            Section.Position = UDim2.new(0.01369863, 0, 0.0176056344, 0)
            Section.Size = UDim2.new(0, 355, 0, 0)
        
            UIListLayout_7.Parent = Section
            UIListLayout_7.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_7.Padding = UDim.new(0, 5)
            
            TextLabel_5.Parent = Section
            TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_5.BackgroundTransparency = 1.000
            TextLabel_5.BorderSizePixel = 0
            TextLabel_5.Size = UDim2.new(0, 345, 0, 20)
            TextLabel_5.Font = Enum.Font.SourceSansSemibold
            TextLabel_5.Text = string
            TextLabel_5.TextColor3 = getgenv().Color
            TextLabel_5.TextSize = 14.000
            TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left
            
            UICorner_10.CornerRadius = UDim.new(0, 2)
            UICorner_10.Parent = Section

            UIListLayout_7:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                Section.Size = UDim2.new(0, 355, 0, UIListLayout_7.AbsoluteContentSize.Y + 15)
            end)

            local brah = {}

            function brah:CreateToggle(string, callback)
                if not string then
                    string = ""
                end

                local Toggle = Instance.new("Frame")
                local UICorner_11 = Instance.new("UICorner")
                local TextButton_2 = Instance.new("TextButton")
                local UIPadding_11 = Instance.new("UIPadding")
                local Frame_3 = Instance.new("Frame")
                local TextButton_3 = Instance.new("TextButton")
                local UICorner_12 = Instance.new("UICorner")
                local UICorner_13 = Instance.new("UICorner")

                Toggle.Name = "Toggle"
                Toggle.Parent = Section
                Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Toggle.BorderSizePixel = 0
                Toggle.Position = UDim2.new(0.0140845068, 0, 0.25, 0)
                Toggle.Size = UDim2.new(0, 340, 0, 23)
                
                UICorner_11.CornerRadius = UDim.new(0, 2)
                UICorner_11.Parent = Toggle
                
                TextButton_2.Parent = Toggle
                TextButton_2.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_2.BackgroundTransparency = 1.000
                TextButton_2.BorderSizePixel = 0
                TextButton_2.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_2.Size = UDim2.new(0, 340, 0, 23)
                TextButton_2.Font = Enum.Font.SourceSansSemibold
                TextButton_2.Text = string
                TextButton_2.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton_2.TextSize = 14.000
                TextButton_2.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_11.Parent = TextButton_2
                UIPadding_11.PaddingLeft = UDim.new(0, 5)
                
                Frame_3.Parent = TextButton_2
                Frame_3.AnchorPoint = Vector2.new(1, 0.5)
                Frame_3.BackgroundColor3 = getgenv().Color
                Frame_3.BorderSizePixel = 0
                Frame_3.Position = UDim2.new(0.985000014, 0, 0.5, 0)
                Frame_3.Size = UDim2.new(0, 15, 0, 15)
                
                TextButton_3.Parent = Frame_3
                TextButton_3.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextButton_3.BorderSizePixel = 0
                TextButton_3.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_3.Size = UDim2.new(0, 13, 0, 13)
                TextButton_3.Font = Enum.Font.Code
                TextButton_3.Text = ""
                TextButton_3.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton_3.TextSize = 14.000
                
                UICorner_12.CornerRadius = UDim.new(0, 2)
                UICorner_12.Parent = TextButton_3
                
                UICorner_13.CornerRadius = UDim.new(0, 2)
                UICorner_13.Parent = Frame_3

                TextButton_2.MouseEnter:Connect(function()
                    local new = TS:Create(Toggle, TI, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)})
                    new:play()
                end)

                TextButton_2.MouseLeave:Connect(function()
                    local old = TS:Create(Toggle, TI, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
                    old:play()
                end)

                local toggle = false
                TextButton_2.MouseButton1Down:Connect(function()
                    if not toggle then
                        toggle = true
                        TextButton_3.Text = "✓"
                    else
                        toggle = false
                        TextButton_3.Text = ""
                    end

                    toggle = toggle
                    pcall(callback, toggle)
                end)

                TextButton_3.MouseButton1Down:Connect(function()
                    if not toggle then
                        toggle = true
                        TextButton_3.Text = "✓"
                    else
                        toggle = false
                        TextButton_3.Text = ""
                    end

                    toggle = toggle
                    pcall(callback, toggle)
                end)
            end

            function brah:CreateButton(string, callback)
                if not string then
                    string = ""
                end
                
                local Button = Instance.new("Frame")
                local UICorner_14 = Instance.new("UICorner")
                local TextButton_4 = Instance.new("TextButton")
                local UIPadding_12 = Instance.new("UIPadding")

                Button.Name = "Button"
                Button.Parent = Section
                Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Button.BorderSizePixel = 0
                Button.Position = UDim2.new(0.0140845068, 0, 0.25, 0)
                Button.Size = UDim2.new(0, 340, 0, 23)
                
                UICorner_14.CornerRadius = UDim.new(0, 2)
                UICorner_14.Parent = Button
                
                TextButton_4.Parent = Button
                TextButton_4.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_4.BackgroundTransparency = 1.000
                TextButton_4.BorderSizePixel = 0
                TextButton_4.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_4.Size = UDim2.new(0, 340, 0, 23)
                TextButton_4.Font = Enum.Font.SourceSansSemibold
                TextButton_4.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton_4.TextSize = 14.000
                TextButton_4.Text = string
                TextButton_4.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_12.Parent = TextButton_4
                UIPadding_12.PaddingLeft = UDim.new(0, 5)

                TextButton_4.MouseButton1Down:Connect(function()
                    local new = TS:Create(TextButton_4, TI, {TextColor3 = getgenv().Color})
                    new:play()
                    wait(0.15)
                    local old = TS:Create(TextButton_4, TI, {TextColor3 = Color3.fromRGB(225, 225, 225)})
                    old:play()

                    pcall(callback)
                end)

                TextButton_4.MouseEnter:Connect(function()
                    local new = TS:Create(Button, TI, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)})
                    new:play()
                end)

                TextButton_4.MouseLeave:Connect(function()
                    local old = TS:Create(Button, TI, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
                    old:play()
                end)
            end

            function brah:CreateBox(string, default, callback)
                if not string or not default then
                    string = ""
                    default = ""
                end

                local Box = Instance.new("Frame")
                local UICorner_15 = Instance.new("UICorner")
                local TextButton_5 = Instance.new("TextButton")
                local UIPadding_13 = Instance.new("UIPadding")
                local Frame_4 = Instance.new("Frame")
                local UICorner_16 = Instance.new("UICorner")
                local TextBox = Instance.new("TextBox")
                local UICorner_17 = Instance.new("UICorner")

                Box.Name = "Box"
                Box.Parent = Section
                Box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Box.BorderSizePixel = 0
                Box.Position = UDim2.new(0.0140845068, 0, 0.25, 0)
                Box.Size = UDim2.new(0, 340, 0, 23)
                
                UICorner_15.CornerRadius = UDim.new(0, 2)
                UICorner_15.Parent = Box
                
                TextButton_5.Parent = Box
                TextButton_5.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_5.BackgroundTransparency = 1.000
                TextButton_5.BorderSizePixel = 0
                TextButton_5.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_5.Size = UDim2.new(0, 340, 0, 23)
                TextButton_5.Font = Enum.Font.SourceSansSemibold
                TextButton_5.Text = string
                TextButton_5.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton_5.TextSize = 14.000
                TextButton_5.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_13.Parent = TextButton_5
                UIPadding_13.PaddingLeft = UDim.new(0, 5)
                
                Frame_4.Parent = TextButton_5
                Frame_4.AnchorPoint = Vector2.new(1, 0.5)
                Frame_4.BackgroundColor3 = getgenv().Color
                Frame_4.BorderSizePixel = 0
                Frame_4.Position = UDim2.new(0.985862851, 0, 0.5, 0)
                Frame_4.Size = UDim2.new(0, 100, 0, 15)
                
                UICorner_16.CornerRadius = UDim.new(0, 2)
                UICorner_16.Parent = Frame_4
                
                TextBox.Parent = Frame_4
                TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
                TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextBox.Size = UDim2.new(0, 98, 0, 13)
                TextBox.Font = Enum.Font.Code
                TextBox.Text = default
                TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.TextSize = 12.000
                
                UICorner_17.CornerRadius = UDim.new(0, 2)
                UICorner_17.Parent = TextBox

                TextButton_5.MouseEnter:Connect(function()
                    local new = TS:Create(Box, TI, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)})
                    new:play()
                end)

                TextButton_5.MouseLeave:Connect(function()
                    local old = TS:Create(Box, TI, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
                    old:play()
                end)

                TextButton_5.MouseButton1Down:Connect(function()
                    TextBox:CaptureFocus()
                end)

                pcall(callback, TextBox.Text)
                TextBox.FocusLost:Connect(function()
                    pcall(callback, TextBox.Text)
                end)
            end
            
            function brah:CreateSlider(string, settings, callback)
                if not string or not settings then
                    string = ""
                    settings = {min = 0, max = 10}
                end

                local min, max, precise, count = settings.min, settings.max, settings.precise, settings.count

                local Slider_2 = Instance.new("Frame")
                local UICorner_18 = Instance.new("UICorner")
                local TextButton_6 = Instance.new("TextButton")
                local UIPadding_14 = Instance.new("UIPadding")
                local UIListLayout_8 = Instance.new("UIListLayout")
                local Frame_5 = Instance.new("Frame")
                local UICorner_19 = Instance.new("UICorner")
                local Frame_6 = Instance.new("Frame")
                local UICorner_20 = Instance.new("UICorner")
                local TextButton_7 = Instance.new("TextButton")
                local Fill = Instance.new("Frame")
                local UICorner_21 = Instance.new("UICorner")

                Slider_2.Name = "Slider"
                Slider_2.Parent = Section
                Slider_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Slider_2.BorderSizePixel = 0
                Slider_2.Position = UDim2.new(0.0211267602, 0, 0.476190478, 0)
                Slider_2.Size = UDim2.new(0, 340, 0, 45)
                
                UICorner_18.CornerRadius = UDim.new(0, 2)
                UICorner_18.Parent = Slider_2
                
                TextButton_6.Parent = Slider_2
                TextButton_6.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_6.BackgroundTransparency = 1.000
                TextButton_6.BorderSizePixel = 0
                TextButton_6.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_6.Size = UDim2.new(0, 340, 0, 20)
                TextButton_6.Font = Enum.Font.SourceSansSemibold
                TextButton_6.Text = string
                TextButton_6.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton_6.TextSize = 14.000
                TextButton_6.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_14.Parent = TextButton_6
                UIPadding_14.PaddingLeft = UDim.new(0, 5)
                
                UIListLayout_8.Parent = Slider_2
                UIListLayout_8.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_8.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_8.Padding = UDim.new(0, 3)
                
                Frame_5.Parent = Slider_2
                Frame_5.BackgroundColor3 = getgenv().Color
                Frame_5.BorderSizePixel = 0
                Frame_5.Position = UDim2.new(0.0294117648, 0, 0.328571439, 0)
                Frame_5.Size = UDim2.new(0, 325, 0, 15)
                
                UICorner_19.CornerRadius = UDim.new(0, 2)
                UICorner_19.Parent = Frame_5
                
                Frame_6.Parent = Frame_5
                Frame_6.AnchorPoint = Vector2.new(0.5, 0.5)
                Frame_6.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Frame_6.BorderSizePixel = 0
                Frame_6.ClipsDescendants = true
                Frame_6.Position = UDim2.new(0.5, 0, 0.5, 0)
                Frame_6.Size = UDim2.new(0, 323, 0, 13)
                
                UICorner_20.CornerRadius = UDim.new(0, 2)
                UICorner_20.Parent = Frame_6
                
                TextButton_7.Parent = Frame_6
                TextButton_7.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_7.BackgroundTransparency = 1.000
                TextButton_7.BorderSizePixel = 0
                TextButton_7.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_7.Size = UDim2.new(0, 323, 0, 13)
                TextButton_7.ZIndex = 3
                TextButton_7.Font = Enum.Font.Code
                TextButton_7.Text = "0"
                TextButton_7.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton_7.TextSize = 14.000
                
                Fill.Name = "Fill"
                Fill.Parent = Frame_6
                Fill.AnchorPoint = Vector2.new(0, 0.5)
                Fill.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                Fill.BackgroundTransparency = 0.5
                Fill.Position = UDim2.new(0, 0, 0.5, 0)
                Fill.Size = UDim2.new(0, 0, 0, 13)
                
                UICorner_21.CornerRadius = UDim.new(0, 2)
                UICorner_21.Parent = Fill

                local UserInputService = game:GetService("UserInputService")
	
                local Draggable = false
                
                local Percent
                
                local function roundTo(a, b)
                    return (math.floor(a / b + 0.5) * b)
                end

                TextButton_7.MouseButton1Down:Connect(function(input)
                    Draggable = true
                end)
                
                UserInputService.InputChanged:Connect(function()
                    if Draggable then
                        local GetMouseLocation = game:GetService("Players").LocalPlayer:GetMouse()
                        Percent = math.clamp((GetMouseLocation.X - TextButton_7.AbsolutePosition.X) / TextButton_7.AbsoluteSize.X, 0, 1)
                        Fill:TweenSize(UDim2.new(Percent, 0, 1, 0), "Out", "Sine", 0.05)

                        if precise then 
                            TextButton_7.Text = roundTo((Percent * (max - min) + min), count or 0.5)
                        else
                            TextButton_7.Text = math.floor((Percent * (max - min) + min))
                        end

                        pcall(callback, tonumber(TextButton_7.Text))
                    end
                end)
                
                TextButton_7.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        Draggable = false
                    end
                end)
            end

            function brah:CreateDrop(string, default, list, callback)
                if not string or not default or not list then
                    string = ""
                    default = ""
                    list = {}
                end
                local Dropdown = Instance.new("Frame")
                local UICorner_22 = Instance.new("UICorner")
                local TextButton_8 = Instance.new("TextButton")
                local UIPadding_15 = Instance.new("UIPadding")
                local UIListLayout_9 = Instance.new("UIListLayout")
                local ScrollingFrame_2 = Instance.new("ScrollingFrame")
                local UIListLayout_10 = Instance.new("UIListLayout")
            

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = Section
                Dropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Dropdown.BorderSizePixel = 0
                Dropdown.ClipsDescendants = true
                Dropdown.Position = UDim2.new(0.0211267602, 0, 0.485185176, 0)
                Dropdown.Size = UDim2.new(0, 340, 0, 23)
                
                UICorner_22.CornerRadius = UDim.new(0, 2)
                UICorner_22.Parent = Dropdown
                
                TextButton_8.Parent = Dropdown
                TextButton_8.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_8.BackgroundTransparency = 1.000
                TextButton_8.BorderSizePixel = 0
                TextButton_8.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_8.Size = UDim2.new(0, 340, 0, 20)
                TextButton_8.Font = Enum.Font.SourceSansSemibold
                TextButton_8.Text = string .. " - " .. default
                TextButton_8.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton_8.TextSize = 14.000
                TextButton_8.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_15.Parent = TextButton_8
                UIPadding_15.PaddingLeft = UDim.new(0, 5)
                
                UIListLayout_9.Parent = Dropdown
                UIListLayout_9.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_9.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_9.Padding = UDim.new(0, 3)
                
                ScrollingFrame_2.Parent = Dropdown
                ScrollingFrame_2.Active = true
                ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ScrollingFrame_2.BackgroundTransparency = 1.000
                ScrollingFrame_2.BorderSizePixel = 0
                ScrollingFrame_2.Position = UDim2.new(-0.349999994, 0, 0.219047621, 0)
                ScrollingFrame_2.Size = UDim2.new(0, 340, 0, 80)
                ScrollingFrame_2.ScrollBarThickness = 2
                ScrollingFrame_2.ScrollBarImageColor3 = getgenv().Color
                
                UIListLayout_10.Parent = ScrollingFrame_2
                UIListLayout_10.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_10.SortOrder = Enum.SortOrder.LayoutOrder

                UIListLayout_10:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    ScrollingFrame_2.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_10.AbsoluteContentSize.Y + 10)
                end)

                TextButton_8.MouseEnter:Connect(function()
                    local new = TS:Create(Dropdown, TI, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)})
                    new:play()
                end)

                TextButton_8.MouseLeave:Connect(function()
                    local old = TS:Create(Dropdown, TI, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
                    old:play()
                end)

                local drop = false
                TextButton_8.MouseButton1Down:Connect(function()
                    if not drop then
                        drop = true
                        local new = TS:Create(Dropdown, TI, {Size = UDim2.new(0, 340, 0, 93)})
                        new:play()
                        --Dropdown.Size = UDim2.new(0, 465, 0, 110)
                    else
                        drop = false
                        local old = TS:Create(Dropdown, TI, {Size = UDim2.new(0, 340, 0, 23)})
                        old:play()
                        --Dropdown.Size = UDim2.new(0, 465, 0, 25)
                    end
                end)

                pcall(callback, default)
                
                for i,v in pairs(list) do
                    local DropButton = Instance.new("Frame")
                    local UICorner_23 = Instance.new("UICorner")
                    local TextButton_9 = Instance.new("TextButton")
                    local UIPadding_16 = Instance.new("UIPadding")

                    DropButton.Name = "DropButton"
                    DropButton.Parent = ScrollingFrame_2
                    DropButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    DropButton.BorderSizePixel = 0
                    DropButton.Position = UDim2.new(0.0140845068, 0, 0.25, 0)
                    DropButton.Size = UDim2.new(0, 340, 0, 23)
                    
                    UICorner_23.CornerRadius = UDim.new(0, 2)
                    UICorner_23.Parent = DropButton
                    
                    TextButton_9.Parent = DropButton
                    TextButton_9.AnchorPoint = Vector2.new(0.5, 0.5)
                    TextButton_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton_9.BackgroundTransparency = 1.000
                    TextButton_9.BorderSizePixel = 0
                    TextButton_9.Text = v
                    TextButton_9.Position = UDim2.new(0.5, 0, 0.5, 0)
                    TextButton_9.Size = UDim2.new(0, 340, 0, 23)
                    TextButton_9.Font = Enum.Font.SourceSansSemibold
                    TextButton_9.TextColor3 = Color3.fromRGB(225, 225, 225)
                    TextButton_9.TextSize = 14.000
                    TextButton_9.TextXAlignment = Enum.TextXAlignment.Left

                    TextButton_9.MouseButton1Down:Connect(function()
                        TextButton_8.Text = string .. " - " .. v
                        pcall(callback, v)
                    end)
                    
                    UIPadding_16.Parent = TextButton_9
                    UIPadding_16.PaddingLeft = UDim.new(0, 5)

                    TextButton_9.MouseEnter:Connect(function()
                        local new = TS:Create(DropButton, TI, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)})
                        new:play()
                    end)
    
                    TextButton_9.MouseLeave:Connect(function()
                        local old = TS:Create(DropButton, TI, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
                        old:play()
                    end)
                end


                local Drop = {}

                function Drop:Refresh(a)
                    for i,v in pairs(ScrollingFrame_2:GetChildren()) do
                        if v:IsA("Frame") and v:FindFirstChild("TextButton") then
                            v:Destroy()
                        end
                    end

                    for i,v in pairs(a) do
                        local DropButton = Instance.new("Frame")
                        local UICorner_23 = Instance.new("UICorner")
                        local TextButton_9 = Instance.new("TextButton")
                        local UIPadding_16 = Instance.new("UIPadding")
    
                        DropButton.Name = "DropButton"
                        DropButton.Parent = ScrollingFrame_2
                        DropButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        DropButton.BorderSizePixel = 0
                        DropButton.Position = UDim2.new(0.0140845068, 0, 0.25, 0)
                        DropButton.Size = UDim2.new(0, 340, 0, 23)
                        
                        UICorner_23.CornerRadius = UDim.new(0, 2)
                        UICorner_23.Parent = DropButton
                        
                        TextButton_9.Parent = DropButton
                        TextButton_9.AnchorPoint = Vector2.new(0.5, 0.5)
                        TextButton_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextButton_9.BackgroundTransparency = 1.000
                        TextButton_9.BorderSizePixel = 0
                        TextButton_9.Text = v
                        TextButton_9.Position = UDim2.new(0.5, 0, 0.5, 0)
                        TextButton_9.Size = UDim2.new(0, 340, 0, 23)
                        TextButton_9.Font = Enum.Font.SourceSansSemibold
                        TextButton_9.TextColor3 = Color3.fromRGB(225, 225, 225)
                        TextButton_9.TextSize = 14.000
                        TextButton_9.TextXAlignment = Enum.TextXAlignment.Left

                        TextButton_9.MouseButton1Down:Connect(function()
                            TextButton_8.Text = string .. " - " .. v
                            pcall(callback, v)
                        end)
                        
                        UIPadding_16.Parent = TextButton_9
                        UIPadding_16.PaddingLeft = UDim.new(0, 5)

                        TextButton_9.MouseEnter:Connect(function()
                            local new = TS:Create(DropButton, TI, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)})
                            new:play()
                        end)
        
                        TextButton_9.MouseLeave:Connect(function()
                            local old = TS:Create(DropButton, TI, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
                            old:play()
                        end)
                    end
                end

                return Drop
            end

            function brah:CreateBind(string, default, callback)
                local Keybind = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local TextButton = Instance.new("TextButton")
                local UIPadding = Instance.new("UIPadding")
                local Frame = Instance.new("Frame")
                local TextButton_2 = Instance.new("TextButton")
                local UICorner_2 = Instance.new("UICorner")
                local UICorner_3 = Instance.new("UICorner")
                
                Keybind.Name = "Keybind"
                Keybind.Parent = Section
                Keybind.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Keybind.BorderSizePixel = 0
                Keybind.Position = UDim2.new(0.0140845068, 0, 0.25, 0)
                Keybind.Size = UDim2.new(0, 340, 0, 23)
                
                UICorner.CornerRadius = UDim.new(0, 2)
                UICorner.Parent = Keybind
                
                TextButton.Parent = Keybind
                TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton.Size = UDim2.new(0, 340, 0, 23)
                TextButton.Font = Enum.Font.SourceSansSemibold
                TextButton.Text = string
                TextButton.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton.TextSize = 14.000
                TextButton.TextXAlignment = Enum.TextXAlignment.Left

                TextButton.MouseEnter:Connect(function()
                    local new = TS:Create(Keybind, TI, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)})
                    new:play()
                end)

                TextButton.MouseLeave:Connect(function()
                    local old = TS:Create(Keybind, TI, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
                    old:play()
                end)
                
                UIPadding.Parent = TextButton
                UIPadding.PaddingLeft = UDim.new(0, 5)
                
                Frame.Parent = TextButton
                Frame.AnchorPoint = Vector2.new(1, 0.5)
                Frame.BackgroundColor3 = getgenv().Color
                Frame.BorderSizePixel = 0
                Frame.Position = UDim2.new(0.985437751, 0, 0.5, 0)
                Frame.Size = UDim2.new(0, 75, 0, 15)
                
                TextButton_2.Parent = Frame
                TextButton_2.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextButton_2.BorderSizePixel = 0
                TextButton_2.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_2.Size = UDim2.new(0, 73, 0, 13)
                TextButton_2.Font = Enum.Font.Code
                TextButton_2.Text = default
                TextButton_2.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton_2.TextSize = 12.000
                
                UICorner_2.CornerRadius = UDim.new(0, 2)
                UICorner_2.Parent = TextButton_2
                
                UICorner_3.CornerRadius = UDim.new(0, 2)
                UICorner_3.Parent = Frame

                pcall(callback, TextButton_2.Text)

                local UIS = game:GetService("UserInputService")
                local Keybind = false

                TextButton.MouseButton1Down:Connect(function()
                    Keybind = true
                    TextButton_2.Text = "..."
                end)

                TextButton_2.MouseButton1Down:Connect(function()
                    Keybind = true
                    TextButton_2.Text = "..."
                end)
                
                UIS.InputBegan:Connect(function(input)
                    if Keybind then
                        if input.KeyCode.Name ~= "Unknown" then
                            TextButton_2.Text = input.KeyCode.Name
                            pcall(callback, TextButton_2.Text)
                            Keybind = false
                        end
                    end
                end)
            end

            function brah:CreatePicker(string, defaultcolor, callback)
                local Picker = Instance.new("Frame")
                local UICorner_24 = Instance.new("UICorner")
                local TextButton_10 = Instance.new("TextButton")
                local UIPadding_17 = Instance.new("UIPadding")
                local Frame_7 = Instance.new("Frame")
                local UICorner_25 = Instance.new("UICorner")
                local Frame_8 = Instance.new("Frame")
                local UICorner_26 = Instance.new("UICorner")
                local TextButton_11 = Instance.new("TextButton")

                Picker.Name = "Picker"
                Picker.Parent = Section
                Picker.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Picker.BorderSizePixel = 0
                Picker.Position = UDim2.new(0.0140845068, 0, 0.25, 0)
                Picker.Size = UDim2.new(0, 340, 0, 23)
                
                UICorner_24.CornerRadius = UDim.new(0, 2)
                UICorner_24.Parent = Picker
                
                TextButton_10.Parent = Picker
                TextButton_10.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_10.BackgroundTransparency = 1.000
                TextButton_10.BorderSizePixel = 0
                TextButton_10.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_10.Size = UDim2.new(0, 340, 0, 23)
                TextButton_10.Font = Enum.Font.SourceSansSemibold
                TextButton_10.Text = string
                TextButton_10.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton_10.TextSize = 14.000
                TextButton_10.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_17.Parent = TextButton_10
                UIPadding_17.PaddingLeft = UDim.new(0, 5)
                
                Frame_7.Parent = TextButton_10
                Frame_7.AnchorPoint = Vector2.new(1, 0.5)
                Frame_7.BackgroundColor3 = getgenv().Color
                Frame_7.BorderSizePixel = 0
                Frame_7.Position = UDim2.new(0.985220492, 0, 0.5, 0)
                Frame_7.Size = UDim2.new(0, 50, 0, 15)
                
                UICorner_25.CornerRadius = UDim.new(0, 2)
                UICorner_25.Parent = Frame_7
                
                Frame_8.Parent = Frame_7
                Frame_8.AnchorPoint = Vector2.new(0.5, 0.5)
                Frame_8.BackgroundColor3 = defaultcolor
                Frame_8.Position = UDim2.new(0.5, 0, 0.5, 0)
                Frame_8.Size = UDim2.new(0, 48, 0, 13)
                
                UICorner_26.CornerRadius = UDim.new(0, 2)
                UICorner_26.Parent = Frame_8
                
                TextButton_11.Parent = Frame_8
                TextButton_11.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton_11.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextButton_11.BackgroundTransparency = 1.000
                TextButton_11.BorderSizePixel = 0
                TextButton_11.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton_11.Size = UDim2.new(0, 13, 0, 13)
                TextButton_11.Font = Enum.Font.SourceSansSemibold
                TextButton_11.Text = ""
                TextButton_11.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton_11.TextSize = 14.000

                TextButton_10.MouseEnter:Connect(function()
                    local new = TS:Create(Picker, TI, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)})
                    new:play()
                end)

                TextButton_10.MouseLeave:Connect(function()
                    local old = TS:Create(Picker, TI, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
                    old:play()
                end)

                local PickOutline = Instance.new("Frame")
                local PickerFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local UIListLayout = Instance.new("UIListLayout")
                local TextLabel = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")
                local HSV = Instance.new("ImageLabel")
                local Drag = Instance.new("ImageButton")
                local Slider = Instance.new("Frame")
                local UIGradient = Instance.new("UIGradient")
                local Drag_2 = Instance.new("ImageButton")
                local UICorner_2 = Instance.new("UICorner")
                local RGB = Instance.new("Frame")
                local UIListLayout_2 = Instance.new("UIListLayout")
                local TextLabel_2 = Instance.new("TextLabel")
                local UICorner_3 = Instance.new("UICorner")
                local UIPadding_2 = Instance.new("UIPadding")
                local R = Instance.new("TextBox")
                local UIPadding_3 = Instance.new("UIPadding")
                local TextLabel_3 = Instance.new("TextLabel")
                local UICorner_4 = Instance.new("UICorner")
                local UIPadding_4 = Instance.new("UIPadding")
                local G = Instance.new("TextBox")
                local UIPadding_5 = Instance.new("UIPadding")
                local TextLabel_4 = Instance.new("TextLabel")
                local UICorner_5 = Instance.new("UICorner")
                local UIPadding_6 = Instance.new("UIPadding")
                local B = Instance.new("TextBox")
                local UIPadding_7 = Instance.new("UIPadding")
                local Frame = Instance.new("Frame")
                local UICorner_6 = Instance.new("UICorner")
                local Frame_2 = Instance.new("Frame")
                local UICorner_7 = Instance.new("UICorner")
                local UIListLayout_3 = Instance.new("UIListLayout")

                PickOutline.Name = "PickOutline"
                PickOutline.Parent = ScreenGui
                PickOutline.AnchorPoint = Vector2.new(0.5, 0.5)
                PickOutline.BackgroundColor3 = getgenv().Color
                PickOutline.Position = UDim2.new(0.5, 0, 0.5, 0)
                PickOutline.Size = UDim2.new(0, 187, 0, 172)
                PickOutline.Visible = false
                
                PickerFrame.Name = "PickerFrame"
                PickerFrame.Parent = PickOutline
                PickerFrame.AnchorPoint = Vector2.new(0.5, 0)
                PickerFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                PickerFrame.BorderSizePixel = 0
                PickerFrame.Position = UDim2.new(0.5, 0, 0, 0)
                PickerFrame.Size = UDim2.new(0, 185, 0, 170)
                
                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = PickerFrame
                
                UIListLayout.Parent = PickerFrame
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 5)
                
                TextLabel.Parent = PickerFrame
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.BorderSizePixel = 0
                TextLabel.Position = UDim2.new(0.0664739907, 0, 0.81300813, 0)
                TextLabel.Size = UDim2.new(0, 183, 0, 20)
                TextLabel.Font = Enum.Font.GothamSemibold
                TextLabel.Text = string
                TextLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextLabel.TextSize = 13.000
                TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding.Parent = TextLabel
                UIPadding.PaddingLeft = UDim.new(0, 5)
                
                HSV.Name = "HSV"
                HSV.Parent = PickerFrame
                HSV.AnchorPoint = Vector2.new(0.5, 0.5)
                HSV.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                HSV.BorderSizePixel = 0
                HSV.Position = UDim2.new(0.4375, 0, 0.508130074, 0)
                HSV.Size = UDim2.new(0, 165, 0, 75)
                HSV.Image = "rbxassetid://4155801252"
                
                Drag.Name = "Drag"
                Drag.Parent = HSV
                Drag.AnchorPoint = Vector2.new(0.5, 0.5)
                Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Drag.BackgroundTransparency = 1.000
                Drag.Position = UDim2.new(0.5, 0, 0.5, 0)
                Drag.Size = UDim2.new(0, 20, 0, 20)
                Drag.Image = "http://www.roblox.com/asset/?id=4805639000"
                
                Slider.Name = "Slider"
                Slider.Parent = PickerFrame
                Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Slider.BorderSizePixel = 0
                Slider.Position = UDim2.new(0.0625, 0, 0.853658557, 0)
                Slider.Size = UDim2.new(0, 165, 0, 10)
                
                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.06, Color3.fromRGB(255, 85, 0)), ColorSequenceKeypoint.new(0.11, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(0.17, Color3.fromRGB(254, 255, 0)), ColorSequenceKeypoint.new(0.22, Color3.fromRGB(169, 255, 0)), ColorSequenceKeypoint.new(0.28, Color3.fromRGB(83, 255, 0)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 1)), ColorSequenceKeypoint.new(0.39, Color3.fromRGB(0, 255, 86)), ColorSequenceKeypoint.new(0.45, Color3.fromRGB(0, 255, 171)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 252, 255)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(0, 167, 255)), ColorSequenceKeypoint.new(0.61, Color3.fromRGB(0, 82, 255)), ColorSequenceKeypoint.new(0.67, Color3.fromRGB(2, 0, 255)), ColorSequenceKeypoint.new(0.72, Color3.fromRGB(88, 0, 255)), ColorSequenceKeypoint.new(0.78, Color3.fromRGB(173, 0, 255)), ColorSequenceKeypoint.new(0.84, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(0.89, Color3.fromRGB(255, 0, 166)), ColorSequenceKeypoint.new(0.95, Color3.fromRGB(255, 0, 80)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
                UIGradient.Parent = Slider
                
                Drag_2.Name = "Drag"
                Drag_2.Parent = Slider
                Drag_2.AnchorPoint = Vector2.new(0.5, 0.5)
                Drag_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Drag_2.BackgroundTransparency = 1.000
                Drag_2.Position = UDim2.new(0.5, 0, 0.5, 0)
                Drag_2.Size = UDim2.new(0, 20, 0, 20)
                Drag_2.Image = "http://www.roblox.com/asset/?id=4805639000"
                
                UICorner_2.CornerRadius = UDim.new(0, 2)
                UICorner_2.Parent = Slider
                
                RGB.Name = "RGB"
                RGB.Parent = PickerFrame
                RGB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                RGB.BackgroundTransparency = 1.000
                RGB.BorderSizePixel = 0
                RGB.Position = UDim2.new(0.0540540554, 0, 0.800000012, 0)
                RGB.Size = UDim2.new(0, 165, 0, 20)
                
                UIListLayout_2.Parent = RGB
                UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
                UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
                UIListLayout_2.Padding = UDim.new(0, 7)
                
                TextLabel_2.Parent = RGB
                TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                TextLabel_2.BorderSizePixel = 0
                TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextLabel_2.Size = UDim2.new(0, 50, 0, 15)
                TextLabel_2.Font = Enum.Font.Gotham
                TextLabel_2.Text = "R:"
                TextLabel_2.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextLabel_2.TextSize = 12.000
                TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
                
                UICorner_3.CornerRadius = UDim.new(0, 2)
                UICorner_3.Parent = TextLabel_2
                
                UIPadding_2.Parent = TextLabel_2
                UIPadding_2.PaddingLeft = UDim.new(0, 5)
                
                R.Name = "R"
                R.Parent = TextLabel_2
                R.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                R.BackgroundTransparency = 1.000
                R.BorderSizePixel = 0
                R.Size = UDim2.new(0, 50, 0, 15)
                R.ZIndex = 2
                R.Font = Enum.Font.Gotham
                R.Text = "255"
                R.TextColor3 = Color3.fromRGB(225, 225, 225)
                R.TextSize = 12.000
                R.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_3.Parent = R
                UIPadding_3.PaddingLeft = UDim.new(0, 15)
                
                TextLabel_3.Parent = RGB
                TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                TextLabel_3.BorderSizePixel = 0
                TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextLabel_3.Size = UDim2.new(0, 50, 0, 15)
                TextLabel_3.Font = Enum.Font.Gotham
                TextLabel_3.Text = "G:"
                TextLabel_3.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextLabel_3.TextSize = 12.000
                TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
                
                UICorner_4.CornerRadius = UDim.new(0, 2)
                UICorner_4.Parent = TextLabel_3
                
                UIPadding_4.Parent = TextLabel_3
                UIPadding_4.PaddingLeft = UDim.new(0, 5)
                
                G.Name = "G"
                G.Parent = TextLabel_3
                G.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                G.BackgroundTransparency = 1.000
                G.BorderSizePixel = 0
                G.Size = UDim2.new(0, 50, 0, 15)
                G.ZIndex = 2
                G.Font = Enum.Font.Gotham
                G.Text = "255"
                G.TextColor3 = Color3.fromRGB(225, 225, 225)
                G.TextSize = 12.000
                G.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_5.Parent = G
                UIPadding_5.PaddingLeft = UDim.new(0, 15)
                
                TextLabel_4.Parent = RGB
                TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel_4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                TextLabel_4.BorderSizePixel = 0
                TextLabel_4.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextLabel_4.Size = UDim2.new(0, 50, 0, 15)
                TextLabel_4.Font = Enum.Font.Gotham
                TextLabel_4.Text = "B:"
                TextLabel_4.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextLabel_4.TextSize = 12.000
                TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left
                
                UICorner_5.CornerRadius = UDim.new(0, 2)
                UICorner_5.Parent = TextLabel_4
                
                UIPadding_6.Parent = TextLabel_4
                UIPadding_6.PaddingLeft = UDim.new(0, 5)
                
                B.Name = "B"
                B.Parent = TextLabel_4
                B.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                B.BackgroundTransparency = 1.000
                B.BorderSizePixel = 0
                B.Size = UDim2.new(0, 50, 0, 15)
                B.ZIndex = 2
                B.Font = Enum.Font.Gotham
                B.Text = "255"
                B.TextColor3 = Color3.fromRGB(225, 225, 225)
                B.TextSize = 12.000
                B.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_7.Parent = B
                UIPadding_7.PaddingLeft = UDim.new(0, 15)
                
                Frame.Parent = PickerFrame
                Frame.BackgroundColor3 = getgenv().Color
                Frame.BorderSizePixel = 0
                Frame.Size = UDim2.new(0, 165, 0, 18)
                
                UICorner_6.CornerRadius = UDim.new(0, 2)
                UICorner_6.Parent = Frame
                
                Frame_2.Parent = Frame
                Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
                Frame_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
                Frame_2.Size = UDim2.new(0, 163, 0, 16)
                
                UICorner_7.CornerRadius = UDim.new(0, 2)
                UICorner_7.Parent = Frame_2
                
                local TextButton = Instance.new("TextButton")

                TextButton.Parent = Frame_2
                TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
                TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextButton.Size = UDim2.new(0, 165, 0, 13)
                TextButton.Font = Enum.Font.Gotham
                TextButton.Text = "Submit"
                TextButton.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextButton.TextSize = 12.000
                
                TextButton.MouseEnter:Connect(function()
                    local new = TS:Create(Frame_2, TI, {BackgroundColor3 = Color3.fromRGB(15, 15, 15)})
                    new:play()
                end)

                TextButton.MouseLeave:Connect(function()
                    local old = TS:Create(Frame_2, TI, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
                    old:play()
                end)
                
                UIListLayout_3.Parent = PickOutline
                UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center

                local gui = PickOutline
                local dragging
                local dragInput
                local dragStart
                local startPos
                
                local function update(input)
                    local delta = input.Position - dragStart
                    gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
                
                gui.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = true
                        dragStart = input.Position
                        startPos = gui.Position
                        
                        input.Changed:Connect(function()
                            if input.UserInputState == Enum.UserInputState.End then
                                dragging = false
                            end
                        end)
                    end
                end)
                
                gui.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                        dragInput = input
                    end
                end)
                
                UIS.InputChanged:Connect(function(input)
                    if input == dragInput and dragging then
                        update(input)
                    end
                end)
            
                

                TextButton_10.MouseButton1Down:Connect(function()
                    if not PickOutline.Visible then
                        for i,v in pairs(ScreenGui:GetChildren()) do
                            if v:IsA("Frame") and v.Name == "PickOutline" then
                                v.Visible = false
                            end
                        end

                        PickOutline.Position = UDim2.new(Outline.Position.X.Scale / Outline.Position.Y.Scale * 0.7, Outline.Position.X.Offset,  Outline.Position.Y.Scale,  Outline.Position.Y.Offset)
                        PickOutline.Visible = true
                    else
                        for i,v in pairs(ScreenGui:GetChildren()) do
                            if v:IsA("Frame") and v.Name == "PickOutline" then
                                v.Visible = false
                            end
                        end

                        PickOutline.Visible = false
                    end
                end)

                pcall(callback, Frame_8.BackgroundColor3)

                local UIS = game:GetService("UserInputService")

                local H = 1
                local S = (math.clamp(Drag.AbsolutePosition.X - HSV.AbsolutePosition.X, 0, HSV.AbsoluteSize.X) / HSV.AbsoluteSize.X)
                local V = 1 - (math.clamp(Drag.AbsolutePosition.Y - HSV.AbsolutePosition.Y, 0, HSV.AbsoluteSize.Y) / HSV.AbsoluteSize.Y)
                
                local function UpdateColorPicker()
                    Frame_8.BackgroundColor3 = Color3.fromHSV(H, S, V)
                    HSV.BackgroundColor3 = Color3.fromHSV(H, 1, 1)

                    --pcall(callback, Frame_7.BackgroundColor3)
                end
                
                do
                    local Draggable = false
                
                    Drag_2.MouseButton1Down:Connect(function()
                        Draggable = true
                    end)
                
                    UIS.InputChanged:Connect(function()
                        if Draggable then
                            local GetMouseLocation = game:GetService("Players").LocalPlayer:GetMouse()
                            local X = math.clamp((GetMouseLocation.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1)
                
                            Drag_2:TweenPosition(UDim2.new(X, 0, 0.5, 0), "Out", "Sine", 0.05)
                            --Drag_2.Position = UDim2.new(X, 0, 0.5, 0)
                            H = X

                            R.Text = math.floor(Frame_8.BackgroundColor3.R * 255)
                            G.Text = math.floor(Frame_8.BackgroundColor3.G * 255)
                            B.Text = math.floor(Frame_8.BackgroundColor3.B * 255)
                

                            UpdateColorPicker()
                        end
                    end)
                
                    Drag_2.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            Draggable = false
                        end
                    end)
                
                    Drag_2.Position = UDim2.new(0, 0, 0.5, 0)
                end
                
                
                do
                    local Draggable = false
                
                    Drag.MouseButton1Down:Connect(function()
                        Draggable = true
                    end)
                
                    UIS.InputChanged:Connect(function()
                        if Draggable then
                            local GetMouseLocation = game:GetService("Players").LocalPlayer:GetMouse()
                            local X = math.clamp((GetMouseLocation.X - HSV.AbsolutePosition.X) / HSV.AbsoluteSize.X, 0, 1)
                            local Y = math.clamp((GetMouseLocation.Y - HSV.AbsolutePosition.Y) / HSV.AbsoluteSize.Y, 0, 1)
                
                            Drag:TweenPosition(UDim2.new(X, 0, Y, 0), "Out", "Sine", 0.05)
                            S = X
                            V = 1 - Y

                            R.Text = math.floor(Frame_8.BackgroundColor3.R * 255)
                            G.Text = math.floor(Frame_8.BackgroundColor3.G * 255)
                            B.Text = math.floor(Frame_8.BackgroundColor3.B * 255)
                
                            UpdateColorPicker()
                        end
                    end)
                
                    Drag.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            Draggable = false
                        end
                    end)
                end

                local function UpdateToHSV()
                    H = select(1, Color3.toHSV(Frame_8.BackgroundColor3))
                    Drag_2:TweenPosition(UDim2.new(Color3.toHSV(Frame_8.BackgroundColor3), 0, 0.5, 0), "Out", "Sine", 0.05)
                    Drag:TweenPosition(UDim2.new(select(2, Color3.toHSV(Frame_8.BackgroundColor3)), 0, 1 - select(3, Color3.toHSV(Frame_7.BackgroundColor3)), 0), "Out", "Sine", 0.05)
                    HSV.BackgroundColor3 = Color3.fromHSV(H, 1, 1)

                    R.Text = math.floor(Frame_8.BackgroundColor3.R * 255)
                    G.Text = math.floor(Frame_8.BackgroundColor3.G * 255)
                    B.Text = math.floor(Frame_8.BackgroundColor3.B * 255)
                    
                    --pcall(callback, Frame_7.BackgroundColor3)
                end

                UpdateToHSV()

                R.FocusLost:Connect(function()
                    if tonumber(G.Text) > 255 then
                        B.Text = 255
                    end

                    Frame_8.BackgroundColor3 = Color3.fromRGB(tonumber(R.Text), tonumber(G.Text), tonumber(B.Text))
                    UpdateToHSV()
                end)

                G.FocusLost:Connect(function()
                    if tonumber(G.Text) > 255 then
                        G.Text = 255
                    end

                    Frame_8.BackgroundColor3 = Color3.fromRGB(tonumber(R.Text), tonumber(G.Text), tonumber(B.Text))
                    UpdateToHSV()
                end)

                B.FocusLost:Connect(function()
                    if tonumber(B.Text) > 255 then
                        B.Text = 255
                    end

                    Frame_8.BackgroundColor3 = Color3.fromRGB(tonumber(R.Text), tonumber(G.Text), tonumber(B.Text))
                    UpdateToHSV()
                end)

                TextButton.MouseButton1Down:Connect(function()
                    local new = TS:Create(TextButton, TI, {TextColor3 = getgenv().Color})
                    new:play()
                    wait(0.15)
                    local old = TS:Create(TextButton, TI, {TextColor3 = Color3.fromRGB(255, 255, 255)})
                    old:play()

                    pcall(callback, Frame_8.BackgroundColor3)
                end)
            end

            return brah
        end

        return Section
    end

    return Tab
end

return Library
