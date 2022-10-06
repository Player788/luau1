# S' Library
S' Library Usage

## Booting the Library
```lua
local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Player788/luau1/main/source.lua')))()
```

## Creating a Window
```lua
local Window = Library:Window("UI name", "Script name", "rbxassetid://YourIconId")
```

## Creating a Tab
```lua
local Tab = Window:AddTab("Name")

--[[
Name = <string> - The name of the tab.
]]
```

## Creating a Section
```lua
local Section = Tab:AddSection("Name")

--[[
Name = <string> - The name of the section.
]]
```
Section header won't be visible for now

## Notifying the user
```lua
Library:Notification({
	Title = "Title",
	Content = "Content",
	Time = 5
})


--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Time = <number> - The duration of the notfication.
]]
```



## Creating a Button
```lua
Section:AddButton({
	Text = "Name",
	Callback = function()
      		print("button pressed")
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
```


## Creating a Checkbox toggle
```lua
Section:AddToggle({
	Text = "Name",
	Default = false,
	Callback = function(Value)
		print(Value)
		end
	end
})

--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]
```

### Changing the value of an existing Toggle
```lua
CoolToggle:Set(true)
```

## Creating a Slider
```lua
Section:AddSlider({
	Text = "Name",
	Min = 0,
	Max = 200,
	Default = 16,
	Color = Color3.fromRGB(85, 170, 255),
	Callback = function(Value)
		print(Value)
	end
})


--[[
Name = <string> - The name of the slider.
Min = <number> - The minimal value of the slider.
Max = <number> - The maxium value of the slider.
Default = <number> - The default value of the slider.
Callback = <function> - The function of the slider.
]]
```

### Change Slider Value
```lua
Slider:Set(2)
```
Make sure you make your slider a variable (local CoolSlider = Section:AddSlider...) for this to work.


## Creating a Label
```lua
Tab:AddLabel("Label")
```

### Changing the value of an existing label
```lua
CoolLabel:Set("Label New!")
```


## Creating an Adaptive Input
```lua
Section:AddTextBox({
	Text = "Name",
	Default = "16",
	Callback = function(Value)
		print(Value)
	end
})

--[[
Name = <string> - The name of the textbox.
Default = <string> - The default value of the textbox.
Callback = <function> - The function of the textbox.
]]
```


## Creating a Keybind
```lua
Section:AddBind({
	Text = "Name",
	Default = Enum.KeyCode.E,
	Callback = function(Value)
		print("Pressed "..Value.Name)
		-- do stuff
	end    
})

--[[
Name = <string> - The name of the bind.
Default = <keycode> - The default value of the bind.
Callback = <function> - The function of the bind.
]]
```

### Chaning the value of a bind
```lua
Bind:Set(Enum.KeyCode.E)
```


## Creating a Dropdown menu
```lua
Section:AddDropDown({
	Text = "Select Option",
	Default = "16",
	Options = {16, 200},
	Callback = function(Value)
		print(Value)
	end
})

--[[
Name = <string> - The name of the dropdown.
Default = <string> - The default value of the dropdown.
Options = <table> - The options in the dropdown.
Callback = <function> - The function of the dropdown.
]]
```

### Adding a set of new Dropdown buttons to an existing menu
```lua
Dropdown:Refresh(List<table>,true)
```

The above boolean value "true" is whether or not the current buttons will be deleted.
### Selecting a dropdown option
```lua
Dropdown:Set("dropdown option")
```

## Check script logs
Press window icon (Top left)
