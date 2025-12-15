local inputService   = game:GetService("UserInputService")
local runService     = game:GetService("RunService")
local tweenService   = game:GetService("TweenService")
local players        = game:GetService("Players")
local localPlayer    = players.LocalPlayer
local mouse          = localPlayer:GetMouse()

local menu           = game:GetObjects("rbxassetid://12705540680")[1]
menu.bg.Position     = UDim2.new(0.5,-menu.bg.Size.X.Offset/2,0.5,-menu.bg.Size.Y.Offset/2)
menu.Parent          = game:GetService("CoreGui")
menu.bg.pre.Text = '<font color="#D1D1D1">kukware</font>'

local tags = {
        34531592,   -- [X]
        35474227,   -- [<3]
        481483834,  -- [:3]
        34423896,   -- [092]
        112358282,  -- [TML]
        909775996,  -- [YAU]
        94195597,   -- [CHEAT]
        445673563, -- [OKEN]
        1018619654, -- [SILLY]
        975405103,  -- [PAWS]
        35423131,   -- [MERCY]
        429397710,  -- [KITTEN]
        1051841454, -- [MEOW]
        35733646,   -- [TERROR]
        34733738,   -- [RR]
        35692393,    -- [RICH]
        35953799,    -- [PRETTY]
        1015469631    -- [1887
}

local library = {cheatname = "";ext = "";gamename = "";colorpicking = false;tabbuttons = {};tabs = {};options = {};flags = {};scrolling = false;notifyText = Drawing.new("Text");playing = false;multiZindex = 200;toInvis = {};libColor = Color3.new(0.200000, 0.000000, 1.000000);disabledcolor = Color3.fromRGB(233, 0, 0);blacklisted = {Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.UserInputType.MouseMovement}}

function draggable(a)local b=inputService;local c;local d;local e;local f;local function g(h)if not library.colorpicking then local i=h.Position-e;a.Position=UDim2.new(f.X.Scale,f.X.Offset+i.X,f.Y.Scale,f.Y.Offset+i.Y)end end;a.InputBegan:Connect(function(h)if h.UserInputType==Enum.UserInputType.MouseButton1 or h.UserInputType==Enum.UserInputType.Touch then c=true;e=h.Position;f=a.Position;h.Changed:Connect(function()if h.UserInputState==Enum.UserInputState.End then c=false end end)end end)a.InputChanged:Connect(function(h)if h.UserInputType==Enum.UserInputType.MouseMovement or h.UserInputType==Enum.UserInputType.Touch then d=h end end)b.InputChanged:Connect(function(h)if h==d and c then g(h)end end)end
draggable(menu.bg)

local tabholder = menu.bg.bg.bg.bg.main.group
local tabviewer = menu.bg.bg.bg.bg.tabbuttons

local Connections     = {};
local Loops           = {};
local GameFramework   = {};
local VisualsModule   = {};
local Notifications   = {};
local Utility         = {};
local Combat          = {};
local CustomObjects   = {};
local CommandBar      = {};
local Commands        = {};
local Flags           = {};
local PlayerFunctions = {};
local Seats           = {};
local Configs         = {};

local Camera = workspace.CurrentCamera


if not gui then 
    gui = { keybind = Enum.KeyCode.RightShift } 
else
    gui.keybind = gui.keybind or Enum.KeyCode.RightShift
end

inputService.InputEnded:Connect(function(key)
    if key.KeyCode == gui.keybind then
        menu.Enabled = not menu.Enabled
        library.scrolling = false
        library.colorpicking = false

        for _, v in next, library.toInvis do
            v.Visible = false
        end
    end
end)
local Client = game.Players.LocalPlayer;
local keyNames = {
    [Enum.KeyCode.LeftAlt] = 'LALT';
    [Enum.KeyCode.RightAlt] = 'RALT';
    [Enum.KeyCode.LeftControl] = 'LCTRL';
    [Enum.KeyCode.RightControl] = 'RCTRL';
    [Enum.KeyCode.LeftShift] = 'LSHIFT';
    [Enum.KeyCode.RightShift] = 'RSHIFT';
    [Enum.KeyCode.Underscore] = '_';
    [Enum.KeyCode.Minus] = '-';
    [Enum.KeyCode.Plus] = '+';
    [Enum.KeyCode.Period] = '.';
    [Enum.KeyCode.Slash] = '/';
    [Enum.KeyCode.BackSlash] = '\\';
    [Enum.KeyCode.Question] = '?';
    [Enum.UserInputType.MouseButton1] = 'MB1';
    [Enum.UserInputType.MouseButton2] = 'MB2';
    [Enum.UserInputType.MouseButton3] = 'MB3';
}

local silent = {
    HealthCheck = false,
    CrewCheck = false,
    target = nil,
    cf = nil,
    key = Enum.KeyCode.C,
    hl = false,
    friend = false,
    visible = false,
    distance = false,
    dist = 0,
    on = false,
    assist = false,
    assistv = 0.058,
    pred = 0.013,
    mode = "FOV",
    part = "HumanoidRootPart",
    fov = {
        visible = false,
        size = 0,
    },
    whitelistEnabled = true,
}


local shared = {
    drawings = {},
    connections = {},
    hidden_connections = {},
    pointers = {},
    theme = {
        inline = Color3.fromRGB(6, 6, 6),
        dark = Color3.fromRGB(24, 24, 24),
        text = Color3.fromRGB(255, 255, 255),
        section = Color3.fromRGB(150, 150, 150),
        accent = Color3.fromRGB(255, 35, 35)
    },
    accents = {},
    moveKeys = {
        ["Movement"] = {
            ["Up"] = "Up",
            ["Down"] = "Down"
        },
        ["Action"] = {
            ["Return"] = "Enter",
            ["Left"] = "Left",
            ["Right"] = "Right"
        }
    },
    keys = {"C","X","E","Q","F","Z"},
    extrakeys = {"Insert","LeftAlt","LeftControl","LeftShift","RightAlt","RightControl","RightShift"},
    allowedKeyCodes = {"Q","E","R","T","Y","U","I","O","P","F","G","H","J","K","L","Z","X","C","V","B","N","M","One","Two","Three","Four","Five","Six","Seveen","Eight","Nine","0","Insert","Tab","Home","End","LeftAlt","LeftControl","LeftShift","RightAlt","RightControl","RightShift"},
    allowedInputTypes = {"MouseButton1","MouseButton2","MouseButton3"},
    shortenedInputs = {["MouseButton1"] = "MB1", ["MouseButton2"] = "MB2", ["MouseButton3"] = "MB3", ["Insert"] = "Ins", ["LeftAlt"] = "LAlt", ["LeftControl"] = "LCtrl", ["LeftShift"] = "LShift", ["RightAlt"] = "RAlt", ["RightControl"] = "RCtrl", ["RightShift"] = "RShift", ["CapsLock"] = "Caps"},
    colors = {Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 100, 0), Color3.fromRGB(255, 200, 0), Color3.fromRGB(210, 255, 0), Color3.fromRGB(110, 255, 0), Color3.fromRGB(10, 255, 0), Color3.fromRGB(0, 255, 90), Color3.fromRGB(0, 255, 190), Color3.fromRGB(0, 220, 255), Color3.fromRGB(0, 120, 255), Color3.fromRGB(0, 20, 255), Color3.fromRGB(80, 0, 255), Color3.fromRGB(180, 0, 255), Color3.fromRGB(255, 0, 230), Color3.fromRGB(255, 0, 130), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0)},
    toggleKey = {Enum.KeyCode.Insert, true}
}

library.notifyText.Font = 2
library.notifyText.Size = 13
library.notifyText.Outline = true
library.notifyText.Color = Color3.new(1,1,1)
library.notifyText.Position = Vector2.new(10,60)

function library:Tween(...)
    tweenService:Create(...):Play()
end

function library:notify(text)
    if playing then return end
    playing = true
    library.notifyText.Text = text
    library.notifyText.Transparency = 0
    library.notifyText.Visible = true
    for i = 0,1,0.1 do wait()
        library.notifyText.Transparency = i
    end
    spawn(function()
        wait(3)
        for i = 1,0,-0.1 do wait()
            library.notifyText.Transparency = i
        end
        playing = false
        library.notifyText.Visible = false
    end)
end

function library:addTab(name)
    local newTab = tabholder.tab:Clone()
    local newButton = tabviewer.button:Clone()

    table.insert(library.tabs,newTab)
    newTab.Parent = tabholder
    newTab.Visible = false

    table.insert(library.tabbuttons,newButton)
    newButton.Parent = tabviewer
    newButton.Modal = true
    newButton.Visible = true
    newButton.text.Text = name
    newButton.MouseButton1Click:Connect(function()
        for i,v in next, library.tabs do
            v.Visible = v == newTab
        end
        for i,v in next, library.toInvis do
            v.Visible = false
        end
        for i,v in next, library.tabbuttons do
            local state = v == newButton
            if state then
                v.element.Visible = true
                library:Tween(v.element, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.000})
                v.text.TextColor3 = Color3.fromRGB(244, 244, 244)
            else
                library:Tween(v.element, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000})
                v.text.TextColor3 = Color3.fromRGB(144, 144, 144)
            end
        end
    end)

    local tab = {}
    local groupCount = 0
    local jigCount = 0
    local topStuff = 2000
  
    function tab:createGroup(pos,groupname) 
        local groupbox = Instance.new("Frame")
        local grouper = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")
        local element = Instance.new("Frame")
        local title = Instance.new("TextLabel")
        local backframe = Instance.new("Frame")

        groupCount -= 1

        groupbox.Parent = newTab[pos]
        groupbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        groupbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
        groupbox.BorderSizePixel = 2
        groupbox.Size = UDim2.new(0, 215, 0, 8)
        groupbox.ZIndex = groupCount

        grouper.Parent = groupbox
        grouper.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        grouper.BorderColor3 = Color3.fromRGB(0, 0, 0)
        grouper.Size = UDim2.new(1, 0, 1, 0)

        UIListLayout.Parent = grouper
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        UIPadding.Parent = grouper
        UIPadding.PaddingBottom = UDim.new(0, 4)
        UIPadding.PaddingTop = UDim.new(0, 7)

        element.Name = "element"
        element.Parent = groupbox
        element.BackgroundColor3 = library.libColor
        element.BorderSizePixel = 0
        element.Size = UDim2.new(1, 0, 0, 1)

        title.Parent = groupbox
        title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1.000
        title.BorderSizePixel = 0
        title.Position = UDim2.new(0, 17, 0, 0)
        title.ZIndex = 2
        title.Font = Enum.Font.Code
        title.Text = groupname or ""
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 13.000
        title.TextStrokeTransparency = 0.000
        title.TextXAlignment = Enum.TextXAlignment.Left

        backframe.Parent = groupbox
        backframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        backframe.BorderSizePixel = 0
        backframe.Position = UDim2.new(0, 10, 0, -2)
        backframe.Size = UDim2.new(0, 13 + title.TextBounds.X, 0, 3)

        local group = {}
        function group:addToggle(args)
            if not args.flag and args.text then args.flag = args.text end
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on recent toggle") end
            groupbox.Size += UDim2.new(0, 0, 0, 20)

            local toggleframe = Instance.new("Frame")
            local tobble = Instance.new("Frame")
            local mid = Instance.new("Frame")
            local front = Instance.new("Frame")
            local text = Instance.new("TextLabel")
            local button = Instance.new("TextButton")

            jigCount -= 1
            library.multiZindex -= 1

            toggleframe.Name = "toggleframe"
            toggleframe.Parent = grouper
            toggleframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleframe.BackgroundTransparency = 1.000
            toggleframe.BorderSizePixel = 0
            toggleframe.Size = UDim2.new(1, 0, 0, 20)
            toggleframe.ZIndex = library.multiZindex
            
            tobble.Name = "tobble"
            tobble.Parent = toggleframe
            tobble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            tobble.BorderColor3 = Color3.fromRGB(0, 0, 0)
            tobble.BorderSizePixel = 3
            tobble.Position = UDim2.new(0.0299999993, 0, 0.272000015, 0)
            tobble.Size = UDim2.new(0, 10, 0, 10)
            
            mid.Name = "mid"
            mid.Parent = tobble
            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
            mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
            mid.BorderSizePixel = 2
            mid.Size = UDim2.new(0, 10, 0, 10)
            
            front.Name = "front"
            front.Parent = mid
            front.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            front.BorderColor3 = Color3.fromRGB(0, 0, 0)
            front.Size = UDim2.new(0, 10, 0, 10)
            
            text.Name = "text"
            text.Parent = toggleframe
            text.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0, 22, 0, 0)
            text.Size = UDim2.new(0, 0, 1, 2)
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(155, 155, 155)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left
            
            button.Name = "button"
            button.Parent = toggleframe
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.BorderSizePixel = 0
            button.Size = UDim2.new(0, 101, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000

            if args.disabled then
                button.Visible = false
                text.TextColor3 = library.disabledcolor
                text.Text = args.text
            return end

            local state = false
            function toggle(newState)
                state = newState
                library.flags[args.flag] = state
                front.BackgroundColor3 = state and library.libColor or Color3.fromRGB(35, 35, 35)
                text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144)
                if args.callback then
                    args.callback(state)
                end
            end
            button.MouseButton1Click:Connect(function()
                state = not state
                front.Name = state and "accent" or "back"
                library.flags[args.flag] = state
                mid.BorderColor3 = Color3.fromRGB(60,60, 60)
                front.BackgroundColor3 = state and library.libColor or Color3.fromRGB(35, 35, 35)
                text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144)
                if args.callback then
                    args.callback(state)
                end
            end)
            button.MouseEnter:connect(function()
                mid.BorderColor3 = library.libColor
			end)
            button.MouseLeave:connect(function()
                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
			end)

            library.flags[args.flag] = false
            library.options[args.flag] = {type = "toggle",changeState = toggle,skipflag = args.skipflag,oldargs = args}
            local toggle = {}
            library.options[args.flag].frame = toggleframe



function group:removeToggle(flag)
    if not flag then return warn("⚠️ removeToggle requires a flag") end

    for _, child in ipairs(grouper:GetChildren()) do
        if child:IsA("Frame") and child:FindFirstChild("text") then
            local textLabel = child:FindFirstChild("text")
            if textLabel.Text == flag or (library.options[flag] and library.options[flag].oldargs.text == textLabel.Text) then
                child:Destroy()
                break
            end
        end
    end

    library.flags[flag] = nil
    library.options[flag] = nil
    groupbox.Size -= UDim2.new(0, 0, 0, 20)
end




            function toggle:addKeybind(args)
                if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on toggle:keybind") end
                local next = false
                
                local keybind = Instance.new("Frame")
                local button = Instance.new("TextButton")

                keybind.Parent = toggleframe
                keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                keybind.BackgroundTransparency = 1.000
                keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
                keybind.BorderSizePixel = 0
                keybind.Position = UDim2.new(0.720000029, 4, 0.272000015, 0)
                keybind.Size = UDim2.new(0, 51, 0, 10)
                
                button.Parent = keybind
                button.BackgroundColor3 = Color3.fromRGB(187, 131, 255)
                button.BackgroundTransparency = 1.000
                button.BorderSizePixel = 0
                button.Position = UDim2.new(-0.270902753, 0, 0, 0)
                button.Size = UDim2.new(1.27090275, 0, 1, 0)
                button.Font = Enum.Font.Code
                button.Text = ""
                button.TextColor3 = Color3.fromRGB(155, 155, 155)
                button.TextSize = 13.000
                button.TextStrokeTransparency = 0.000
                button.TextXAlignment = Enum.TextXAlignment.Right
    
                function updateValue(val)
                    if library.colorpicking then return end
                    library.flags[args.flag] = val
                    button.Text = keyNames[val] or val.Name
                end
                inputService.InputBegan:Connect(function(key)
                    local key = key.KeyCode == Enum.KeyCode.Unknown and key.UserInputType or key.KeyCode
                    if next then
                        if not table.find(library.blacklisted,key) then
                            next = false
                            library.flags[args.flag] = key
                            button.Text = keyNames[key] or key.Name
                            button.TextColor3 = Color3.fromRGB(155, 155, 155)
                        end
                    end
                    if not next and key == library.flags[args.flag] and args.callback then
                        args.callback()
                    end
                end)
    
                button.MouseButton1Click:Connect(function()
                    if library.colorpicking then return end
                    library.flags[args.flag] = Enum.KeyCode.Unknown
                    button.Text = "--"
                    button.TextColor3 = library.libColor
                    next = true
                end)
    
                library.flags[args.flag] = Enum.KeyCode.Unknown
                library.options[args.flag] = {type = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
    
                updateValue(args.key or Enum.KeyCode.Unknown)
            end
            function toggle:addColorpicker(args)
                if not args.flag and args.text then args.flag = args.text end
                local colorpicker = Instance.new("Frame")
                local mid = Instance.new("Frame")
                local front = Instance.new("Frame")
                local button2 = Instance.new("TextButton")
                local colorFrame = Instance.new("Frame")
                local colorFrame_2 = Instance.new("Frame")
                local hueframe = Instance.new("Frame")
                local main = Instance.new("Frame")
                local hue = Instance.new("ImageLabel")
                local pickerframe = Instance.new("Frame")
                local main_2 = Instance.new("Frame")
                local picker = Instance.new("ImageLabel")
                local clr = Instance.new("Frame")
                local copy = Instance.new("TextButton")

                library.multiZindex -= 1
                jigCount -= 1
                topStuff -= 1 

                colorpicker.Parent = toggleframe
                colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                colorpicker.BorderSizePixel = 3
                colorpicker.Position = args.second and UDim2.new(0.720000029, 4, 0.272000015, 0) or UDim2.new(0.860000014, 4, 0.272000015, 0)
                colorpicker.Size = UDim2.new(0, 20, 0, 10)
                
                mid.Name = "mid"
                mid.Parent = colorpicker
                mid.BackgroundColor3 = Color3.new(0.984314, 1.000000, 0.000000)
                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
                mid.BorderSizePixel = 2
                mid.Size = UDim2.new(1, 0, 1, 0)
                
                front.Name = "front"
                front.Parent = mid
                front.BackgroundColor3 = Color3.fromRGB(240, 142, 214)
                front.BorderColor3 = Color3.fromRGB(0, 0, 0)
                front.Size = UDim2.new(1, 0, 1, 0)
                
                button2.Name = "button2"
                button2.Parent = front
                button2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                button2.BackgroundTransparency = 1.000
                button2.Size = UDim2.new(1, 0, 1, 0)
                button2.Text = ""
                button2.Font = Enum.Font.SourceSans
                button2.TextColor3 = Color3.fromRGB(0, 0, 0)
                button2.TextSize = 14.000

				colorFrame.Name = "colorFrame"
				colorFrame.Parent = toggleframe
				colorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				colorFrame.BorderSizePixel = 2
				colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)
				colorFrame.Size = UDim2.new(0, 137, 0, 128)

				colorFrame_2.Name = "colorFrame"
				colorFrame_2.Parent = colorFrame
				colorFrame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
				colorFrame_2.Size = UDim2.new(1, 0, 1, 0)

				hueframe.Name = "hueframe"
				hueframe.Parent = colorFrame_2
				hueframe.Parent = colorFrame_2
                hueframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                hueframe.BorderSizePixel = 2
                hueframe.Position = UDim2.new(-0.0930000022, 18, -0.0599999987, 30)
                hueframe.Size = UDim2.new(0, 100, 0, 100)
    
                main.Name = "main"
                main.Parent = hueframe
                main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                main.BorderColor3 = Color3.fromRGB(0, 0, 0)
                main.Size = UDim2.new(0, 100, 0, 100)
                main.ZIndex = 6
    
                picker.Name = "picker"
                picker.Parent = main
                picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
                picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                picker.BorderSizePixel = 0
                picker.Size = UDim2.new(0, 100, 0, 100)
                picker.ZIndex = 104
                picker.Image = "rbxassetid://2615689005"
    
                pickerframe.Name = "pickerframe"
                pickerframe.Parent = colorFrame
                pickerframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                pickerframe.BorderSizePixel = 2
                pickerframe.Position = UDim2.new(0.711000025, 14, -0.0599999987, 30)
                pickerframe.Size = UDim2.new(0, 20, 0, 100)
    
                main_2.Name = "main"
                main_2.Parent = pickerframe
                main_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                main_2.Size = UDim2.new(0, 20, 0, 100)
                main_2.ZIndex = 6
    
                hue.Name = "hue"
                hue.Parent = main_2
                hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
                hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                hue.BorderSizePixel = 0
                hue.Size = UDim2.new(0, 20, 0, 100)
                hue.ZIndex = 104
                hue.Image = "rbxassetid://2615692420"
    
                clr.Name = "clr"
                clr.Parent = colorFrame
                clr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                clr.BackgroundTransparency = 1.000
                clr.BorderColor3 = Color3.fromRGB(60, 60, 60)
                clr.BorderSizePixel = 2
                clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
                clr.Size = UDim2.new(0, 129, 0, 14)
                clr.ZIndex = 5
    
                copy.Name = "copy"
                copy.Parent = clr
                copy.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                copy.BackgroundTransparency = 1.000
                copy.BorderSizePixel = 0
                copy.Size = UDim2.new(0, 129, 0, 14)
                copy.ZIndex = 5
                copy.Font = Enum.Font.SourceSans
                copy.Text = args.text or args.flag
                copy.TextColor3 = Color3.fromRGB(100, 100, 100)
                copy.TextSize = 14.000
                copy.TextStrokeTransparency = 0.000

                copy.MouseButton1Click:Connect(function() 
                    colorFrame.Visible = false
                end)

                button2.MouseButton1Click:Connect(function()
                    colorFrame.Visible = not colorFrame.Visible
                    mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
                end)

                button2.MouseEnter:connect(function()
                    mid.BorderColor3 = library.libColor
                end)
                button2.MouseLeave:connect(function()
                    mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
                end)

                local function updateValue(value,fakevalue)
                    if typeof(value) == "table" then value = fakevalue end
                    library.flags[args.flag] = value
                    front.BackgroundColor3 = value
                    if args.callback then
                        args.callback(value)
                    end
                end

                local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
                local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
                local heartbeat = game:GetService("RunService").Heartbeat

                local pickerX,pickerY,hueY = 0,0,0
                local oldpercentX,oldpercentY = 0,0

                hue.MouseEnter:Connect(function()
                    local input = hue.InputBegan:connect(function(key)
                        if key.UserInputType == Enum.UserInputType.MouseButton1 then
                            while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                library.colorpicking = true
                                local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                                local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                                local startC = colors[math.floor(num)]
                                local endC = colors[math.ceil(num)]
                                local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                                picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                                updateValue(color)
                            end
                            library.colorpicking = false
                        end
                    end)
                    local leave
                    leave = hue.MouseLeave:connect(function()
                        input:disconnect()
                        leave:disconnect()
                    end)
                end)

                picker.MouseEnter:Connect(function()
                    local input = picker.InputBegan:connect(function(key)
                        if key.UserInputType == Enum.UserInputType.MouseButton1 then
                            while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                library.colorpicking = true
                                local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                                local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                                local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                                updateValue(color)
                                oldpercentX,oldpercentY = xPercent,yPercent
                            end
                            library.colorpicking = false
                        end
                    end)
                    local leave
                    leave = picker.MouseLeave:connect(function()
                        input:disconnect()
                        leave:disconnect()
                    end)
                end)

                hue.MouseMoved:connect(function(_, y)
                    hueY = y
                end)

                picker.MouseMoved:connect(function(x, y)
                    pickerX,pickerY = x,y
                end)

                table.insert(library.toInvis,colorFrame)
                library.flags[args.flag] = Color3.new(1,1,1)
                library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}

                updateValue(args.color or Color3.new(1,1,1))
            end
            return toggle
        end
        function group:addButton(args)
            if not args.callback or not args.text then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0, 0, 0, 22)

            local buttonframe = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("Frame")
            local button = Instance.new("TextButton")
            local gradient = Instance.new("UIGradient")

            buttonframe.Name = "buttonframe"
            buttonframe.Parent = grouper
            buttonframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            buttonframe.BackgroundTransparency = 1.000
            buttonframe.BorderSizePixel = 0
            buttonframe.Size = UDim2.new(1, 0, 0, 21)
            
            bg.Name = "bg"
            bg.Parent = buttonframe
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.0299999993, -1, 0.140000001, 0)
            bg.Size = UDim2.new(0, 205, 0, 15)
            
            main.Name = "main"
            main.Parent = bg
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            
            button.Name = "button"
            button.Parent = main
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            button.BackgroundTransparency = 1.000
            button.BorderSizePixel = 0
            button.Size = UDim2.new(1, 0, 1, 0)
            button.Font = Enum.Font.Code
            button.Text = args.text or args.flag
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextSize = 13.000
            button.TextStrokeTransparency = 0.000
            
            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
            gradient.Rotation = 90
            gradient.Name = "gradient"
            gradient.Parent = main

            button.MouseButton1Click:Connect(function()
                if not library.colorpicking then
                    args.callback()
                end
            end)
            button.MouseEnter:connect(function()
                main.BorderColor3 = library.libColor
			end)
			button.MouseLeave:connect(function()
                main.BorderColor3 = Color3.fromRGB(60, 60, 60)
			end)
        end
        function group:addSlider(args)
            groupbox.Size += UDim2.new(0, 0, 0, 30)

            local slider = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("Frame")
            local fill = Instance.new("Frame")
            local button = Instance.new("TextButton")
            local valuetext = Instance.new("TextLabel")
            local UIGradient = Instance.new("UIGradient")
            local text = Instance.new("TextLabel")

            slider.Name = "slider"
            slider.Parent = grouper
            slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            slider.BackgroundTransparency = 1.000
            slider.BorderSizePixel = 0
            slider.Size = UDim2.new(1, 0, 0, 30)
            
            bg.Name = "bg"
            bg.Parent = slider
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.0299999993, -1, 0, 16)
            bg.Size = UDim2.new(0, 205, 0, 10)
            
            main.Name = "main"
            main.Parent = bg
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(50, 50, 50)
            main.Size = UDim2.new(1, 0, 1, 0)
            
            fill.Name = "fill"
            fill.Parent = main
            fill.BackgroundColor3 = library.libColor
            fill.BackgroundTransparency = 0.200
            fill.BorderColor3 = Color3.fromRGB(60, 60, 60)
            fill.BorderSizePixel = 0
            fill.Size = UDim2.new(0.617238641, 13, 1, 0)
            
            button.Name = "button"
            button.Parent = main
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.Size = UDim2.new(0, 191, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000
            
            valuetext.Parent = main
            valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            valuetext.BackgroundTransparency = 1.000
            valuetext.Position = UDim2.new(0.5, 0, 0.5, 0)
            valuetext.Font = Enum.Font.Code
            valuetext.Text = "0.9172/10"
            valuetext.TextColor3 = Color3.fromRGB(255, 255, 255)
            valuetext.TextSize = 14.000
            valuetext.TextStrokeTransparency = 0.000
            
            UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(113, 113, 113))}
            UIGradient.Rotation = 90
            UIGradient.Parent = main
            
            text.Name = "text"
            text.Parent = slider
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
            text.ZIndex = 2
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left

            local entered = false
			local scrolling = false
			local amount = 0

            local function updateValue(value)
                if library.colorpicking then return end
				if value ~= 0 then
					fill:TweenSize(UDim2.new(value/args.max,0,1,0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.01)
				else
					fill:TweenSize(UDim2.new(0,1,1,0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.01)
                end
                valuetext.Text = tostring(value )
                library.flags[args.flag] = value
                if args.callback then
                    args.callback(value)
                end
			end
			local function updateScroll()
                if scrolling or library.scrolling or not newTab.Visible or library.colorpicking then return end
                while inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and menu.Enabled do runService.RenderStepped:Wait()
                    library.scrolling = true
                    valuetext.TextColor3 = Color3.fromRGB(255,255,255)
					scrolling = true
					local value = args.min + ((mouse.X - button.AbsolutePosition.X) / button.AbsoluteSize.X) * (args.max - args.min)
					if value < 0 then value = 0 end
					if value > args.max then value = args.max end
                    if value < args.min then value = args.min end
					updateValue(math.floor(value))
                end
                if scrolling and not entered then
                    valuetext.TextColor3 = Color3.fromRGB(255,255,255)
                end
                if not menu.Enabled then
                    entered = false
                end
                scrolling = false
                library.scrolling = false
			end
			button.MouseEnter:connect(function()
                if library.colorpicking then return end
				if scrolling or entered then return end
                entered = true
                main.BorderColor3 = library.libColor
				while entered do wait()
					updateScroll()
				end
			end)
			button.MouseLeave:connect(function()
                entered = false
                main.BorderColor3 = Color3.fromRGB(60, 60, 60)
			end)
            if args.value then
                updateValue(args.value)
            end
            library.flags[args.flag] = 0
            library.options[args.flag] = {type = "slider",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
            updateValue(args.value or 0)
        end
        function group:addTextbox(args)
            groupbox.Size += UDim2.new(0, 0, 0, 35)

            local textbox = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("ScrollingFrame")
            local box = Instance.new("TextBox")
            local gradient = Instance.new("UIGradient")
            local text = Instance.new("TextLabel")

            box:GetPropertyChangedSignal('Text'):Connect(function(val)
                if library.colorpicking then return end
                library.flags[args.flag] = box.Text
                args.value = box.Text
                if args.callback then
                    args.callback()
                end
            end)
            textbox.Name = "textbox"
            textbox.Parent = grouper
            textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            textbox.BackgroundTransparency = 1.000
            textbox.BorderSizePixel = 0
            textbox.Size = UDim2.new(1, 0, 0, 35)
            textbox.ZIndex = 10

            bg.Name = "bg"
            bg.Parent = textbox
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.0299999993, -1, 0, 16)
            bg.Size = UDim2.new(0, 205, 0, 15)

            main.Name = "main"
            main.Parent = bg
            main.Active = true
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            main.CanvasSize = UDim2.new(0, 0, 0, 0)
            main.ScrollBarThickness = 0

            box.Name = "box"
            box.Parent = main
            box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            box.BackgroundTransparency = 1.000
            box.Selectable = false
            box.Size = UDim2.new(1, 0, 1, 0)
            box.Font = Enum.Font.Code
            box.Text = args.value or ""
            box.TextColor3 = Color3.fromRGB(255, 255, 255)
            box.TextSize = 13.000
            box.TextStrokeTransparency = 0.000
            box.TextXAlignment = Enum.TextXAlignment.Left

            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
            gradient.Rotation = 90
            gradient.Name = "gradient"
            gradient.Parent = main

            text.Name = "text"
            text.Parent = textbox
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
            text.ZIndex = 2
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left


            library.flags[args.flag] = args.value or ""
            library.options[args.flag] = {type = "textbox",changeState = function(text) box.Text = text end,skipflag = args.skipflag,oldargs = args}
        end
        function group:addDivider(args)
            groupbox.Size += UDim2.new(0, 0, 0, 10)
            
            local div = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("Frame")

            div.Name = "div"
            div.Parent = grouper
            div.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            div.BackgroundTransparency = 1.000
            div.BorderSizePixel = 0
            div.Position = UDim2.new(0, 0, 0.743662, 0)
            div.Size = UDim2.new(0, 202, 0, 10)
            
            bg.Name = "bg"
            bg.Parent = div
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.0240000002, 0, 0, 4)
            bg.Size = UDim2.new(0, 191, 0, 1)
            
            main.Name = "main"
            main.Parent = bg
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(0, 191, 0, 1)
        end
        function group:addList(args)
            if not args.flag or not args.values then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0, 0, 0, 35)
            
            library.multiZindex -= 1

            local list = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("ScrollingFrame")
            local button = Instance.new("TextButton")
            local dumbtriangle = Instance.new("ImageLabel")
            local valuetext = Instance.new("TextLabel")
            local gradient = Instance.new("UIGradient")
            local text = Instance.new("TextLabel")

            local frame = Instance.new("Frame")
            local holder = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")
            
            list.Name = "list"
            list.Parent = grouper
            list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            list.BackgroundTransparency = 1.000
            list.BorderSizePixel = 0
            list.Size = UDim2.new(1, 0, 0, 35)
            list.ZIndex = library.multiZindex

            bg.Name = "bg"
            bg.Parent = list
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.0299999993, -1, 0, 16)
            bg.Size = UDim2.new(0, 205, 0, 15)

            main.Name = "main"
            main.Parent = bg
            main.Active = true
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            main.CanvasSize = UDim2.new(0, 0, 0, 0)
            main.ScrollBarThickness = 0

            button.Name = "button"
            button.Parent = main
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.Size = UDim2.new(0, 191, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000

            dumbtriangle.Name = "dumbtriangle"
            dumbtriangle.Parent = main
            dumbtriangle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            dumbtriangle.BackgroundTransparency = 1.000
            dumbtriangle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            dumbtriangle.BorderSizePixel = 0
            dumbtriangle.Position = UDim2.new(1, -11, 0.5, -3)
            dumbtriangle.Size = UDim2.new(0, 7, 0, 6)
            dumbtriangle.ZIndex = 3
            dumbtriangle.Image = "rbxassetid://8532000591"

            valuetext.Name = "valuetext"
            valuetext.Parent = main
            valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            valuetext.BackgroundTransparency = 1.000
            valuetext.Position = UDim2.new(0.00200000009, 2, 0, 7)
            valuetext.ZIndex = 2
            valuetext.Font = Enum.Font.Code
            valuetext.Text = ""
            valuetext.TextColor3 = Color3.fromRGB(244, 244, 244)
            valuetext.TextSize = 13.000
            valuetext.TextStrokeTransparency = 0.000
            valuetext.TextXAlignment = Enum.TextXAlignment.Left

            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
            gradient.Rotation = 90
            gradient.Name = "gradient"
            gradient.Parent = main

            text.Name = "text"
            text.Parent = list
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
            text.ZIndex = 2
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left

            frame.Name = "frame"
            frame.Parent = list
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            frame.BorderSizePixel = 2
            frame.Position = UDim2.new(0.0299999993, -1, 0.605000019, 15)
            frame.Size = UDim2.new(0, 203, 0, 0)
            frame.Visible = false
            frame.ZIndex = library.multiZindex
            
            holder.Name = "holder"
            holder.Parent = frame
            holder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            holder.BorderColor3 = Color3.fromRGB(60, 60, 60)
            holder.Size = UDim2.new(1, 0, 1, 0)
            
            UIListLayout.Parent = holder
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

			local function updateValue(value)
                if value == nil then valuetext.Text = "nil" return end
				if args.multiselect then
                    if type(value) == "string" then
                        if not table.find(library.options[args.flag].values,value) then return end
                        if table.find(library.flags[args.flag],value) then
                            for i,v in pairs(library.flags[args.flag]) do
                                if v == value then
                                    table.remove(library.flags[args.flag],i)
                                end
                            end
                        else
                            table.insert(library.flags[args.flag],value)
                        end
                    else
                        library.flags[args.flag] = value
                    end
					local buttonText = ""
					for i,v in pairs(library.flags[args.flag]) do
						local jig = i ~= #library.flags[args.flag] and "," or ""
						buttonText = buttonText..v..jig
					end
                    if buttonText == "" then buttonText = "..." end
					for i,v in next, holder:GetChildren() do
						if v.ClassName ~= "Frame" then continue end
						v.off.TextColor3 = Color3.new(0.65,0.65,0.65)
						for _i,_v in next, library.flags[args.flag] do
							if v.Name == _v then
								v.off.TextColor3 = Color3.new(1,1,1)
							end
						end
					end
					valuetext.Text = buttonText
					if args.callback then
						args.callback(library.flags[args.flag])
					end
				else
                    if not table.find(library.options[args.flag].values,value) then value = library.options[args.flag].values[1] end
                    library.flags[args.flag] = value
					for i,v in next, holder:GetChildren() do
						if v.ClassName ~= "Frame" then continue end
						v.off.TextColor3 = Color3.new(0.65,0.65,0.65)
                        if v.Name == library.flags[args.flag] then
                            v.off.TextColor3 = Color3.new(1,1,1)
                        end
					end
					frame.Visible = false
                    if library.flags[args.flag] then
                        valuetext.Text = library.flags[args.flag]
                        if args.callback then
                            args.callback(library.flags[args.flag])
                        end
                    end
				end
			end

            function refresh(tbl)
                for i,v in next, holder:GetChildren() do
                    if v.ClassName == "Frame" then
                        v:Destroy()
                    end
					frame.Size = UDim2.new(0, 203, 0, 0)
                end
                for i,v in pairs(tbl) do
                    frame.Size += UDim2.new(0, 0, 0, 20)

                    local option = Instance.new("Frame")
                    local button_2 = Instance.new("TextButton")
                    local text_2 = Instance.new("TextLabel")

                    option.Name = v
                    option.Parent = holder
                    option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    option.BackgroundTransparency = 1.000
                    option.Size = UDim2.new(1, 0, 0, 20)

                    button_2.Name = "button"
                    button_2.Parent = option
                    button_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    button_2.BackgroundTransparency = 0.850
                    button_2.BorderSizePixel = 0
                    button_2.Size = UDim2.new(1, 0, 1, 0)
                    button_2.Font = Enum.Font.SourceSans
                    button_2.Text = ""
                    button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
                    button_2.TextSize = 14.000

                    text_2.Name = "off"
                    text_2.Parent = option
                    text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    text_2.BackgroundTransparency = 1.000
                    text_2.Position = UDim2.new(0, 4, 0, 0)
                    text_2.Size = UDim2.new(0, 0, 1, 0)
                    text_2.Font = Enum.Font.Code
                    text_2.Text = v
                    text_2.TextColor3 = args.multiselect and Color3.new(0.65,0.65,0.65) or Color3.new(1,1,1)
                    text_2.TextSize = 14.000
                    text_2.TextStrokeTransparency = 0.000
                    text_2.TextXAlignment = Enum.TextXAlignment.Left
    
                    button_2.MouseButton1Click:Connect(function()
                        updateValue(v)
                    end)
                end
                library.options[args.flag].values = tbl
                updateValue(table.find(library.options[args.flag].values,library.flags[args.flag]) and library.flags[args.flag] or library.options[args.flag].values[1])
            end

            button.MouseButton1Click:Connect(function()
                if not library.colorpicking then
                    frame.Visible = not frame.Visible
                end
            end)
            button.MouseEnter:connect(function()
                main.BorderColor3 = library.libColor
			end)
			button.MouseLeave:connect(function()
                main.BorderColor3 = Color3.fromRGB(60, 60, 60)
			end)
            
            table.insert(library.toInvis,frame)
            library.flags[args.flag] = args.multiselect and {} or ""
            library.options[args.flag] = {type = "list",changeState = updateValue,values = args.values,refresh = refresh,skipflag = args.skipflag,oldargs = args}

            refresh(args.values)
            updateValue(args.value or not args.multiselect and args.values[1] or "abcdefghijklmnopqrstuwvxyz")
        end
        function group:addConfigbox(args)
            groupbox.Size += UDim2.new(0, 0, 0, 138)
            library.multiZindex -= 1
            
            local list2 = Instance.new("Frame")
            local frame = Instance.new("Frame")
            local main = Instance.new("Frame")
            local holder = Instance.new("ScrollingFrame")
            local UIListLayout = Instance.new("UIListLayout")
            local dwn = Instance.new("ImageLabel")
            local up = Instance.new("ImageLabel")
        
            list2.Name = "list2"
            list2.Parent = grouper
            list2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            list2.BackgroundTransparency = 1.000
            list2.BorderSizePixel = 0
            list2.Position = UDim2.new(0, 0, 0.108108111, 0)
            list2.Size = UDim2.new(1, 0, 0, 138)
            
            frame.Name = "frame"
            frame.Parent = list2
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            frame.BorderSizePixel = 2
            frame.Position = UDim2.new(0.0299999993, -1, 0.0439999998, 0)
            frame.Size = UDim2.new(0, 205, 0, 128)
            
            main.Name = "main"
            main.Parent = frame
            main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            
            holder.Name = "holder"
            holder.Parent = main
            holder.Active = true
            holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            holder.BackgroundTransparency = 1.000
            holder.BorderSizePixel = 0
            holder.Position = UDim2.new(0, 0, 0.00571428565, 0)
            holder.Size = UDim2.new(1, 0, 1, 0)
            holder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            holder.CanvasSize = UDim2.new(0, 0, 0, 0)
            holder.ScrollBarThickness = 0
            holder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
            holder.ScrollingEnabled = true
            holder.ScrollBarImageTransparency = 0
            
            UIListLayout.Parent = holder
            
            dwn.Name = "dwn"
            dwn.Parent = frame
            dwn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            dwn.BackgroundTransparency = 1.000
            dwn.BorderColor3 = Color3.fromRGB(0, 0, 0)
            dwn.BorderSizePixel = 0
            dwn.Position = UDim2.new(0.930000007, 4, 1, -9)
            dwn.Size = UDim2.new(0, 7, 0, 6)
            dwn.ZIndex = 3
            dwn.Image = "rbxassetid://8548723563"
            dwn.Visible = false
            
            up.Name = "up"
            up.Parent = frame
            up.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            up.BackgroundTransparency = 1.000
            up.BorderColor3 = Color3.fromRGB(0, 0, 0)
            up.BorderSizePixel = 0
            up.Position = UDim2.new(0, 3, 0, 3)
            up.Size = UDim2.new(0, 7, 0, 6)
            up.ZIndex = 3
            up.Image = "rbxassetid://8548757311"
            up.Visible = false

            local function updateValue(value)
                if value == nil then return end
                if not table.find(library.options[args.flag].values,value) then value = library.options[args.flag].values[1] end
                library.flags[args.flag] = value
        
                for i,v in next, holder:GetChildren() do
                    if v.ClassName ~= "Frame" then continue end
                    if v.text.Text == library.flags[args.flag] then
                        v.text.TextColor3 = library.libColor
                    else
                        v.text.TextColor3 = Color3.fromRGB(255,255,255)
                    end
                end
                if library.flags[args.flag] then
                    if args.callback then
                        args.callback(library.flags[args.flag])
                    end
                end
                holder.Visible = true
            end
            holder:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                up.Visible = (holder.CanvasPosition.Y > 1)
                dwn.Visible = (holder.CanvasPosition.Y + 1 < (holder.AbsoluteCanvasSize.Y - holder.AbsoluteSize.Y))
            end)
        
        
            function refresh(tbl)
                for i,v in next, holder:GetChildren() do
                    if v.ClassName == "Frame" then
                        v:Destroy()
                    end
                end
                for i,v in pairs(tbl) do
                    local item = Instance.new("Frame")
                    local button = Instance.new("TextButton")
                    local text = Instance.new("TextLabel")
        
                    item.Name = v
                    item.Parent = holder
                    item.Active = true
                    item.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    item.BackgroundTransparency = 1.000
                    item.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    item.BorderSizePixel = 0
                    item.Size = UDim2.new(1, 0, 0, 18)
                    
                    button.Parent = item
                    button.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                    button.BackgroundTransparency = 1
                    button.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    button.BorderSizePixel = 0
                    button.Size = UDim2.new(1, 0, 1, 0)
                    button.Text = ""
                    button.TextTransparency = 1.000
                    
                    text.Name = 'text'
                    text.Parent = item
                    text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    text.BackgroundTransparency = 1.000
                    text.Size = UDim2.new(1, 0, 0, 18)
                    text.Font = Enum.Font.Code
                    text.Text = v
                    text.TextColor3 = Color3.fromRGB(255, 255, 255)
                    text.TextSize = 14.000
                    text.TextStrokeTransparency = 0.000
        
                    button.MouseButton1Click:Connect(function()
                        updateValue(v)
                    end)
                end
        
                holder.Visible = true
                library.options[args.flag].values = tbl
                updateValue(table.find(library.options[args.flag].values,library.flags[args.flag]) and library.flags[args.flag] or library.options[args.flag].values[1])
            end
        
        
            library.flags[args.flag] = ""
            library.options[args.flag] = {type = "cfg",changeState = updateValue,values = args.values,refresh = refresh,skipflag = args.skipflag,oldargs = args}
        
            refresh(args.values)
            updateValue(args.value or not args.multiselect and args.values[1] or "abcdefghijklmnopqrstuwvxyz")
        end
        function group:addColorpicker(args)
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0, 0, 0, 20)
        
            library.multiZindex -= 1
            jigCount -= 1
            topStuff -= 1

            local colorpicker = Instance.new("Frame")
            local back = Instance.new("Frame")
            local mid = Instance.new("Frame")
            local front = Instance.new("Frame")
            local text = Instance.new("TextLabel")
            local colorpicker_2 = Instance.new("Frame")
            local button = Instance.new("TextButton")

            local colorFrame = Instance.new("Frame")
			local colorFrame_2 = Instance.new("Frame")
			local hueframe = Instance.new("Frame")
			local main = Instance.new("Frame")
			local hue = Instance.new("ImageLabel")
			local pickerframe = Instance.new("Frame")
			local main_2 = Instance.new("Frame")
			local picker = Instance.new("ImageLabel")
			local clr = Instance.new("Frame")
			local copy = Instance.new("TextButton")

            colorpicker.Name = "colorpicker"
            colorpicker.Parent = grouper
            colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            colorpicker.BackgroundTransparency = 1.000
            colorpicker.BorderSizePixel = 0
            colorpicker.Size = UDim2.new(1, 0, 0, 20)
            colorpicker.ZIndex = topStuff

            text.Name = "text"
            text.Parent = colorpicker
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 10)
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left

            button.Name = "button"
            button.Parent = colorpicker
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.BorderSizePixel = 0
            button.Size = UDim2.new(1, 0, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000

            colorpicker_2.Name = "colorpicker"
            colorpicker_2.Parent = colorpicker
            colorpicker_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            colorpicker_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            colorpicker_2.BorderSizePixel = 3
            colorpicker_2.Position = UDim2.new(0.860000014, 4, 0.272000015, 0)
            colorpicker_2.Size = UDim2.new(0, 20, 0, 10)

            mid.Name = "mid"
            mid.Parent = colorpicker_2
            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
            mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
            mid.BorderSizePixel = 2
            mid.Size = UDim2.new(1, 0, 1, 0)

            front.Name = "front"
            front.Parent = mid
            front.BackgroundColor3 = Color3.fromRGB(240, 142, 214)
            front.BorderColor3 = Color3.fromRGB(0, 0, 0)
            front.Size = UDim2.new(1, 0, 1, 0)

            button.Name = "button"
            button.Parent = colorpicker
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.Size = UDim2.new(0, 202, 0, 22)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
			button.ZIndex = args.ontop and topStuff or jigCount
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000

			colorFrame.Name = "colorFrame"
			colorFrame.Parent = colorpicker
			colorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			colorFrame.BorderSizePixel = 2
			colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)
			colorFrame.Size = UDim2.new(0, 137, 0, 128)

			colorFrame_2.Name = "colorFrame"
			colorFrame_2.Parent = colorFrame
			colorFrame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
			colorFrame_2.Size = UDim2.new(1, 0, 1, 0)

			hueframe.Name = "hueframe"
			hueframe.Parent = colorFrame_2
            hueframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
            hueframe.BorderSizePixel = 2
            hueframe.Position = UDim2.new(-0.0930000022, 18, -0.0599999987, 30)
            hueframe.Size = UDim2.new(0, 100, 0, 100)

            main.Name = "main"
            main.Parent = hueframe
            main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            main.BorderColor3 = Color3.fromRGB(0, 0, 0)
            main.Size = UDim2.new(0, 100, 0, 100)
            main.ZIndex = 6

            picker.Name = "picker"
            picker.Parent = main
            picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
            picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
            picker.BorderSizePixel = 0
            picker.Size = UDim2.new(0, 100, 0, 100)
            picker.ZIndex = 104
            picker.Image = "rbxassetid://2615689005"

            pickerframe.Name = "pickerframe"
            pickerframe.Parent = colorFrame
            pickerframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
            pickerframe.BorderSizePixel = 2
            pickerframe.Position = UDim2.new(0.711000025, 14, -0.0599999987, 30)
            pickerframe.Size = UDim2.new(0, 20, 0, 100)

            main_2.Name = "main"
            main_2.Parent = pickerframe
            main_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            main_2.Size = UDim2.new(0, 20, 0, 100)
            main_2.ZIndex = 6

            hue.Name = "hue"
            hue.Parent = main_2
            hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
            hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
            hue.BorderSizePixel = 0
            hue.Size = UDim2.new(0, 20, 0, 100)
            hue.ZIndex = 104
            hue.Image = "rbxassetid://2615692420"

            clr.Name = "clr"
            clr.Parent = colorFrame
            clr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            clr.BackgroundTransparency = 1.000
            clr.BorderColor3 = Color3.fromRGB(60, 60, 60)
            clr.BorderSizePixel = 2
            clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
            clr.Size = UDim2.new(0, 129, 0, 14)
            clr.ZIndex = 5

            copy.Name = "copy"
            copy.Parent = clr
            copy.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            copy.BackgroundTransparency = 1.000
            copy.BorderSizePixel = 0
            copy.Size = UDim2.new(0, 129, 0, 14)
            copy.ZIndex = 5
            copy.Font = Enum.Font.SourceSans
            copy.Text = args.text or args.flag
            copy.TextColor3 = Color3.fromRGB(100, 100, 100)
            copy.TextSize = 14.000
            copy.TextStrokeTransparency = 0.000
            
            copy.MouseButton1Click:Connect(function()
                colorFrame.Visible = false
            end)

            button.MouseButton1Click:Connect(function()
				colorFrame.Visible = not colorFrame.Visible
                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
            end)

            button.MouseEnter:connect(function()
                mid.BorderColor3 = library.libColor
            end)
            button.MouseLeave:connect(function()
                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
            end)

            local function updateValue(value,fakevalue)
                if typeof(value) == "table" then value = fakevalue end
                library.flags[args.flag] = value
                front.BackgroundColor3 = value
                if args.callback then
                    args.callback(value)
                end
			end

            local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
            local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
            local heartbeat = game:GetService("RunService").Heartbeat

            local pickerX,pickerY,hueY = 0,0,0
            local oldpercentX,oldpercentY = 0,0

            hue.MouseEnter:Connect(function()
                local input = hue.InputBegan:connect(function(key)
                    if key.UserInputType == Enum.UserInputType.MouseButton1 then
                        while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            library.colorpicking = true
                            local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                            local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                            local startC = colors[math.floor(num)]
                            local endC = colors[math.ceil(num)]
                            local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                            picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                            updateValue(color)
                        end
                        library.colorpicking = false
                    end
                end)
                local leave
                leave = hue.MouseLeave:connect(function()
                    input:disconnect()
                    leave:disconnect()
                end)
            end)

            picker.MouseEnter:Connect(function()
                local input = picker.InputBegan:connect(function(key)
                    if key.UserInputType == Enum.UserInputType.MouseButton1 then
                        while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            library.colorpicking = true
                            local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                            local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                            local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                            updateValue(color)
                            oldpercentX,oldpercentY = xPercent,yPercent
                        end
                        library.colorpicking = false
                    end
                end)
                local leave
                leave = picker.MouseLeave:connect(function()
                    input:disconnect()
                    leave:disconnect()
                end)
            end)

            hue.MouseMoved:connect(function(_, y)
                hueY = y
            end)

            picker.MouseMoved:connect(function(x, y)
                pickerX,pickerY = x,y
            end)

            table.insert(library.toInvis,colorFrame)
            library.flags[args.flag] = Color3.new(1,1,1)
            library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}

            updateValue(args.color or Color3.new(1,1,1))
        end
        function group:addKeybind(args)
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on toggle:keybind") end
            groupbox.Size += UDim2.new(0, 0, 0, 20)
            local next = false
            
            local keybind = Instance.new("Frame")
            local text = Instance.new("TextLabel")
            local button = Instance.new("TextButton")

            keybind.Parent = grouper
            keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            keybind.BackgroundTransparency = 1.000
            keybind.BorderSizePixel = 0
            keybind.Size = UDim2.new(1, 0, 0, 20)
            
            text.Parent = keybind
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 10)
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left
            
            button.Parent = keybind
            button.BackgroundColor3 = Color3.fromRGB(187, 131, 255)
            button.BackgroundTransparency = 1.000
            button.BorderSizePixel = 0
            button.Position = UDim2.new(7.09711117e-08, 0, 0, 0)
            button.Size = UDim2.new(0.978837132, 0, 1, 0)
            button.Font = Enum.Font.Code
            button.Text = "--"
            button.TextColor3 = Color3.fromRGB(155, 155, 155)
            button.TextSize = 13.000
            button.TextStrokeTransparency = 0.000
            button.TextXAlignment = Enum.TextXAlignment.Right

            function updateValue(val)
                if library.colorpicking then return end
                library.flags[args.flag] = val
                button.Text = keyNames[val] or val.Name
            end
            inputService.InputBegan:Connect(function(key)
                local key = key.KeyCode == Enum.KeyCode.Unknown and key.UserInputType or key.KeyCode
                if next then
                    if not table.find(library.blacklisted,key) then
                        next = false
                        library.flags[args.flag] = key
                        button.Text = keyNames[key] or key.Name
                        button.TextColor3 = Color3.fromRGB(155, 155, 155)
                    end
                end
                if not next and key == library.flags[args.flag] and args.callback then
                    args.callback()
                end
            end)

            button.MouseButton1Click:Connect(function()
                if library.colorpicking then return end
                library.flags[args.flag] = Enum.KeyCode.Unknown
                button.Text = "..."
                button.TextColor3 = Color3.new(0.2,0.2,0.2)
                next = true
            end)

            library.flags[args.flag] = Enum.KeyCode.Unknown
            library.options[args.flag] = {type = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}

            updateValue(args.key or Enum.KeyCode.Unknown)
        end
        return group, groupbox
    end
    return tab
end

function contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end


function library:createConfig()
    local name = library.flags["config_name"]

    -- Ensure folder exists
    if not isfolder("kukware") then
        makefolder("kukware")
    end

    if contains(library.options["selected_config"].values, name) then 
        return library:notify(name..".cfg already exists!") 
    end
    if name == "" then 
        return library:notify("Put a name goofy") 
    end

    local jig = {}
    for i,v in next, library.flags do
        if library.options[i].skipflag then continue end
        if typeof(v) == "Color3" then
            jig[i] = {v.R,v.G,v.B}
        elseif typeof(v) == "EnumItem" then
            jig[i] = {string.split(tostring(v),".")[2],string.split(tostring(v),".")[3]}
        else
            jig[i] = v
        end
    end

    writefile("kukware/"..name..".cfg",game:GetService("HttpService"):JSONEncode(jig))
    library:notify("Succesfully created config "..name..".cfg!")
    library:refreshConfigs()
end


function library:saveConfig()
    local name = library.flags["selected_config"]
    local jig = {}
    for i,v in next, library.flags do
        if library.options[i].skipflag then continue end
        if typeof(v) == "Color3" then
            jig[i] = {v.R,v.G,v.B}
        elseif typeof(v) == "EnumItem" then
            jig[i] = {string.split(tostring(v),".")[2],string.split(tostring(v),".")[3]}
        else
            jig[i] = v
        end
    end
    writefile("kukware/"..name..".cfg",game:GetService("HttpService"):JSONEncode(jig))
    library:notify("Succesfully updated config "..name..".cfg!")
    library:refreshConfigs()
end

function library:loadConfig()
    local name = library.flags["selected_config"]
    if not isfile("kukware/"..name..".cfg") then
        library:notify("Config file not found!")
        return
    end

    local config = game:GetService("HttpService"):JSONDecode(readfile("kukware/"..name..".cfg"))

    for i,v in next, library.options do
        if i ~= "selected_config" then 
            spawn(function()
                pcall(function()
                    if config[i] then
                        if v.type == "colorpicker" then
                            v.changeState(Color3.new(config[i][1],config[i][2],config[i][3]))
                        elseif v.type == "keybind" then
                            v.changeState(Enum[config[i][1]][config[i][2]])
                        else
                            if config[i] ~= library.flags[i] then
                                v.changeState(config[i])
                            end
                        end
                    else
                        if v.type == "toggle" then
                            v.changeState(false)
                        elseif v.type == "slider" then
                            v.changeState(v.args.value or 0)
                        elseif v.type == "textbox" or v.type == "list" or v.type == "cfg" then
                            v.changeState(v.args.value or v.args.text or "")
                        elseif v.type == "colorpicker" then
                            v.changeState(v.args.color or Color3.new(1,1,1))
                        elseif v.type == "keybind" then
                            v.changeState(v.args.key or Enum.KeyCode.Unknown)
                        end
                    end
                end)
            end)
        end
    end

    library:notify("Succesfully loaded config "..name..".cfg!")
end


function library:refreshConfigs()
    local tbl = {}
    for i,v in next, listfiles("kukware") do
        local filename = string.match(v, "[^/\\]+$")        
        filename = string.gsub(filename, "%.cfg$", "")     
        table.insert(tbl, filename)
    end
    library.options["selected_config"].refresh(tbl)
end


function library:deleteConfig()
    if isfile("kukware/"..library.flags["selected_config"]..".cfg") then
        delfile("kukware/"..library.flags["selected_config"]..".cfg")
        library:refreshConfigs()
    end
end

local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local plrs = game:GetService("Players")
local ws = game:GetService("Workspace")
local plr = plrs.LocalPlayer

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local InputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Gui = game:GetService("GuiService")

local load = tick()
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = Workspace.CurrentCamera
local MapLightingJmp = Instance.new("ColorCorrectionEffect")
local Mouse = LocalPlayer:GetMouse()
local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, InputService:GetPlatform())
local Connections = {}
local Flags = {}

do 
    Flags.ESPBox       = false;
    Flags.ESPName      = false;
    Flags.ESPWeapon    = false;
    Flags.ESPAmmo      = false;
    Flags.ESPHealth    = false;
    Flags.ESPHealthbar = false;
    Flags.ESPHighlight = false;
    Flags.StaffDetect = false;

    Flags.HighlightFillTransparency = 1;
    Flags.HighlightOutlineTransparency = 0;
    Flags.HighlightFillColor    = Color3.fromRGB(100, 95, 192);
    Flags.HighlightOutlineColor = Color3.fromRGB(255, 255, 255);

    Flags.BoxColor     = Color3.fromRGB(100, 95, 192);
    Flags.TextColor    = Color3.fromRGB(255, 255, 255);
    Flags.VestColor    = Color3.fromRGB(100, 95, 192);
    Flags.ReloadColor  = Color3.fromRGB(100, 95, 192);
    Flags.HealthHigher = Color3.fromRGB(0, 255, 0);
    Flags.HealthLower  = Color3.fromRGB(255, 0, 0);
end;

local Circle = Drawing.new("Circle")
Circle.Radius = silent.fov.size * 3
Circle.Visible = silent.fov.visible
Circle.Color = Color3.new(1,1,1)
Circle.Thickness = 1
Circle.NumSides = 25

function get_pred()
    local PingStats = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local Value = tostring(PingStats)
    local PingValue = Value:split(" ")
    local PingNumber = tonumber(PingValue[1])
    return tonumber(PingNumber / 225 * 0.1 + 0.1)
end

CheckDistance = function(Player)
    if (Player.Character:FindFirstChild("HumanoidRootPart").Position - game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > silent.dist then 
        return true
    else
        return false
    end
end

OnScreen = function(Object)
    local _, screen = CurrentCamera:WorldToScreenPoint(Object.Position)
    return screen
end

WTS = function(Object)
	local ObjectVector = CurrentCamera:WorldToScreenPoint(Object.Position)
	return v2.new(ObjectVector.X, ObjectVector.Y)
end


FilterObjs = function(Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end


RayCastCheck = function(Part, PartDescendant)
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded.Wait(LocalPlayer.CharacterAdded)
    local Origin = CurrentCamera.CFrame.Position

    local RayCastParams = RaycastParams.new()
    RayCastParams.FilterType = Enum.RaycastFilterType.Blacklist
    RayCastParams.FilterDescendantsInstances = {Character, CurrentCamera}

    local Result = Workspace.Raycast(Workspace, Origin, Part.Position - Origin, RayCastParams)
    
    if (Result) then
        local PartHit = Result.Instance
        local Visible = (not PartHit or Instance.new("Part").IsDescendantOf(PartHit, PartDescendant))
        
        return Visible
    end
    return false
end

GetMagnitudeFromMouse = function(Part)
    local PartPos, OnScreen = CurrentCamera:WorldToScreenPoint(Part.Position)
    if OnScreen then
        local Magnitude = (Vector2.new(PartPos.X, PartPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
        return Magnitude
    end
    return math.huge
end

local tags = {
        34531592,   -- [X]
        35474227,   -- [<3]
        481483834,  -- [:3]
        34423896,   -- [092]
        112358282,  -- [TML]
        909775996,  -- [YAU]
        94195597,   -- [CHEAT]
        445673563, -- [OKEN]
        1018619654, -- [SILLY]
        975405103,  -- [PAWS]
        35423131,   -- [MERCY]
        429397710,  -- [KITTEN]
        1051841454, -- [MEOW]
        35733646,   -- [TERROR]
        34733738,   -- [RR]
        35692393,    -- [RICH]
        35953799,    -- [PRETTY]
        1015469631    -- [1887
}

GetClosestPlayer = function()
    local Target = nil
    local Closest = math.huge

    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v ~= LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart") then

            if silent.whitelistEnabled then
                local toggleFlag = "player_" .. v.UserId
                if Flags[toggleFlag] then
                    continue 
                end
            end

            if silent.CrewCheck then
                local inBlockedGroup = false
                for _, groupId in pairs(tags) do
                    if v:IsInGroup(groupId) then
                        inBlockedGroup = true
                        break
                    end
                end
                if inBlockedGroup then
                    continue
                end
            end

            local humanoid = v.Character:FindFirstChildOfClass("Humanoid")
            if not humanoid then 
                continue 
            end

            if not OnScreen(v.Character.HumanoidRootPart) then 
                continue 
            end

            if silent.visible and not RayCastCheck(v.Character.HumanoidRootPart, v.Character) then 
                continue 
            end

            if silent.friend and LocalPlayer:IsFriendsWith(v.UserId) then
                continue
            end

            if silent.HealthCheck and v:FindFirstChild("isKnocked") and v.isKnocked.Value then
               continue
            end

            if silent.distance and CheckDistance(v) then
                continue
            end

            local Distance = GetMagnitudeFromMouse(v.Character.HumanoidRootPart)
            if (Distance < Closest and silent.fov.size * 3 + Distance * 0.3 > Distance) then
                Closest = Distance
                Target = v
            end
        end
    end

    silent.target = Target
end





local function MainEvent()
    for _, v in pairs(game.ReplicatedStorage:GetChildren()) do
        if v.Name == "MainEvent" or v.Name == "Bullets" or v.Name == ".gg/untitledhood" or v.Name == "Remote" or v.Name == "MAINEVENT" then
            return v
        end
    end
end

GetClosestBodyPart = function()
    local character = silent.target.Character
    local ClosestDistance = 1 / 0
    local BodyPart = nil
    if (character and character:GetChildren()) then
        for _, x in next, character:GetChildren() do
            if FilterObjs(x) and OnScreen(x) then
                local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                    if (Distance < ClosestDistance) then
                        ClosestDistance = Distance
                        BodyPart = x
                    end
            end
        end
    end
    silent.part = tostring(BodyPart)
end


function GetClosestPointOfPart(Part)
    local mouseray = Mouse.UnitRay
    mouseray = mouseray.Origin + (mouseray.Direction * (Part.Position - mouseray.Origin).Magnitude)
    local point =
        (mouseray.Y >= (Part.Position - Part.Size / 2).Y and mouseray.Y <= (Part.Position + Part.Size / 2).Y) and
            (Part.Position + Vector3.new(0, -Part.Position.Y + mouseray.Y, 0)) or Part.Position
    local check = RaycastParams.new()
    check.FilterType = Enum.RaycastFilterType.Whitelist
    check.FilterDescendantsInstances = {Part}
    local ray = game:GetService("Workspace"):Raycast(mouseray, (point - mouseray), check)
    if ray then
        return ray.Position
    else
        return Mouse.Hit.Position
    end
end

do 

    Utility.WDown = false;
    Utility.ADown = false;
    Utility.SDown = false;
    Utility.DDown = false;

    function Utility:Tween(...)
        local NewTween = game:GetService("TweenService"):Create(...)
        NewTween:Play();
        return NewTween;
    end;


    function Utility:FindPlayer(Player)
        Player = Player:lower();
        local FoundPlayers = {};
        for Index, Value in next, Players:GetPlayers() do 
            if Value and Value ~= Client then 
                local Name = Value.Name:lower();
                local DisplayName = Value.DisplayName:lower(); 
                if Name == Player then 
                    table.insert(FoundPlayers, Value);
                    break;
                end;
                    
                if string.sub(Name, 1, #Player) == Player or string.sub(DisplayName, 1, #Player) == Player then 
                    table.insert(FoundPlayers, Value);
                end;
            end;
        end
            
        return FoundPlayers;
    end;

    function Utility:FireAimlock()
        local Tool = Client.Character:FindFirstChildOfClass("Tool");
        if Tool and Tool:FindFirstChild("Shoot") then 
            local Target = Utility.AimlockTarget.Character;
            local Part = Target:FindFirstChild(Flags.AimPart);
            local AimAt = nil;

            if Part then
                local Velocity = Part.Velocity;
                if Flags.YPrediction == false then 
                    Velocity = Vector3.new(Velocity.X, 0, Velocity.Z);
                end;

                if Flags.AimlockMode == "default" or Flags.AimlockMode == "velocity" then 
                    AimAt = Part.CFrame + Velocity / Flags.AimVelocity + Velocity / math.huge
                end;

                if Flags.AimlockMode == "movedirection" then 
                    Velocity = Part:GetAttribute("CalculatedVelocity");
                    if not Velocity then 
                        Velocity = Vector.new(0, 0, 0);
                    end;

                    if Flags.YPrediction == false then 
                        Velocity = Vector3.new(Velocity.X, 0, Velocity.Z);
                    end;

                    local Humanoid = Target:FindFirstChildOfClass("Humanoid");
                    local MoveDirection = Humanoid.MoveDirection;
                    
                    if MoveDirection.Magnitude ~= 0 then 
                        AimAt = Part.CFrame + Humanoid.MoveDirection * (Velocity.Unit + Vector3.new(Ping / 1000, Ping / 1000, Ping / 1000))
                    else 
                        AimAt = Part.CFrame;
                    end;
                end;

                Tool.Shoot:FireServer(AimAt);
            end;
        end;
    end;

 
    
    function Utility:CharacterAdded()
        repeat task.wait() until Client.Character;
        local Humanoid = Client.Character:WaitForChild("Humanoid");
        repeat wait() until Humanoid ~= nil;
        
    end;
end;
do 
    PlayerFunctions.__index = PlayerFunctions;
    function PlayerFunctions:GetCharacter()
        local Character = self.Player.Character;

        return Character;
    end;

    function PlayerFunctions:CheckGamepass(ID)
        return MarketplaceService:UserOwnsGamePassAsync(self.Player.UserId, ID)
    end;

    function PlayerFunctions:GetRoot()
        local Character = self:GetCharacter();
        if Character then
            if Character:FindFirstChild("HumanoidRootPart") then 
                return Character:FindFirstChild("HumanoidRootPart");
            end

            if Character:FindFirstChild("Torso") then 
                return Character:FindFirstChild("Torso");
            end;

            return Character.PrimaryPart;
        end;
        return nil;
    end;

    function PlayerFunctions:GetDistance()
        local Character = self:GetCharacter();
        if Character then 
            local Root = self:GetRoot();

            if Root then 
                return math.floor((Camera.CFrame.p - Root.CFrame.p).Magnitude);
            end;
        end;
        return 0;
    end;

    function PlayerFunctions:GetName()
        return self.Player.Name;
    end;

    function PlayerFunctions:GetWeapon()
        local Character = self:GetCharacter();
        if Character then 
            local Tool = Character:FindFirstChildOfClass("Tool");
            if Tool then 
                return Tool, Tool.Name;
            end;
        end;

        return nil, "None"
    end;

    function PlayerFunctions:GetHealth()
        local Character = self:GetCharacter();
        if Character and Character:FindFirstChildOfClass("Humanoid") then 
            return Character:FindFirstChildOfClass("Humanoid").Health, Character:FindFirstChildOfClass("Humanoid").MaxHealth;
        end;
        return 0, 100
    end;

function PlayerFunctions:GetAmmo()
    local Character = self:GetCharacter()
    if not Character then
        return 0
    end

    local Tool = self:GetWeapon()
    if not Tool then
        return 0
    end

    local Ammo = Tool:FindFirstChild("AMMO") or Tool:FindFirstChild("Ammo")
    if Ammo and Ammo:IsA("ValueBase") then
        return Ammo.Value
    end

    return 0
end


    function PlayerFunctions:GetBoundingBox()
        local Root = self:GetRoot();

		local BoxInfo = {};
		local RootPos, IsOnScreen = Camera:WorldToViewportPoint(Root.Position);

		local SF = 1 / (RootPos.Z * math.tan(math.rad(Camera.FieldOfView / 2)) * 2) * 1000; 
		local Width = 4 * SF;
		local Height = 7 * SF;

		BoxInfo.Width = Width;
		BoxInfo.Height = Height;

		local Size, Pos = VisualsModule:FloorVector(Vector2.new(math.max(Width, 7), math.max(Height, 12))), VisualsModule:FloorVector(Vector2.new(RootPos.X - Width / 2, (RootPos.Y - 1) - Height / 2));
		local Center = Vector2.new(Pos.X + Size.X / 2, Pos.Y + Size.Y / 2);

		BoxInfo.BoxSize = Size;
		BoxInfo.BoxPos = Pos;
		BoxInfo.Center = Center;
		BoxInfo.IsOnScreen = IsOnScreen;

		return BoxInfo;
    end;

    function PlayerFunctions:SetInvisible()
        local Components = self.Components;

        if Components.Name then 
            Components.Name.Visible      = false;
            Components.Reloading.Visible = false;
            Components.Weapon.Visible    = false;
            Components.Ammo.Visible      = false;
            Components.Distance.Visible  = false;
            Components.Health.Visible    = false;
            Components.Vest.Visible      = false;

            Components.Box.Visible        = false;
            Components.BoxOutline.Visible = false;

            Components.HealthbarOutline.Visible = false;
            Components.Healthbar.Visible        = false;
        end;
    end;


function PlayerFunctions:Update()
    local Character = self:GetCharacter() 
    local Player    = self.Player

    local toggleFlag = "player_" .. Player.UserId
    if Flags[toggleFlag] then
        self:SetInvisible()
        if self.Highlight then
            self.Highlight.Enabled = false
            self.Highlight.Adornee = nil
        end
        return
    end

    local function HideESP()
        self:SetInvisible()
        if self.Highlight then
            self.Highlight.Enabled = false
            self.Highlight.Adornee = nil
        end
    end

self.CrewCache = self.CrewCache or {}
if silent.CrewCheck then
    if self.CrewCache[Player.UserId] == nil then
        local isInCrew = false
        for _, groupId in pairs(tags) do
            local ok, isIn = pcall(Player.IsInGroup, Player, groupId)
            if ok and isIn then
                isInCrew = true
                break
            end
        end
        self.CrewCache[Player.UserId] = isInCrew
    end
    if self.CrewCache[Player.UserId] then
        HideESP()
        return
    end
end


if silent.HealthCheck and Character then
    local knocked = Character:FindFirstChild("isKnocked")
    if knocked and knocked:IsA("BoolValue") and knocked.Value then
        HideESP()
        return
    end
end


self.FriendCache = self.FriendCache or {}
if silent.friend then
    if self.FriendCache[Player.UserId] == nil then
        self.FriendCache[Player.UserId] = LocalPlayer:IsFriendsWith(Player.UserId)
    end
    if self.FriendCache[Player.UserId] then
        HideESP()
        return
    end
end



    local Components = self.Components
    local Highlight  = self.Highlight

    local Box        = Components.Box
    local BoxOutline = Components.BoxOutline
    local Name       = Components.Name
    local Distance   = Components.Distance
    local Health     = Components.Health
    local Reloading  = Components.Reloading
    local Weapon     = Components.Weapon
    local Ammo       = Components.Ammo
    local Vest       = Components.Vest
    local Healthbar        = Components.Healthbar
    local HealthbarOutline = Components.HealthbarOutline

    if Character and Character:FindFirstChildOfClass("Humanoid") and self:GetRoot() then 
        local PlayerName   = Player.DisplayName
        local CurrentAmmo  = self:GetAmmo()
        local Magnitude    = self:GetDistance()
        local Root         = self:GetRoot()
        local BoxInfo      = self:GetBoundingBox()
        local PlayerWeapon, WeaponName = self:GetWeapon()
        local CurrentHealth, MaxHealth = self:GetHealth()

        local BoxSize, BoxPosition, BoxCenter, IsOnScreen = BoxInfo.BoxSize, BoxInfo.BoxPos, BoxInfo.BoxCenter, BoxInfo.IsOnScreen

        local TopOffset    = VisualsModule:FloorVector(Vector2.new(BoxSize.X / 2 + BoxPosition.X, BoxPosition.Y - 16))
        local BottomOffset = VisualsModule:FloorVector(Vector2.new(BoxSize.X / 2 + BoxPosition.X, BoxSize.Y + BoxPosition.Y + 1))
        local RightOffset  = Vector2.new(BoxPosition.X + BoxSize.X + 8, BoxPosition.Y - 1)
        local LeftOffset   = Vector2.new(BoxPosition.X - 28, (BoxPosition.Y + BoxSize.Y) -1 * BoxSize.Y)

        local TopBounds, LeftBounds, BottomBounds, RightBounds = 0, 0, 0, 0

        if Root and IsOnScreen and Box then 
            -- Box
            if Flags.ESPBox then 
                BoxOutline.Visible  = true
                BoxOutline.Position = BoxPosition
                BoxOutline.Size     = BoxSize

                Box.Color    = Flags.BoxColor
                Box.Visible  = true
                Box.Size     = BoxSize
                Box.Position = BoxPosition
            else 
                Box.Visible = false
                BoxOutline.Visible = false
            end

            -- Text overlays
            if Flags.ESPName then 
                Name.Visible  = true
                Name.Text     = PlayerName
                Name.Position = TopOffset + Vector2.new(0, TopBounds)
                Name.Color    = Flags.TextColor
                TopBounds = TopBounds - 14
            else 
                Name.Visible = false
            end

            if Flags.ESPWeapon then 
                if Weapon then
                    Weapon.Visible  = true
                    Weapon.Text     = WeaponName
                    Weapon.Position = BottomOffset + Vector2.new(0, BottomBounds)
                    Weapon.Color    = Flags.TextColor
                    BottomBounds = BottomBounds + 14
                else 
                    Weapon.Visible = false
                end
            else 
                Weapon.Visible = false
            end

            if Flags.ESPAmmo then 
                Ammo.Position = BottomOffset + Vector2.new(0, BottomBounds)
                Ammo.Text     = "Ammo: " .. tostring(CurrentAmmo)
                Ammo.Visible  = true
                Ammo.Color    = Flags.TextColor
                BottomBounds = BottomBounds + 14
            else 
                Ammo.Visible = false
            end

            if Flags.ESPHealth then 
                Health.Text     = tostring(math.floor(CurrentHealth))
                Health.Position = LeftOffset + Vector2.new(0, LeftBounds)
                Health.Visible  = true
                LeftBounds = LeftBounds + 14
            else 
                Health.Visible = false
            end

            -- Healthbar
            if Flags.ESPHealthbar then 
                local From = Vector2.new(BoxPosition.X - 5, BoxPosition.Y + BoxSize.Y)
                local To   = Vector2.new(From.X, From.Y - (CurrentHealth / MaxHealth) * BoxSize.Y)

                Healthbar.Color = Flags.HealthLower:lerp(Flags.HealthHigher, CurrentHealth / MaxHealth)
                Healthbar.Visible        = true
                HealthbarOutline.Visible = true
                Healthbar.From = From
                Healthbar.To   = To
                HealthbarOutline.From = Vector2.new(From.X, BoxPosition.Y + BoxSize.Y) + Vector2.new(0, 1)
                HealthbarOutline.To   = Vector2.new(From.X, From.Y - 1 * BoxSize.Y) + Vector2.new(0, -1)
            else 
                Healthbar.Visible = false
                HealthbarOutline.Visible = false
            end

            -- Highlight
            if Flags.ESPHighlight then 
                Highlight.FillTransparency    = Flags.HighlightFillTransparency
                Highlight.OutlineTransparency = Flags.HighlightOutlineTransparency
                Highlight.OutlineColor        = Flags.HighlightOutlineColor
                Highlight.FillColor           = Flags.HighlightFillColor
                Highlight.Adornee = Character
                Highlight.Enabled = true
            else 
                Highlight.Enabled = false
            end
        else 
            HideESP()
        end
    else 
        HideESP()
    end
end
end




--autoreload
if not Auto then Auto = {} end
Auto.Reload = Flags.AutoReload or false

Players = game:GetService("Players")
VirtualInputManager = game:GetService("VirtualInputManager")
player = Players.LocalPlayer
char = player.Character or player.CharacterAdded:Wait()
currentTool = nil

blacklist = {
    "wip mask","katana","[Taco]","[Popcorn]","[Chicken]",
    "[Burger]","[Pizza]","[Bloxy Cola]","[Donut]","spray"
}

function isBlacklisted(tool)
    for _, n in ipairs(blacklist) do
        if string.lower(tool.Name) == string.lower(n) then
            return true
        end
    end
    return false
end

function checkTool(tool)
    if isBlacklisted(tool) then return end
    ammo = tool:FindFirstChild("AMMO")
    if not ammo then return end

    if Auto.Reload and ammo.Value == 0 then
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.R, false, game)
        task.wait()
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.R, false, game)
    end

    ammo:GetPropertyChangedSignal("Value"):Connect(function()
        if Auto.Reload and ammo.Value == 0 then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.R, false, game)
            task.wait()
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.R, false, game)
        end
    end)
end

function monitorCharacter(c)
    char = c
    char.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            currentTool = child
            if Auto.Reload then
                checkTool(child)
            end
        end
    end)

    char.ChildRemoved:Connect(function(child)
        if child == currentTool then
            currentTool = nil
        end
    end)

    for _, child in ipairs(char:GetChildren()) do
        if child:IsA("Tool") then
            currentTool = child
            if Auto.Reload then
                checkTool(child)
            end
        end
    end
end

monitorCharacter(char)
player.CharacterAdded:Connect(monitorCharacter)

spawn(function()
    while true do
        Auto.Reload = Flags.AutoReload
        task.wait(0.1)
    end
end)


if not anti then anti = {} end

local antiEnabled = true 

local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if anti.Keybindbenabled and anti.keybindlol and input.KeyCode == anti.keybindlol and antiEnabled then
            Flags.AntiLock = not Flags.AntiLock
        end
    end
end)



if not anti then anti = {} end

local RunService = game:GetService("RunService")
local LocalPlr = game:GetService("Players").LocalPlayer

spawn(function()
    while true do
        task.wait()
        if LocalPlr.Character and LocalPlr.Character:FindFirstChild("HumanoidRootPart") then
            local RootPart = LocalPlr.Character.HumanoidRootPart
            local Velocity, Cframe = RootPart.AssemblyLinearVelocity, RootPart.CFrame

            if Flags.AntiLock then
                if anti.mode == "Prediction Multiplier" then
                    RootPart.AssemblyLinearVelocity = Velocity * 7
                    RunService.RenderStepped:Wait()
                    RootPart.AssemblyLinearVelocity = Velocity
                elseif anti.mode == "Prediction Reverser" then
                    RootPart.CFrame = Cframe - LocalPlr.Character.Humanoid.MoveDirection * 0.5
                elseif anti.mode == "Prediction Tripler" then
                    RootPart.AssemblyLinearVelocity = Velocity * 3
                    RunService.RenderStepped:Wait()
                    RootPart.AssemblyLinearVelocity = Velocity
                elseif anti.mode == "Sky" then
                    RootPart.AssemblyLinearVelocity = Vector3.new(0, 9e9, 0)
                    RunService.RenderStepped:Wait()
                    RootPart.AssemblyLinearVelocity = Velocity
                elseif anti.mode == "Floor" then
                    RootPart.AssemblyLinearVelocity = Vector3.new(0, -9e9, 0)
                    RunService.RenderStepped:Wait()
                    RootPart.AssemblyLinearVelocity = Velocity
                end
            else
                RootPart.AssemblyLinearVelocity = Velocity
                RootPart.CFrame = Cframe
            end
        end
    end
end)






spawn(function()
    local SpeedConnection

    while true do
        if Flags.SpeedH then
            if not SpeedConnection then
                SpeedConnection = game:GetService("RunService").Stepped:Connect(function(_, deltaTime)
                    local plr = game:GetService("Players").LocalPlayer
                    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") then
                        local humanoid = plr.Character.Humanoid
                        local hrp = plr.Character.HumanoidRootPart
                        local moveDir = humanoid.MoveDirection
                        if moveDir.Magnitude > 0 then
                            local speed = Flags.SpeedAmount or humanoid.WalkSpeed
                            hrp.CFrame = hrp.CFrame + moveDir * speed * deltaTime
                        end
                    end
                end)
            end
        else
            if SpeedConnection then
                SpeedConnection:Disconnect()
                SpeedConnection = nil
            end
        end
        wait(0.05)
    end
end)




if not silent then silent = {} end

local silentEnabled = false 

local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if silent.keybindenabled and silent.keybindlol and input.KeyCode == silent.keybindlol and silentEnabled then
            silent.on = not silent.on
        end
    end
end)


if not speedhack then speedhack = {} end

local speedEnabled = false

local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if speedhack.keybindenabled and speedhack.keybindlol and input.KeyCode == speedhack.keybindlol and speedEnabled then
            Flags.SpeedH = not Flags.SpeedH
        end
    end
end)






local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Shotguns = {["tactical sg"] = true, ["sg"] = true, ["db"] = true}
local Handguns = {["rev"] = true, ["usp"] = true, ["silencer"] = true}

local function updateFOV()
    if not Flags.CustomGunFovs then return end
    local character = LocalPlayer.Character
    if not character then return end
    local tool = character:FindFirstChildOfClass("Tool")
    if not tool then return end
    local gunName = tool.Name:lower()
    if Shotguns[gunName] then
        silent.fov.size = Flags.ShotGunsFov
    elseif Handguns[gunName] then
        silent.fov.size = Flags.HandGunsFov
    end
end

game:GetService("RunService").RenderStepped:Connect(updateFOV)





--autostomplolxd
if not Auto then Auto = {} end

spawn(function()
    while true do
        if Flags.AutoStomp then
            if not Auto.Stomp then
                Auto.Stomp = true
                Auto._StompConnection = game:GetService("RunService").Stepped:Connect(function()
                    game:GetService("ReplicatedStorage").MAINEVENT:FireServer("STOMP")
                end)
            end
        else
            if Auto.Stomp then
                Auto.Stomp = false
                if Auto._StompConnection then
                    Auto._StompConnection:Disconnect()
                    Auto._StompConnection = nil
                end
            end
        end
        wait(0.05)
    end
end)

if not Jump then Jump = {} end

spawn(function()
    while true do
        if Flags.NoJumpCooldown then
            if not Jump.Enabled then
                Jump.Enabled = true
                Jump.Connection = game:GetService("RunService").Stepped:Connect(function()
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("Humanoid") then
                        char.Humanoid.UseJumpPower = false
                    end
                end)
            end
        else
            if Jump.Enabled then
                Jump.Enabled = false
                if Jump.Connection then
                    Jump.Connection:Disconnect()
                    Jump.Connection = nil
                end
            end
        end
        task.wait(0.05)
    end
end)






--staffdetect
if not Staff then Staff = {} end

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local localPlayer = Players.LocalPlayer

local function gethead(id)
    local ok, img = pcall(function()
        return Players:GetUserThumbnailAsync(
            id,
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size420x420
        )
    end)
    return ok and img or "rbxassetid://15059364356"
end

local function notify(plr, msg)
    StarterGui:SetCore("SendNotification", {
        Title = plr.DisplayName,
        Text = plr.Name .. " " .. msg,
        Icon = gethead(plr.UserId),
        Duration = 8
    })
end

local function IsStaff(plr)
    if table.find({6203233210, 555909464, 350124454, 5637396}, plr.UserId) then
        return true
    end
    local ok, res = pcall(function()
        return plr:IsInGroup(693335996)
    end)
    return ok and res
end

local addedConn, removingConn
spawn(function()
    local notified = {}

    while true do
        if Flags.StaffDetect then
            if not Staff.Detect then
                Staff.Detect = true

                if not notified[localPlayer.UserId] then
                    notify(localPlayer, "joined the server")
                    notified[localPlayer.UserId] = true
                end

                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= localPlayer and IsStaff(plr) and not notified[plr.UserId] then
                        notify(plr, "joined the server")
                        notified[plr.UserId] = true
                    end
                end

                addedConn = Players.PlayerAdded:Connect(function(plr)
                    if IsStaff(plr) and not notified[plr.UserId] then
                        notify(plr, "joined the server")
                        notified[plr.UserId] = true
                    end
                end)

                removingConn = Players.PlayerRemoving:Connect(function(plr)
                    if IsStaff(plr) and notified[plr.UserId] then
                        notify(plr, "left the server")
                        notified[plr.UserId] = nil
                    end
                end)
            end
        else
            if Staff.Detect then
                Staff.Detect = false
                if addedConn then addedConn:Disconnect() addedConn = nil end
                if removingConn then removingConn:Disconnect() removingConn = nil end
                notified = {}
            end
        end
        wait(0.5)
    end
end)













if not autok then autok = {} end
if not autok.keybind then autok.keybind = Enum.KeyCode.G end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

LocalPlayer.CharacterAdded:Connect(function(char)
    character = char
    rootPart = character:WaitForChild("HumanoidRootPart")
    humanoid = character:WaitForChild("Humanoid")
    equippedWeapon = nil
end)

local following = false
local targetPlayer = nil
local belowOffset = 3
local behindDistance = 1.5
local leftOffset = 1
local insideArm = false
local weaponName = "katana"
local equippedWeapon = nil

local function findPlayerByPartial(name)
    if not name or name == "" then return nil end
    name = name:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Name:lower():find(name, 1, true) then
            return plr
        end
    end
    return nil
end

UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == autok.keybind then
        following = not following
        if following then
            local inputName = library.flags.Target_Username
            targetPlayer = findPlayerByPartial(inputName)
            if not targetPlayer then
                following = false
                return
            end
        else
            targetPlayer = nil
            insideArm = false
            equippedWeapon = nil
        end
    end
end)

local function equipKatana()
    local tool = character:FindFirstChild(weaponName)
    if not tool then
        local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
        if backpack then
            tool = backpack:FindFirstChild(weaponName)
        end
    end
    if tool and tool.Parent ~= character then
        tool.Parent = character
    end
    if tool then
        humanoid:EquipTool(tool)
        equippedWeapon = tool
    end
end

spawn(function()
    while true do
        task.wait(0.1)
        if following and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.Health > 0 then
            equipKatana()
            pcall(function()
                mouse1click()
            end)
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if not following or not targetPlayer then return end

    local targetChar = targetPlayer.Character
    if not targetChar then insideArm = false return end

    local targetHum = targetChar:FindFirstChild("Humanoid")
    local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHum or not targetRoot then insideArm = false return end

    local targetArm = targetChar:FindFirstChild("Right Arm") 
        or targetChar:FindFirstChild("RightUpperArm") 
        or targetChar:FindFirstChild("RightHand")
    if not targetArm then insideArm = false return end

    if targetHum.Health <= 2 then
        insideArm = true
    elseif targetHum.Health >= targetHum.MaxHealth then
        insideArm = false
    end

    if insideArm then
        rootPart.CFrame = targetArm.CFrame
    else
        local lookVector = targetRoot.CFrame.LookVector
        local rightVector = targetRoot.CFrame.RightVector * -leftOffset
        local desiredPos = targetRoot.Position - lookVector * behindDistance - Vector3.new(0, belowOffset, 0) + rightVector
        rootPart.CFrame = CFrame.new(desiredPos, desiredPos + lookVector)
    end
end)







spawn(function()
    while true do
        if Flags.AutoArmor then
            local character = game.Players.LocalPlayer.Character
            local armor = character and character:GetAttribute("Armor") or 0

            if armor < 150 then
                local armorNames = {
                    "[High-Medium Armor]",
                    "[Medium Armor]"
                }

                for _, armorType in ipairs(armorNames) do
                    for _, obj in ipairs(workspace:GetDescendants()) do
                        if obj.Name == armorType and (obj:IsA("Model") or obj:IsA("Part")) then
                            local cd = obj:FindFirstChildOfClass("ClickDetector")
                            if cd then
                                fireclickdetector(cd)
                            end
                        end
                    end
                end
            end
        end

        task.wait(0.05)
    end
end)





local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local watchedHumanoids = {}

local function isActuallyKnocked(hum)
    return hum.PlatformStand == true or hum.Health <= 0
end

local function setupKnockFlag(parent, name)
    local flag = parent:FindFirstChild("isKnocked")
    if not flag then
        flag = Instance.new("BoolValue")
        flag.Name = "isKnocked"
        flag.Value = false
        flag.Parent = parent
    else
        flag.Value = false
    end
    return flag
end

local function watchHumanoid(hum, parent, name)
    if watchedHumanoids[hum] then return end
    watchedHumanoids[hum] = true
    local flag = setupKnockFlag(parent, name)

    local function updateFlag()
        flag.Value = isActuallyKnocked(hum)
    end

    hum:GetPropertyChangedSignal("Health"):Connect(updateFlag)
    hum:GetPropertyChangedSignal("PlatformStand"):Connect(updateFlag)
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(updateFlag)
    hum:GetPropertyChangedSignal("JumpPower"):Connect(updateFlag)
    hum.Died:Connect(function()
        flag.Value = true -- ensure knocked is true on death
    end)
    updateFlag()
end

local function watchCharacter(player, character)
    local hum = character:WaitForChild("Humanoid")
    watchHumanoid(hum, player, player.Name)
end

for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        watchCharacter(player, player.Character)
    end
    player.CharacterAdded:Connect(function(char)
        watchCharacter(player, char)
    end)
    setupKnockFlag(player, player.Name)
end

Players.PlayerAdded:Connect(function(player)
    setupKnockFlag(player, player.Name)
    player.CharacterAdded:Connect(function(char)
        watchCharacter(player, char)
    end)
end)

for _, obj in ipairs(Workspace:GetChildren()) do
    if obj:FindFirstChild("Humanoid") then
        watchHumanoid(obj.Humanoid, obj, obj.Name)
    end
end

Workspace.ChildAdded:Connect(function(obj)
    if obj:FindFirstChild("Humanoid") then
        watchHumanoid(obj.Humanoid, obj, obj.Name)
    end
end)






--autobuylolxd
if not Autobuy then Autobuy = {} end
if not Autobuy.key then Autobuy.key = Enum.KeyCode.Q end

local function findPad(name)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == name then
            return obj
        end
    end
    return nil
end

-- Tactical Shotgun
spawn(function()
    while true do
        if Flags.TacticalShotgun and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[Tactical Shotgun]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)

-- Shotgun
spawn(function()
    while true do
        if Flags.Shotgun and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[Shotgun]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)

-- USP
spawn(function()
    while true do
        if Flags.USP and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[USP]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)

-- Silencer
spawn(function()
    while true do
        if Flags.Silencer and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[Silencer]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)

-- High-Medium Armor
spawn(function()
    while true do
        if Flags.HighMediumArmor and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[High-Medium Armor]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)

-- Medium Armor
spawn(function()
    while true do
        if Flags.MediumArmor and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[Medium Armor]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)

-- Chicken
spawn(function()
    while true do
        if Flags.Chicken and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[Chicken]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)

-- Taco
spawn(function()
    while true do
        if Flags.Taco and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[Taco]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)

-- Pizza
spawn(function()
    while true do
        if Flags.Pizza and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[Pizza]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)

-- Donut
spawn(function()
    while true do
        if Flags.Donut and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[Donut]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)

-- Popcorn
spawn(function()
    while true do
        if Flags.Popcorn and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[Popcorn]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)

-- Burger
spawn(function()
    while true do
        if Flags.Burger and game:GetService("UserInputService"):IsKeyDown(Autobuy.key) then
            local pad = findPad("[Burger]")
            if pad then
                local cd = pad:FindFirstChildOfClass("ClickDetector")
                if cd then fireclickdetector(cd) end
            end
        end
        task.wait(0.1)
    end
end)





VisualsModule.ESPCache = {}

function VisualsModule:FloorVector(Vector)
    if typeof(Vector) == "Vector2" then 
        return Vector2.new(math.floor(Vector.X), math.floor(Vector.Y))
    else 
        return Vector3.new(math.floor(Vector.X), math.floor(Vector.Y), math.floor(Vector.Z))
    end
end

function VisualsModule:Draw(Class, Properties)
    local d = Drawing.new(Class)
    for i, v in pairs(Properties or {}) do
        pcall(function() d[i] = v end)
    end
    return d
end

function VisualsModule:NewLabel()
    local TextLabel = VisualsModule:Draw("Text", {
        Text = "",
        Font = 2,
        Size = 13,
        Outline = true,
        Center = true,
        Color = Color3.new(1, 1, 1)
    })
    return TextLabel
end

function VisualsModule:NewBox()
    local BoxOutline = VisualsModule:Draw("Square", {
        Color = Color3.new(0, 0, 0),
        Filled = false,
        Thickness = 3
    })
    local Box = VisualsModule:Draw("Square", {
        Color = Color3.new(1, 1, 1),
        Filled = false,
        Thickness = 1
    })

    return Box, BoxOutline
end

function VisualsModule:New(Player)
    if not VisualsModule.ESPCache[Player] then
        local Components = {}
        local Highlight = Instance.new("Highlight")
        Highlight.Parent = workspace
		Highlight.Adornee = Player.Character
        task.spawn(function()
            Highlight.FillTransparency = 1
            Highlight.OutlineTransparency = 0
            Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

            local Box, BoxOutline = VisualsModule:NewBox()
            Components.Box = Box
            Components.BoxOutline = BoxOutline

            Components.Name      = VisualsModule:NewLabel()
            Components.Distance  = VisualsModule:NewLabel()
            Components.Health    = VisualsModule:NewLabel()
            Components.Weapon    = VisualsModule:NewLabel()
            Components.Ammo      = VisualsModule:NewLabel()
            Components.Reloading = VisualsModule:NewLabel()
            Components.Vest      = VisualsModule:NewLabel()

            Components.HealthbarOutline = VisualsModule:Draw("Line", {
                Thickness = 3,
                Color = Color3.new(0, 0, 0)
            })

            Components.Healthbar = VisualsModule:Draw("Line", {
                Thickness = 1,
                Color = Color3.new(0, 1, 0)
            })
        end)

        local Info = setmetatable({
            Components = Components,
            Player = Player,
            GunNames = {"Uzi", "Shotty", "Glock"},
            Highlight = Highlight
        }, PlayerFunctions)

        VisualsModule.ESPCache[Player] = Info
        return Info
    end
end

function VisualsModule:Remove(Player)
    if VisualsModule.ESPCache[Player] then
        for _, Value in next, VisualsModule.ESPCache[Player].Components do
            Value:Remove()
        end
        VisualsModule.ESPCache[Player].Highlight:Destroy()
        VisualsModule.ESPCache[Player] = nil
    end
end

VisualsModule.WeaponInfo = VisualsModule:NewLabel()
VisualsModule.PredCircle = VisualsModule:Draw("Circle", {
    Thickness = 5,
    Size = Vector2.new(10, 10),
    Filled = false,
    Color = Color3.new(1, 1, 1),
    ZIndex = 9000
})

local aimbotTab = library:addTab("Aimbot")

local aimingGroup = aimbotTab:createGroup('left', 'Silent')


aimingGroup:addList({text = "Mode", flag = "SilentMode", values = {"Silent"}, callback = function(value)
    silent.mode = value
end})

aimingGroup:addToggle({
    text = "Silent",
    flag = "Enabled",
    default = false,
    callback = function(value)
        silent.on = value
        silentEnabled = value
    end
})

aimingGroup:addToggle({text = "Highlight", flag = "Highlight", default = false, callback = function(value)
    silent.hl = value
end})

aimingGroup:addList({
    text = "Keybind",
    flag = "SilentKeybindLol",
    values = shared.keys,
    default = "C",
    callback = function(value)
        silent.keybindlol = Enum.KeyCode[value]
    end
})

aimingGroup:addToggle({
    text = "Keybind",
    flag = "Keybindlolll",
    default = false,
    callback = function(value)
        silent.keybindenabled = value
    end
})


local fovSection = aimbotTab:createGroup('right', 'FOV')

fovSection:addToggle({text = "Visible", flag = "FovVisible", default = false, callback = function(value)
    silent.fov.visible = value
end})

fovSection:addSlider({text = "Size", flag = "FovSize", min = 1, max = 1000, default = 15, callback = function(value)
    silent.fov.size = value
end})

fovSection:addToggle({
    text = "Custom Gun FOV",
    flag = "CustomGunFovs",
    default = false,
    callback = function(value)
        Flags.CustomGunFovs = value
    end
})


fovSection:addSlider({
    text = "Shotgun FOV Size",
    flag = "ShotgunFovSize",
    min = 1,
    max = 1000,
    default = 15,
    callback = function(value)
        Flags.ShotGunsFov = value
    end
})

fovSection:addSlider({
    text = "Handgun FOV Size",
    flag = "HandgunFovSize",
    min = 1,
    max = 1000,
    default = 15,
    callback = function(value)
        Flags.HandGunsFov = value
    end
})

local checksSection = aimbotTab:createGroup('left', 'Checks')

checksSection:addToggle({text = "Wall Check", flag = "VisibleCheck", default = true, callback = function(value)
    silent.visible = value
end})

checksSection:addToggle({text = "Friends", flag = "FriendCheck", default = true, callback = function(value)
    silent.friend = value
end})

checksSection:addToggle({text = "Knock Check", flag = "HealthCheck", default = true, callback = function(value)
    silent.HealthCheck = value
end})

checksSection:addToggle({text = "Crew Check", flag = "CrewCheck", default = true, callback = function(value)
    silent.CrewCheck = value
end})

checksSection:addToggle({text = "Distance", flag = "DistanceCheck", default = true, callback = function(value)
    silent.distance = value
end})

checksSection:addSlider({text = "Max Distance", flag = "MaxDistance", min = 1, max = 1000, default = 150, callback = function(value)
    silent.dist = value
end})

local visualsTab = library:addTab("Visuals")
local espSection = visualsTab:createGroup('left', "Visuals")

espSection:addToggle({text = "ESP", flag = "ESP", default = false, callback = function(value)
    task.spawn(function()
        for _, v in ipairs(game.Players:GetPlayers()) do
            if value then
                VisualsModule:New(v)
            else
                VisualsModule:Remove(v)
            end
        end
    end);
end})

espSection:addToggle({
    text = "ESP Box",
    flag = "ESPBox",
    default = true,
    callback = function(value)
        Flags.ESPBox = value
    end
})


espSection:addToggle({
    text = "ESP Highlight",
    flag = "ESPHighlight",
    default = true,
    callback = function(value)
        Flags.ESPHighlight = value
    end
})

espSection:addToggle({
    text = "ESP Name",
    flag = "ESPName",
    default = true,
    callback = function(value)
        Flags.ESPName = value
    end
})


espSection:addToggle({
    text = "ESP Weapon",
    flag = "ESPWeapon",
    default = true,
    callback = function(value)
        Flags.ESPWeapon = value
    end
})

espSection:addToggle({
    text = "ESP Ammo",
    flag = "ESPAmmo",
    default = true,
    callback = function(value)
        Flags.ESPAmmo = value
    end
})


espSection:addToggle({
    text = "ESP Health",
    flag = "ESPHealth",
    default = true,
    callback = function(value)
        Flags.ESPHealth = value
    end
})

espSection:addToggle({
    text = "ESP Healthbar",
    flag = "ESPHealthbar",
    default = true,
    callback = function(value)
        Flags.ESPHealthbar = value
    end
})



local rageTab = library:addTab("Rage")

local AutoKatana = rageTab:createGroup('left', "Auto Katana")

AutoKatana:addTextbox({text = "Username", flag = "Target_Username"})

AutoKatana:addList({text = "Key Bind", flag = "AutoKatanaKeybind", values = shared.keys, callback = function(value)
    autok.keybind = Enum.KeyCode[value]
end})

local ragemiscs = rageTab:createGroup('right', "Misc")

ragemiscs:addToggle({
    text = "Auto Armor",
    flag = "AutoArmor",
    default = true,
    callback = function(value)
        Flags.AutoArmor = value
    end
})

ragemiscs:addToggle({
    text = "Auto Stomp",
    flag = "AutoStomp",
    default = true,
    callback = function(value)
        Flags.AutoStomp = value
    end
})




local antilock = rageTab:createGroup('left', "Anti Lock")

antilock:addList({text = "Mode", flag = "AntiLockType", values = {"Prediction Multiplier", "Prediction Reverser", "Prediction Tripler", "Sky", "Floor"}, callback = function(value)
    anti.mode = value
end})


antilock:addToggle({
    text = "Anti Lock",
    flag = "AntiLock",
    default = true,
    callback = function(value)
        Flags.AntiLock = value
        antiEnabled = value
    end
})

antilock:addList({
    text = "Key Bind",
    flag = "AntiKeybind",
    values = shared.keys,
    default = "C",
    callback = function(value)
        anti.keybindlol = Enum.KeyCode[value]
    end
})

antilock:addToggle({
    text = "Keybind",
    flag = "AntiLockKeybindEnabled",
    default = true,
    callback = function(value)
        anti.Keybindbenabled = value
    end
})


local speedh = rageTab:createGroup('right', "Movement")


speedh:addToggle({
    text = "Speed",
    flag = "SpeedH",
    default = true,
    callback = function(value)
        Flags.SpeedH = value
        speedEnabled = value
    end
})

speedh:addSlider({
    text = "Speed Amount",
    flag = "SpeedAmount",
    min = 1,
    max = 1000,
    default = 15,
    callback = function(value)
        Flags.SpeedAmount = value
    end
})

speedh:addList({
    text = "Keybind",
    flag = "SilentKeybindLol",
    values = shared.keys,
    default = "C",
    callback = function(value)
        speedhack.keybindlol = Enum.KeyCode[value]
    end
})

speedh:addToggle({
    text = "Keybind",
    flag = "Keybindlolll",
    default = false,
    callback = function(value)
        speedhack.keybindenabled = value
    end
})

speedh:addToggle({
    text = "No Jump Cooldown",
    flag = "NoJumpCooldown",
    default = true,
    callback = function(value)
        Flags.NoJumpCooldown = value
    end
})

local otherTab = library:addTab("Other")






local autobuySection = otherTab:createGroup('right', "Auto buy")


autobuySection:addList({text = "Key Bind", flag = "Lolkeybind", values = shared.keys, callback = function(value)
    Autobuy.key = Enum.KeyCode[value]
end})

-- Guns

autobuySection:addToggle({
    text = "Tactical Shotgun",
    flag = "TacticalShotgun",
    default = true,
    callback = function(value)
        Flags.TacticalShotgun = value
    end
})

autobuySection:addToggle({
    text = "Shotgun",
    flag = "Shotgun",
    default = true,
    callback = function(value)
        Flags.Shotgun = value
    end
})

autobuySection:addToggle({
    text = "USP",
    flag = "USP",
    default = true,
    callback = function(value)
        Flags.USP = value
    end
})

autobuySection:addToggle({
    text = "Silencer",
    flag = "Silencer",
    default = true,
    callback = function(value)
        Flags.Silencer = value
    end
})


-- Armor
autobuySection:addToggle({
    text = "High-Medium Armor",
    flag = "HighMediumArmor",
    default = true,
    callback = function(value)
        Flags.HighMediumArmor = value
    end
})

autobuySection:addToggle({
    text = "Medium Armor",
    flag = "MediumArmor",
    default = true,
    callback = function(value)
        Flags.MediumArmor = value
    end
})

-- Food
autobuySection:addToggle({
    text = "Chicken",
    flag = "Chicken",
    default = true,
    callback = function(value)
        Flags.Chicken = value
    end
})

autobuySection:addToggle({
    text = "Taco",
    flag = "Taco",
    default = true,
    callback = function(value)
        Flags.Taco = value
    end
})


autobuySection:addToggle({
    text = "Pizza",
    flag = "Pizza",
    default = true,
    callback = function(value)
        Flags.Pizza = value
    end
})

autobuySection:addToggle({
    text = "Donut",
    flag = "Donut",
    default = true,
    callback = function(value)
        Flags.Donut = value
    end
})

autobuySection:addToggle({
    text = "Popcorn",
    flag = "Popcorn",
    default = true,
    callback = function(value)
        Flags.Popcorn = value
    end
})

autobuySection:addToggle({
    text = "Chicken Leg",
    flag = "ChickenLeg",
    default = true,
    callback = function(value)
        Flags.ChickenLeg = value
    end
})

autobuySection:addToggle({
    text = "Burger",
    flag = "Burger",
    default = true,
    callback = function(value)
        Flags.Burger = value
    end
})


local miscSection = otherTab:createGroup('left', "Misc")

miscSection:addToggle({
    text = "Auto Reload",
    flag = "AutoReload",
    default = true,
    callback = function(value)
        Flags.AutoReload = value
    end
})


miscSection:addToggle({
    text = "Staff Detect",
    flag = "StaffDetect",
    default = true,
    callback = function(value)
        Flags.StaffDetect = value
    end
})



local configTab = library:addTab("Settings")

local createconfigs = configTab:createGroup('left', 'Create Configs')
createconfigs:addTextbox({text = "Name", flag = "config_name"})
createconfigs:addButton({text = "Create Config", callback = function() library:createConfig() end})



local whitelistsettings = configTab:createGroup('right', 'Whitelist')

local Players = game:GetService("Players")
local playerToggles = {}

local localPlayer = Players.LocalPlayer

local function createPlayerToggle(player)
    if player == localPlayer then return end

    local toggleFlag = "player_" .. player.UserId

    Flags[toggleFlag] = Flags[toggleFlag] or false

    whitelistsettings:addToggle({
        text = player.DisplayName,
        flag = toggleFlag,
        default = Flags[toggleFlag],
        callback = function(value)
            Flags[toggleFlag] = value
        end
    })

    playerToggles[player.UserId] = {flag = toggleFlag}
end

local function removePlayerToggle(player)
    local data = playerToggles[player.UserId]
    if data then
        whitelistsettings:removeToggle(data.flag)
        playerToggles[player.UserId] = nil
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    createPlayerToggle(player)
end

Players.PlayerAdded:Connect(createPlayerToggle)
Players.PlayerRemoving:Connect(removePlayerToggle)





local configsettings = configTab:createGroup('left', 'Config Settings')
configsettings:addConfigbox({flag = 'selected_config', values = {}})

configsettings:addButton({text = "Load", callback = function() library:loadConfig() end})
configsettings:addButton({text = "Update", callback = function() library:saveConfig() end})
configsettings:addButton({text = "Delete", callback = function() library:deleteConfig() end})
configsettings:addButton({text = "Refresh", callback = function() library:refreshConfigs() end}) --]]



local settingslol = configTab:createGroup('left', 'Settings')


settingslol:addList({text = "Gui Keybind", flag = "guitogglekey", values = shared.extrakeys, callback = function(value)
    gui.keybind = Enum.KeyCode[value]
end})



local LocalHL2 = Instance.new("Highlight")
LocalHL2.FillColor = Color3.fromRGB(160, 160, 160)
LocalHL2.OutlineColor = Color3.fromRGB(255, 35, 35)


Connections["RS1"] = game:GetService("RunService").Heartbeat:Connect(function()
    silent.pred = get_pred()
    Circle.Position = Vector2.new(Mouse.X, Mouse.Y + Gui:GetGuiInset().Y)
    Circle.Radius = silent.fov.size * 3
    Circle.Visible = silent.fov.visible
    if silent.on and  silent.mode == "Silent" then 
        GetClosestPlayer()
    end
    if silent.on and silent.target then 
        silent.cf = GetClosestPointOfPart(silent.target.Character[silent.part])
    end
    if silent.on and silent.hl and silent.target then 
        if LocalHL2.Parent ~= silent.target.Character then
           LocalHL2.Parent = silent.target.Character
        end
    else
        if LocalHL2.Parent ~= game.CoreGui then 
           LocalHL2.Parent = game.CoreGui
        end
    end
    if silent.on and silent.target and silent.assist and silent.mode == "Camlock" then 
        local Character = silent.target.Character
        local TargetCF = silent.cf
        local Prediction = TargetCF + Vector3.new(Character.HumanoidRootPart.Velocity.X, (Character.HumanoidRootPart.Velocity.Y * 0.3), Character.HumanoidRootPart.Velocity.Z) * silent.pred
        local Main = CFrame.new(CurrentCamera.CFrame.p, Prediction)
        CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(Main, silent.assistv, Enum.EasingStyle.Exponential , Enum.EasingDirection.InOut)
    end
end)

game:GetService("UserInputService").InputBegan:Connect(function(Key,GP)
    if GP then return end
    if Key.KeyCode ~= silent.key then return end
    if silent.on and silent.mode == "Camlock" then 
        if silent.target ~= nil then 
            silent.target = nil
        else
            GetClosestPlayer()
        end
    end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

function Silent()
    if silent.on and silent.target ~= nil then
        local Character = silent.target.Character
        if not Character then return end

        local mousePos = Mouse.Hit.Position
        local closestPart = nil
        local closestDist = math.huge

        local partslist = {
            "Head","UpperTorso","LowerTorso",
            "LeftUpperArm","LeftLowerArm","LeftHand",
            "RightUpperArm","RightLowerArm","RightHand",
            "LeftUpperLeg","LeftLowerLeg","LeftFoot",
            "RightUpperLeg","RightLowerLeg","RightFoot"
        }

        for _, partName in ipairs(partslist) do
            local part = Character:FindFirstChild(partName)
            if part and part:IsA("BasePart") then
                local dist = (part.Position - mousePos).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    closestPart = part
                end
            end
        end

        if not closestPart then return end

        local vel = closestPart.Velocity
        local Prediction

        if vel.Y < -20 then
            Prediction = closestPart.Position +
                Vector3.new(vel.X, vel.Y * 0.3, vel.Z) * silent.pred
        else
            Prediction = closestPart.Position + vel * silent.pred
        end

        MainEvent():FireServer("MOUSE", Prediction)
    end
end

game.Players.LocalPlayer.Character.ChildAdded:Connect(function(tool)
    if tool:IsA("Tool") then
        tool.Activated:Connect(function()
            Silent() 
        end)
    end
 end)
    
 game.Players.LocalPlayer.CharacterAdded:Connect(function(Character)
    Character.ChildAdded:Connect(function(tool)
        if tool:IsA("Tool") then
            tool.Activated:Connect(function()
                Silent() 
            end)
        end
    end)
 end)

do
RunService:BindToRenderStep("ESPUpdate", 100, function()
    if Client.Character then
        for _, Data in next, VisualsModule.ESPCache do
            Data:Update()
        end
    end
end)
end
