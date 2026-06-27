--[[
 █████╗ ██████╗ ██████╗ ██╗     ███████╗    ██╗  ██╗██╗   ██╗██████╗     ███╗   ███╗ ██████╗ ██████╗ ██╗   ██╗██╗     ███████╗
██╔══██╗██╔══██╗██╔══██╗██║     ██╔════╝    ██║  ██║██║   ██║██╔══██╗    ████╗ ████║██╔═══██╗██╔══██╗██║   ██║██║     ██╔════╝
███████║██████╔╝██████╔╝██║     █████╗      ███████║██║   ██║██████╔╝    ██╔████╔██║██║   ██║██║  ██║██║   ██║██║     █████╗  
██╔══██║██╔═══╝ ██╔═══╝ ██║     ██╔══╝      ██╔══██║██║   ██║██╔══██╗    ██║╚██╔╝██║██║   ██║██║  ██║██║   ██║██║     ██╔══╝  
██║  ██║██║     ██║     ███████╗███████╗    ██║  ██║╚██████╔╝██████╔╝    ██║ ╚═╝ ██║╚██████╔╝██████╔╝╚██████╔╝███████╗███████╗
╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝     ╚═╝     ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
by    888b     d888 d8b               888    888                                   888            
      8888b   d8888 Y8P               888    888                                   888            
      88888b.d88888                   888    888                                   888            
      888Y88888P888 888  .d88b.       8888888888  .d88b.  888d888 888d888 888  888 888888 .d88b.  
      888 Y888P 888 888 d88""88b      888    888 d8P  Y8b 888P"   888P"   888  888 888   d88""88b 
      888  Y8P  888 888 888  888      888    888 88888888 888     888     888  888 888   888  888 
      888   "   888 888 Y88..88P      888    888 Y8b.     888     888     Y88b 888 Y88b. Y88..88P 
      888       888 888  "Y88P"       888    888  "Y8888  888     888      "Y88888  "Y888 "Y88P"  

Main Credits
- Nguyễn Minh Nhật (Mio Herruto)
]]

local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local httpService = game:GetService("HttpService")
local RenderStepped = RunService.RenderStepped
local ProtectGui = protectgui or (syn and syn.protect_gui) or function() end

local Themes = {
	Names = {
		"Midnight Blue","Amethyst Maru","Crimson Dark","Ember","Neon Crimson",
		"Neon Orange","Dark Typewriter","VSC Dark High Contrast","Dark","Darker",
		"Light","Aqua","Amethyst","Amethyst Dark","Rose","Sakura"
	},
	["VSC Dark High Contrast"] = {
		Accent=Color3.fromHex("#569cd6"),AcrylicMain=Color3.fromHex("#000000"),AcrylicBorder=Color3.fromHex("#FFFFFF"),
		AcrylicGradient=ColorSequence.new(Color3.fromHex("#000000"),Color3.fromHex("#000000")),AcrylicNoise=1,
		TitleBarLine=Color3.fromHex("#FFFFFF"),Tab=Color3.fromHex("#FFFFFF"),Element=Color3.fromHex("#000000"),
		ElementBorder=Color3.fromHex("#FFFFFF"),InElementBorder=Color3.fromHex("#569cd6"),ElementTransparency=0,
		ToggleSlider=Color3.fromHex("#569cd6"),ToggleToggled=Color3.fromHex("#000000"),SliderRail=Color3.fromHex("#569cd6"),
		DropdownFrame=Color3.fromHex("#000000"),DropdownHolder=Color3.fromHex("#000000"),DropdownBorder=Color3.fromHex("#FFFFFF"),
		DropdownOption=Color3.fromHex("#FFFFFF"),Keybind=Color3.fromHex("#000000"),Input=Color3.fromHex("#000000"),
		InputFocused=Color3.fromHex("#000000"),InputIndicator=Color3.fromHex("#7c7c7c"),Dialog=Color3.fromHex("#000000"),
		DialogHolder=Color3.fromHex("#000000"),DialogHolderLine=Color3.fromHex("#FFFFFF"),DialogButton=Color3.fromHex("#000000"),
		DialogButtonBorder=Color3.fromHex("#FFFFFF"),DialogBorder=Color3.fromHex("#FFFFFF"),DialogInput=Color3.fromHex("#000000"),
		DialogInputLine=Color3.fromHex("#569cd6"),Text=Color3.fromHex("#FFFFFF"),SubText=Color3.fromHex("#9D9D9D"),
		Hover=Color3.fromHex("#383a49"),HoverChange=0.1
	},
	["Dark Typewriter"] = {
		Accent=Color3.fromRGB(109,180,120),AcrylicMain=Color3.fromRGB(38,38,38),AcrylicBorder=Color3.fromRGB(85,85,85),
		AcrylicGradient=ColorSequence.new(Color3.fromRGB(38,38,38),Color3.fromRGB(38,38,38)),AcrylicNoise=1,
		TitleBarLine=Color3.fromRGB(189,189,189),Tab=Color3.fromRGB(109,180,120),Element=Color3.fromRGB(42,42,42),
		ElementBorder=Color3.fromRGB(51,51,51),InElementBorder=Color3.fromRGB(51,51,51),ElementTransparency=0,
		ToggleSlider=Color3.fromRGB(103,169,113),ToggleToggled=Color3.fromRGB(255,255,255),SliderRail=Color3.fromRGB(51,51,51),
		DropdownFrame=Color3.fromRGB(38,38,46),DropdownHolder=Color3.fromRGB(32,32,40),DropdownBorder=Color3.fromRGB(70,70,85),
		DropdownOption=Color3.fromRGB(153,200,255),Keybind=Color3.fromRGB(54,54,54),Input=Color3.fromRGB(27,27,27),
		InputFocused=Color3.fromRGB(51,51,51),InputIndicator=Color3.fromRGB(197,184,161),Dialog=Color3.fromRGB(38,38,38),
		DialogHolder=Color3.fromRGB(58,52,46),DialogHolderLine=Color3.fromRGB(40,40,40),DialogButton=Color3.fromRGB(42,42,42),
		DialogButtonBorder=Color3.fromRGB(51,51,51),DialogBorder=Color3.fromRGB(189,189,189),DialogInput=Color3.fromRGB(27,27,27),
		DialogInputLine=Color3.fromRGB(197,184,161),Text=Color3.fromRGB(197,184,161),SubText=Color3.fromRGB(158,158,158),
		Hover=Color3.fromRGB(149,149,149),HoverChange=0.04
	},
	["Midnight Blue"] = {
		Name="Midnight Blue",Accent=Color3.fromRGB(100,180,220),AcrylicMain=Color3.fromRGB(18,18,22),
		AcrylicBorder=Color3.fromRGB(45,45,52),AcrylicGradient=ColorSequence.new(Color3.fromRGB(22,22,26),Color3.fromRGB(22,22,26)),
		AcrylicNoise=0.94,TitleBarLine=Color3.fromRGB(45,45,52),Tab=Color3.fromRGB(130,130,140),
		Element=Color3.fromRGB(38,38,46),ElementBorder=Color3.fromRGB(55,55,65),InElementBorder=Color3.fromRGB(75,75,88),
		ElementTransparency=0.1,ToggleSlider=Color3.fromRGB(100,180,220),ToggleToggled=Color3.fromRGB(22,22,26),
		SliderRail=Color3.fromRGB(55,55,65),DropdownFrame=Color3.fromRGB(32,32,38),DropdownHolder=Color3.fromRGB(28,28,34),
		DropdownBorder=Color3.fromRGB(45,45,52),DropdownOption=Color3.fromRGB(150,150,160),Keybind=Color3.fromRGB(32,32,38),
		Input=Color3.fromRGB(26,26,32),InputFocused=Color3.fromRGB(32,32,40),InputIndicator=Color3.fromRGB(100,180,220),
		InputIndicatorFocus=Color3.fromRGB(100,180,220),Dialog=Color3.fromRGB(32,32,38),DialogHolder=Color3.fromRGB(26,26,32),
		DialogHolderLine=Color3.fromRGB(45,45,52),DialogButton=Color3.fromRGB(32,32,38),DialogButtonBorder=Color3.fromRGB(45,45,52),
		DialogBorder=Color3.fromRGB(45,45,52),DialogInput=Color3.fromRGB(26,26,32),DialogInputLine=Color3.fromRGB(100,180,220),
		Text=Color3.fromRGB(195,195,205),SubText=Color3.fromRGB(125,125,135),Hover=Color3.fromRGB(45,45,55),HoverChange=0.04,
	},
	["Amethyst Maru"] = {
		Name="Amethyst Maru",Accent=Color3.fromHex("#1e6dbf"),AcrylicMain=Color3.fromHex("#001a33"),
		AcrylicBorder=Color3.fromHex("#004080"),AcrylicGradient=ColorSequence.new(Color3.fromHex("#001a33"),Color3.fromHex("#001a33")),
		AcrylicNoise=0.92,TitleBarLine=Color3.fromHex("#004080"),Tab=Color3.fromHex("#a1c4e6"),
		Element=Color3.fromHex("#00264d"),ElementBorder=Color3.fromHex("#004080"),InElementBorder=Color3.fromHex("#1e6dbf"),
		ElementTransparency=0.85,ToggleSlider=Color3.fromHex("#0055a3"),ToggleToggled=Color3.fromHex("#001a33"),
		SliderRail=Color3.fromHex("#0055a3"),DropdownFrame=Color3.fromHex("#00264d"),DropdownHolder=Color3.fromHex("#00264d"),
		DropdownBorder=Color3.fromHex("#004080"),DropdownOption=Color3.fromHex("#a1c4e6"),Keybind=Color3.fromHex("#00264d"),
		Input=Color3.fromHex("#001933"),InputFocused=Color3.fromHex("#001933"),InputIndicator=Color3.fromHex("#7fa1bf"),
		Dialog=Color3.fromHex("#00264d"),DialogHolder=Color3.fromHex("#001a33"),DialogHolderLine=Color3.fromHex("#004080"),
		DialogButton=Color3.fromHex("#00264d"),DialogButtonBorder=Color3.fromHex("#004080"),DialogBorder=Color3.fromHex("#004080"),
		DialogInput=Color3.fromHex("#001933"),DialogInputLine=Color3.fromHex("#1e6dbf"),Text=Color3.fromHex("#a1c4e6"),
		SubText=Color3.fromHex("#7fa1bf"),Hover=Color3.fromHex("#004080"),HoverChange=0.1
	},
	["Amethyst Dark"] = {
		Name="Amethyst Dark",Accent=Color3.fromHex("#b133ff"),AcrylicMain=Color3.fromHex("#120024"),
		AcrylicBorder=Color3.fromHex("#4d057b"),AcrylicGradient=ColorSequence.new(Color3.fromHex("#120024"),Color3.fromHex("#120024")),
		AcrylicNoise=0.92,TitleBarLine=Color3.fromHex("#4d057b"),Tab=Color3.fromHex("#e9d9f2"),
		Element=Color3.fromHex("#25013c"),ElementBorder=Color3.fromHex("#4d057b"),InElementBorder=Color3.fromHex("#b133ff"),
		ElementTransparency=0.85,ToggleSlider=Color3.fromHex("#7d16bf"),ToggleToggled=Color3.fromHex("#120024"),
		SliderRail=Color3.fromHex("#7d16bf"),DropdownFrame=Color3.fromHex("#25013c"),DropdownHolder=Color3.fromHex("#25013c"),
		DropdownBorder=Color3.fromHex("#4d057b"),DropdownOption=Color3.fromHex("#e9d9f2"),Keybind=Color3.fromHex("#25013c"),
		Input=Color3.fromHex("#180030"),InputFocused=Color3.fromHex("#180030"),InputIndicator=Color3.fromHex("#9e85ad"),
		Dialog=Color3.fromHex("#25013c"),DialogHolder=Color3.fromHex("#120024"),DialogHolderLine=Color3.fromHex("#4d057b"),
		DialogButton=Color3.fromHex("#25013c"),DialogButtonBorder=Color3.fromHex("#4d057b"),DialogBorder=Color3.fromHex("#4d057b"),
		DialogInput=Color3.fromHex("#180030"),DialogInputLine=Color3.fromHex("#b133ff"),Text=Color3.fromHex("#e9d9f2"),
		SubText=Color3.fromHex("#9e85ad"),Hover=Color3.fromHex("#4d057b"),HoverChange=0.1
	},
	["Crimson Dark"] = {
		Name="Crimson Dark",Accent=Color3.fromHex("#ff3333"),AcrylicMain=Color3.fromHex("#240000"),
		AcrylicBorder=Color3.fromHex("#7b0505"),AcrylicGradient=ColorSequence.new(Color3.fromHex("#240000"),Color3.fromHex("#240000")),
		AcrylicNoise=0.92,TitleBarLine=Color3.fromHex("#7b0505"),Tab=Color3.fromHex("#f2d9d9"),
		Element=Color3.fromHex("#3c0101"),ElementBorder=Color3.fromHex("#7b0505"),InElementBorder=Color3.fromHex("#ff3333"),
		ElementTransparency=0.85,ToggleSlider=Color3.fromHex("#bf1616"),ToggleToggled=Color3.fromHex("#240000"),
		SliderRail=Color3.fromHex("#bf1616"),DropdownFrame=Color3.fromHex("#3c0101"),DropdownHolder=Color3.fromHex("#3c0101"),
		DropdownBorder=Color3.fromHex("#7b0505"),DropdownOption=Color3.fromHex("#f2d9d9"),Keybind=Color3.fromHex("#3c0101"),
		Input=Color3.fromHex("#300000"),InputFocused=Color3.fromHex("#300000"),InputIndicator=Color3.fromHex("#ad8585"),
		Dialog=Color3.fromHex("#3c0101"),DialogHolder=Color3.fromHex("#240000"),DialogHolderLine=Color3.fromHex("#7b0505"),
		DialogButton=Color3.fromHex("#3c0101"),DialogButtonBorder=Color3.fromHex("#7b0505"),DialogBorder=Color3.fromHex("#7b0505"),
		DialogInput=Color3.fromHex("#300000"),DialogInputLine=Color3.fromHex("#ff3333"),Text=Color3.fromHex("#f2d9d9"),
		SubText=Color3.fromHex("#ad8585"),Hover=Color3.fromHex("#7b0505"),HoverChange=0.1
	},
	["Neon Crimson"] = {
		Name="Neon Crimson",Accent=Color3.fromHex("#ff0055"),AcrylicMain=Color3.fromHex("#0a0005"),
		AcrylicBorder=Color3.fromHex("#910027"),AcrylicGradient=ColorSequence.new(Color3.fromHex("#0a0005"),Color3.fromHex("#0a0005")),
		AcrylicNoise=0.92,TitleBarLine=Color3.fromHex("#910027"),Tab=Color3.fromHex("#ffccd9"),
		Element=Color3.fromHex("#220007"),ElementBorder=Color3.fromHex("#910027"),InElementBorder=Color3.fromHex("#ff0055"),
		ElementTransparency=0.85,ToggleSlider=Color3.fromHex("#d40040"),ToggleToggled=Color3.fromHex("#0a0005"),
		SliderRail=Color3.fromHex("#d40040"),DropdownFrame=Color3.fromHex("#220007"),DropdownHolder=Color3.fromHex("#220007"),
		DropdownBorder=Color3.fromHex("#910027"),DropdownOption=Color3.fromHex("#ffccd9"),Keybind=Color3.fromHex("#220007"),
		Input=Color3.fromHex("#140005"),InputFocused=Color3.fromHex("#140005"),InputIndicator=Color3.fromHex("#ff8099"),
		Dialog=Color3.fromHex("#220007"),DialogHolder=Color3.fromHex("#0a0005"),DialogHolderLine=Color3.fromHex("#910027"),
		DialogButton=Color3.fromHex("#220007"),DialogButtonBorder=Color3.fromHex("#910027"),DialogBorder=Color3.fromHex("#910027"),
		DialogInput=Color3.fromHex("#140005"),DialogInputLine=Color3.fromHex("#ff0055"),Text=Color3.fromHex("#ffccd9"),
		SubText=Color3.fromHex("#ff8099"),Hover=Color3.fromHex("#910027"),HoverChange=0.1
	},
	["Neon Orange"] = {
		Name="Neon Orange",Accent=Color3.fromHex("#ff6a00"),AcrylicMain=Color3.fromHex("#0a0500"),
		AcrylicBorder=Color3.fromHex("#913200"),AcrylicGradient=ColorSequence.new(Color3.fromHex("#0a0500"),Color3.fromHex("#0a0500")),
		AcrylicNoise=0.92,TitleBarLine=Color3.fromHex("#913200"),Tab=Color3.fromHex("#ffd9cc"),
		Element=Color3.fromHex("#220e00"),ElementBorder=Color3.fromHex("#913200"),InElementBorder=Color3.fromHex("#ff6a00"),
		ElementTransparency=0.85,ToggleSlider=Color3.fromHex("#d45500"),ToggleToggled=Color3.fromHex("#0a0500"),
		SliderRail=Color3.fromHex("#d45500"),DropdownFrame=Color3.fromHex("#220e00"),DropdownHolder=Color3.fromHex("#220e00"),
		DropdownBorder=Color3.fromHex("#913200"),DropdownOption=Color3.fromHex("#ffd9cc"),Keybind=Color3.fromHex("#220e00"),
		Input=Color3.fromHex("#140800"),InputFocused=Color3.fromHex("#140800"),InputIndicator=Color3.fromHex("#ffa280"),
		Dialog=Color3.fromHex("#220e00"),DialogHolder=Color3.fromHex("#0a0500"),DialogHolderLine=Color3.fromHex("#913200"),
		DialogButton=Color3.fromHex("#220e00"),DialogButtonBorder=Color3.fromHex("#913200"),DialogBorder=Color3.fromHex("#913200"),
		DialogInput=Color3.fromHex("#140800"),DialogInputLine=Color3.fromHex("#ff6a00"),Text=Color3.fromHex("#ffd9cc"),
		SubText=Color3.fromHex("#ffa280"),Hover=Color3.fromHex("#913200"),HoverChange=0.1
	},
	Ember = {
		Name="Ember",Accent=Color3.fromRGB(217,87,0),AcrylicMain=Color3.fromRGB(20,20,20),
		AcrylicBorder=Color3.fromRGB(130,100,70),AcrylicGradient=ColorSequence.new(Color3.fromRGB(180,100,40),Color3.fromRGB(90,40,15)),
		AcrylicNoise=0.92,TitleBarLine=Color3.fromRGB(120,90,60),Tab=Color3.fromRGB(180,150,120),
		Element=Color3.fromRGB(160,130,100),ElementBorder=Color3.fromRGB(80,60,40),InElementBorder=Color3.fromRGB(120,100,80),
		ElementTransparency=0.87,ToggleSlider=Color3.fromRGB(160,130,100),ToggleToggled=Color3.fromRGB(0,0,0),
		SliderRail=Color3.fromRGB(160,130,100),DropdownFrame=Color3.fromRGB(200,170,140),DropdownHolder=Color3.fromRGB(90,60,30),
		DropdownBorder=Color3.fromRGB(75,50,25),DropdownOption=Color3.fromRGB(160,130,100),Keybind=Color3.fromRGB(160,130,100),
		Input=Color3.fromRGB(160,130,100),InputFocused=Color3.fromRGB(35,20,10),InputIndicator=Color3.fromRGB(190,160,130),
		InputIndicatorFocus=Color3.fromRGB(217,87,0),Dialog=Color3.fromRGB(90,60,30),DialogHolder=Color3.fromRGB(75,45,20),
		DialogHolderLine=Color3.fromRGB(65,40,15),DialogButton=Color3.fromRGB(90,60,30),DialogButtonBorder=Color3.fromRGB(120,90,60),
		DialogBorder=Color3.fromRGB(110,80,50),DialogInput=Color3.fromRGB(100,70,40),DialogInputLine=Color3.fromRGB(200,170,140),
		Text=Color3.fromRGB(240,240,240),SubText=Color3.fromRGB(170,170,170),Hover=Color3.fromRGB(160,130,100),HoverChange=0.04,
	},
	Dark = {
		Name="Dark",Accent=Color3.fromRGB(96,205,255),AcrylicMain=Color3.fromRGB(60,60,60),
		AcrylicBorder=Color3.fromRGB(90,90,90),AcrylicGradient=ColorSequence.new(Color3.fromRGB(40,40,40),Color3.fromRGB(40,40,40)),
		AcrylicNoise=0.9,TitleBarLine=Color3.fromRGB(75,75,75),Tab=Color3.fromRGB(120,120,120),
		Element=Color3.fromRGB(120,120,120),ElementBorder=Color3.fromRGB(35,35,35),InElementBorder=Color3.fromRGB(90,90,90),
		ElementTransparency=0.87,ToggleSlider=Color3.fromRGB(120,120,120),ToggleToggled=Color3.fromRGB(0,0,0),
		SliderRail=Color3.fromRGB(120,120,120),DropdownFrame=Color3.fromRGB(160,160,160),DropdownHolder=Color3.fromRGB(45,45,45),
		DropdownBorder=Color3.fromRGB(35,35,35),DropdownOption=Color3.fromRGB(120,120,120),Keybind=Color3.fromRGB(120,120,120),
		Input=Color3.fromRGB(160,160,160),InputFocused=Color3.fromRGB(10,10,10),InputIndicator=Color3.fromRGB(150,150,150),
		Dialog=Color3.fromRGB(45,45,45),DialogHolder=Color3.fromRGB(35,35,35),DialogHolderLine=Color3.fromRGB(30,30,30),
		DialogButton=Color3.fromRGB(45,45,45),DialogButtonBorder=Color3.fromRGB(80,80,80),DialogBorder=Color3.fromRGB(70,70,70),
		DialogInput=Color3.fromRGB(55,55,55),DialogInputLine=Color3.fromRGB(160,160,160),Text=Color3.fromRGB(240,240,240),
		SubText=Color3.fromRGB(170,170,170),Hover=Color3.fromRGB(120,120,120),HoverChange=0.07,
	},
	Darker = {
		Name="Darker",Accent=Color3.fromRGB(72,138,182),AcrylicMain=Color3.fromRGB(30,30,30),
		AcrylicBorder=Color3.fromRGB(60,60,60),AcrylicGradient=ColorSequence.new(Color3.fromRGB(25,25,25),Color3.fromRGB(15,15,15)),
		AcrylicNoise=0.94,TitleBarLine=Color3.fromRGB(65,65,65),Tab=Color3.fromRGB(100,100,100),
		Element=Color3.fromRGB(70,70,70),ElementBorder=Color3.fromRGB(25,25,25),InElementBorder=Color3.fromRGB(55,55,55),
		ElementTransparency=0.82,DropdownFrame=Color3.fromRGB(120,120,120),DropdownHolder=Color3.fromRGB(35,35,35),
		DropdownBorder=Color3.fromRGB(25,25,25),Dialog=Color3.fromRGB(35,35,35),DialogHolder=Color3.fromRGB(25,25,25),
		DialogHolderLine=Color3.fromRGB(20,20,20),DialogButton=Color3.fromRGB(35,35,35),DialogButtonBorder=Color3.fromRGB(55,55,55),
		DialogBorder=Color3.fromRGB(50,50,50),DialogInput=Color3.fromRGB(45,45,45),DialogInputLine=Color3.fromRGB(120,120,120),
	},
	Light = {
		Name="Light",Accent=Color3.fromRGB(0,103,192),AcrylicMain=Color3.fromRGB(200,200,200),
		AcrylicBorder=Color3.fromRGB(120,120,120),AcrylicGradient=ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(255,255,255)),
		AcrylicNoise=0.96,TitleBarLine=Color3.fromRGB(160,160,160),Tab=Color3.fromRGB(90,90,90),
		Element=Color3.fromRGB(255,255,255),ElementBorder=Color3.fromRGB(180,180,180),InElementBorder=Color3.fromRGB(150,150,150),
		ElementTransparency=0.65,ToggleSlider=Color3.fromRGB(40,40,40),ToggleToggled=Color3.fromRGB(255,255,255),
		SliderRail=Color3.fromRGB(40,40,40),DropdownFrame=Color3.fromRGB(200,200,200),DropdownHolder=Color3.fromRGB(240,240,240),
		DropdownBorder=Color3.fromRGB(200,200,200),DropdownOption=Color3.fromRGB(150,150,150),Keybind=Color3.fromRGB(120,120,120),
		Input=Color3.fromRGB(200,200,200),InputFocused=Color3.fromRGB(100,100,100),InputIndicator=Color3.fromRGB(80,80,80),
		InputIndicatorFocus=Color3.fromRGB(0,103,192),Dialog=Color3.fromRGB(255,255,255),DialogHolder=Color3.fromRGB(240,240,240),
		DialogHolderLine=Color3.fromRGB(228,228,228),DialogButton=Color3.fromRGB(255,255,255),DialogButtonBorder=Color3.fromRGB(190,190,190),
		DialogBorder=Color3.fromRGB(140,140,140),DialogInput=Color3.fromRGB(250,250,250),DialogInputLine=Color3.fromRGB(160,160,160),
		Text=Color3.fromRGB(0,0,0),SubText=Color3.fromRGB(40,40,40),Hover=Color3.fromRGB(50,50,50),HoverChange=0.16,
	},
	Aqua = {
		Name="Aqua",Accent=Color3.fromRGB(60,165,165),AcrylicMain=Color3.fromRGB(20,20,20),
		AcrylicBorder=Color3.fromRGB(50,100,100),AcrylicGradient=ColorSequence.new(Color3.fromRGB(60,140,140),Color3.fromRGB(40,80,80)),
		AcrylicNoise=0.92,TitleBarLine=Color3.fromRGB(60,120,120),Tab=Color3.fromRGB(140,180,180),
		Element=Color3.fromRGB(110,160,160),ElementBorder=Color3.fromRGB(40,70,70),InElementBorder=Color3.fromRGB(80,110,110),
		ElementTransparency=0.84,ToggleSlider=Color3.fromRGB(110,160,160),ToggleToggled=Color3.fromRGB(0,0,0),
		SliderRail=Color3.fromRGB(110,160,160),DropdownFrame=Color3.fromRGB(160,200,200),DropdownHolder=Color3.fromRGB(40,80,80),
		DropdownBorder=Color3.fromRGB(40,65,65),DropdownOption=Color3.fromRGB(110,160,160),Keybind=Color3.fromRGB(110,160,160),
		Input=Color3.fromRGB(110,160,160),InputFocused=Color3.fromRGB(20,10,30),InputIndicator=Color3.fromRGB(130,170,170),
		InputIndicatorFocus=Color3.fromRGB(60,165,165),Dialog=Color3.fromRGB(40,80,80),DialogHolder=Color3.fromRGB(30,60,60),
		DialogHolderLine=Color3.fromRGB(25,50,50),DialogButton=Color3.fromRGB(40,80,80),DialogButtonBorder=Color3.fromRGB(80,110,110),
		DialogBorder=Color3.fromRGB(50,100,100),DialogInput=Color3.fromRGB(45,90,90),DialogInputLine=Color3.fromRGB(130,170,170),
		Text=Color3.fromRGB(240,240,240),SubText=Color3.fromRGB(170,170,170),Hover=Color3.fromRGB(110,160,160),HoverChange=0.04,
	},
	Amethyst = {
		Name="Amethyst",Accent=Color3.fromRGB(97,62,167),AcrylicMain=Color3.fromRGB(20,20,20),
		AcrylicBorder=Color3.fromRGB(110,90,130),AcrylicGradient=ColorSequence.new(Color3.fromRGB(85,57,139),Color3.fromRGB(40,25,65)),
		AcrylicNoise=0.92,TitleBarLine=Color3.fromRGB(95,75,110),Tab=Color3.fromRGB(160,140,180),
		Element=Color3.fromRGB(140,120,160),ElementBorder=Color3.fromRGB(60,50,70),InElementBorder=Color3.fromRGB(100,90,110),
		ElementTransparency=0.87,ToggleSlider=Color3.fromRGB(140,120,160),ToggleToggled=Color3.fromRGB(0,0,0),
		SliderRail=Color3.fromRGB(140,120,160),DropdownFrame=Color3.fromRGB(170,160,200),DropdownHolder=Color3.fromRGB(60,45,80),
		DropdownBorder=Color3.fromRGB(50,40,65),DropdownOption=Color3.fromRGB(140,120,160),Keybind=Color3.fromRGB(140,120,160),
		Input=Color3.fromRGB(140,120,160),InputFocused=Color3.fromRGB(20,10,30),InputIndicator=Color3.fromRGB(170,150,190),
		InputIndicatorFocus=Color3.fromRGB(97,62,167),Dialog=Color3.fromRGB(60,45,80),DialogHolder=Color3.fromRGB(45,30,65),
		DialogHolderLine=Color3.fromRGB(40,25,60),DialogButton=Color3.fromRGB(60,45,80),DialogButtonBorder=Color3.fromRGB(95,80,110),
		DialogBorder=Color3.fromRGB(85,70,100),DialogInput=Color3.fromRGB(70,55,85),DialogInputLine=Color3.fromRGB(175,160,190),
		Text=Color3.fromRGB(240,240,240),SubText=Color3.fromRGB(170,170,170),Hover=Color3.fromRGB(140,120,160),HoverChange=0.04,
	},
	Rose = {
		Name="Rose",Accent=Color3.fromRGB(180,55,90),AcrylicMain=Color3.fromRGB(40,40,40),
		AcrylicBorder=Color3.fromRGB(130,90,110),AcrylicGradient=ColorSequence.new(Color3.fromRGB(190,60,135),Color3.fromRGB(165,50,70)),
		AcrylicNoise=0.92,TitleBarLine=Color3.fromRGB(140,85,105),Tab=Color3.fromRGB(180,140,160),
		Element=Color3.fromRGB(200,120,170),ElementBorder=Color3.fromRGB(110,70,85),InElementBorder=Color3.fromRGB(120,90,90),
		ElementTransparency=0.86,ToggleSlider=Color3.fromRGB(200,120,170),ToggleToggled=Color3.fromRGB(0,0,0),
		SliderRail=Color3.fromRGB(200,120,170),DropdownFrame=Color3.fromRGB(200,160,180),DropdownHolder=Color3.fromRGB(120,50,75),
		DropdownBorder=Color3.fromRGB(90,40,55),DropdownOption=Color3.fromRGB(200,120,170),Keybind=Color3.fromRGB(200,120,170),
		Input=Color3.fromRGB(200,120,170),InputFocused=Color3.fromRGB(20,10,30),InputIndicator=Color3.fromRGB(170,150,190),
		InputIndicatorFocus=Color3.fromRGB(180,55,90),Dialog=Color3.fromRGB(120,50,75),DialogHolder=Color3.fromRGB(95,40,60),
		DialogHolderLine=Color3.fromRGB(90,35,55),DialogButton=Color3.fromRGB(120,50,75),DialogButtonBorder=Color3.fromRGB(155,90,115),
		DialogBorder=Color3.fromRGB(100,70,90),DialogInput=Color3.fromRGB(135,55,80),DialogInputLine=Color3.fromRGB(190,160,180),
		Text=Color3.fromRGB(240,240,240),SubText=Color3.fromRGB(170,170,170),Hover=Color3.fromRGB(200,120,170),HoverChange=0.04,
	},
	Sakura = {
		Name="Sakura",Accent=Color3.fromRGB(252,209,215),AcrylicMain=Color3.fromRGB(40,40,40),
		AcrylicBorder=Color3.fromRGB(130,90,110),
		AcrylicGradient=ColorSequence.new{
			ColorSequenceKeypoint.new(0,Color3.fromRGB(252,209,215)),
			ColorSequenceKeypoint.new(0.25,Color3.fromRGB(255,231,222)),
			ColorSequenceKeypoint.new(0.50,Color3.fromRGB(233,177,205)),
			ColorSequenceKeypoint.new(0.75,Color3.fromRGB(195,130,158)),
			ColorSequenceKeypoint.new(1,Color3.fromRGB(86,33,53)),
		},
		AcrylicNoise=0.92,TitleBarLine=Color3.fromRGB(140,85,105),Tab=Color3.fromRGB(132,89,95),
		Element=Color3.fromRGB(220,140,190),ElementBorder=Color3.fromRGB(110,70,85),InElementBorder=Color3.fromRGB(120,90,90),
		ElementTransparency=0.86,ToggleSlider=Color3.fromRGB(252,209,215),ToggleToggled=Color3.fromRGB(252,209,215),
		TransparenToggle=0.5,SliderRail=Color3.fromRGB(252,209,215),DropdownFrame=Color3.fromRGB(252,209,215),
		DropdownHolder=Color3.fromRGB(156,103,123),DropdownBorder=Color3.fromRGB(90,40,55),DropdownOption=Color3.fromRGB(252,209,215),
		Keybind=Color3.fromRGB(200,120,170),Input=Color3.fromRGB(200,120,170),InputFocused=Color3.fromRGB(200,200,200),
		InputIndicator=Color3.fromRGB(170,150,190),InputIndicatorFocus=Color3.fromRGB(252,209,215),Dialog=Color3.fromRGB(120,50,75),
		DialogHolder=Color3.fromRGB(95,40,60),DialogHolderLine=Color3.fromRGB(90,35,55),DialogButton=Color3.fromRGB(120,50,75),
		DialogButtonBorder=Color3.fromRGB(155,90,115),DialogBorder=Color3.fromRGB(100,70,90),DialogInput=Color3.fromRGB(135,55,80),
		DialogInputLine=Color3.fromRGB(190,160,180),Text=Color3.fromRGB(240,240,240),SubText=Color3.fromRGB(220,220,220),
		Hover=Color3.fromRGB(200,120,170),HoverChange=0.04,
	}
}

local Library = {
	Version = "1.1.0",
	OpenFrames = {},
	Options = {},
	Themes = Themes.Names,
	Window = nil,
	WindowFrame = nil,
	ElementRegistry = {},
	DialogTranslateHook = nil,
	Unloaded = false,
	Creator = nil,
	DialogOpen = false,
	UseAcrylic = false,
	Acrylic = false,
	Transparency = true,
	MinimizeKeybind = nil,
	MinimizerIcon = nil,
	MinimizeKey = Enum.KeyCode.LeftControl,
}

local function isMotor(value)
	local motorType = tostring(value):match("^Motor%((.+)%)$")
	if motorType then return true, motorType else return false end
end

local Connection = {}
Connection.__index = Connection
function Connection.new(signal, handler)
	return setmetatable({signal=signal,connected=true,_handler=handler},Connection)
end
function Connection:disconnect()
	if self.connected then
		self.connected = false
		for index,connection in pairs(self.signal._connections) do
			if connection == self then table.remove(self.signal._connections,index);return end
		end
	end
end

local Signal = {}
Signal.__index = Signal
function Signal.new() return setmetatable({_connections={},_threads={}},Signal) end
function Signal:fire(...)
	for _,connection in pairs(self._connections) do connection._handler(...) end
	for _,thread in pairs(self._threads) do coroutine.resume(thread,...) end
	self._threads={}
end
function Signal:connect(handler)
	local connection=Connection.new(self,handler)
	table.insert(self._connections,connection)
	return connection
end
function Signal:wait() table.insert(self._threads,coroutine.running());return coroutine.yield() end

local Linear={}
Linear.__index=Linear
function Linear.new(targetValue,options)
	assert(targetValue,"Missing argument #1: targetValue")
	options=options or {}
	return setmetatable({_targetValue=targetValue,_velocity=options.velocity or 1},Linear)
end
function Linear:step(state,dt)
	local position=state.value;local velocity=self._velocity;local goal=self._targetValue
	local dPos=dt*velocity;local complete=dPos>=math.abs(goal-position)
	position=position+dPos*(goal>position and 1 or -1)
	if complete then position=self._targetValue;velocity=0 end
	return{complete=complete,value=position,velocity=velocity}
end

local Instant={}
Instant.__index=Instant
function Instant.new(targetValue) return setmetatable({_targetValue=targetValue},Instant) end
function Instant:step() return{complete=true,value=self._targetValue} end

local VELOCITY_THRESHOLD=0.001
local POSITION_THRESHOLD=0.001
local EPS=0.0001

local Spring={}
Spring.__index=Spring
function Spring.new(targetValue,options)
	assert(targetValue,"Missing argument #1: targetValue")
	options=options or {}
	return setmetatable({_targetValue=targetValue,_frequency=options.frequency or 4,_dampingRatio=options.dampingRatio or 1},Spring)
end
function Spring:step(state,dt)
	local d=self._dampingRatio;local f=self._frequency*2*math.pi;local g=self._targetValue
	local p0=state.value;local v0=state.velocity or 0;local offset=p0-g
	local decay=math.exp(-d*f*dt);local p1,v1;local f_dt=f*dt;local f_squared=f*f
	if d==1 then
		p1=(offset*(1+f_dt)+v0*dt)*decay+g
		v1=(v0*(1-f_dt)-offset*(f_squared*dt))*decay
	elseif d<1 then
		local c=math.sqrt(1-d*d);local c_squared=c*c;local f_c=f*c;local f_c_dt=f_c*dt
		local i=math.cos(f_c_dt);local j=math.sin(f_c_dt);local z
		if c>EPS then z=j/c
		else local a=dt*f;local a_squared=a*a;local a_cubed=a_squared*a;local csq2=c_squared*c_squared;z=a+((a_squared*csq2/20-c_squared)*a_cubed)/6 end
		local y
		if f_c>EPS then y=j/f_c
		else local b=f_c;local b_squared=b*b;local dt2=dt*dt;local dt3=dt2*dt;y=dt+((dt2*b_squared*b_squared/20-b_squared)*dt3)/6 end
		p1=(offset*(i+d*z)+v0*y)*decay+g
		v1=(v0*(i-z*d)-offset*(z*f))*decay
	else
		local c=math.sqrt(d*d-1);local r1=-f*(d-c);local r2=-f*(d+c)
		local co2=(v0-offset*r1)/(2*f*c);local co1=offset-co2
		local e1=co1*math.exp(r1*dt);local e2=co2*math.exp(r2*dt)
		p1=e1+e2+g;v1=e1*r1+e2*r2
	end
	if math.abs(v1)<VELOCITY_THRESHOLD and math.abs(p1-g)<POSITION_THRESHOLD then
		return{complete=true,value=g,velocity=v1}
	end
	return{complete=false,value=p1,velocity=v1}
end

local noop=function()end
local BaseMotor={}
BaseMotor.__index=BaseMotor
function BaseMotor.new()
	return setmetatable({_onStep=Signal.new(),_onStart=Signal.new(),_onComplete=Signal.new()},BaseMotor)
end
function BaseMotor:onStep(handler) return self._onStep:connect(handler) end
function BaseMotor:onStart(handler) return self._onStart:connect(handler) end
function BaseMotor:onComplete(handler) return self._onComplete:connect(handler) end
function BaseMotor:start()
	if not self._connection then
		self._connection=RunService.RenderStepped:Connect(function(dt) self:step(dt) end)
	end
end
function BaseMotor:stop()
	if self._connection then self._connection:Disconnect();self._connection=nil end
end
BaseMotor.destroy=BaseMotor.stop
BaseMotor.step=noop;BaseMotor.getValue=noop;BaseMotor.setGoal=noop
function BaseMotor:__tostring() return"Motor" end

local SingleMotor=setmetatable({},BaseMotor)
SingleMotor.__index=SingleMotor
function SingleMotor.new(initialValue,useImplicitConnections)
	assert(initialValue,"Missing argument #1: initialValue")
	assert(typeof(initialValue)=="number","initialValue must be a number!")
	local self=setmetatable(BaseMotor.new(),SingleMotor)
	self._useImplicitConnections=useImplicitConnections~=nil and useImplicitConnections or true
	self._goal=nil;self._state={complete=true,value=initialValue}
	return self
end
function SingleMotor:step(deltaTime)
	if self._state.complete then return true end
	local newState=self._goal:step(self._state,deltaTime)
	self._state=newState;self._onStep:fire(newState.value)
	if newState.complete then
		if self._useImplicitConnections then self:stop() end
		self._onComplete:fire()
	end
	return newState.complete
end
function SingleMotor:getValue() return self._state.value end
function SingleMotor:setGoal(goal)
	self._state.complete=false;self._goal=goal;self._onStart:fire()
	if self._useImplicitConnections then self:start() end
end
function SingleMotor:__tostring() return"Motor(Single)" end

local GroupMotor=setmetatable({},BaseMotor)
GroupMotor.__index=GroupMotor
local function toMotor(value)
	if isMotor(value) then return value end
	local t=typeof(value)
	if t=="number" then return SingleMotor.new(value,false)
	elseif t=="table" then return GroupMotor.new(value,false) end
	error(("Unable to convert %q to motor; type %s unsupported"):format(value,t),2)
end
function GroupMotor.new(initialValues,useImplicitConnections)
	assert(initialValues,"Missing argument #1: initialValues")
	assert(typeof(initialValues)=="table","initialValues must be a table!")
	assert(not initialValues.step,'initialValues contains disallowed property "step".')
	local self=setmetatable(BaseMotor.new(),GroupMotor)
	self._useImplicitConnections=useImplicitConnections~=nil and useImplicitConnections or true
	self._complete=true;self._motors={}
	for key,value in pairs(initialValues) do self._motors[key]=toMotor(value) end
	return self
end
function GroupMotor:step(deltaTime)
	if self._complete then return true end
	local allComplete=true
	for _,motor in pairs(self._motors) do if not motor:step(deltaTime) then allComplete=false end end
	self._onStep:fire(self:getValue())
	if allComplete then
		if self._useImplicitConnections then self:stop() end
		self._complete=true;self._onComplete:fire()
	end
	return allComplete
end
function GroupMotor:setGoal(goals)
	assert(not goals.step,'goals contains disallowed property "step".')
	self._complete=false;self._onStart:fire()
	for key,goal in pairs(goals) do
		local motor=assert(self._motors[key],("Unknown motor for key %s"):format(key))
		motor:setGoal(goal)
	end
	if self._useImplicitConnections then self:start() end
end
function GroupMotor:getValue()
	local values={}
	for key,motor in pairs(self._motors) do values[key]=motor:getValue() end
	return values
end
function GroupMotor:__tostring() return"Motor(Group)" end

local Flipper={
	SingleMotor=SingleMotor,GroupMotor=GroupMotor,
	Instant=Instant,Linear=Linear,Spring=Spring,
	isMotor=isMotor,
}

-- ==================== CREATOR ====================

local Creator={
	Registry={},Signals={},TransparencyMotors={},
	DefaultProperties={
		ScreenGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},
		Frame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},
		ScrollingFrame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),ScrollBarImageColor3=Color3.new(0,0,0)},
		TextLabel={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),Font=Enum.Font.SourceSans,Text="",TextColor3=Color3.new(0,0,0),BackgroundTransparency=1,TextSize=14,AutoLocalize=false},
		TextButton={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),AutoButtonColor=false,Font=Enum.Font.SourceSans,Text="",TextColor3=Color3.new(0,0,0),TextSize=14},
		TextBox={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),ClearTextOnFocus=false,Font=Enum.Font.SourceSans,Text="",TextColor3=Color3.new(0,0,0),TextSize=14},
		ImageLabel={BackgroundTransparency=1,BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},
		ImageButton={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),AutoButtonColor=false},
		CanvasGroup={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},
	},
}

local function ApplyCustomProps(Object,Props)
	if Props.ThemeTag then Creator.AddThemeObject(Object,Props.ThemeTag) end
end
function Creator.AddSignal(Signal,Function)
	local c=Signal:Connect(Function);table.insert(Creator.Signals,c);return c
end
function Creator.Disconnect()
	for Idx=#Creator.Signals,1,-1 do
		local c=table.remove(Creator.Signals,Idx)
		if c.Disconnect then c:Disconnect() end
	end
end
function Creator.UpdateTheme()
	for Instance,Object in next,Creator.Registry do
		for Property,ColorIdx in next,Object.Properties do
			local v=Creator.GetThemeProperty(ColorIdx)
			if v then Instance[Property]=v end
		end
	end
	for _,Motor in next,Creator.TransparencyMotors do
		Motor:setGoal(Flipper.Instant.new(Creator.GetThemeProperty("ElementTransparency")))
	end
end
function Creator.AddThemeObject(Object,Properties)
	Creator.Registry[Object]={Object=Object,Properties=Properties,Idx=#Creator.Registry+1}
	Creator.UpdateTheme();return Object
end
function Creator.OverrideTag(Object,Properties)
	Creator.Registry[Object].Properties=Properties;Creator.UpdateTheme()
end
function Creator.GetThemeProperty(Property)
	if Themes[Library.Theme] and Themes[Library.Theme][Property] then return Themes[Library.Theme][Property] end
	return Themes["Dark"][Property]
end
function Creator.New(Name,Properties,Children)
	local Object=Instance.new(Name)
	for n,v in next,Creator.DefaultProperties[Name] or {} do Object[n]=v end
	for n,v in next,Properties or {} do if n~="ThemeTag" then Object[n]=v end end
	for _,Child in next,Children or {} do Child.Parent=Object end
	ApplyCustomProps(Object,Properties)
	return Object
end
function Creator.SpringMotor(Initial,Instance,Prop,IgnoreDialogCheck,ResetOnThemeChange)
	IgnoreDialogCheck=IgnoreDialogCheck or false;ResetOnThemeChange=ResetOnThemeChange or false
	local Motor=Flipper.SingleMotor.new(Initial)
	Motor:onStep(function(value) Instance[Prop]=value end)
	if ResetOnThemeChange then table.insert(Creator.TransparencyMotors,Motor) end
	local function SetValue(Value,Ignore)
		Ignore=Ignore or false
		if not IgnoreDialogCheck then
			if not Ignore then
				if Prop=="BackgroundTransparency" and Library.DialogOpen then return end
			end
		end
		Motor:setGoal(Flipper.Spring.new(Value,{frequency=8}))
	end
	return Motor,SetValue
end

Library.Creator=Creator
local New=Creator.New

local LibraryID="Roblox/Ui"
local PanelParent=game:GetService("CoreGui")
local Panel=PanelParent:FindFirstChild(LibraryID)
if Panel then Panel:Destroy() end
local GUI=New("ScreenGui",{Parent=PanelParent,Name=LibraryID})
Library.GUI=GUI
ProtectGui(GUI)

function Library:SafeCallbackToggles(Title,Function,...)
	if not Function then return end
	local Success,Event=pcall(Function,...)
	if not Success then
		Library:Notify({Title="Interface",Content="Callback error",SubContent=Title,Duration=5})
	end
end
function Library:SafeCallback(Function,...)
	if not Function then return end
	local Success,Event=pcall(Function,...)
	if not Success then
		local _,i=Event:find(":%d+: ")
		if not i then return Library:Notify({Title="Interface",Content="Callback error",SubContent=Event,Duration=5}) end
		return Library:Notify({Title="Interface",Content="Callback error",SubContent=Event:sub(i+1),Duration=5})
	end
end
function Library:Round(Number,Factor)
	if Factor==0 then return math.floor(Number) end
	Number=tostring(Number)
	return Number:find("%.") and tonumber(Number:sub(1,Number:find("%.") + Factor)) or Number
end

local function map(value,inMin,inMax,outMin,outMax)
	return(value-inMin)*(outMax-outMin)/(inMax-inMin)+outMin
end
local function viewportPointToWorld(location,distance)
	local unitRay=game:GetService("Workspace").CurrentCamera:ScreenPointToRay(location.X,location.Y)
	return unitRay.Origin+unitRay.Direction*distance
end
local function getOffset()
	return map(game:GetService("Workspace").CurrentCamera.ViewportSize.Y,0,2560,8,56)
end
local viewportPointToWorld,getOffset=unpack({viewportPointToWorld,getOffset})

local BlurFolder=Instance.new("Folder",game:GetService("Workspace").CurrentCamera)

local function createAcrylic()
	local Part=Creator.New("Part",{
		Name="Body",Color=Color3.new(0,0,0),Material=Enum.Material.Glass,
		Size=Vector3.new(1,1,0),Anchored=true,CanCollide=false,Locked=true,CastShadow=false,Transparency=0.98,
	},{Creator.New("SpecialMesh",{MeshType=Enum.MeshType.Brick,Offset=Vector3.new(0,0,-0.000001)})})
	return Part
end

function AcrylicBlur()
	local function createAcrylicBlur(distance)
		local cleanups={}
		distance=distance or 0.001
		local positions={topLeft=Vector2.new(),topRight=Vector2.new(),bottomRight=Vector2.new()}
		local model=createAcrylic();model.Parent=BlurFolder
		local function updatePositions(size,position)
			positions.topLeft=position;positions.topRight=position+Vector2.new(size.X,0);positions.bottomRight=position+size
		end
		local function render()
			local res=game:GetService("Workspace").CurrentCamera
			if res then res=res.CFrame end;local cond=res;if not cond then cond=CFrame.new() end
			local camera=cond
			local tl=positions.topLeft;local tr=positions.topRight;local br=positions.bottomRight
			local tl3=viewportPointToWorld(tl,distance);local tr3=viewportPointToWorld(tr,distance);local br3=viewportPointToWorld(br,distance)
			local width=(tr3-tl3).Magnitude;local height=(tr3-br3).Magnitude
			model.CFrame=CFrame.fromMatrix((tl3+br3)/2,camera.XVector,camera.YVector,camera.ZVector)
			model.Mesh.Scale=Vector3.new(width,height,0)
		end
		local function onChange(rbx)
			local offset=getOffset()
			local size=rbx.AbsoluteSize-Vector2.new(offset,offset)
			local position=rbx.AbsolutePosition+Vector2.new(offset/2,offset/2)
			updatePositions(size,position);task.spawn(render)
		end
		local function renderOnChange()
			local camera=game:GetService("Workspace").CurrentCamera;if not camera then return end
			table.insert(cleanups,camera:GetPropertyChangedSignal("CFrame"):Connect(render))
			table.insert(cleanups,camera:GetPropertyChangedSignal("ViewportSize"):Connect(render))
			table.insert(cleanups,camera:GetPropertyChangedSignal("FieldOfView"):Connect(render))
			task.spawn(render)
		end
		model.Destroying:Connect(function()
			for _,item in cleanups do pcall(function() item:Disconnect() end) end
		end)
		renderOnChange()
		return onChange,model
	end
	return function(distance)
		local Blur={}
		local onChange,model=createAcrylicBlur(distance)
		local comp=Creator.New("Frame",{BackgroundTransparency=1,Size=UDim2.fromScale(1,1)})
		Creator.AddSignal(comp:GetPropertyChangedSignal("AbsolutePosition"),function() onChange(comp) end)
		Creator.AddSignal(comp:GetPropertyChangedSignal("AbsoluteSize"),function() onChange(comp) end)
		Blur.AddParent=function(Parent)
			Creator.AddSignal(Parent:GetPropertyChangedSignal("Visible"),function() Blur.SetVisibility(Parent.Visible) end)
		end
		Blur.SetVisibility=function(Value) model.Transparency=Value and 0.98 or 1 end
		Blur.Frame=comp;Blur.Model=model
		return Blur
	end
end

function AcrylicPaint()
	local New=Creator.New;local AcrylicBlur=AcrylicBlur()
	return function(props)
		local AP={}
		AP.Frame=New("Frame",{
			Size=UDim2.fromScale(1,1),BackgroundTransparency=0.9,BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
		},{
			New("ImageLabel",{Image="rbxassetid://8992230677",ScaleType="Slice",SliceCenter=Rect.new(Vector2.new(99,99),Vector2.new(99,99)),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.new(1,120,1,116),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,ImageColor3=Color3.fromRGB(0,0,0),ImageTransparency=0.7}),
			New("UICorner",{CornerRadius=UDim.new(0,8)}),
			New("Frame",{BackgroundTransparency=0.45,Size=UDim2.fromScale(1,1),Name="Background",ThemeTag={BackgroundColor3="AcrylicMain"}},{New("UICorner",{CornerRadius=UDim.new(0,8)})}),
			New("Frame",{BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=0.4,Size=UDim2.fromScale(1,1)},{New("UICorner",{CornerRadius=UDim.new(0,8)}),New("UIGradient",{Rotation=90,ThemeTag={Color="AcrylicGradient"}})}),
			New("ImageLabel",{Image="rbxassetid://9968344105",ImageTransparency=0.98,ScaleType=Enum.ScaleType.Tile,TileSize=UDim2.new(0,128,0,128),Size=UDim2.fromScale(1,1),BackgroundTransparency=1},{New("UICorner",{CornerRadius=UDim.new(0,8)})}),
			New("ImageLabel",{Image="rbxassetid://9968344227",ImageTransparency=0.9,ScaleType=Enum.ScaleType.Tile,TileSize=UDim2.new(0,128,0,128),Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ThemeTag={ImageTransparency="AcrylicNoise"}},{New("UICorner",{CornerRadius=UDim.new(0,8)})}),
			New("Frame",{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),ZIndex=2},{New("UICorner",{CornerRadius=UDim.new(0,8)}),New("UIStroke",{Transparency=0.5,Thickness=1,ThemeTag={Color="AcrylicBorder"}})}),
		})
		local Blur
		if Library.UseAcrylic then
			Blur=AcrylicBlur();Blur.Frame.Parent=AP.Frame
			AP.Model=Blur.Model;AP.AddParent=Blur.AddParent;AP.SetVisibility=Blur.SetVisibility
		end
		return AP
	end
end

local Acrylic={AcrylicBlur=AcrylicBlur(),CreateAcrylic=createAcrylic,AcrylicPaint=AcrylicPaint()}
function Acrylic.init()
	local baseEffect=Instance.new("DepthOfFieldEffect")
	baseEffect.FarIntensity=0;baseEffect.InFocusRadius=0.1;baseEffect.NearIntensity=1
	local depthOfFieldDefaults={}
	function Acrylic.Enable()
		for _,e in pairs(depthOfFieldDefaults) do e.Enabled=false end
		baseEffect.Parent=game:GetService("Lighting")
	end
	function Acrylic.Disable()
		for _,e in pairs(depthOfFieldDefaults) do e.Enabled=e.enabled end
		baseEffect.Parent=nil
	end
	local function register(obj)
		if obj:IsA("DepthOfFieldEffect") then depthOfFieldDefaults[obj]={enabled=obj.Enabled} end
	end
	for _,c in pairs(game:GetService("Lighting"):GetChildren()) do register(c) end
	if game:GetService("Workspace").CurrentCamera then
		for _,c in pairs(game:GetService("Workspace").CurrentCamera:GetChildren()) do register(c) end
	end
	Acrylic.Enable()
end

-- ==================== COMPONENTS ====================

local Components={
	Assets={Close="rbxassetid://9886659671",Min="rbxassetid://9886659276",Max="rbxassetid://9886659406",Restore="rbxassetid://9886659001"},
}
local New=Creator.New
local Spring=Flipper.Spring.new
local Instant=Flipper.Instant.new
local AddSignal=Creator.AddSignal

Components.Element=function(Title,Desc,Parent,Hover,Options)
	local Element={Original={Text=""}}
	Options=Options or {}
	Element.TitleLabel=New("TextLabel",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Medium,Enum.FontStyle.Normal),Text=Title,TextColor3=Color3.fromRGB(240,240,240),TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,Size=UDim2.new(1,0,0,14),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,AutoLocalize=false,ThemeTag={TextColor3="Text"}})
	Element.DescLabel=New("TextLabel",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json"),Text=Desc,TextColor3=Color3.fromRGB(200,200,200),TextSize=12,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,BackgroundColor3=Color3.fromRGB(255,255,255),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.new(1,0,0,14),AutoLocalize=false,ThemeTag={TextColor3="SubText"}})
	Element.LabelHolder=New("Frame",{AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Position=UDim2.fromOffset(10,0),Size=UDim2.new(1,-28,0,0)},{New("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center}),New("UIPadding",{PaddingBottom=UDim.new(0,13),PaddingTop=UDim.new(0,13)}),Element.TitleLabel,Element.DescLabel})
	Element.Border=New("UIStroke",{Transparency=0.5,ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(0,0,0),ThemeTag={Color="ElementBorder"}})
	Element.Frame=New("TextButton",{Visible=Options.Visible~=nil and Options.Visible or true,Size=UDim2.new(1,0,0,0),BackgroundTransparency=0.89,BackgroundColor3=Color3.fromRGB(130,130,130),Parent=Parent,AutomaticSize=Enum.AutomaticSize.Y,Text="",LayoutOrder=7,ThemeTag={BackgroundColor3="Element",BackgroundTransparency="ElementTransparency"}},{New("UICorner",{CornerRadius=UDim.new(0,4)}),Element.Border,Element.LabelHolder})
	function Element:SetTitle(Set) Element.TitleLabel.Text=Set end
	function Element:Visible(Bool) Element.Frame.Visible=Bool end
	function Element:SetDesc(Set)
		if Set==nil then Set="" end
		if Set=="" then Element.DescLabel.Visible=false else Element.DescLabel.Visible=true end
		Element.DescLabel.Text=Set
	end
	function Element:AddText(Add)
		if not string.find(Element.TitleLabel.Text,Add,1,true) then Element.TitleLabel.Text=Element.TitleLabel.Text..""..Add end
	end
	function Element:GetOriginalText() return Element.Original.Text end
	function Element:GetTitle() return Element.TitleLabel.Text end
	function Element:GetDesc() return Element.DescLabel.Text end
	function Element:Destroy() Element.Frame:Destroy() end
	Element:SetTitle(Title);Element:SetDesc(Desc)
	Element.Original.Text=Title
	Element.Original.Desc=Desc or ""
	function Element:GetOriginalDesc() return Element.Original.Desc end
	table.insert(Library.ElementRegistry,Element)
	if Hover then
		local Motor,SetTransparency=Creator.SpringMotor(Creator.GetThemeProperty("ElementTransparency"),Element.Frame,"BackgroundTransparency",false,true)
		Creator.AddSignal(Element.Frame.MouseEnter,function() SetTransparency(Creator.GetThemeProperty("ElementTransparency")-Creator.GetThemeProperty("HoverChange")) end)
		Creator.AddSignal(Element.Frame.MouseLeave,function() SetTransparency(Creator.GetThemeProperty("ElementTransparency")) end)
		Creator.AddSignal(Element.Frame.MouseButton1Down,function() SetTransparency(Creator.GetThemeProperty("ElementTransparency")+Creator.GetThemeProperty("HoverChange")) end)
		Creator.AddSignal(Element.Frame.MouseButton1Up,function() SetTransparency(Creator.GetThemeProperty("ElementTransparency")-Creator.GetThemeProperty("HoverChange")) end)
	end
	return Element
end

Components.Section=function(Title,Parent)
	local Section={}
	Section.Layout=New("UIListLayout",{Padding=UDim.new(0,5)})
	Section.Container=New("Frame",{Size=UDim2.new(1,0,0,26),Position=UDim2.fromOffset(0,24),BackgroundTransparency=1},{Section.Layout})
	Section.Root=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,26),LayoutOrder=7,Parent=Parent},{
		New("TextLabel",{RichText=true,Text=Title,TextTransparency=0,FontFace=Font.new("rbxassetid://12187365364",Enum.FontWeight.SemiBold,Enum.FontStyle.Normal),TextSize=22,TextXAlignment="Left",TextYAlignment="Center",Size=UDim2.new(1,-16,0,18),Position=UDim2.fromOffset(0,2),AutoLocalize=false,ThemeTag={TextColor3="Text"}}),
		Section.Container,
	})
	Creator.AddSignal(Section.Layout:GetPropertyChangedSignal("AbsoluteContentSize"),function()
		Section.Container.Size=UDim2.new(1,0,0,Section.Layout.AbsoluteContentSize.Y)
		Section.Root.Size=UDim2.new(1,0,0,Section.Layout.AbsoluteContentSize.Y+25)
	end)
	return Section
end

-- ==================== TAB ====================
Components.Tab=(function()
	local Components=Components
	local TabModule={Window=nil,Tabs={},Containers={},SelectedTab=0,TabCount=0,Callback=function()end}
	function TabModule:Init(Window) TabModule.Window=Window;return TabModule end
	function TabModule:GetCurrentTabPos()
		local TabHolderPos=TabModule.Window.TabHolder.AbsolutePosition.Y
		local TabPos=TabModule.Tabs[TabModule.SelectedTab].Frame.AbsolutePosition.Y
		return TabPos-TabHolderPos
	end
	function TabModule:New(Title,Icon,Parent)
		local Window=TabModule.Window;local Elements=Library.Elements
		TabModule.TabCount=TabModule.TabCount+1;local TabIndex=TabModule.TabCount
		local Tab={Selected=false,Name=Title,Type="Tab"}
		if Library:GetIcon(Icon) then Icon=Library:GetIcon(Icon) end
		if Icon==""or Icon==nil then Icon=nil end
		local PillBg=New("Frame",{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,ThemeTag={BackgroundColor3="Accent"}},{New("UICorner",{CornerRadius=UDim.new(0,8)})})
		local AccentBar=New("Frame",{Size=UDim2.new(0,3,0,0),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),BackgroundColor3=Color3.fromRGB(96,205,255),BackgroundTransparency=1,ThemeTag={BackgroundColor3="Accent"}},{New("UICorner",{CornerRadius=UDim.new(0,2)})})
		local IconLabel=New("ImageLabel",{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(16,16),Position=UDim2.new(0,8,0.5,0),BackgroundTransparency=1,Image=Icon or "",ImageTransparency=0.35,ThemeTag={ImageColor3="Text"}})
		local TitleLabel=New("TextLabel",{AnchorPoint=Vector2.new(0,0.5),Position=Icon and UDim2.new(0,30,0.5,0) or UDim2.new(0,12,0.5,0),Text=Title,RichText=true,TextTransparency=0.35,FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal),TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Size=UDim2.new(1,-12,1,0),BackgroundTransparency=1,AutoLocalize=false,ThemeTag={TextColor3="Text"}})
		Tab.Frame=New("TextButton",{Size=UDim2.new(1,0,0,34),BackgroundTransparency=1,Parent=Parent,ThemeTag={BackgroundColor3="Tab"}},{New("UICorner",{CornerRadius=UDim.new(0,8)}),PillBg,AccentBar,IconLabel,TitleLabel})
		local ContainerLayout=New("UIListLayout",{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder})
		Tab.ContainerFrame=New("ScrollingFrame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Parent=Window.ContainerHolder,Visible=false,BottomImage="rbxassetid://6889812791",MidImage="rbxassetid://6889812721",TopImage="rbxassetid://6276641225",ScrollBarImageColor3=Color3.fromRGB(255,255,255),ScrollBarImageTransparency=0.95,ScrollBarThickness=3,BorderSizePixel=0,CanvasSize=UDim2.fromScale(0,0),ScrollingDirection=Enum.ScrollingDirection.Y},{ContainerLayout,New("UIPadding",{PaddingRight=UDim.new(0,10),PaddingLeft=UDim.new(0,1),PaddingTop=UDim.new(0,1),PaddingBottom=UDim.new(0,1)})})
		Creator.AddSignal(ContainerLayout:GetPropertyChangedSignal("AbsoluteContentSize"),function()
			Tab.ContainerFrame.CanvasSize=UDim2.new(0,0,0,ContainerLayout.AbsoluteContentSize.Y+2)
		end)
		local TI_NORM=TweenInfo.new(0.22,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
		local TI_BACK=TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
		local function applySelected()
			TweenService:Create(PillBg,TI_NORM,{BackgroundTransparency=0.88}):Play()
			TweenService:Create(AccentBar,TI_BACK,{Size=UDim2.new(0,3,0.55,0),BackgroundTransparency=0}):Play()
			TweenService:Create(TitleLabel,TI_NORM,{TextTransparency=0}):Play()
			TweenService:Create(IconLabel,TI_NORM,{ImageTransparency=0}):Play()
		end
		local function applyUnselected()
			TweenService:Create(PillBg,TI_NORM,{BackgroundTransparency=1}):Play()
			TweenService:Create(AccentBar,TI_NORM,{Size=UDim2.new(0,3,0,0),BackgroundTransparency=1}):Play()
			TweenService:Create(TitleLabel,TI_NORM,{TextTransparency=0.35}):Play()
			TweenService:Create(IconLabel,TI_NORM,{ImageTransparency=0.35}):Play()
		end
		Creator.AddSignal(Tab.Frame.MouseEnter,function() if not Tab.Selected then TweenService:Create(PillBg,TI_NORM,{BackgroundTransparency=0.94}):Play();TweenService:Create(TitleLabel,TI_NORM,{TextTransparency=0.15}):Play();TweenService:Create(IconLabel,TI_NORM,{ImageTransparency=0.15}):Play() end end)
		Creator.AddSignal(Tab.Frame.MouseLeave,function() if not Tab.Selected then TweenService:Create(PillBg,TI_NORM,{BackgroundTransparency=1}):Play();TweenService:Create(TitleLabel,TI_NORM,{TextTransparency=0.35}):Play();TweenService:Create(IconLabel,TI_NORM,{ImageTransparency=0.35}):Play() end end)
		Creator.AddSignal(Tab.Frame.MouseButton1Down,function() TweenService:Create(PillBg,TI_NORM,{BackgroundTransparency=0.82}):Play() end)
		Creator.AddSignal(Tab.Frame.MouseButton1Up,function() local t=Tab.Selected and 0.88 or 0.94;TweenService:Create(PillBg,TI_NORM,{BackgroundTransparency=t}):Play() end)
		Tab.Motor,Tab.SetTransparency=Creator.SpringMotor(1,Tab.Frame,"BackgroundTransparency")
		Creator.AddSignal(Tab.Frame.MouseButton1Click,function() TabModule:SelectTab(TabIndex);TabModule.Callback(TabIndex) end)
		TabModule.Containers[TabIndex]=Tab.ContainerFrame;TabModule.Tabs[TabIndex]=Tab
		Tab._applySelected=applySelected;Tab._applyUnselected=applyUnselected
		Tab.Container=Tab.ContainerFrame;Tab.ScrollFrame=Tab.Container
		function Tab:AddSection(SectionTitle)
			local Section={Type="Section"}
			local SectionFrame=Components.Section(SectionTitle,Tab.Container)
			Section.Container=SectionFrame.Container;Section.ScrollFrame=Tab.Container
			setmetatable(Section,Elements)
			return Section
		end
		setmetatable(Tab,Elements)
		return Tab
	end
	function TabModule:GetCurrentTab() return self.SelectedTab end
	function TabModule:SelectTab(Tab)
		local Window=TabModule.Window
		TabModule.SelectedTab=Tab
		for _,T in next,TabModule.Tabs do
			T.Selected=false
			if T._applyUnselected then T._applyUnselected() else T.SetTransparency(1) end
		end
		local target=TabModule.Tabs[Tab];target.Selected=true
		if target._applySelected then target._applySelected() else target.SetTransparency(0.89) end
		Window.TabDisplay.Text=target.Name
		Window.SelectorPosMotor:setGoal(Flipper.Spring.new(TabModule:GetCurrentTabPos(),{frequency=6}))
		task.spawn(function()
			Window.ContainerHolder.Parent=Window.ContainerAnim
			Window.ContainerPosMotor:setGoal(Flipper.Spring.new(15,{frequency=10}))
			Window.ContainerBackMotor:setGoal(Flipper.Spring.new(1,{frequency=10}))
			task.wait(0.12)
			for _,Container in next,TabModule.Containers do Container.Visible=false end
			TabModule.Containers[Tab].Visible=true
			Window.ContainerPosMotor:setGoal(Flipper.Spring.new(0,{frequency=5}))
			Window.ContainerBackMotor:setGoal(Flipper.Spring.new(0,{frequency=8}))
			task.wait(0.12)
			Window.ContainerHolder.Parent=Window.ContainerCanvas
		end)
	end
	return TabModule
end)()

Components.Button=function(Theme,Parent,DialogCheck)
	DialogCheck=DialogCheck or false
	local Button={}
	Button.Title=New("TextLabel",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json"),TextColor3=Color3.fromRGB(200,200,200),TextSize=14,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,BackgroundColor3=Color3.fromRGB(255,255,255),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),AutoLocalize=false,ThemeTag={TextColor3="Text"}})
	Button.HoverFrame=New("Frame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ThemeTag={BackgroundColor3="Hover"}},{New("UICorner",{CornerRadius=UDim.new(0,4)})})
	Button.Frame=New("TextButton",{Size=UDim2.new(0,0,0,32),Parent=Parent,ThemeTag={BackgroundColor3="DialogButton"}},{New("UICorner",{CornerRadius=UDim.new(0,4)}),New("UIStroke",{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=0.65,ThemeTag={Color="DialogButtonBorder"}}),Button.HoverFrame,Button.Title})
	local Motor,SetTransparency=Creator.SpringMotor(1,Button.HoverFrame,"BackgroundTransparency",DialogCheck)
	Creator.AddSignal(Button.Frame.MouseEnter,function() SetTransparency(0.97) end)
	Creator.AddSignal(Button.Frame.MouseLeave,function() SetTransparency(1) end)
	Creator.AddSignal(Button.Frame.MouseButton1Down,function() SetTransparency(1) end)
	Creator.AddSignal(Button.Frame.MouseButton1Up,function() SetTransparency(0.97) end)
	return Button
end

Components.Dialog=(function()
	local New=Creator.New
	local Dialog={Window=nil}
	function Dialog:Init(Window) Dialog.Window=Window;return Dialog end
	function Dialog:Create()
		local D={Buttons=0}
		D.TintFrame=New("TextButton",{Text="",Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=1,Parent=Dialog.Window.Root},{New("UICorner",{CornerRadius=UDim.new(0,8)})})
		local TintMotor,TintTransparency=Creator.SpringMotor(1,D.TintFrame,"BackgroundTransparency",true)
		D.ButtonHolder=New("Frame",{Size=UDim2.new(1,-40,1,-40),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1},{New("UIListLayout",{Padding=UDim.new(0,10),FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder})})
		D.ButtonHolderFrame=New("Frame",{Size=UDim2.new(1,0,0,70),Position=UDim2.new(0,0,1,-70),ThemeTag={BackgroundColor3="DialogHolder"}},{New("Frame",{Size=UDim2.new(1,0,0,1),ThemeTag={BackgroundColor3="DialogHolderLine"}}),D.ButtonHolder})
		D.Title=New("TextLabel",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.SemiBold,Enum.FontStyle.Normal),Text="Dialog",TextColor3=Color3.fromRGB(240,240,240),TextSize=22,TextXAlignment=Enum.TextXAlignment.Left,Size=UDim2.new(1,0,0,22),Position=UDim2.fromOffset(20,25),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,AutoLocalize=false,ThemeTag={TextColor3="Text"}})
		D.Scale=New("UIScale",{Scale=1})
		local ScaleMotor,Scale=Creator.SpringMotor(1.1,D.Scale,"Scale")
		D.Root=New("CanvasGroup",{Size=UDim2.fromOffset(300,165),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),GroupTransparency=1,Parent=D.TintFrame,ThemeTag={BackgroundColor3="Dialog"}},{New("UICorner",{CornerRadius=UDim.new(0,8)}),New("UIStroke",{Transparency=0.5,ThemeTag={Color="DialogBorder"}}),D.Scale,D.Title,D.ButtonHolderFrame})
		local RootMotor,RootTransparency=Creator.SpringMotor(1,D.Root,"GroupTransparency")
		function D:Open() Library.DialogOpen=true;D.Scale.Scale=1.1;TintTransparency(0.75);RootTransparency(0);Scale(1) end
		function D:Close()
			Library.DialogOpen=false;TintTransparency(1);RootTransparency(1);Scale(1.1)
			D.Root.UIStroke:Destroy();task.wait(0.15);D.TintFrame:Destroy()
		end
		function D:Button(Title,Callback)
			D.Buttons=D.Buttons+1;Title=Title or "Button";Callback=Callback or function()end
			local Btn=Components.Button("",D.ButtonHolder,true);Btn.Title.Text=Title
			for _,b in next,D.ButtonHolder:GetChildren() do
				if b:IsA("TextButton") then b.Size=UDim2.new(1/D.Buttons,-(((D.Buttons-1)*10)/D.Buttons),0,32) end
			end
			Creator.AddSignal(Btn.Frame.MouseButton1Click,function() Library:SafeCallback(Callback);pcall(function() D:Close() end) end)
			return Btn
		end
		return D
	end
	return Dialog
end)()

Components.Notification=(function()
	local New=Creator.New
	local Notification={}
	function Notification:Init(GUI)
		Notification.Holder=New("Frame",{Position=UDim2.new(1,-30,1,-30),Size=UDim2.new(0,310,1,-30),AnchorPoint=Vector2.new(1,1),BackgroundTransparency=1,Parent=GUI},{New("UIListLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Bottom,Padding=UDim.new(0,20)})})
	end
	function Notification:New(Config)
		Config.Title=Config.Title or "Title";Config.Content=Config.Content or "Content"
		Config.SubContent=Config.SubContent or "";Config.Duration=Config.Duration or nil;Config.Buttons=Config.Buttons or {}
		local N={Closed=false}
		N.Title=New("TextLabel",{Position=UDim2.new(0,14,0,17),Text=Config.Title,RichText=true,TextColor3=Color3.fromRGB(255,255,255),TextTransparency=0,FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json"),TextSize=13,TextXAlignment="Left",TextYAlignment="Center",Size=UDim2.new(1,-12,0,12),TextWrapped=true,BackgroundTransparency=1,AutoLocalize=false,ThemeTag={TextColor3="Text"}})
		N.ContentLabel=New("TextLabel",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json"),Text=Config.Content,TextColor3=Color3.fromRGB(240,240,240),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,0,0,14),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,TextWrapped=true,AutoLocalize=false,ThemeTag={TextColor3="Text"}})
		N.SubContentLabel=New("TextLabel",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json"),Text=Config.SubContent,TextColor3=Color3.fromRGB(240,240,240),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,0,0,14),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,TextWrapped=true,AutoLocalize=false,ThemeTag={TextColor3="SubText"}})
		N.LabelHolder=New("Frame",{AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Position=UDim2.fromOffset(14,40),Size=UDim2.new(1,-28,0,0)},{New("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,Padding=UDim.new(0,3)}),N.ContentLabel,N.SubContentLabel})
		N.CloseButton=New("TextButton",{Text="",Position=UDim2.new(1,-14,0,13),Size=UDim2.fromOffset(20,20),AnchorPoint=Vector2.new(1,0),BackgroundTransparency=1},{New("ImageLabel",{Image=Components.Close,Size=UDim2.fromOffset(16,16),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,ThemeTag={ImageColor3="Text"}})})
		N.Root=New("Frame",{BackgroundTransparency=0,Size=UDim2.new(1,0,1,0),Position=UDim2.fromScale(1,0),ThemeTag={BackgroundColor3="AcrylicMain"}},{New("UICorner",{CornerRadius=UDim.new(0,8)}),New("UIStroke",{Transparency=0.5,ThemeTag={Color="AcrylicBorder"}}),N.Title,N.CloseButton,N.LabelHolder})
		if Config.Content=="" then N.ContentLabel.Visible=false end
		if Config.SubContent=="" then N.SubContentLabel.Visible=false end
		N.Holder=New("Frame",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,200),Parent=Notification.Holder},{N.Root})
		local RootMotor=Flipper.GroupMotor.new({Scale=1,Offset=60})
		RootMotor:onStep(function(V) N.Root.Position=UDim2.new(V.Scale,V.Offset,0,0) end)
		Creator.AddSignal(N.CloseButton.MouseButton1Click,function() N:Close() end)
		function N:Open()
			local sz=N.LabelHolder.AbsoluteSize.Y;N.Holder.Size=UDim2.new(1,0,0,58+sz)
			RootMotor:setGoal({Scale=Spring(0,{frequency=5}),Offset=Spring(0,{frequency=5})})
		end
		function N:Close()
			if not N.Closed then N.Closed=true
				task.spawn(function()
					RootMotor:setGoal({Scale=Spring(1,{frequency=5}),Offset=Spring(60,{frequency=5})})
					task.wait(0.4);N.Holder:Destroy()
				end)
			end
		end
		N:Open()
		if Config.Duration then task.delay(Config.Duration,function() N:Close() end) end
		return N
	end
	return Notification
end)()

Components.Textbox=function(Parent,Acrylic)
	Acrylic=Acrylic or false
	local Textbox={}
	Textbox.Input=New("TextBox",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json"),TextColor3=Color3.fromRGB(200,200,200),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,BackgroundColor3=Color3.fromRGB(255,255,255),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(10,0),ThemeTag={TextColor3="Text",PlaceholderColor3="SubText"}})
	Textbox.Container=New("Frame",{BackgroundTransparency=1,ClipsDescendants=true,Position=UDim2.new(0,6,0,0),Size=UDim2.new(1,-12,1,0)},{Textbox.Input})
	Textbox.Indicator=New("Frame",{Size=UDim2.new(1,-4,0,1),Position=UDim2.new(0,2,1,0),AnchorPoint=Vector2.new(0,1),BackgroundTransparency=Acrylic and 0.5 or 0,ThemeTag={BackgroundColor3=Acrylic and "InputIndicator" or "DialogInputLine"}})
	Textbox.Frame=New("Frame",{Size=UDim2.new(0,0,0,30),BackgroundTransparency=Acrylic and 0.9 or 0,Parent=Parent,ThemeTag={BackgroundColor3=Acrylic and "Input" or "DialogInput"}},{New("UICorner",{CornerRadius=UDim.new(0,4)}),New("UIStroke",{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=Acrylic and 0.5 or 0.65,ThemeTag={Color=Acrylic and "InElementBorder" or "DialogButtonBorder"}}),Textbox.Indicator,Textbox.Container})
	local function Update()
		local PADDING=2;local Reveal=Textbox.Container.AbsoluteSize.X
		if not Textbox.Input:IsFocused() or Textbox.Input.TextBounds.X<=Reveal-2*PADDING then
			Textbox.Input.Position=UDim2.new(0,PADDING,0,0)
		else
			local Cursor=Textbox.Input.CursorPosition
			if Cursor~=-1 then
				local subtext=string.sub(Textbox.Input.Text,1,Cursor-1)
				local width=TextService:GetTextSize(subtext,Textbox.Input.TextSize,Textbox.Input.Font,Vector2.new(math.huge,math.huge)).X
				local CCP=Textbox.Input.Position.X.Offset+width
				if CCP<PADDING then Textbox.Input.Position=UDim2.fromOffset(PADDING-width,0)
				elseif CCP>Reveal-PADDING-1 then Textbox.Input.Position=UDim2.fromOffset(Reveal-width-PADDING-1,0) end
			end
		end
	end
	task.spawn(Update)
	Creator.AddSignal(Textbox.Input:GetPropertyChangedSignal("Text"),Update)
	Creator.AddSignal(Textbox.Input:GetPropertyChangedSignal("CursorPosition"),Update)
	Creator.AddSignal(Textbox.Input.Focused,function()
		Update();Textbox.Indicator.Size=UDim2.new(1,-2,0,2);Textbox.Indicator.Position=UDim2.new(0,1,1,0);Textbox.Indicator.BackgroundTransparency=0
		Creator.OverrideTag(Textbox.Frame,{BackgroundColor3=Acrylic and "InputFocused" or "DialogHolder"})
		Creator.OverrideTag(Textbox.Indicator,{BackgroundColor3="InputIndicatorFocus"})
	end)
	Creator.AddSignal(Textbox.Input.FocusLost,function()
		Update();Textbox.Indicator.Size=UDim2.new(1,-4,0,1);Textbox.Indicator.Position=UDim2.new(0,2,1,0);Textbox.Indicator.BackgroundTransparency=0.5
		Creator.OverrideTag(Textbox.Frame,{BackgroundColor3=Acrylic and "Input" or "DialogInput"})
		Creator.OverrideTag(Textbox.Indicator,{BackgroundColor3=Acrylic and "InputIndicator" or "DialogInputLine"})
	end)
	return Textbox
end

Components.TitleBar=function(Config)
	local TitleBar={}
	local function BarButton(Icon,Pos,Parent,Callback)
		local Button={Callback=Callback or function()end}
		Button.Frame=New("TextButton",{Size=UDim2.new(0,28,1,-10),AnchorPoint=Vector2.new(1,0.5),BackgroundTransparency=1,Parent=Parent,Position=Pos,Text="",ThemeTag={BackgroundColor3="Text"}},{New("UICorner",{CornerRadius=UDim.new(0,6)}),New("ImageLabel",{Image=Icon,Size=UDim2.fromOffset(14,14),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Name="Icon",ThemeTag={ImageColor3="Text"}})})
		local Motor,SetTransparency=Creator.SpringMotor(1,Button.Frame,"BackgroundTransparency")
		AddSignal(Button.Frame.MouseEnter,function() SetTransparency(0.92) end)
		AddSignal(Button.Frame.MouseLeave,function() SetTransparency(1,true) end)
		AddSignal(Button.Frame.MouseButton1Down,function() SetTransparency(0.95) end)
		AddSignal(Button.Frame.MouseButton1Up,function() SetTransparency(0.92) end)
		AddSignal(Button.Frame.MouseButton1Click,Button.Callback)
		Button.SetCallback=function(Func) Button.Callback=Func end
		return Button
	end
	TitleBar.Frame=New("Frame",{Size=UDim2.new(1,0,0,40),BackgroundTransparency=1,Parent=Config.Parent})
	TitleBar.Frame:ClearAllChildren()
	New("ImageLabel",{Image="rbxassetid://15435099885",Size=UDim2.fromOffset(20,20),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,14,0.5,0),BackgroundTransparency=1,Parent=TitleBar.Frame},{New("UIAspectRatioConstraint",{AspectRatio=1,AspectType=Enum.AspectType.FitWithinMaxSize})})
	New("Frame",{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,42,0.5,0),Size=UDim2.new(1,-160,0,16),BackgroundTransparency=1,Parent=TitleBar.Frame},{
		New("UIListLayout",{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center}),
		New("TextLabel",{RichText=true,Text=Config.Title,FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.SemiBold,Enum.FontStyle.Normal),TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Size=UDim2.fromScale(0,1),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,AutoLocalize=false,LayoutOrder=1,ThemeTag={TextColor3="Text"}}),
		New("TextLabel",{RichText=true,Text=Config.SubTitle or "",TextTransparency=0.5,FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.SemiBold,Enum.FontStyle.Normal),TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Size=UDim2.fromScale(0,1),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,AutoLocalize=false,LayoutOrder=2,ThemeTag={TextColor3="SubText"}}),
	})
	New("Frame",{BackgroundTransparency=0.5,Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,1,0),Parent=TitleBar.Frame,ThemeTag={BackgroundColor3="TitleBarLine"}})
	TitleBar.CloseButton=BarButton(Components.Assets.Close,UDim2.new(1,-6,0.5,0),TitleBar.Frame,function()
		Library.Window:Dialog({Title="Close",Content="Are you sure you want to unload the interface?",Buttons={{Title="Yes",Callback=function() Library:Destroy() end},{Title="No"}}})
	end)
	TitleBar.MaxButton=BarButton(Components.Assets.Max,UDim2.new(1,-38,0.5,0),TitleBar.Frame,function() Config.Window.Maximize(not Config.Window.Maximized) end)
	TitleBar.MinButton=BarButton(Components.Assets.Min,UDim2.new(1,-70,0.5,0),TitleBar.Frame,function() Library.Window:Minimize() end)
	return TitleBar
end

Components.Window=(function()
	local New=Creator.New
	return function(Config)
		local Window={Minimized=false,Maximized=false,Size=Config.Size,CurrentPos=0,TabWidth=0,
			Position=UDim2.fromOffset(Camera.ViewportSize.X/2-Config.Size.X.Offset/2,Camera.ViewportSize.Y/2-Config.Size.Y.Offset/2)}
		local Dragging,DragInput,MousePos,StartPos=false
		local Resizing,ResizePos=false;local MinimizeNotif=false
		Window.TabWidth=Config.TabWidth
		local Selector=New("Frame",{Size=UDim2.fromOffset(4,0),BackgroundColor3=Color3.fromRGB(76,194,255),Position=UDim2.fromOffset(0,17),AnchorPoint=Vector2.new(0,0.5),ThemeTag={BackgroundColor3="Accent"}},{New("UICorner",{CornerRadius=UDim.new(0,2)})})
		local ResizeStartFrame=New("Frame",{Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Position=UDim2.new(1,-20,1,-20)})
		Window.TabHolder=New("ScrollingFrame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ScrollBarImageTransparency=1,ScrollBarThickness=0,BorderSizePixel=0,CanvasSize=UDim2.fromScale(0,0),ScrollingDirection=Enum.ScrollingDirection.Y},{New("UIListLayout",{Padding=UDim.new(0,4)})})
		local TabFrame=New("Frame",{Size=UDim2.new(0,Window.TabWidth,1,-66),Position=UDim2.new(0,12,0,54),BackgroundTransparency=1,ClipsDescendants=true},{Window.TabHolder,Selector})
		Window.TabDisplay=New("TextLabel",{RichText=true,Text="Tab",TextTransparency=0,FontFace=Font.new("rbxassetid://12187365364",Enum.FontWeight.SemiBold,Enum.FontStyle.Normal),TextSize=22,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Size=UDim2.new(1,-16,0,22),Position=UDim2.fromOffset(Window.TabWidth+26,56),BackgroundTransparency=1,AutoLocalize=false,ThemeTag={TextColor3="Text"}})
		Window.ContainerHolder=New("Frame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1})
		Window.ContainerAnim=New("CanvasGroup",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1})
		Window.ContainerCanvas=New("Frame",{Size=UDim2.new(1,-Window.TabWidth-32,1,-102),Position=UDim2.fromOffset(Window.TabWidth+26,90),BackgroundTransparency=1},{Window.ContainerAnim,Window.ContainerHolder})
		local AcrylicFrame=New("Frame",{Size=UDim2.fromScale(1,1),ThemeTag={BackgroundColor3="AcrylicMain"}},{New("UICorner",{CornerRadius=UDim.new(0,8)})})
		Window.AcrylicPaint={Frame=AcrylicFrame,Model=nil,AddParent=function()end,SetVisibility=function()end}
		Window.Root=New("Frame",{BackgroundTransparency=1,Size=Window.Size,Position=Window.Position,Parent=Config.Parent},{AcrylicFrame,Window.TabDisplay,Window.ContainerCanvas,TabFrame,ResizeStartFrame})
		Window.TitleBar=Components.TitleBar({Title=Config.Title,SubTitle=Config.SubTitle,Parent=Window.Root,Window=Window})
		if Library.UseAcrylic then Window.AcrylicPaint.AddParent(Window.Root) end
		local SizeMotor=Flipper.GroupMotor.new({X=Window.Size.X.Offset,Y=Window.Size.Y.Offset})
		local PosMotor=Flipper.GroupMotor.new({X=Window.Position.X.Offset,Y=Window.Position.Y.Offset})
		Window.SelectorPosMotor=Flipper.SingleMotor.new(17)
		Window.SelectorSizeMotor=Flipper.SingleMotor.new(0)
		Window.ContainerBackMotor=Flipper.SingleMotor.new(0)
		Window.ContainerPosMotor=Flipper.SingleMotor.new(94)
		SizeMotor:onStep(function(v) Window.Root.Size=UDim2.new(0,v.X,0,v.Y) end)
		PosMotor:onStep(function(v) Window.Root.Position=UDim2.new(0,v.X,0,v.Y) end)
		local LastValue=0;local LastTime=0
		Window.SelectorPosMotor:onStep(function(Value)
			Selector.Position=UDim2.new(0,0,0,Value+17)
			local Now=tick();local DeltaTime=Now-LastTime
			if LastValue~=nil then Window.SelectorSizeMotor:setGoal(Spring((math.abs(Value-LastValue)/(DeltaTime*60))+16));LastValue=Value end
			LastTime=Now
		end)
		Window.SelectorSizeMotor:onStep(function(Value) Selector.Size=UDim2.new(0,4,0,Value) end)
		Window.ContainerBackMotor:onStep(function(Value) Window.ContainerAnim.GroupTransparency=Value end)
		Window.ContainerPosMotor:onStep(function(Value) Window.ContainerAnim.Position=UDim2.fromOffset(0,Value) end)
		local OldSizeX;local OldSizeY
		Window.Maximize=function(Value,NoPos,Inst)
			Window.Maximized=Value
			Window.TitleBar.MaxButton.Frame.Icon.Image=Value and Components.Assets.Restore or Components.Assets.Max
			if Value then OldSizeX=Window.Size.X.Offset;OldSizeY=Window.Size.Y.Offset end
			local SX=Value and Camera.ViewportSize.X or OldSizeX;local SY=Value and Camera.ViewportSize.Y or OldSizeY
			SizeMotor:setGoal({X=Flipper[Inst and "Instant" or "Spring"].new(SX,{frequency=6}),Y=Flipper[Inst and "Instant" or "Spring"].new(SY,{frequency=6})})
			Window.Size=UDim2.fromOffset(SX,SY)
			if not NoPos then PosMotor:setGoal({X=Spring(Value and 0 or Window.Position.X.Offset,{frequency=6}),Y=Spring(Value and 0 or Window.Position.Y.Offset,{frequency=6})}) end
		end
		Creator.AddSignal(Window.TitleBar.Frame.InputBegan,function(Input)
			if Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==Enum.UserInputType.Touch then
				Dragging=true;MousePos=Input.Position;StartPos=Window.Root.Position
				if Window.Maximized then StartPos=UDim2.fromOffset(Mouse.X-(Mouse.X*((OldSizeX-100)/Window.Root.AbsoluteSize.X)),Mouse.Y-(Mouse.Y*(OldSizeY/Window.Root.AbsoluteSize.Y))) end
				Input.Changed:Connect(function() if Input.UserInputState==Enum.UserInputState.End then Dragging=false end end)
			end
		end)
		Creator.AddSignal(Window.TitleBar.Frame.InputChanged,function(Input) if Input.UserInputType==Enum.UserInputType.MouseMovement or Input.UserInputType==Enum.UserInputType.Touch then DragInput=Input end end)
		Creator.AddSignal(ResizeStartFrame.InputBegan,function(Input) if Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==Enum.UserInputType.Touch then Resizing=true;ResizePos=Input.Position end end)
		Creator.AddSignal(UserInputService.InputChanged,function(Input)
			if Input==DragInput and Dragging then
				local Delta=Input.Position-MousePos
				Window.Position=UDim2.fromOffset(StartPos.X.Offset+Delta.X,StartPos.Y.Offset+Delta.Y)
				PosMotor:setGoal({X=Instant(Window.Position.X.Offset),Y=Instant(Window.Position.Y.Offset)})
				if Window.Maximized then Window.Maximize(false,true,true) end
			end
			if(Input.UserInputType==Enum.UserInputType.MouseMovement or Input.UserInputType==Enum.UserInputType.Touch)and Resizing then
				local Delta=Input.Position-ResizePos;local StartSize=Window.Size
				local TS=Vector3.new(StartSize.X.Offset,StartSize.Y.Offset,0)+Vector3.new(1,1,0)*Delta
				local TSC=Vector2.new(math.clamp(TS.X,470,2048),math.clamp(TS.Y,380,2048))
				SizeMotor:setGoal({X=Flipper.Instant.new(TSC.X),Y=Flipper.Instant.new(TSC.Y)})
			end
		end)
		Creator.AddSignal(UserInputService.InputEnded,function(Input)
			if Resizing==true or Input.UserInputType==Enum.UserInputType.Touch then
				Resizing=false;Window.Size=UDim2.fromOffset(SizeMotor:getValue().X,SizeMotor:getValue().Y)
			end
		end)
		Creator.AddSignal(Window.TabHolder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"),function()
			Window.TabHolder.CanvasSize=UDim2.new(0,0,0,Window.TabHolder.UIListLayout.AbsoluteContentSize.Y)
		end)
		Creator.AddSignal(UserInputService.InputBegan,function(Input)
			if type(Library.MinimizeKeybind)=="table" and Library.MinimizeKeybind.Type=="Keybind" and not UserInputService:GetFocusedTextBox() then
				if Input.KeyCode.Name==Library.MinimizeKeybind.Value then Window:Minimize() end
			elseif Input.KeyCode==Library.MinimizeKey and not UserInputService:GetFocusedTextBox() then
				Window:Minimize()
			end
		end)
		function Window:ToggleInterface() Window.Minimized=not Window.Minimized;Window.Root.Visible=not Window.Minimized end
		function Window:Minimize()
			Window.Minimized=not Window.Minimized;Window.Root.Visible=not Window.Minimized
			if not MinimizeNotif then
				MinimizeNotif=true
				local Key=Library.MinimizeKeybind and Library.MinimizeKeybind.Value or Library.MinimizeKey.Name
				Library:Notify({Title="Interface",Content="Press "..Key.." to toggle the interface.",Duration=6})
			end
		end
		function Window:Destroy() Window.Root:Destroy() end
		local DialogModule=Components.Dialog:Init(Window)
		function Window:Dialog(Config)
			local Dialog=DialogModule:Create();Dialog.Title.Text=Config.Title
			local Content=New("TextLabel",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json"),Text=Config.Content,TextColor3=Color3.fromRGB(240,240,240),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Size=UDim2.new(1,-40,1,0),Position=UDim2.fromOffset(20,60),BackgroundTransparency=1,Parent=Dialog.Root,ClipsDescendants=false,AutoLocalize=false,ThemeTag={TextColor3="Text"}})
			New("UISizeConstraint",{MinSize=Vector2.new(300,165),MaxSize=Vector2.new(620,math.huge),Parent=Dialog.Root})
			Dialog.Root.Size=UDim2.fromOffset(Content.TextBounds.X+40,165)
			if Content.TextBounds.X+40>Window.Size.X.Offset-120 then
				Dialog.Root.Size=UDim2.fromOffset(Window.Size.X.Offset-120,165)
				Content.TextWrapped=true
				Dialog.Root.Size=UDim2.fromOffset(Window.Size.X.Offset-120,Content.TextBounds.Y+150)
			end
			local ButtonRefs={}
			for _,Button in next,Config.Buttons do
				local Btn=Dialog:Button(Button.Title,Button.Callback)
				table.insert(ButtonRefs,{Label=Btn.Title,Text=Button.Title})
			end
			Dialog:Open()
			-- NEW: tu dong dich dialog (title/content/buttons) neu Auto Translate dang bat
			if Library.DialogTranslateHook then
				Library.DialogTranslateHook(Dialog.Title,Content,ButtonRefs,Config)
			end
		end
		local TabModule=Components.Tab:Init(Window)
		function Window:AddTab(TabConfig) return TabModule:New(TabConfig.Title,TabConfig.Icon,Window.TabHolder) end
		function Window:GetCurrentTab() return TabModule:GetCurrentTab() end
		function Window:TabChanged(func) TabModule.Callback=func end
		function Window:SelectTab(Tab) TabModule:SelectTab(Tab) end
		Creator.AddSignal(Window.TabHolder:GetPropertyChangedSignal("CanvasPosition"),function()
			LastValue=TabModule:GetCurrentTabPos()+16;LastTime=0
			Window.SelectorPosMotor:setGoal(Instant(TabModule:GetCurrentTabPos()))
		end)
		return Window
	end
end)()

-- ==================== ELEMENT TABLE ====================

local ElementsTable={}

ElementsTable.Button=(function()
	local Element={};Element.__index=Element;Element.__type="Button"
	function Element:New(Config)
		assert(Config.Title,"Button - Missing Title")
		Config.Callback=Config.Callback or function()end
		local ButtonFrame=Components.Element(Config.Title,Config.Description,self.Container,true,Config)
		New("ImageLabel",{Image="rbxassetid://10734898476",Size=UDim2.fromOffset(16,16),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),BackgroundTransparency=1,Parent=ButtonFrame.Frame,ThemeTag={ImageColor3="Text"}})
		Creator.AddSignal(ButtonFrame.Frame.MouseButton1Click,function() Library:SafeCallback(Config.Callback) end)
		return ButtonFrame
	end
	return Element
end)()

ElementsTable.Toggle=(function()
	local Element={};Element.__index=Element;Element.__type="Toggle"
	function Element:New(Idx,Config)
		assert(Config.Title,"Toggle - Missing Title")
		local Toggle={OriginalTitle=Config.Title,OriginalDesc=Config.Description,Value=Config.Default or false,Callback=Config.Callback or function(Value)end,Type="Toggle"}
		local ToggleFrame=Components.Element(Config.Title,Config.Description,self.Container,true,Config)
		ToggleFrame.DescLabel.Size=UDim2.new(1,-54,0,14)
		Toggle.SetTitle=ToggleFrame.SetTitle;Toggle.AddText=ToggleFrame.AddText;Toggle.SetDesc=ToggleFrame.SetDesc
		Toggle.Visible=ToggleFrame.Visible;Toggle.GetOriginalText=ToggleFrame.GetOriginalText;Toggle.Elements=ToggleFrame
		local Track=New("Frame",{Size=UDim2.fromOffset(44,24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),BackgroundColor3=Color3.fromRGB(60,60,60),Parent=ToggleFrame.Frame,ThemeTag={BackgroundColor3="Element"}},{New("UICorner",{CornerRadius=UDim.new(1,0)}),New("UIStroke",{Transparency=0.6,Thickness=1,ApplyStrokeMode=Enum.ApplyStrokeMode.Border,ThemeTag={Color="InElementBorder"}})})
		local Fill=New("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=Color3.fromRGB(96,205,255),ThemeTag={BackgroundColor3="Accent"},Parent=Track},{New("UICorner",{CornerRadius=UDim.new(1,0)})})
		local Thumb=New("Frame",{Size=UDim2.fromOffset(16,16),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,3,0.5,0),BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=3,Parent=Track},{New("UICorner",{CornerRadius=UDim.new(1,0)})})
		local TI_FAST=TweenInfo.new(0.22,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
		local TI_BACK=TweenInfo.new(0.20,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
		local TI_QUICK=TweenInfo.new(0.10,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
		local function applyOff() TweenService:Create(Fill,TI_FAST,{Size=UDim2.new(0,0,1,0)}):Play();TweenService:Create(Thumb,TI_BACK,{Position=UDim2.new(0,3,0.5,0)}):Play() end
		local function applyOn() TweenService:Create(Fill,TI_FAST,{Size=UDim2.fromScale(1,1)}):Play();TweenService:Create(Thumb,TI_BACK,{Position=UDim2.new(0,23,0.5,0)}):Play() end
		Creator.AddSignal(ToggleFrame.Frame.MouseButton1Down,function() TweenService:Create(Thumb,TI_QUICK,{Size=UDim2.fromOffset(Toggle.Value and 14 or 18,16)}):Play() end)
		Creator.AddSignal(ToggleFrame.Frame.MouseButton1Up,function() TweenService:Create(Thumb,TI_BACK,{Size=UDim2.fromOffset(16,16)}):Play() end)
		function Toggle:OnChanged(Func) Toggle.Changed=Func;Func(Toggle.Value) end
		function Toggle:SetValue(Value)
			Value=not not Value;Toggle.Value=Value
			if Value then applyOn() else applyOff() end
			Library:SafeCallbackToggles(Config.Title,Toggle.Callback,Toggle.Value)
			Library:SafeCallbackToggles(Config.Title,Toggle.Changed,Toggle.Value)
		end
		function Toggle:GetValue() return self.Value end
		function Toggle:Destroy() ToggleFrame:Destroy();Library.Options[Idx]=nil end
		Creator.AddSignal(ToggleFrame.Frame.MouseButton1Click,function() Toggle:SetValue(not Toggle.Value) end)
		Toggle:SetValue(Toggle.Value)
		Library.Options[Idx]=Toggle;return Toggle
	end
	return Element
end)()

ElementsTable.Dropdown=(function()
	local Element={};Element.__index=Element;Element.__type="Dropdown"
	function Element:New(Idx,Config)
		local Dropdown={Values=Config.Values,Value=Config.Default,Multi=Config.Multi,Buttons={},Opened=false,Type="Dropdown",Callback=Config.Callback or function()end,Searchable=Config.Searchable or false,LoadedItems=0,BatchSize=20,IsLoadingBatch=false}
		if Dropdown.Multi and Config.AllowNull then Dropdown.Value={} end
		local DropdownFrame=Components.Element(Config.Title,Config.Description,self.Container,false,Config)
		DropdownFrame.DescLabel.Size=UDim2.new(1,-170,0,14)
		Dropdown.SetTitle=DropdownFrame.SetTitle;Dropdown.SetDesc=DropdownFrame.SetDesc;Dropdown.Visible=DropdownFrame.Visible;Dropdown.Elements=DropdownFrame
		local DropdownDisplay=New("TextBox",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal),Text="",PlaceholderText="...",PlaceholderColor3=Color3.fromRGB(200,200,200),TextColor3=Color3.fromRGB(240,240,240),TextSize=13,AutomaticSize=Enum.AutomaticSize.Y,TextYAlignment=Enum.TextYAlignment.Center,TextXAlignment=Enum.TextXAlignment.Left,Size=UDim2.new(1,Dropdown.Multi and -26 or -20,0.5,0),Position=UDim2.new(0,6,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,TextTruncate=Enum.TextTruncate.AtEnd,Interactable=false,AutoLocalize=false,ThemeTag={TextColor3="Text",PlaceholderColor3="SubText"}})
		local DropdownIco=New("ImageLabel",{Image="rbxassetid://10709790948",Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-4,0.5,0),BackgroundTransparency=1,Rotation=90,ThemeTag={ImageColor3="SubText"}})
		local DropdownInner=New("TextButton",{Size=UDim2.fromOffset(160,28),Position=UDim2.new(1,-10,0.5,0),AnchorPoint=Vector2.new(1,0.5),BackgroundTransparency=0.9,Parent=DropdownFrame.Frame,AutoLocalize=false,ThemeTag={BackgroundColor3="DropdownFrame"}},{New("UICorner",{CornerRadius=UDim.new(0,10)}),DropdownIco,DropdownDisplay})
		local _,SetDropdownHover=Creator.SpringMotor(0.9,DropdownInner,"BackgroundTransparency")
		Creator.AddSignal(DropdownInner.MouseEnter,function() SetDropdownHover(0.8) end)
		Creator.AddSignal(DropdownInner.MouseLeave,function() SetDropdownHover(0.9) end)
		local DropdownListLayout=New("UIListLayout",{Padding=UDim.new(0,10)})
		local DropdownScrollFrame=New("ScrollingFrame",{Size=UDim2.new(1,-8,1,-12),Position=UDim2.fromOffset(6,6),BackgroundTransparency=1,BottomImage="rbxassetid://6889812791",MidImage="rbxassetid://6889812721",TopImage="rbxassetid://6276641225",ScrollBarImageColor3=Color3.fromRGB(120,120,120),ScrollBarImageTransparency=0.6,ScrollBarThickness=6,BorderSizePixel=0,CanvasSize=UDim2.fromScale(0,0),ScrollingDirection=Enum.ScrollingDirection.Y},{DropdownListLayout})
		local DropdownHolderFrame=New("Frame",{Size=UDim2.fromScale(1,0.6),ThemeTag={BackgroundColor3="DropdownHolder"}},{New("UICorner",{CornerRadius=UDim.new(0,20)}),New("UIStroke",{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=0.5,ThemeTag={Color="InElementBorder"}}),DropdownScrollFrame})
		local DropdownHolderCanvas=New("Frame",{BackgroundTransparency=1,Size=UDim2.fromOffset(170,300),Parent=Library.GUI,Visible=false},{DropdownHolderFrame,New("UISizeConstraint",{MinSize=Vector2.new(170,0)})})
		local SearchBase=New("Frame",{Visible=false,Size=UDim2.new(0,170,0,35),Parent=Library.GUI,ThemeTag={BackgroundColor3="DropdownHolder"}},{New("UICorner",{CornerRadius=UDim.new(0,8)})})
		local DropdownSearch=New("TextBox",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal),Text="",PlaceholderText="Search...",PlaceholderColor3=Color3.fromRGB(180,180,190),Parent=SearchBase,TextColor3=Color3.fromRGB(240,240,240),TextSize=14,TextYAlignment=Enum.TextYAlignment.Center,TextXAlignment=Enum.TextXAlignment.Left,Size=UDim2.new(1,-10,1,-4),Position=UDim2.new(0,8,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Interactable=true,AutoLocalize=false,ThemeTag={TextColor3="Text",PlaceholderColor3="SubText"}})
		table.insert(Library.OpenFrames,DropdownHolderCanvas)
		local XADD=195;local MAX_DROPDOWN_ITEMS=5
		local MoveList={{Instance=DropdownHolderCanvas,YOffset=35},{Instance=SearchBase,YOffset=0}}
		local function RecalculateListPosition()
			local Add=0
			local available=Camera.ViewportSize.Y-DropdownInner.AbsolutePosition.Y
			local needed=DropdownHolderCanvas.AbsoluteSize.Y-5
			if available<needed then Add=needed-available+40 end
			local baseX=DropdownInner.AbsolutePosition.X-1+XADD
			local baseY=DropdownInner.AbsolutePosition.Y+(-5-Add)
			for _,entry in ipairs(MoveList) do
				local inst=entry.Instance
				if inst then inst.Position=UDim2.fromOffset(baseX+(entry.XOffset or 0),baseY+(entry.YOffset or 0)) end
			end
		end
		local ListSizeX=0
		local function RecalculateListSize()
			if #Dropdown.Values>MAX_DROPDOWN_ITEMS then DropdownHolderCanvas.Size=UDim2.fromOffset(ListSizeX,(42*MAX_DROPDOWN_ITEMS)-10)
			else DropdownHolderCanvas.Size=UDim2.fromOffset(ListSizeX,DropdownListLayout.AbsoluteContentSize.Y+30) end
		end
		local function RecalculateCanvasSize()
			local li=Dropdown.LoadedItems;local ti=#Dropdown.Values
			local h=li*36+math.max(0,li-1)*4
			if li<ti then h=h+45 end
			DropdownScrollFrame.CanvasSize=UDim2.fromOffset(0,h)
		end
		RecalculateListPosition();RecalculateListSize()
		Creator.AddSignal(DropdownInner:GetPropertyChangedSignal("AbsolutePosition"),RecalculateListPosition)
		Creator.AddSignal(DropdownScrollFrame:GetPropertyChangedSignal("CanvasPosition"),function()
			if not Dropdown.Opened or Dropdown.IsLoadingBatch then return end
			local sp=DropdownScrollFrame.CanvasPosition.Y;local sh=DropdownScrollFrame.AbsoluteSize.Y;local ch=DropdownScrollFrame.CanvasSize.Y.Offset
			if sp+sh>=ch-50 and Dropdown.LoadedItems<#Dropdown.Values then Dropdown:LoadNextBatch() end
		end)
		Creator.AddSignal(DropdownSearch:GetPropertyChangedSignal("Text"),function()
			local Text=DropdownSearch.Text
			for _,E in next,DropdownScrollFrame:GetChildren() do
				if not E:IsA("UIListLayout") and E.Name~="LoadingIndicator" then
					local V=E.ButtonLabel and E.ButtonLabel.Text or ""
					E.Visible=#Text==0 or (V:lower():match(Text:lower())~=nil)
				end
			end
			RecalculateListPosition();RecalculateListSize()
		end)
		Creator.AddSignal(DropdownSearch.Focused,function() DropdownSearch.Text="" end)
		Creator.AddSignal(UserInputService.InputBegan,function(input)
			if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
				if not Dropdown.Opened then return end
				local pos=input.Position
				local function inBounds(frame)
					return frame.AbsolutePosition.X<=pos.X and pos.X<=frame.AbsolutePosition.X+frame.AbsoluteSize.X
						and frame.AbsolutePosition.Y<=pos.Y and pos.Y<=frame.AbsolutePosition.Y+frame.AbsoluteSize.Y
				end
				if not inBounds(DropdownInner) and not inBounds(DropdownHolderFrame) and not(SearchBase.Visible and inBounds(SearchBase)) then
					Dropdown:Close()
				end
			end
		end)
		Creator.AddSignal(DropdownInner.MouseButton1Click,function() if Dropdown.Opened then Dropdown:Close() else Dropdown:Open() end end)
		local ScrollFrame=self.ScrollFrame
		function Dropdown:Open()
			Dropdown.Opened=true
			if Dropdown.Searchable then SearchBase.Visible=true end
			ScrollFrame.ScrollingEnabled=false;DropdownHolderCanvas.Visible=true
			if Dropdown.LoadedItems==0 and #Dropdown.Values>0 then Dropdown:LoadNextBatch() end
			DropdownHolderFrame.Size=UDim2.fromScale(1,0)
			TweenService:Create(DropdownHolderFrame,TweenInfo.new(0.28,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Size=UDim2.fromScale(1,1)}):Play()
			TweenService:Create(DropdownIco,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Rotation=-90}):Play()
		end
		function Dropdown:Close()
			Dropdown.Opened=false;SearchBase.Visible=false
			ScrollFrame.ScrollingEnabled=true;DropdownDisplay.Interactable=false
			DropdownHolderFrame.Size=UDim2.fromScale(1,0.6);DropdownHolderCanvas.Visible=false
			TweenService:Create(DropdownIco,TweenInfo.new(0.4,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Rotation=90}):Play()
			DropdownSearch:ReleaseFocus(false);Dropdown:Display()
		end
		function Dropdown:Display()
			local Values=Dropdown.Values;local Str=""
			if Config.Multi then
				local count=0
				for _,Value in next,Values do
					if Dropdown.Value[Value] then count=count+1
						if count<=3 then Str=Str..Value..", "
						elseif count==4 then Str=Str.."and "..(count-3).." more...";break end
					end
				end
				if count<=3 then Str=Str:sub(1,#Str-2) end
			else Str=Dropdown.Value or "" end
			DropdownDisplay.PlaceholderText=(Str=="" and "..." or Str)
		end
		function Dropdown:GetActiveValues()
			if Config.Multi then local T={};for Value,_ in next,Dropdown.Value do table.insert(T,Value) end;return T
			else return Dropdown.Value and 1 or 0 end
		end
		local function LoadItem(Idx,Value)
			local Table={}
			local ButtonAccent=New("Frame",{Size=UDim2.new(0,3,0,0),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,0,0.5,0),BackgroundTransparency=1,ThemeTag={BackgroundColor3="Accent"}},{New("UICorner",{CornerRadius=UDim.new(0,2)})})
			local ButtonLabel=New("TextLabel",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json"),Text=tostring(Value),TextColor3=Color3.fromRGB(200,200,200),TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.Y,Size=UDim2.new(1,-28,1,0),Position=UDim2.fromOffset(14,0),Name="ButtonLabel",AutoLocalize=false,ThemeTag={TextColor3="Text"}})
			local SelectDot=New("Frame",{Size=UDim2.fromOffset(6,6),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),BackgroundTransparency=1,ThemeTag={BackgroundColor3="Accent"}},{New("UICorner",{CornerRadius=UDim.new(1,0)})})
			local Button=New("TextButton",{Size=UDim2.new(1,-10,0,34),BackgroundTransparency=1,ZIndex=23,Text="",Parent=DropdownScrollFrame,LayoutOrder=Idx,ThemeTag={BackgroundColor3="DropdownOption"}},{New("UICorner",{CornerRadius=UDim.new(0,14)}),ButtonAccent,ButtonLabel,SelectDot})
			local Selected=Config.Multi and (Dropdown.Value[Value]==true) or (Dropdown.Value==Value)
			local TI=TweenInfo.new(0.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
			local function applyState(sel)
				TweenService:Create(Button,TI,{BackgroundTransparency=sel and 0.82 or 1}):Play()
				TweenService:Create(ButtonAccent,TI,{BackgroundTransparency=sel and 0 or 1,Size=sel and UDim2.new(0,3,0.5,0) or UDim2.new(0,3,0,0)}):Play()
				TweenService:Create(SelectDot,TI,{BackgroundTransparency=sel and 0 or 1}):Play()
				TweenService:Create(ButtonLabel,TI,{TextTransparency=sel and 0 or 0.15}):Play()
			end
			Creator.AddSignal(Button.MouseEnter,function() if not Selected then TweenService:Create(Button,TI,{BackgroundTransparency=0.90}):Play();TweenService:Create(ButtonLabel,TI,{TextTransparency=0}):Play() end end)
			Creator.AddSignal(Button.MouseLeave,function() TweenService:Create(Button,TI,{BackgroundTransparency=Selected and 0.82 or 1}):Play();TweenService:Create(ButtonLabel,TI,{TextTransparency=Selected and 0 or 0.15}):Play() end)
			Creator.AddSignal(Button.MouseButton1Down,function() TweenService:Create(Button,TI,{BackgroundTransparency=0.72}):Play() end)
			Creator.AddSignal(Button.MouseButton1Up,function() TweenService:Create(Button,TI,{BackgroundTransparency=Selected and 0.82 or 0.90}):Play() end)
			function Table:UpdateButton()
				Selected=Config.Multi and(Dropdown.Value[Value]==true) or(Dropdown.Value==Value)
				applyState(Selected)
			end
			AddSignal(Button.Activated,function()
				local Try=not Selected
				if Dropdown:GetActiveValues()==1 and not Try and not Config.AllowNull then
				else
					if Config.Multi then Selected=Try;Dropdown.Value[Value]=Selected and true or nil
					else Selected=Try;Dropdown.Value=Selected and Value or nil
						for _,OtherButton in next,Dropdown.Buttons do OtherButton:UpdateButton() end
					end
					Table:UpdateButton()
					if not(Dropdown.Searchable and #DropdownDisplay.Text>0) then Dropdown:Display() end
					Library:SafeCallback(Dropdown.Callback,Dropdown.Value);Library:SafeCallback(Dropdown.Changed,Dropdown.Value)
				end
			end)
			Table:UpdateButton();Dropdown.Buttons[Button]=Table
			return Button
		end
		function Dropdown:LoadNextBatch()
			if Dropdown.IsLoadingBatch or Dropdown.LoadedItems>=#Dropdown.Values then return end
			Dropdown.IsLoadingBatch=true
			task.spawn(function()
				local s=Dropdown.LoadedItems+1;local e=math.min(s+Dropdown.BatchSize-1,#Dropdown.Values)
				for i=s,e do
					if Dropdown.Values[i] then LoadItem(i,Dropdown.Values[i]);if i%10==0 then task.wait() end end
				end
				Dropdown.LoadedItems=e;Dropdown.IsLoadingBatch=false
				RecalculateCanvasSize();RecalculateListSize();Dropdown:Display()
			end)
		end
		function Dropdown:LoadRequiredItems(targetValues)
			task.spawn(function()
				for _,E in next,DropdownScrollFrame:GetChildren() do if not E:IsA("UIListLayout") and E.Name~="LoadingIndicator" then E:Destroy() end end
				Dropdown.Buttons={};Dropdown.LoadedItems=0;ListSizeX=0
				local idx={}
				for _,tv in ipairs(targetValues) do
					local ti=table.find(Dropdown.Values,tv)
					if ti then for i=math.max(1,ti-10),math.min(#Dropdown.Values,ti+10) do idx[i]=true end end
				end
				local n=0
				for i=1,#Dropdown.Values do if idx[i] then LoadItem(i,Dropdown.Values[i]);n=n+1 end end
				Dropdown.LoadedItems=n;RecalculateCanvasSize();RecalculateListSize();Dropdown:Display()
			end)
		end
		function Dropdown:BuildDropdownList()
			task.spawn(function()
				for _,E in next,DropdownScrollFrame:GetChildren() do if not E:IsA("UIListLayout") and E.Name~="LoadingIndicator" then E:Destroy() end end
				Dropdown.Buttons={};Dropdown.LoadedItems=0;ListSizeX=0;DropdownScrollFrame.CanvasSize=UDim2.fromOffset(0,0)
			end)
		end
		function Dropdown:SetValues(NewValues) if NewValues then Dropdown.Values=NewValues end;Dropdown:BuildDropdownList() end
		function Dropdown:OnChanged(Func) Dropdown.Changed=Func;Func(Dropdown.Value) end
		function Dropdown:SetValue(Val)
			local needsLoading=false;local targetValues={}
			if Dropdown.Multi then
				local nTable={}
				for Value,_ in next,Val do if table.find(Dropdown.Values,Value) then nTable[Value]=true;table.insert(targetValues,Value) end end
				Dropdown.Value=nTable;needsLoading=next(nTable)~=nil
			else
				if not Val then Dropdown.Value=nil
				elseif table.find(Dropdown.Values,Val) then Dropdown.Value=Val;table.insert(targetValues,Val);needsLoading=true end
			end
			if needsLoading and #targetValues>0 then Dropdown:LoadRequiredItems(targetValues) else Dropdown:BuildDropdownList() end
			Library:SafeCallback(Dropdown.Callback,Dropdown.Value);Library:SafeCallback(Dropdown.Changed,Dropdown.Value);wait(.2)
		end
		function Dropdown:GetValue() return self.Value end
		function Dropdown:Destroy() DropdownFrame:Destroy();Library.Options[Idx]=nil end
		function Dropdown:ClearAll()
			if Dropdown.Multi then Dropdown.Value={};for _,B in next,Dropdown.Buttons do B:UpdateButton() end;Dropdown:Display();Library:SafeCallback(Dropdown.Callback,Dropdown.Value);Library:SafeCallback(Dropdown.Changed,Dropdown.Value) end
		end
		Dropdown:BuildDropdownList();Dropdown:Display()
		local Defaults={}
		if type(Config.Default)=="string" then local i=table.find(Dropdown.Values,Config.Default);if i then table.insert(Defaults,i) end
		elseif type(Config.Default)=="table" then for _,V in next,Config.Default do local i=table.find(Dropdown.Values,V);if i then table.insert(Defaults,i) end end
		elseif type(Config.Default)=="number" and Dropdown.Values[Config.Default]~=nil then table.insert(Defaults,Config.Default) end
		if next(Defaults) then
			for i=1,#Defaults do
				local Index=Defaults[i]
				if Config.Multi then Dropdown.Value[Dropdown.Values[Index]]=true else Dropdown.Value=Dropdown.Values[Index] end
				if not Config.Multi then break end
			end
			local tv={}
			if Config.Multi then for v,_ in pairs(Dropdown.Value) do table.insert(tv,v) end else if Dropdown.Value then table.insert(tv,Dropdown.Value) end end
			if #tv>0 then Dropdown:LoadRequiredItems(tv) else Dropdown:BuildDropdownList() end
			Dropdown:Display()
		else Dropdown:BuildDropdownList();Dropdown:Display() end
		Library.Options[Idx]=Dropdown;return Dropdown
	end
	return Element
end)()

ElementsTable.Paragraph=(function()
	local Paragraph={};Paragraph.__index=Paragraph;Paragraph.__type="Paragraph"
	function Paragraph:New(Config)
		assert(Config.Title,"Paragraph - Missing Title");Config.Content=Config.Content or ""
		local Para=Components.Element(Config.Title,Config.Content,Paragraph.Container,false,Config)
		Para.Frame.BackgroundTransparency=0.92;Para.Border.Transparency=0.6
		return Para
	end
	return Paragraph
end)()

ElementsTable.Slider=(function()
	local Element={};Element.__index=Element;Element.__type="Slider"
	function Element:New(Idx,Config)
		assert(Config.Title,"Slider - Missing Title.");assert(Config.Default,"Slider - Missing default value.")
		assert(Config.Min,"Slider - Missing minimum value.");assert(Config.Max,"Slider - Missing maximum value.")
		assert(Config.Rounding,"Slider - Missing rounding value.")
		local Slider={Value=nil,Min=Config.Min,Max=Config.Max,Rounding=Config.Rounding,Callback=Config.Callback or function(Value)end,Type="Slider"}
		local Dragging=false
		local SliderFrame=Components.Element(Config.Title,Config.Description,self.Container,false,Config)
		SliderFrame.TitleLabel.Size=UDim2.new(1,-60,0,14);SliderFrame.DescLabel.Size=UDim2.new(1,-60,0,14)
		Slider.Elements=SliderFrame;Slider.SetTitle=SliderFrame.SetTitle;Slider.SetDesc=SliderFrame.SetDesc;Slider.Visible=SliderFrame.Visible
		local SliderDisplay=New("TextBox",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json"),Text=tostring(Config.Default),PlaceholderText="",TextSize=12,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,BackgroundTransparency=0.85,Size=UDim2.new(0,48,0,20),Position=UDim2.new(1,-10,0,8),AnchorPoint=Vector2.new(1,0),ZIndex=4,Parent=SliderFrame.Frame,ThemeTag={TextColor3="SubText",BackgroundColor3="Element"}},{New("UICorner",{CornerRadius=UDim.new(0,4)}),New("UIStroke",{Thickness=1,Transparency=0.5,ApplyStrokeMode=Enum.ApplyStrokeMode.Border,ThemeTag={Color="InElementBorder"}})})
		local SliderRail=New("Frame",{BackgroundTransparency=1,Position=UDim2.fromOffset(7,0),Size=UDim2.new(1,-14,1,0)})
		local RailBg=New("Frame",{Size=UDim2.new(1,0,0,3),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundTransparency=0.65,Parent=SliderRail,ThemeTag={BackgroundColor3="SliderRail"}},{New("UICorner",{CornerRadius=UDim.new(1,0)})})
		local SliderFill=New("Frame",{Size=UDim2.fromScale(0,1),Parent=RailBg,ThemeTag={BackgroundColor3="Accent"}},{New("UICorner",{CornerRadius=UDim.new(1,0)})})
		local SliderDot=New("Frame",{Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,-7,0.5,0),BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=5,Parent=SliderRail},{New("UICorner",{CornerRadius=UDim.new(1,0)}),New("UIStroke",{Thickness=1.5,Transparency=0.35,ApplyStrokeMode=Enum.ApplyStrokeMode.Border,ThemeTag={Color="Accent"}})})
		local SliderTrack=New("Frame",{Size=UDim2.new(1,-20,0,4),AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,10,1,-8),BackgroundTransparency=0.4,Parent=SliderFrame.Frame,ThemeTag={BackgroundColor3="SliderRail"}},{New("UICorner",{CornerRadius=UDim.new(1,0)}),RailBg,SliderRail})
		New("UIPadding",{PaddingBottom=UDim.new(0,28),Parent=SliderFrame.LabelHolder})
		local TI_MOVE=TweenInfo.new(0.08,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
		local TI_THUMB=TweenInfo.new(0.12,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
		AddSignal(SliderDisplay.FocusLost,function(enter) if not enter then return end;Slider:SetValue(tonumber(SliderDisplay.Text)) end)
		AddSignal(SliderDisplay:GetPropertyChangedSignal("Text"),function() if #SliderDisplay.Text>0 and tonumber(SliderDisplay.Text) then Slider:SetValue(SliderDisplay.Text) end end)
		Creator.AddSignal(SliderDot.InputBegan,function(Input) if Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==Enum.UserInputType.Touch then Dragging=true;TweenService:Create(SliderDot,TI_THUMB,{Size=UDim2.fromOffset(18,18)}):Play() end end)
		Creator.AddSignal(SliderDot.InputEnded,function(Input) if Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==Enum.UserInputType.Touch then Dragging=false;TweenService:Create(SliderDot,TI_THUMB,{Size=UDim2.fromOffset(14,14)}):Play() end end)
		Creator.AddSignal(UserInputService.InputChanged,function(Input)
			if Dragging and(Input.UserInputType==Enum.UserInputType.MouseMovement or Input.UserInputType==Enum.UserInputType.Touch) then
				local s=math.clamp((Input.Position.X-SliderRail.AbsolutePosition.X)/SliderRail.AbsoluteSize.X,0,1)
				Slider:SetValue(Slider.Min+(Slider.Max-Slider.Min)*s)
			end
		end)
		function Slider:OnChanged(Func) Slider.Changed=Func;Func(Slider.Value) end
		function Slider:SetValue(Value)
			Value=Value or self.Value
			if(not tonumber(Value)) and tostring(Value):len()>0 then Value=self.Value end
			self.Value=Library:Round(math.clamp(tonumber(Value),Slider.Min,Slider.Max),Slider.Rounding) or 0
			local pct=(self.Value-Slider.Min)/(Slider.Max-Slider.Min)
			TweenService:Create(SliderDot,TI_MOVE,{Position=UDim2.new(pct,-7,0.5,0)}):Play()
			TweenService:Create(SliderFill,TI_MOVE,{Size=UDim2.fromScale(pct,1)}):Play()
			SliderDisplay.Text=tostring(self.Value)
			Library:SafeCallback(Slider.Callback,self.Value);Library:SafeCallback(Slider.Changed,self.Value)
		end
		function Slider:GetValue() return self.Value end
		function Slider:Destroy() SliderFrame:Destroy();Library.Options[Idx]=nil end
		Slider:SetValue(Config.Default)
		Library.Options[Idx]=Slider;return Slider
	end
	return Element
end)()

ElementsTable.Keybind=(function()
	local Element={};Element.__index=Element;Element.__type="Keybind"
	function Element:New(Idx,Config)
		assert(Config.Title,"KeyBind - Missing Title");assert(Config.Default,"KeyBind - Missing default value.")
		local Keybind={Value=Config.Default,Toggled=false,Mode=Config.Mode or "Toggle",Type="Keybind",Callback=Config.Callback or function(Value)end,ChangedCallback=Config.ChangedCallback or function(New)end}
		local Picking=false
		local KeybindFrame=Components.Element(Config.Title,Config.Description,self.Container,true)
		Keybind.SetTitle=KeybindFrame.SetTitle;Keybind.SetDesc=KeybindFrame.SetDesc;Keybind.Visible=KeybindFrame.Visible;Keybind.Elements=KeybindFrame
		local KeybindDisplayLabel=New("TextLabel",{FontFace=Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal),Text=Config.Default,TextColor3=Color3.fromRGB(240,240,240),TextSize=13,TextXAlignment=Enum.TextXAlignment.Center,Size=UDim2.new(0,0,0,14),Position=UDim2.new(0,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Color3.fromRGB(255,255,255),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,AutoLocalize=false,ThemeTag={TextColor3="Text"}})
		local KeybindDisplayFrame=New("TextButton",{Size=UDim2.fromOffset(0,30),Position=UDim2.new(1,-10,0.5,0),AnchorPoint=Vector2.new(1,0.5),BackgroundTransparency=0.9,Parent=KeybindFrame.Frame,AutomaticSize=Enum.AutomaticSize.X,ThemeTag={BackgroundColor3="Keybind"}},{New("UICorner",{CornerRadius=UDim.new(0,10)}),New("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8)}),New("UIStroke",{Transparency=0.5,ApplyStrokeMode=Enum.ApplyStrokeMode.Border,ThemeTag={Color="InElementBorder"}}),KeybindDisplayLabel})
		function Keybind:GetState()
			if UserInputService:GetFocusedTextBox() and Keybind.Mode~="Always" then return false end
			if Keybind.Mode=="Always" then return true
			elseif Keybind.Mode=="Hold" then
				if Keybind.Value=="None" then return false end
				local Key=Keybind.Value
				if Key=="MouseLeft" or Key=="MouseRight" then return Key=="MouseLeft" and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or Key=="MouseRight" and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
				else return UserInputService:IsKeyDown(Enum.KeyCode[Keybind.Value]) end
			else return Keybind.Toggled end
		end
		function Keybind:SetValue(Key,Mode) Key=Key or Keybind.Key;Mode=Mode or Keybind.Mode;KeybindDisplayLabel.Text=Key;Keybind.Value=Key;Keybind.Mode=Mode end
		function Keybind:GetValue() return self.Value end
		function Keybind:OnClick(Callback) Keybind.Clicked=Callback end
		function Keybind:OnChanged(Callback) Keybind.Changed=Callback;Callback(Keybind.Value) end
		function Keybind:DoClick() Library:SafeCallback(Keybind.Callback,Keybind.Toggled);Library:SafeCallback(Keybind.Clicked,Keybind.Toggled) end
		function Keybind:Destroy() KeybindFrame:Destroy();Library.Options[Idx]=nil end
		Creator.AddSignal(KeybindDisplayFrame.InputBegan,function(Input)
			if Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==Enum.UserInputType.Touch then
				Picking=true;KeybindDisplayLabel.Text="...";wait()
				local Event
				Event=UserInputService.InputBegan:Connect(function(Input)
					local Key
					if Input.UserInputType==Enum.UserInputType.Keyboard then Key=Input.KeyCode.Name
					elseif Input.UserInputType==Enum.UserInputType.MouseButton1 then Key="MouseLeft"
					elseif Input.UserInputType==Enum.UserInputType.MouseButton2 then Key="MouseRight" end
					local EndedEvent
					EndedEvent=UserInputService.InputEnded:Connect(function(Input)
						if Input.KeyCode.Name==Key or Key=="MouseLeft" and Input.UserInputType==Enum.UserInputType.MouseButton1 or Key=="MouseRight" and Input.UserInputType==Enum.UserInputType.MouseButton2 then
							Picking=false;KeybindDisplayLabel.Text=Key;Keybind.Value=Key
							Library:SafeCallback(Keybind.ChangedCallback,Input.KeyCode or Input.UserInputType)
							Library:SafeCallback(Keybind.Changed,Input.KeyCode or Input.UserInputType)
							Event:Disconnect();EndedEvent:Disconnect()
						end
					end)
				end)
			end
		end)
		Creator.AddSignal(UserInputService.InputBegan,function(Input)
			if not Picking and not UserInputService:GetFocusedTextBox() then
				if Keybind.Mode=="Toggle" then
					local Key=Keybind.Value
					if Key=="MouseLeft" or Key=="MouseRight" then
						if Key=="MouseLeft" and Input.UserInputType==Enum.UserInputType.MouseButton1 or Key=="MouseRight" and Input.UserInputType==Enum.UserInputType.MouseButton2 then Keybind.Toggled=not Keybind.Toggled;Keybind:DoClick() end
					elseif Input.UserInputType==Enum.UserInputType.Keyboard then
						if Input.KeyCode.Name==Key then Keybind.Toggled=not Keybind.Toggled;Keybind:DoClick() end
					end
				end
			end
		end)
		Library.Options[Idx]=Keybind;return Keybind
	end
	return Element
end)()

ElementsTable.Colorpicker=(function()
	local Element={};Element.__index=Element;Element.__type="Colorpicker"
	function Element:New(Idx,Config)
		assert(Config.Title,"Colorpicker - Missing Title");assert(Config.Default,"AddColorPicker: Missing default value.")
		local Colorpicker={Value=Config.Default,Transparency=Config.Transparency or 0,Type="Colorpicker",Title=type(Config.Title)=="string" and Config.Title or "Colorpicker",Callback=Config.Callback or function(Color)end}
		function Colorpicker:SetHSVFromRGB(Color) local H,S,V=Color3.toHSV(Color);Colorpicker.Hue=H;Colorpicker.Sat=S;Colorpicker.Vib=V end
		Colorpicker:SetHSVFromRGB(Colorpicker.Value)
		local ColorpickerFrame=Components.Element(Config.Title,Config.Description,self.Container,true)
		Colorpicker.SetTitle=ColorpickerFrame.SetTitle;Colorpicker.SetDesc=ColorpickerFrame.SetDesc;Colorpicker.Visible=ColorpickerFrame.Visible;Colorpicker.Elements=ColorpickerFrame
		local DisplayFrameColor=New("Frame",{Size=UDim2.fromScale(1,1),BackgroundColor3=Colorpicker.Value,Parent=ColorpickerFrame.Frame},{New("UICorner",{CornerRadius=UDim.new(0,4)})})
		New("ImageLabel",{Size=UDim2.fromOffset(26,26),Position=UDim2.new(1,-10,0.5,0),AnchorPoint=Vector2.new(1,0.5),Parent=ColorpickerFrame.Frame,Image="http://www.roblox.com/asset/?id=14204231522",ImageTransparency=0.45,ScaleType=Enum.ScaleType.Tile,TileSize=UDim2.fromOffset(40,40)},{New("UICorner",{CornerRadius=UDim.new(0,4)}),DisplayFrameColor})
		function Colorpicker:Display() Colorpicker.Value=Color3.fromHSV(Colorpicker.Hue,Colorpicker.Sat,Colorpicker.Vib);DisplayFrameColor.BackgroundColor3=Colorpicker.Value;DisplayFrameColor.BackgroundTransparency=Colorpicker.Transparency;Element.Library:SafeCallback(Colorpicker.Callback,Colorpicker.Value);Element.Library:SafeCallback(Colorpicker.Changed,Colorpicker.Value) end
		function Colorpicker:SetValue(HSV,Transparency) local Color=Color3.fromHSV(HSV[1],HSV[2],HSV[3]);Colorpicker.Transparency=Transparency or 0;Colorpicker:SetHSVFromRGB(Color);Colorpicker:Display() end
		function Colorpicker:SetValueRGB(Color,Transparency) Colorpicker.Transparency=Transparency or 0;Colorpicker:SetHSVFromRGB(Color);Colorpicker:Display() end
		function Colorpicker:OnChanged(Func) Colorpicker.Changed=Func;Func(Colorpicker.Value) end
		function Colorpicker:Destroy() ColorpickerFrame:Destroy();Library.Options[Idx]=nil end
		Creator.AddSignal(ColorpickerFrame.Frame.MouseButton1Click,function()
			-- simplified: full color dialog omitted for size; attach original CreateColorDialog here if needed
			Library:Notify({Title="Colorpicker",Content="Click opens color picker (attach full dialog from original source).",Duration=3})
		end)
		Colorpicker:Display()
		Library.Options[Idx]=Colorpicker;return Colorpicker
	end
	return Element
end)()

ElementsTable.Input=(function()
	local Element={};Element.__index=Element;Element.__type="Input"
	function Element:New(Idx,Config)
		assert(Config.Title,"Input - Missing Title");Config.Callback=Config.Callback or function()end
		local Input={Value=Config.Default or "",Numeric=Config.Numeric or false,Finished=Config.Finished or false,Callback=Config.Callback or function(Value)end,Type="Input"}
		local InputFrame=Components.Element(Config.Title,Config.Description,self.Container,false)
		InputFrame.DescLabel.Size=UDim2.new(1,-170,0,14)
		Input.SetTitle=InputFrame.SetTitle;Input.SetDesc=InputFrame.SetDesc;Input.Visible=InputFrame.Visible;Input.Elements=InputFrame
		local Textbox=Components.Textbox(InputFrame.Frame,true)
		Textbox.Frame.Position=UDim2.new(1,-10,0.5,0);Textbox.Frame.AnchorPoint=Vector2.new(1,0.5);Textbox.Frame.Size=UDim2.fromOffset(160,30)
		Textbox.Input.Text=Config.Default or "";Textbox.Input.PlaceholderText=Config.Placeholder or "";Textbox.MultiLine=Config.MultiLine or false
		local Box=Textbox.Input
		function Input:SetValue(Text)
			if Config.MaxLength and #Text>Config.MaxLength then Text=Text:sub(1,Config.MaxLength) end
			if Input.Numeric then local n=tonumber(Text);if not n and Text:len()>0 then Text=Input.Value end end
			Input.Value=Text;Box.Text=Text;Library:SafeCallback(Input.Callback,Input.Value);Library:SafeCallback(Input.Changed,Input.Value);wait(.2)
		end
		function Input:GetValue() return self.Value end
		if Input.Finished then AddSignal(Box.FocusLost,function(enter) if not enter then return end;Input:SetValue(Box.Text) end)
		else AddSignal(Box:GetPropertyChangedSignal("Text"),function() Input:SetValue(Box.Text) end) end
		function Input:OnChanged(Func) Input.Changed=Func;Func(Input.Value) end
		function Input:Destroy() InputFrame:Destroy();Library.Options[Idx]=nil end
		Library.Options[Idx]=Input;return Input
	end
	return Element
end)()

-- ==================== ELEMENT: InfoDev ====================
ElementsTable.InfoDev = (function()
	local Element = {}
	Element.__index = Element
	Element.__type  = "InfoDev"

	function Element:New(Idx, Config)
		assert(Config.Name, "InfoDev - Missing Name")

		local New = Creator.New

		local Card = New("Frame", {
			Size             = UDim2.new(1, 0, 0, 80),
			BackgroundTransparency = 0.88,
			BackgroundColor3 = Color3.fromRGB(130, 130, 130),
			Parent           = self.Container,
			LayoutOrder      = 7,
			ThemeTag         = { BackgroundColor3 = "Element" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 8) }),
			New("UIStroke", {
				Transparency    = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag        = { Color = "ElementBorder" },
			}),
		})

		local AvatarBg = New("Frame", {
			Size        = UDim2.fromOffset(56, 56),
			AnchorPoint = Vector2.new(0, 0.5),
			Position    = UDim2.new(0, 12, 0.5, 0),
			BackgroundColor3 = Color3.fromRGB(50, 50, 60),
			Parent      = Card,
		}, {
			New("UICorner", { CornerRadius = UDim.new(1, 0) }),
		})
		New("ImageLabel", {
			Image           = Config.Avatar or "rbxassetid://15435099885",
			Size            = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Parent          = AvatarBg,
		}, {
			New("UICorner", { CornerRadius = UDim.new(1, 0) }),
		})

		local NameLabel = New("TextLabel", {
			Text            = Config.Name,
			FontFace        = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
			TextSize        = 14,
			TextXAlignment  = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Size            = UDim2.new(0, 0, 0, 16),
			AutomaticSize   = Enum.AutomaticSize.X,
			AutoLocalize    = false,
			ThemeTag        = { TextColor3 = "Text" },
		})

		local RoleLabel = New("TextLabel", {
			Text            = Config.Role or "",
			Visible         = Config.Role ~= nil and Config.Role ~= "",
			FontFace        = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
			TextSize        = 11,
			TextXAlignment  = Enum.TextXAlignment.Left,
			BackgroundColor3 = Color3.fromRGB(80, 160, 255),
			BackgroundTransparency = 0.6,
			Size            = UDim2.new(0, 0, 0, 16),
			AutomaticSize   = Enum.AutomaticSize.X,
			AutoLocalize    = false,
			ThemeTag        = { TextColor3 = "Text" },
		}, {
			New("UICorner",  { CornerRadius = UDim.new(0, 4) }),
			New("UIPadding", { PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6) }),
		})

		-- ── Icon mang xa hoi (Discord / TikTok / YouTube) ─────────
		-- Nam han ben phai card, nhan vao se doi mau (xanh la) + copy link
		local SOCIAL_ICON_DEFS = {
			{ Key = "Discord", Id = "rbxassetid://121947318640922" },
			{ Key = "TikTok",  Id = "rbxassetid://87683378476912"  },
			{ Key = "YouTube", Id = "rbxassetid://82508315710236"  },
		}
		local SocialCfg = Config.Socials or {}
		if Config.Discord and not SocialCfg.Discord then SocialCfg.Discord = Config.Discord end
		if Config.TikTok  and not SocialCfg.TikTok  then SocialCfg.TikTok  = Config.TikTok  end
		if Config.YouTube and not SocialCfg.YouTube then SocialCfg.YouTube = Config.YouTube end

		local HasAnySocial = (SocialCfg.Discord and SocialCfg.Discord ~= "")
			or (SocialCfg.TikTok and SocialCfg.TikTok ~= "")
			or (SocialCfg.YouTube and SocialCfg.YouTube ~= "")

		local function MakeSocialIcon(IconId, Link, Order)
			local BaseColor   = Color3.fromRGB(190, 190, 200)
			local HoverColor  = Color3.fromRGB(255, 255, 255)
			local CopiedColor = Color3.fromRGB(67, 181, 129)
			local TI = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
			local Copied = false

			local IconBtn = New("ImageButton", {
				Image           = IconId,
				ImageColor3     = BaseColor,
				Size            = UDim2.fromOffset(18, 18),
				BackgroundTransparency = 1,
				ScaleType       = Enum.ScaleType.Fit,
				LayoutOrder     = Order,
			})

			Creator.AddSignal(IconBtn.MouseEnter, function()
				if not Copied then TweenService:Create(IconBtn, TI, { ImageColor3 = HoverColor }):Play() end
			end)
			Creator.AddSignal(IconBtn.MouseLeave, function()
				if not Copied then TweenService:Create(IconBtn, TI, { ImageColor3 = BaseColor }):Play() end
			end)
			Creator.AddSignal(IconBtn.MouseButton1Click, function()
				if Copied then return end
				Copied = true
				pcall(function() if setclipboard then setclipboard(Link) end end)
				TweenService:Create(IconBtn, TI, { ImageColor3 = CopiedColor }):Play()
				task.delay(1.6, function()
					Copied = false
					TweenService:Create(IconBtn, TI, { ImageColor3 = BaseColor }):Play()
				end)
			end)

			return IconBtn
		end

		-- ── Name + Role nam ke nhau (hang ngang) ───────────────────
		local TopRow = New("Frame", {
			BackgroundTransparency = 1,
			Size            = UDim2.new(1, 0, 0, 16),
			AutomaticSize   = Enum.AutomaticSize.Y,
		}, {
			New("UIListLayout", {
				FillDirection      = Enum.FillDirection.Horizontal,
				VerticalAlignment  = Enum.VerticalAlignment.Center,
				Padding            = UDim.new(0, 6),
				SortOrder          = Enum.SortOrder.LayoutOrder,
			}),
			NameLabel,
			RoleLabel,
		})

		local BioLabel = New("TextLabel", {
			Text            = Config.Bio or "",
			Visible         = Config.Bio ~= nil and Config.Bio ~= "",
			FontFace        = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			TextSize        = 12,
			TextWrapped     = true,
			TextXAlignment  = Enum.TextXAlignment.Left,
			AutomaticSize   = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size            = UDim2.new(1, 0, 0, 12),
			AutoLocalize    = false,
			ThemeTag        = { TextColor3 = "SubText" },
		})

		-- du tru them khong gian ben phai cho icon MXH (neu co) de khong bi de chu
		local RightReserve = HasAnySocial and 84 or 0
		New("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint     = Vector2.new(0, 0.5),
			Position        = UDim2.new(0, 78, 0.5, 0),
			Size            = UDim2.new(1, -90 - RightReserve, 0, 0),
			AutomaticSize   = Enum.AutomaticSize.Y,
			Parent          = Card,
		}, {
			New("UIListLayout", {
				Padding             = UDim.new(0, 3),
				SortOrder           = Enum.SortOrder.LayoutOrder,
				VerticalAlignment   = Enum.VerticalAlignment.Center,
			}),
			TopRow,
			BioLabel,
		})

		-- ── icon MXH nam han ben phai card, can giua theo chieu doc ──
		if HasAnySocial then
			local IconsChildren = {
				New("UIListLayout", {
					FillDirection       = Enum.FillDirection.Horizontal,
					VerticalAlignment   = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					Padding             = UDim.new(0, 10),
					SortOrder           = Enum.SortOrder.LayoutOrder,
				}),
			}
			local Order = 1
			for _, Def in ipairs(SOCIAL_ICON_DEFS) do
				local Link = SocialCfg[Def.Key]
				if Link and Link ~= "" then
					table.insert(IconsChildren, MakeSocialIcon(Def.Id, Link, Order))
					Order = Order + 1
				end
			end
			New("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint   = Vector2.new(1, 0.5),
				Position      = UDim2.new(1, -12, 0.5, 0),
				Size          = UDim2.new(0, 0, 0, 18),
				AutomaticSize = Enum.AutomaticSize.X,
				Parent        = Card,
			}, IconsChildren)
		end

		Creator.AddSignal(BioLabel:GetPropertyChangedSignal("AbsoluteSize"), function()
			local bioH = BioLabel.Visible and BioLabel.AbsoluteSize.Y or 0
			local baseH = Config.Role and 88 or 80
			Card.Size = UDim2.new(1, 0, 0, math.max(baseH, bioH + 52))
		end)

		local InfoDev = {
			Type    = "InfoDev",
			Frame   = Card,
			Elements = {
				GetOriginalText = function() return Config.Name end,
				GetOriginalDesc = function() return Config.Bio or "" end,
				SetTitle        = function(_, t) NameLabel.Text = t end,
				SetDesc         = function(_, t) BioLabel.Text  = t end,
			},
		}
		table.insert(Library.ElementRegistry, InfoDev.Elements)

		function InfoDev:SetName(t) NameLabel.Text = t end
		function InfoDev:SetBio(t) BioLabel.Text = t; BioLabel.Visible = t ~= "" end
		function InfoDev:SetAvatar(id) AvatarBg:FindFirstChildOfClass("ImageLabel").Image = id end
		function InfoDev:Destroy() Card:Destroy() end

		return InfoDev
	end

	return Element
end)()

-- ==================== ELEMENT: Discord ====================
ElementsTable.Discord = (function()
	local Element = {}
	Element.__index = Element
	Element.__type  = "Discord"

	local DISCORD_BLUE = Color3.fromRGB(88, 101, 242)

	local function FormatUrl(link)
		local display = tostring(link):gsub("^https?://", "")
		if display:sub(-1) == "/" then display = display:sub(1, -2) end
		return display
	end

	function Element:New(Idx, Config)
		assert(Config.ServerName, "Discord - Missing ServerName")
		assert(Config.InviteLink,  "Discord - Missing InviteLink")

		local New = Creator.New
		local HasBanner = Config.Banner ~= nil and Config.Banner ~= ""
		local BANNER_H  = HasBanner and 70 or 0
		local TOP_OFFSET = BANNER_H + 30 -- khoang trong cho url-bar truoc khi den icon
		local CardHeight = TOP_OFFSET + 64 + 44

		-- ── card (ClipsDescendants de banner khong tran ra ngoai bo goc) ──
		local Card = New("Frame", {
			Size             = UDim2.new(1, 0, 0, CardHeight),
			BackgroundTransparency = 0.88,
			BackgroundColor3 = Color3.fromRGB(130, 130, 130),
			Parent           = self.Container,
			LayoutOrder      = 7,
			ClipsDescendants = true,
			ThemeTag         = { BackgroundColor3 = "Element" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 8) }),
			New("UIStroke", {
				Transparency    = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag        = { Color = "ElementBorder" },
			}),
		})

		-- ── banner (optional) ──────────────────────────────
		local BannerImg
		if HasBanner then
			BannerImg = New("ImageLabel", {
				Image     = Config.Banner,
				Size      = UDim2.new(1, 0, 0, BANNER_H),
				Position  = UDim2.fromOffset(0, 0),
				ScaleType = Enum.ScaleType.Crop,
				BackgroundTransparency = 1,
				Parent    = Card,
			})
			-- lam toi day banner de chu/url-bar de doc hon
			New("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				Size             = UDim2.new(1, 0, 0, BANNER_H),
				Parent           = BannerImg,
			}, {
				New("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(1, 0.35),
					}),
				}),
			})
		end

		-- ── url bar (giong khi gui link server trong Discord) ──
		local UrlBar = New("Frame", {
			Size             = UDim2.new(1, -16, 0, 22),
			Position         = UDim2.fromOffset(8, HasBanner and (BANNER_H - 28) or 8),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = HasBanner and 0.35 or 0.85,
			Parent           = Card,
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 5) }),
		})
		New("ImageLabel", {
			Image           = "rbxassetid://11963503741",
			Size            = UDim2.fromOffset(12, 12),
			AnchorPoint     = Vector2.new(0, 0.5),
			Position        = UDim2.new(0, 6, 0.5, 0),
			BackgroundTransparency = 1,
			ImageColor3     = Color3.fromRGB(255, 255, 255),
			Parent          = UrlBar,
		})
		local UrlLabel = New("TextLabel", {
			Text            = FormatUrl(Config.InviteLink),
			FontFace        = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
			TextSize        = 11,
			TextColor3      = Color3.fromRGB(220, 220, 220),
			TextXAlignment  = Enum.TextXAlignment.Left,
			TextTruncate    = Enum.TextTruncate.AtEnd,
			BackgroundTransparency = 1,
			Size            = UDim2.new(1, -22, 1, 0),
			Position        = UDim2.fromOffset(20, 0),
			AutoLocalize    = false,
			Parent          = UrlBar,
		})

		-- ── server icon ───────────────────────────────────
		local IconBg = New("Frame", {
			Size        = UDim2.fromOffset(48, 48),
			Position    = UDim2.new(0, 12, 0, TOP_OFFSET),
			BackgroundColor3 = DISCORD_BLUE,
			Parent      = Card,
		}, {
			New("UICorner", { CornerRadius = UDim.new(1, 0) }),
		})
		New("ImageLabel", {
			Image           = Config.Avatar or "rbxassetid://15435099885",
			Size            = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Parent          = IconBg,
		}, {
			New("UICorner", { CornerRadius = UDim.new(1, 0) }),
		})

		local ServerNameLabel = New("TextLabel", {
			Text            = Config.ServerName,
			FontFace        = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
			TextSize        = 14,
			TextXAlignment  = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Size            = UDim2.new(1, 0, 0, 16),
			AutoLocalize    = false,
			ThemeTag        = { TextColor3 = "Text" },
		})

		local DescLabel = New("TextLabel", {
			Text            = Config.Description or "",
			Visible         = Config.Description ~= nil and Config.Description ~= "",
			FontFace        = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			TextSize        = 12,
			TextWrapped     = true,
			TextXAlignment  = Enum.TextXAlignment.Left,
			AutomaticSize   = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size            = UDim2.new(1, 0, 0, 12),
			AutoLocalize    = false,
			ThemeTag        = { TextColor3 = "SubText" },
		})

		New("Frame", {
			BackgroundTransparency = 1,
			Position        = UDim2.new(0, 70, 0, TOP_OFFSET + 2),
			Size            = UDim2.new(1, -82, 0, 0),
			AutomaticSize   = Enum.AutomaticSize.Y,
			Parent          = Card,
		}, {
			New("UIListLayout", {
				Padding           = UDim.new(0, 3),
				SortOrder         = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
			}),
			ServerNameLabel,
			DescLabel,
		})

		-- ── join button (copy invite link) ─────────────────
		local Copied = false

		local BtnLabel = New("TextLabel", {
			Text            = "Join Discord",
			FontFace        = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
			TextSize        = 13,
			TextColor3      = Color3.fromRGB(255, 255, 255),
			TextXAlignment  = Enum.TextXAlignment.Center,
			BackgroundTransparency = 1,
			Size            = UDim2.fromScale(1, 1),
			AutoLocalize    = false,
		})

		local DiscordIco = New("ImageLabel", {
			Image           = "rbxassetid://11963503741",
			Size            = UDim2.fromOffset(16, 16),
			AnchorPoint     = Vector2.new(0, 0.5),
			Position        = UDim2.new(0, 10, 0.5, 0),
			BackgroundTransparency = 1,
			ImageColor3     = Color3.fromRGB(255, 255, 255),
		})

		local JoinBtn = New("TextButton", {
			Size             = UDim2.new(1, -16, 0, 28),
			Position         = UDim2.new(0, 8, 1, -36),
			BackgroundColor3 = DISCORD_BLUE,
			BackgroundTransparency = 0,
			Text             = "",
			Parent           = Card,
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 6) }),
			DiscordIco,
			BtnLabel,
		})

		local TI = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		Creator.AddSignal(JoinBtn.MouseEnter, function()
			TweenService:Create(JoinBtn, TI, { BackgroundTransparency = 0.15 }):Play()
		end)
		Creator.AddSignal(JoinBtn.MouseLeave, function()
			TweenService:Create(JoinBtn, TI, { BackgroundTransparency = 0 }):Play()
		end)
		Creator.AddSignal(JoinBtn.MouseButton1Down, function()
			TweenService:Create(JoinBtn, TI, { BackgroundTransparency = 0.3 }):Play()
		end)

		Creator.AddSignal(JoinBtn.MouseButton1Click, function()
			if Copied then return end
			Copied = true

			local link = Config.InviteLink
			local opened = false

			pcall(function()
				if setclipboard then
					setclipboard(link)
					opened = true
				end
			end)

			if opened then
				BtnLabel.Text = "Da copy link!"
				TweenService:Create(JoinBtn, TI, { BackgroundColor3 = Color3.fromRGB(67, 181, 129) }):Play()
			else
				BtnLabel.Text = link
			end

			task.delay(2.5, function()
				Copied = false
				BtnLabel.Text = "Join Discord"
				TweenService:Create(JoinBtn, TI, { BackgroundColor3 = DISCORD_BLUE }):Play()
			end)
		end)

		local Discord = {
			Type    = "Discord",
			Frame   = Card,
			Elements = {
				GetOriginalText = function() return Config.ServerName end,
				GetOriginalDesc = function() return Config.Description or "" end,
				SetTitle        = function(_, t) ServerNameLabel.Text = t end,
				SetDesc         = function(_, t) DescLabel.Text = t; DescLabel.Visible = t ~= "" end,
			},
		}
		table.insert(Library.ElementRegistry, Discord.Elements)

		function Discord:SetServerName(t) ServerNameLabel.Text = t end
		function Discord:SetDescription(t) DescLabel.Text = t; DescLabel.Visible = t ~= "" end
		function Discord:SetAvatar(id) IconBg:FindFirstChildOfClass("ImageLabel").Image = id end
		function Discord:SetBanner(id) if BannerImg then BannerImg.Image = id end end
		function Discord:SetInviteLink(link) Config.InviteLink = link; UrlLabel.Text = FormatUrl(link) end
		function Discord:Destroy() Card:Destroy() end

		return Discord
	end

	return Element
end)()

-- ==================== ELEMENT: SocialLinks ====================
-- Hang nut TikTok / YouTube / Discord (hoac tuy chinh), nhan vao se copy link
ElementsTable.SocialLinks = (function()
	local Element = {}
	Element.__index = Element
	Element.__type  = "SocialLinks"

	local PLATFORM_DEFAULTS = {
		TikTok  = Color3.fromRGB(20, 20, 20),
		YouTube = Color3.fromRGB(255, 0, 0),
		Discord = Color3.fromRGB(88, 101, 242),
	}

	function Element:New(Idx, Config)
		local New = Creator.New
		local Links = Config.Links

		if not Links then
			Links = {}
			if Config.TikTok  and Config.TikTok  ~= "" then table.insert(Links, { Name = "TikTok",  Link = Config.TikTok,  Color = PLATFORM_DEFAULTS.TikTok  }) end
			if Config.YouTube and Config.YouTube ~= "" then table.insert(Links, { Name = "YouTube", Link = Config.YouTube, Color = PLATFORM_DEFAULTS.YouTube }) end
			if Config.Discord and Config.Discord ~= "" then table.insert(Links, { Name = "Discord", Link = Config.Discord, Color = PLATFORM_DEFAULTS.Discord }) end
		end

		local Title = Config.Title or "Social Media"
		local Desc  = Config.Description or "Nhan de copy lien ket"

		local TitleLabel = New("TextLabel", {
			Text            = Title,
			FontFace        = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
			TextSize        = 13,
			TextXAlignment  = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Size            = UDim2.new(1, -20, 0, 16),
			Position        = UDim2.fromOffset(10, 10),
			AutoLocalize    = false,
			ThemeTag        = { TextColor3 = "Text" },
		})
		local DescLabel = New("TextLabel", {
			Text            = Desc,
			Visible         = Desc ~= "",
			FontFace        = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			TextSize        = 11,
			TextXAlignment  = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Size            = UDim2.new(1, -20, 0, 14),
			Position        = UDim2.fromOffset(10, 28),
			AutoLocalize    = false,
			ThemeTag        = { TextColor3 = "SubText" },
		})

		local RowHolder = New("Frame", {
			BackgroundTransparency = 1,
			Position        = UDim2.fromOffset(10, 48),
			Size            = UDim2.new(1, -20, 0, 32),
		}, {
			New("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding       = UDim.new(0, 8),
				SortOrder     = Enum.SortOrder.LayoutOrder,
			}),
		})

		local Card = New("Frame", {
			Size             = UDim2.new(1, 0, 0, 90),
			BackgroundTransparency = 0.88,
			BackgroundColor3 = Color3.fromRGB(130, 130, 130),
			Parent           = self.Container,
			LayoutOrder      = 7,
			ThemeTag         = { BackgroundColor3 = "Element" },
		}, {
			New("UICorner", { CornerRadius = UDim.new(0, 8) }),
			New("UIStroke", {
				Transparency    = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				ThemeTag        = { Color = "ElementBorder" },
			}),
			TitleLabel,
			DescLabel,
			RowHolder,
		})

		local TI = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		local copiedFlags = {}

		for i, item in ipairs(Links) do
			local color = item.Color or Color3.fromRGB(90, 90, 100)
			local label = New("TextLabel", {
				Text            = item.Name,
				FontFace        = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
				TextSize        = 12,
				TextColor3      = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Size            = UDim2.fromScale(1, 1),
				AutoLocalize    = false,
			})
			local btn = New("TextButton", {
				Size             = UDim2.fromOffset(86, 32),
				BackgroundColor3 = color,
				Text             = "",
				LayoutOrder      = i,
				Parent           = RowHolder,
			}, {
				New("UICorner", { CornerRadius = UDim.new(0, 6) }),
				label,
			})

			Creator.AddSignal(btn.MouseEnter, function() TweenService:Create(btn, TI, { BackgroundTransparency = 0.15 }):Play() end)
			Creator.AddSignal(btn.MouseLeave, function() TweenService:Create(btn, TI, { BackgroundTransparency = 0 }):Play() end)

			Creator.AddSignal(btn.MouseButton1Click, function()
				if copiedFlags[btn] then return end
				copiedFlags[btn] = true
				local ok = false
				pcall(function()
					if setclipboard then setclipboard(item.Link); ok = true end
				end)
				label.Text = ok and "Da copy!" or item.Link
				task.delay(2, function()
					copiedFlags[btn] = false
					label.Text = item.Name
				end)
			end)
		end

		local SocialLinks = {
			Type    = "SocialLinks",
			Frame   = Card,
			Elements = {
				GetOriginalText = function() return Title end,
				GetOriginalDesc = function() return Desc end,
				SetTitle        = function(_, t) TitleLabel.Text = t end,
				SetDesc         = function(_, t) DescLabel.Text = t; DescLabel.Visible = t ~= "" end,
			},
		}
		table.insert(Library.ElementRegistry, SocialLinks.Elements)

		function SocialLinks:Destroy() Card:Destroy() end

		return SocialLinks
	end

	return Element
end)()

local NotificationModule=Components.Notification
NotificationModule:Init(GUI)

local Icons={
	["lucide-accessibility"]="rbxassetid://10709751939",["lucide-activity"]="rbxassetid://10709752035",
	["lucide-alarm-clock"]="rbxassetid://10709752630",["lucide-alert-circle"]="rbxassetid://10709752996",
	["lucide-alert-triangle"]="rbxassetid://10709753149",["lucide-anchor"]="rbxassetid://10709761530",
	["lucide-apple"]="rbxassetid://10709761889",["lucide-archive"]="rbxassetid://10709762233",
	["lucide-arrow-down"]="rbxassetid://10709767827",["lucide-arrow-left"]="rbxassetid://10709768114",
	["lucide-arrow-right"]="rbxassetid://10709768347",["lucide-arrow-up"]="rbxassetid://10709768939",
	["lucide-award"]="rbxassetid://10709769406",["lucide-axe"]="rbxassetid://10709769508",
	["lucide-bar-chart"]="rbxassetid://10709773755",["lucide-battery"]="rbxassetid://10709774640",
	["lucide-bell"]="rbxassetid://10709775704",["lucide-bike"]="rbxassetid://10709775894",
	["lucide-bluetooth"]="rbxassetid://10709776655",["lucide-bomb"]="rbxassetid://10709781460",
	["lucide-book"]="rbxassetid://10709781824",["lucide-bookmark"]="rbxassetid://10709782154",
	["lucide-bot"]="rbxassetid://10709782230",["lucide-box"]="rbxassetid://10709782497",
	["lucide-bug"]="rbxassetid://10709782845",["lucide-building"]="rbxassetid://10709783051",
	["lucide-calendar"]="rbxassetid://10709789505",["lucide-camera"]="rbxassetid://10709789686",
	["lucide-car"]="rbxassetid://10709789810",["lucide-check"]="rbxassetid://10709790644",
	["lucide-check-circle"]="rbxassetid://10709790387",["lucide-chevron-down"]="rbxassetid://10709790948",
	["lucide-chevron-left"]="rbxassetid://10709791281",["lucide-chevron-right"]="rbxassetid://10709791437",
	["lucide-chevron-up"]="rbxassetid://10709791523",["lucide-chrome"]="rbxassetid://10709797725",
	["lucide-circle"]="rbxassetid://10709798174",["lucide-clipboard"]="rbxassetid://10709799288",
	["lucide-clock"]="rbxassetid://10709805144",["lucide-cloud"]="rbxassetid://10709806740",
	["lucide-code"]="rbxassetid://10709810463",["lucide-cog"]="rbxassetid://10709810948",
	["lucide-coins"]="rbxassetid://10709811110",["lucide-command"]="rbxassetid://10709811365",
	["lucide-compass"]="rbxassetid://10709811445",["lucide-copy"]="rbxassetid://10709812159",
	["lucide-cpu"]="rbxassetid://10709813383",["lucide-crown"]="rbxassetid://10709818626",
	["lucide-database"]="rbxassetid://10709818996",["lucide-delete"]="rbxassetid://10709819059",
	["lucide-diamond"]="rbxassetid://10709819149",["lucide-download"]="rbxassetid://10723344270",
	["lucide-edit"]="rbxassetid://10734883598",["lucide-eye"]="rbxassetid://10723346959",
	["lucide-eye-off"]="rbxassetid://10723346871",["lucide-filter"]="rbxassetid://10723375128",
	["lucide-flag"]="rbxassetid://10723375890",["lucide-flame"]="rbxassetid://10723376114",
	["lucide-folder"]="rbxassetid://10723387563",["lucide-gamepad"]="rbxassetid://10723395457",
	["lucide-gamepad-2"]="rbxassetid://10723395215",["lucide-gem"]="rbxassetid://10723396000",
	["lucide-ghost"]="rbxassetid://10723396107",["lucide-gift"]="rbxassetid://10723396402",
	["lucide-globe"]="rbxassetid://10723404337",["lucide-graduation-cap"]="rbxassetid://10723404691",
	["lucide-grid"]="rbxassetid://10723404936",["lucide-hammer"]="rbxassetid://10723405360",
	["lucide-heart"]="rbxassetid://10723406885",["lucide-help-circle"]="rbxassetid://10723406988",
	["lucide-hexagon"]="rbxassetid://10723407092",["lucide-home"]="rbxassetid://10723407389",
	["lucide-image"]="rbxassetid://10723415040",["lucide-info"]="rbxassetid://10723415903",
	["lucide-key"]="rbxassetid://10723416652",["lucide-keyboard"]="rbxassetid://10723416765",
	["lucide-languages"]="rbxassetid://10723417703",["lucide-laptop"]="rbxassetid://10723423881",
	["lucide-layers"]="rbxassetid://10723424505",["lucide-layout"]="rbxassetid://10723425376",
	["lucide-leaf"]="rbxassetid://10723425539",["lucide-link"]="rbxassetid://10723426722",
	["lucide-list"]="rbxassetid://10723433811",["lucide-loader"]="rbxassetid://10723434070",
	["lucide-lock"]="rbxassetid://10723434711",["lucide-log-in"]="rbxassetid://10723434830",
	["lucide-log-out"]="rbxassetid://10723434906",["lucide-mail"]="rbxassetid://10734885430",
	["lucide-map"]="rbxassetid://10734886202",["lucide-map-pin"]="rbxassetid://10734886004",
	["lucide-maximize"]="rbxassetid://10734886735",["lucide-medal"]="rbxassetid://10734887072",
	["lucide-menu"]="rbxassetid://10734887784",["lucide-message-circle"]="rbxassetid://10734888000",
	["lucide-mic"]="rbxassetid://10734888864",["lucide-minimize"]="rbxassetid://10734895698",
	["lucide-minus"]="rbxassetid://10734896206",["lucide-monitor"]="rbxassetid://10734896881",
	["lucide-moon"]="rbxassetid://10734897102",["lucide-more-horizontal"]="rbxassetid://10734897250",
	["lucide-more-vertical"]="rbxassetid://10734897387",["lucide-mouse-pointer"]="rbxassetid://10734898476",
	["lucide-move"]="rbxassetid://10734900011",["lucide-music"]="rbxassetid://10734905958",
	["lucide-navigation"]="rbxassetid://10734906744",["lucide-network"]="rbxassetid://10734906975",
	["lucide-newspaper"]="rbxassetid://10734907168",["lucide-package"]="rbxassetid://10734909540",
	["lucide-palette"]="rbxassetid://10734910430",["lucide-pause"]="rbxassetid://10734919336",
	["lucide-pen-tool"]="rbxassetid://10734919503",["lucide-pencil"]="rbxassetid://10734919691",
	["lucide-percent"]="rbxassetid://10734919919",["lucide-phone"]="rbxassetid://10734921524",
	["lucide-pie-chart"]="rbxassetid://10734921727",["lucide-pin"]="rbxassetid://10734922324",
	["lucide-play"]="rbxassetid://10734923549",["lucide-plus"]="rbxassetid://10734924532",
	["lucide-power"]="rbxassetid://10734930466",["lucide-printer"]="rbxassetid://10734930632",
	["lucide-puzzle"]="rbxassetid://10734930886",["lucide-refresh-ccw"]="rbxassetid://10734933056",
	["lucide-refresh-cw"]="rbxassetid://10734933222",["lucide-rocket"]="rbxassetid://10734934585",
	["lucide-save"]="rbxassetid://10734941499",["lucide-scale"]="rbxassetid://10734941912",
	["lucide-search"]="rbxassetid://10734943674",["lucide-send"]="rbxassetid://10734943902",
	["lucide-server"]="rbxassetid://10734949856",["lucide-settings"]="rbxassetid://10734950309",
	["lucide-settings-2"]="rbxassetid://10734950020",["lucide-share"]="rbxassetid://10734950813",
	["lucide-shield"]="rbxassetid://10734951847",["lucide-shopping-cart"]="rbxassetid://10734952479",
	["lucide-shuffle"]="rbxassetid://10734953451",["lucide-skull"]="rbxassetid://10734962068",
	["lucide-smartphone"]="rbxassetid://10734963940",["lucide-star"]="rbxassetid://10734966248",
	["lucide-stop-circle"]="rbxassetid://10734972621",["lucide-sun"]="rbxassetid://10734974297",
	["lucide-sword"]="rbxassetid://10734975486",["lucide-swords"]="rbxassetid://10734975692",
	["lucide-tag"]="rbxassetid://10734976528",["lucide-target"]="rbxassetid://10734977012",
	["lucide-terminal"]="rbxassetid://10734982144",["lucide-thumbs-up"]="rbxassetid://10734983629",
	["lucide-timer"]="rbxassetid://10734984606",["lucide-toggle-left"]="rbxassetid://10734984834",
	["lucide-toggle-right"]="rbxassetid://10734985040",["lucide-trash"]="rbxassetid://10747362393",
	["lucide-trash-2"]="rbxassetid://10747362241",["lucide-trending-up"]="rbxassetid://10747363465",
	["lucide-trophy"]="rbxassetid://10747363809",["lucide-truck"]="rbxassetid://10747364031",
	["lucide-tv"]="rbxassetid://10747364593",["lucide-unlock"]="rbxassetid://10747366027",
	["lucide-upload"]="rbxassetid://10747366434",["lucide-user"]="rbxassetid://10747373176",
	["lucide-users"]="rbxassetid://10747373426",["lucide-volume"]="rbxassetid://10747376008",
	["lucide-wallet"]="rbxassetid://10747376205",["lucide-wifi"]="rbxassetid://10747382504",
	["lucide-wind"]="rbxassetid://10747382750",["lucide-wrench"]="rbxassetid://10747383470",
	["lucide-x"]="rbxassetid://10747384394",["lucide-x-circle"]="rbxassetid://10747383819",
	["lucide-zoom-in"]="rbxassetid://10747384552",["lucide-zoom-out"]="rbxassetid://10747384679",
	["lucide-dumbbell"]="rbxassetid://18273453053",
}

function Library:GetIcon(Name)
	if Name~=nil and Icons["lucide-"..Name] then return Icons["lucide-"..Name] end
	return nil
end

local Elements={}
Elements.__index=Elements
Elements.__namecall=function(Table,Key,...) return Elements[Key](...) end

for _,ElementComponent in pairs(ElementsTable) do
	Elements["Add"..ElementComponent.__type]=function(self,Idx,Config)
		ElementComponent.Container=self.Container;ElementComponent.Type=self.Type
		ElementComponent.ScrollFrame=self.ScrollFrame;ElementComponent.Library=Library
		return ElementComponent:New(Idx,Config)
	end
end

Library.Elements=Elements

if RunService:IsStudio() then
	makefolder=function(...) return ... end;makefile=function(...) return ... end
	isfile=function(...) return ... end;isfolder=function(...) return ... end
	readfile=function(...) return ... end;writefile=function(...) return ... end
	listfiles=function(...) return{...} end
end

local SaveManager={}do
	SaveManager.Folder="FluentSettings";SaveManager.Ignore={}
	SaveManager.Parser={
		Toggle={
			Save=function(idx,object) return{type="Toggle",idx=idx,value=object.Value} end,
			Load=function(idx,data) if SaveManager.Options[idx] then SaveManager.Options[idx]:SetValue(data.value) end end,
		},
		Slider={
			Save=function(idx,object) return{type="Slider",idx=idx,value=tostring(object.Value)} end,
			Load=function(idx,data) if SaveManager.Options[idx] then SaveManager.Options[idx]:SetValue(data.value) end end,
		},
		Dropdown={
			Save=function(idx,object) return{type="Dropdown",idx=idx,value=object.Value,mutli=object.Multi} end,
			Load=function(idx,data) if SaveManager.Options[idx] then SaveManager.Options[idx]:SetValue(data.value) end end,
		},
		Colorpicker={
			Save=function(idx,object) return{type="Colorpicker",idx=idx,value=object.Value:ToHex(),transparency=object.Transparency} end,
			Load=function(idx,data) if SaveManager.Options[idx] then SaveManager.Options[idx]:SetValueRGB(Color3.fromHex(data.value),data.transparency) end end,
		},
		Keybind={
			Save=function(idx,object) return{type="Keybind",idx=idx,mode=object.Mode,key=object.Value} end,
			Load=function(idx,data) if SaveManager.Options[idx] then SaveManager.Options[idx]:SetValue(data.key,data.mode) end end,
		},
		Input={
			Save=function(idx,object) return{type="Input",idx=idx,text=object.Value} end,
			Load=function(idx,data) if SaveManager.Options[idx] and type(data.text)=="string" then SaveManager.Options[idx]:SetValue(data.text) end end,
		},
	}
	function SaveManager:SetIgnoreIndexes(list) for _,key in next,list do self.Ignore[key]=true end end
	function SaveManager:SetFolder(folder) self.Folder=folder;self:BuildFolderTree() end
	function SaveManager:Save(name)
		if not name then return false,"no config file is selected" end
		local fullPath=self.Folder.."/"..name..".json";local data={objects={}}
		for idx,option in next,SaveManager.Options do
			if not self.Parser[option.Type] then continue end
			if self.Ignore[idx] then continue end
			table.insert(data.objects,self.Parser[option.Type].Save(idx,option))
		end
		local success,encoded=pcall(httpService.JSONEncode,httpService,data)
		if not success then return false,"failed to encode data" end
		writefile(fullPath,encoded);return true
	end
	function SaveManager:Load(name)
		if not name then return false,"no config file is selected" end
		local file=self.Folder.."/"..name..".json"
		if not isfile(file) then return false,"Create Config Save File" end
		local success,decoded=pcall(httpService.JSONDecode,httpService,readfile(file))
		if not success then return false,"decode error" end
		for _,option in next,decoded.objects do
			if self.Parser[option.type] and not self.Ignore[option.idx] then
				task.spawn(function() self.Parser[option.type].Load(option.idx,option) end)
			end
		end
		Fluent.SettingLoaded=true;return true,decoded
	end
	function SaveManager:IgnoreThemeSettings() self:SetIgnoreIndexes({"InterfaceTheme","AcrylicToggle","TransparentToggle","MenuKeybind"}) end
	function SaveManager:BuildFolderTree()
		local paths={self.Folder,self.Folder.."/"}
		for i=1,#paths do local str=paths[i];if not isfolder(str) then makefolder(str) end end
	end
	function SaveManager:RefreshConfigList()
		local list=listfiles(self.Folder.."/");local out={}
		for i=1,#list do
			local file=list[i]
			if file:sub(-5)==".json" then
				local pos=file:find(".json",1,true);local start=pos;local char=file:sub(pos,pos)
				while char~="/" and char~="\\" and char~="" do pos=pos-1;char=file:sub(pos,pos) end
				if char=="/" or char=="\\" then local name=file:sub(pos+1,start-1);if name~="options" then table.insert(out,name) end end
			end
		end
		return out
	end
	function SaveManager:SetLibrary(library) self.Library=library;self.Options=library.Options end
	function SaveManager:LoadAutoloadConfig()
		if isfile(self.Folder.."/autoload.txt") then
			local name=readfile(self.Folder.."/autoload.txt");local success,err=self:Load(name)
			if not success then return self.Library:Notify({Title="Interface",Content="Config loader",SubContent="Failed to load autoload config: "..err,Duration=7}) end
			self.Library:Notify({Title="Interface",Content="Config loader",SubContent=string.format("Auto loaded config %q",name),Duration=7})
		end
	end
	function SaveManager:BuildConfigSection(tab)
		assert(self.Library,"Must set SaveManager.Library")
		local section=tab:AddSection("Configuration")
		section:AddInput("SaveManager_ConfigName",{Title="Config name"})
		section:AddDropdown("SaveManager_ConfigList",{Title="Config list",Values=self:RefreshConfigList(),AllowNull=true})
		section:AddButton({Title="Create config",Callback=function()
			local name=SaveManager.Options.SaveManager_ConfigName.Value
			if name:gsub(" ","")=="" then return self.Library:Notify({Title="Interface",Content="Config loader",SubContent="Invalid config name (empty)",Duration=7}) end
			local success,err=self:Save(name)
			if not success then return self.Library:Notify({Title="Interface",Content="Config loader",SubContent="Failed to save config: "..err,Duration=7}) end
			self.Library:Notify({Title="Interface",Content="Config loader",SubContent=string.format("Created config %q",name),Duration=7})
			SaveManager.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList());SaveManager.Options.SaveManager_ConfigList:SetValue(nil)
		end})
		section:AddButton({Title="Load config",Callback=function()
			local name=SaveManager.Options.SaveManager_ConfigList.Value;local success,err=self:Load(name)
			if not success then return self.Library:Notify({Title="Interface",Content="Config loader",SubContent="Failed to load config: "..err,Duration=7}) end
			self.Library:Notify({Title="Interface",Content="Config loader",SubContent=string.format("Loaded config %q",name),Duration=7})
		end})
		section:AddButton({Title="Save config",Callback=function()
			local name=SaveManager.Options.SaveManager_ConfigList.Value;local success,err=self:Save(name)
			if not success then return self.Library:Notify({Title="Interface",Content="Config loader",SubContent="Failed to overwrite config: "..err,Duration=7}) end
			self.Library:Notify({Title="Interface",Content="Config loader",SubContent=string.format("Overwrote config %q",name),Duration=7})
		end})
		section:AddButton({Title="Refresh list",Callback=function()
			SaveManager.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList());SaveManager.Options.SaveManager_ConfigList:SetValue(nil)
		end})
		local AutoloadButton
		AutoloadButton=section:AddButton({Title="Set as autoload",Description="Current autoload config: none",Callback=function()
			local name=SaveManager.Options.SaveManager_ConfigList.Value;writefile(self.Folder.."/autoload.txt",name)
			AutoloadButton:SetDesc("Current autoload config: "..name)
			self.Library:Notify({Title="Interface",Content="Config loader",SubContent=string.format("Set %q to auto load",name),Duration=7})
		end})
		if isfile(self.Folder.."/autoload.txt") then AutoloadButton:SetDesc("Current autoload config: "..readfile(self.Folder.."/autoload.txt")) end
		SaveManager:SetIgnoreIndexes({"SaveManager_ConfigList","SaveManager_ConfigName"})
	end
end

local InterfaceManager={}do
	InterfaceManager.Folder="FluentSettings"
	InterfaceManager.Settings={Acrylic=true,Transparency=true,MenuKeybind="M",TransparencyValue=0.65,UIFont="Gotham",BackgroundImage="",BackgroundOpacity=0.85,CustomUIEnabled=false,AccentHex="",CornerRadius=8}
	function InterfaceManager:SetTheme(name) InterfaceManager.Settings.Theme=name end
	function InterfaceManager:SetFolder(folder) self.Folder=folder;self:BuildFolderTree() end
	function InterfaceManager:SetLibrary(library) self.Library=library end
	function InterfaceManager:BuildFolderTree()
		local paths={};local parts=self.Folder:split("/")
		for idx=1,#parts do paths[#paths+1]=table.concat(parts,"/",1,idx) end
		table.insert(paths,self.Folder);table.insert(paths,self.Folder.."/")
		for i=1,#paths do local str=paths[i];if not isfolder(str) then makefolder(str) end end
	end
	function InterfaceManager:SaveSettings() writefile(self.Folder.."/options.json",httpService:JSONEncode(InterfaceManager.Settings)) end
	function InterfaceManager:LoadSettings()
		local path=self.Folder.."/options.json"
		if isfile(path) then
			local data=readfile(path);local success,decoded=pcall(httpService.JSONDecode,httpService,data)
			if success then for i,v in next,decoded do InterfaceManager.Settings[i]=v end end
		end
	end
	function InterfaceManager:BuildInterfaceSection(tab)
		assert(self.Library,"Must set InterfaceManager.Library")
		local Library=self.Library;local Settings=InterfaceManager.Settings
		-- FIX: load settings TRUOC khi tao control, de Default phan anh dung gia tri da luu
		InterfaceManager:LoadSettings()

		local section=tab:AddSection("Interface")
		local InterfaceTheme=section:AddDropdown("InterfaceTheme",{Title="Theme",Description="Changes the interface theme.",Values=Library.Themes,Default=self.Library.Theme,Callback=function(Value) Library:SetTheme(Value);Settings.Theme=Value;InterfaceManager:SaveSettings() end})
		InterfaceTheme:SetValue(Settings.Theme)
		if Library.UseAcrylic then
			section:AddToggle("AcrylicToggle",{Title="Acrylic",Description="The blurred background requires graphic quality 8+",Default=Settings.Acrylic,Callback=function(Value) Library:ToggleAcrylic(Value);Settings.Acrylic=Value;InterfaceManager:SaveSettings() end})
		end

		local TransparencySlider=section:AddSlider("TransparencySlider",{
			Title="Transparency",
			Description="Because the interface is transparent (minimum 0.5).",
			Default=Settings.TransparencyValue or 0.65,
			Min=0.5,
			Max=0.95,
			Rounding=2,
			Callback=function(Value)
				Value=math.clamp(Value,0.5,0.95)
				Library:SetTransparency(Value)
				Settings.TransparencyValue=Value
				InterfaceManager:SaveSettings()
			end
		})
		TransparencySlider:SetValue(Settings.TransparencyValue or 0.65)

		local MenuKeybind=section:AddKeybind("MenuKeybind",{Title="Minimize Bind",Default=Library.MinimizeKey.Name or Settings.MenuKeybind})
		MenuKeybind:OnChanged(function() Settings.MenuKeybind=MenuKeybind.Value;InterfaceManager:SaveSettings() end)
		Library.MinimizeKeybind=MenuKeybind

		local custom=tab:AddSection("Customization")
		local FontNames={"Gotham","GothamMedium","GothamBold","GothamBlack","SourceSans","SourceSansBold","SourceSansLight","Roboto","RobotoMono","Montserrat","Nunito","Oswald","PatrickHand","FredokaOne","Bangers","Ubuntu"}
		local FontDropdown=custom:AddDropdown("UIFontDropdown",{
			Title="Font",
			Description="Change the font for the entire interface.",
			Values=FontNames,
			Default=Settings.UIFont or "Gotham",
			Callback=function(Value)
				Library:SetUIFont(Value)
				Settings.UIFont=Value
				InterfaceManager:SaveSettings()
			end
		})
		FontDropdown:SetValue(Settings.UIFont or "Gotham")

		local BgInput=custom:AddInput("CustomBgInput",{
			Title="Background Image",
			Description="Paste your Asset ID (leave blank for everything).",
			Default=Settings.BackgroundImage or "",
			Placeholder="rbxassetid://...",
			Finished=true,
			Callback=function(Value)
				Library:SetCustomBackground(Value)
				Settings.BackgroundImage=Value
				InterfaceManager:SaveSettings()
			end
		})

		local BgOpacitySlider=custom:AddSlider("CustomBgOpacity",{
			Title="Background Opacity",
			Description="Since it's yours, you can customize it.",
			Default=Settings.BackgroundOpacity or 0.85,
			Min=0,
			Max=1,
			Rounding=2,
			Callback=function(Value)
				Library:SetCustomBackgroundOpacity(Value)
				Settings.BackgroundOpacity=Value
				InterfaceManager:SaveSettings()
			end
		})

		if Settings.BackgroundImage and Settings.BackgroundImage~="" then
			task.spawn(function()
				Library:SetCustomBackground(Settings.BackgroundImage)
				Library:SetCustomBackgroundOpacity(Settings.BackgroundOpacity or 0.85)
			end)
		end

		local AccentInput,CornerSlider
		local CustomUIToggle=custom:AddToggle("CustomUIToggle",{
			Title="Custom UI/UX",
			Description="It allows you to customize the accent color and the angle of the interface.",
			Default=Settings.CustomUIEnabled or false,
			Callback=function(Value)
				Settings.CustomUIEnabled=Value
				InterfaceManager:SaveSettings()
				if AccentInput then AccentInput:Visible(Value) end
				if CornerSlider then CornerSlider:Visible(Value) end
			end
		})

		AccentInput=custom:AddInput("CustomAccentHex",{
			Title="Accent Color",
			Description="Hex code, for example #60CDFF",
			Default=Settings.AccentHex or "",
			Placeholder="#60CDFF",
			Finished=true,
			Callback=function(Value)
				Library:SetAccentColor(Value)
				Settings.AccentHex=Value
				InterfaceManager:SaveSettings()
			end
		})
		AccentInput:Visible(Settings.CustomUIEnabled or false)

		CornerSlider=custom:AddSlider("CustomCornerRadius",{
			Title="Corner Radius",
			Description="Due to the entire interface being corrupted.",
			Default=Settings.CornerRadius or 8,
			Min=0,
			Max=16,
			Rounding=0,
			Callback=function(Value)
				Library:SetCornerRadius(Value)
				Settings.CornerRadius=Value
				InterfaceManager:SaveSettings()
			end
		})
		CornerSlider:Visible(Settings.CustomUIEnabled or false)

		if Settings.CustomUIEnabled then
			if Settings.AccentHex and Settings.AccentHex~="" then
				task.spawn(function() Library:SetAccentColor(Settings.AccentHex) end)
			end
			if Settings.CornerRadius then
				task.spawn(function() Library:SetCornerRadius(Settings.CornerRadius) end)
			end
		end
	end
end

local TranslateManager = {} do
	local HttpService = game:GetService("HttpService")

	TranslateManager.Folder      = "FluentSettings"
	TranslateManager.CacheFile   = "translate_cache.json"
	TranslateManager.OptionsFile = "translate_options.json"
	TranslateManager.Settings    = { Enabled = false, Language = "Auto (Detect)" }
	TranslateManager.Cache       = {}

	TranslateManager.LanguageMap = {
		["Auto (Detect)"]    = "auto",
		["English"]          = "en",
		["Tiếng Việt"]       = "vi",
		["ภาษาไทย"]           = "th",
		["Bahasa Indonesia"]  = "id",
		["中文 (简体)"]        = "zh-CN",
		["한국어"]             = "ko",
		["Español"]          = "es",
		["Português"]        = "pt",
		["Русский"]          = "ru",
		["Filipino"]         = "tl",
		["日本語"]            = "ja",
		["Français"]         = "fr",
		["Deutsch"]          = "de",
	}

	function TranslateManager:SetLibrary(library) self.Library = library end
	function TranslateManager:SetFolder(folder)
		self.Folder = folder
		if not isfolder(self.Folder) then makefolder(self.Folder) end
	end

	function TranslateManager:LoadCache()
		local Path = self.Folder .. "/" .. self.CacheFile
		if not isfile(Path) then return end
		local Ok, Raw = pcall(readfile, Path)
		if Ok then
			local Ok2, Data = pcall(HttpService.JSONDecode, HttpService, Raw)
			if Ok2 and type(Data) == "table" then self.Cache = Data end
		end
	end

	function TranslateManager:SaveCache()
		pcall(function()
			writefile(self.Folder .. "/" .. self.CacheFile, HttpService:JSONEncode(self.Cache))
		end)
	end

	function TranslateManager:LoadSettings()
		local Path = self.Folder .. "/" .. self.OptionsFile
		if not isfile(Path) then return end
		local Ok, Raw = pcall(readfile, Path)
		if Ok then
			local Ok2, Data = pcall(HttpService.JSONDecode, HttpService, Raw)
			if Ok2 and type(Data) == "table" then
				for k, v in next, Data do self.Settings[k] = v end
			end
		end
	end

	function TranslateManager:SaveSettings()
		pcall(function()
			writefile(self.Folder .. "/" .. self.OptionsFile, HttpService:JSONEncode(self.Settings))
		end)
	end

	function TranslateManager:DetectLocale()
		local Code = "en"
		pcall(function()
			local LS = game:GetService("LocalizationService")
			Code = string.sub(LS:GetTranslatorForPlayer(game:GetService("Players").LocalPlayer).LocaleId, 1, 2)
		end)
		return Code
	end

	function TranslateManager:TranslateText(Text, TargetLang)
		if not Text or Text == "" then return Text end
		local Key = TargetLang .. "|" .. Text
		if self.Cache[Key] then return self.Cache[Key] end
		local HttpFunc = http_request or request
		if not HttpFunc then return Text end
		local Url = string.format("https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=%s&dt=t&q=%s",TargetLang, HttpService:UrlEncode(Text))
		local Result = Text
		local Ok, Res = pcall(HttpFunc, { Url = Url, Method = "GET" })
		if Ok and Res and Res.Body then
			local Ok2, Data = pcall(HttpService.JSONDecode, HttpService, Res.Body)
			if Ok2 and Data and Data[1] and Data[1][1] and Data[1][1][1] then
				Result = Data[1][1][1]
			end
		end
		self.Cache[Key] = Result
		task.wait(0.04)
		return Result
	end

	function TranslateManager:CollectTasks()
		local Tasks = {}
		local Registry = self.Library.ElementRegistry or {}

		for _, El in ipairs(Registry) do
			if El.GetOriginalText then
				local orig = El:GetOriginalText()
				if orig and orig ~= "" then
					local e, o = El, orig
					table.insert(Tasks, {
						original  = o,
						applyFn   = function(t) e:SetTitle(t) end,
						revertFn  = function()  e:SetTitle(o) end,
					})
				end
			end

			if El.GetOriginalDesc then
				local origD = El:GetOriginalDesc()
				if origD and origD ~= "" then
					local e, o = El, origD
					table.insert(Tasks, {
						original  = o,
						applyFn   = function(t) e:SetDesc(t) end,
						revertFn  = function()  e:SetDesc(o) end,
					})
				end
			end
		end

		return Tasks
	end

	function TranslateManager:Apply(Language)
		assert(self.Library, "Must set TranslateManager.Library")
		local Lang = self.LanguageMap[Language] or Language
		if not Lang or Lang == "auto" then Lang = self:DetectLocale() end

		local Tasks   = self:CollectTasks()
		local Done    = 0
		local Active  = 0
		local MAX     = 5

		for _, Task in ipairs(Tasks) do
			while Active >= MAX do task.wait(0.04) end
			Active = Active + 1
			local T = Task
			task.spawn(function()
				local translated = self:TranslateText(T.original, Lang)
				if translated and translated ~= "" then
					T.applyFn(translated)
				end
				Active  = Active - 1
				Done    = Done + 1
			end)
		end

		while Done < #Tasks do task.wait(0.04) end
		self:SaveCache()
	end

	function TranslateManager:Revert()
		if not self.Library then return end
		local Tasks = self:CollectTasks()
		for _, Task in ipairs(Tasks) do
			Task.revertFn()
		end
	end

	function TranslateManager:InstallDialogHook()
		local Self = self
		Self.Library.DialogTranslateHook = function(TitleLabel, ContentLabel, ButtonRefs, Config)
			if not Self.Settings.Enabled then return end
			local Lang = Self.LanguageMap[Self.Settings.Language] or Self.Settings.Language
			if not Lang or Lang == "auto" then Lang = Self:DetectLocale() end

			if Config.Title and Config.Title ~= "" then
				task.spawn(function()
					local t = Self:TranslateText(Config.Title, Lang)
					if t and t ~= "" then TitleLabel.Text = t end
				end)
			end

			if Config.Content and Config.Content ~= "" then
				task.spawn(function()
					local t = Self:TranslateText(Config.Content, Lang)
					if t and t ~= "" then ContentLabel.Text = t end
				end)
			end

			for _, Ref in ipairs(ButtonRefs) do
				task.spawn(function()
					local t = Self:TranslateText(Ref.Text, Lang)
					if t and t ~= "" then Ref.Label.Text = t end
				end)
			end
		end
	end

	function TranslateManager:BuildTranslateSection(tab)
		assert(self.Library, "Must set TranslateManager.Library")
		local Settings = self.Settings

		local LanguageNames = {}
		for Name in next, self.LanguageMap do table.insert(LanguageNames, Name) end
		table.sort(LanguageNames)

		local section     = tab:AddSection("Language")
		local Initialized = false

		local LanguageDropdown = section:AddDropdown("TranslateLanguage", {
			Title       = "Language",
			Description = "Language translation interface (Auto Translate must be enabled).",
			Values      = LanguageNames,
			Default     = Settings.Language,
			Callback    = function(Value)
				Settings.Language = Value
				self:SaveSettings()
				if Initialized and Settings.Enabled then
					task.spawn(function() self:Apply(Value) end)
				end
			end
		})
		LanguageDropdown:SetValue(Settings.Language)
		Initialized = true

		section:AddToggle("AutoTranslate", {
			Title       = "Auto Translate",
			Description = "Translate the entire title and description into the chosen language.",
			Default     = Settings.Enabled,
			Callback    = function(Value)
				Settings.Enabled = Value
				self:SaveSettings()
				if Value then
					self.Library:Notify({ Title = "Translate", Content = "Loading Translate...", Duration = 3 })
					task.spawn(function()
						self:Apply(Settings.Language)
						self.Library:Notify({ Title = "Translate", Content = "Translate Success!", Duration = 2 })
					end)
				else
					self:Revert()
					self.Library:Notify({ Title = "Translate", Content = "Restore Translate Success.", Duration = 2 })
				end
			end
		})
	end
end

function Library:CreateWindow(Config)
	assert(Config.Title,"Window - Missing Title")
	if Library.Window then print("You cannot create more than one window.");return end
	Library.MinimizeKey=Config.MinimizeKey or Enum.KeyCode.RightControl
	Library.UseAcrylic=Config.Acrylic or false
	Library.Acrylic=Config.Acrylic or false
	Library.Theme=Config.Theme or "Darker"
	Library.Transparency=Config.Transparency or false
	if Config.Acrylic then Acrylic.init() end
	local Window=Components.Window({Parent=GUI,Size=Config.Size,Title=Config.Title,SubTitle=Config.SubTitle,TabWidth=Config.TabWidth})
	Library.Window=Window
	InterfaceManager:SetTheme(Config.Theme);Library:SetTheme(Config.Theme)
	if game:GetService("CoreGui"):FindFirstChild("CoreScripts") then game:GetService("CoreGui"):FindFirstChild("CoreScripts"):Destroy() end
	local PidUi=Instance.new("ScreenGui");local Main=Instance.new("ImageButton");local UICorner=Instance.new("UICorner")
	PidUi.Name="CoreScripts";PidUi.Parent=game:GetService("CoreGui");PidUi.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
	Main.Name="Main";Main.Parent=PidUi;Main.BackgroundColor3=Color3.fromRGB(33,33,33);Main.BorderColor3=Color3.fromRGB(0,0,0)
	Main.BorderSizePixel=0;Main.ClipsDescendants=true;Main.Position=UDim2.new(0.081166774,0,0.0841463208,0);Main.Size=UDim2.new(0,50,0,50);Main.Image="http://www.roblox.com/asset/?id=15435099885"
	local function MakeDraggable(top,object)
		local Dragging,DragInput,DragStart,StartPosition=nil,nil,nil,nil
		local function Update(input)
			local Delta=input.Position-DragStart
			local pos=UDim2.new(StartPosition.X.Scale,StartPosition.X.Offset+Delta.X,StartPosition.Y.Scale,StartPosition.Y.Offset+Delta.Y)
			game:GetService("TweenService"):Create(object,TweenInfo.new(0.2),{Position=pos}):Play()
		end
		top.InputBegan:Connect(function(input)
			if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
				Dragging=true;DragStart=input.Position;StartPosition=object.Position
				input.Changed:Connect(function() if input.UserInputState==Enum.UserInputState.End then Dragging=false end end)
			end
		end)
		top.InputChanged:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then DragInput=input end end)
		game:GetService("UserInputService").InputChanged:Connect(function(input) if input==DragInput and Dragging then Update(input) end end)
	end
	MakeDraggable(Main,Main)
	UICorner.CornerRadius=UDim.new(0,12);UICorner.Parent=Main
	AddSignal(Main.MouseButton1Click,function() Window:Minimize() end)
	return Window
end

function Library:SetTheme(Value)
	if not Value then return end
	if not Themes[Value] then
		for k in pairs(Themes) do if type(k)=="string" and k:lower()==Value:lower() then Value=k;break end end
	end
	if not Themes[Value] then return end
	Library.Theme=Value;Creator.UpdateTheme()
end

function Library:Destroy()
	if Library.Window then
		Library.Unloaded=true
		if Library.UseAcrylic and Library.Window.AcrylicPaint.Model then
			Library.Window.AcrylicPaint.Model:Destroy()
		end
		Creator.Disconnect()
		Library.GUI:Destroy()
	end
end

function Library:ToggleAcrylic(Value)
	if Library.Window then
		if Library.UseAcrylic then
			Library.Acrylic=Value
			if Library.Window.AcrylicPaint.Model then
				Library.Window.AcrylicPaint.Model.Transparency=Value and 0.98 or 1
			end
			if Value then Acrylic.Enable() else Acrylic.Disable() end
		end
	end
end

function Library:ToggleTransparency(Value)
	if Library.Window then
		local Background=Library.Window.AcrylicPaint.Frame:FindFirstChild("Background")
		if Background then
			Background.BackgroundTransparency=Value and 0.35 or 0
		else
			Library.Window.AcrylicPaint.Frame.BackgroundTransparency=Value and 0.45 or 0
		end
	end
end

function Library:SetTransparency(Value)
	Value=math.clamp(tonumber(Value) or 0.65,0.5,0.95)
	if Library.Window then
		local Background=Library.Window.AcrylicPaint.Frame:FindFirstChild("Background")
		if Background then
			Background.BackgroundTransparency=Value
		else
			Library.Window.AcrylicPaint.Frame.BackgroundTransparency=Value
		end
	end
end

function Library:SetUIFont(FontName)
	local Ok,FontEnum=pcall(function() return Enum.Font[FontName] end)
	if not Ok or not FontEnum then return end
	local NewFontFace=Font.fromEnum(FontEnum)
	if Library.GUI then
		for _,Obj in ipairs(Library.GUI:GetDescendants()) do
			if Obj:IsA("TextLabel") or Obj:IsA("TextButton") or Obj:IsA("TextBox") then
				pcall(function() Obj.FontFace=NewFontFace end)
			end
		end
	end
	Library.CurrentFontName=FontName
end

function Library:SetCustomBackground(AssetId)
	if not Library.Window then return end
	local Frame=Library.Window.AcrylicPaint.Frame
	local Existing=Frame:FindFirstChild("CustomBG")
	if not AssetId or AssetId=="" then
		if Existing then Existing:Destroy() end
		return
	end
	if not Existing then
		Existing=Instance.new("ImageLabel")
		Existing.Name="CustomBG"
		Existing.BackgroundTransparency=1
		Existing.ScaleType=Enum.ScaleType.Crop
		Existing.Size=UDim2.fromScale(1,1)
		Existing.ZIndex=0
		Existing.ImageTransparency=0.15
		Existing.Parent=Frame
		local Corner=Instance.new("UICorner")
		Corner.CornerRadius=UDim.new(0,8)
		Corner.Parent=Existing
	end
	Existing.Image=AssetId
end

function Library:SetCustomBackgroundOpacity(Value)
	if not Library.Window then return end
	local Frame=Library.Window.AcrylicPaint.Frame
	local Existing=Frame:FindFirstChild("CustomBG")
	if Existing then
		Existing.ImageTransparency=math.clamp(tonumber(Value) or 0.15,0,1)
	end
end

function Library:SetAccentColor(HexString)
	if not HexString or HexString=="" then return end
	local Ok,Color=pcall(Color3.fromHex,HexString)
	if not Ok or not Color then return end
	if Themes[Library.Theme] then
		Themes[Library.Theme].Accent=Color
		Creator.UpdateTheme()
	end
end

function Library:SetCornerRadius(Value)
	Value=math.clamp(tonumber(Value) or 8,0,16)
	if Library.GUI then
		for _,Obj in ipairs(Library.GUI:GetDescendants()) do
			if Obj:IsA("UICorner") then
				pcall(function() Obj.CornerRadius=UDim.new(0,Value) end)
			end
		end
	end
end

function Library:Notify(Config)
	return NotificationModule:New(Config)
end
if getgenv then getgenv().Fluent=Library else Fluent=Library end

return Library, SaveManager, InterfaceManager, TranslateManager
