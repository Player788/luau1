local Library = {}
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function Library.Create(Class, Parent, Table)
	local newObj = Instance.new(Class)
	newObj.Parent = Parent
	newObj.Name = Table.Name or newObj.Name
	for i, v in pairs(Table) do
		local success, err = pcall(function()
			return newObj[i]
		end)
		if (success) then
			newObj[i] = v
		else
		end
	end
	return newObj
end

Library.Headshot = function(UserId)
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size100x100
	local content, isReady = Players:GetUserThumbnailAsync(UserId, thumbType, thumbSize)
	return content
end

Library.AvatarThumbnail = function(UserId)
	local thumbType = Enum.ThumbnailType.AvatarThumbnail
	local thumbSize = Enum.ThumbnailSize.Size420x420
	local content, isReady = Players:GetUserThumbnailAsync(UserId, thumbType, thumbSize)
	return content
end

Library.GetUserId = function(Name)
	local UserId = Players:GetUserIdFromNameAsync(Name)
	return UserId
end

Library.GetName = function(UserId)
	local Name = Players:GetNameFromUserIdAsync(UserId)
	return Name
end

Library.Date = function(Pattern)
	local Result = os.date(Pattern, os.time())
	return Result
end

Library.Tween = function(GuiObj, Property, Value, Direction, Style, Duration)
	Direction = Direction or "Out"
	Style = Style or "Quint"
	Duration = Duration or 0.3
	local nTweenInfo = TweenInfo.new(Duration, Enum.EasingStyle[Style], Enum.EasingDirection[Direction])
	local Tween = TweenService:Create(GuiObj, nTweenInfo, {[Property] = Value})
	Tween:Play()
	return Tween
end

Library.MouseHover = function(GuiObj, Property, Value1, Value2)
	GuiObj.MouseEnter:Connect(function()
		Library.Tween(GuiObj, Property, Value1, "Out", "Quint", 0.1)
	end)
	GuiObj.MouseLeave:Connect(function()
		Library.Tween(GuiObj, Property, Value2, "Out", "Quint", 0.1)
	end)
end

Library.BoolToString = function(Bool)
	if Bool == true then
		return "true"
	elseif Bool == false then
		return "false"
	end
end

Library.toJSON = function(Table)
	pcall(function()
		local JSON = game:GetService("HttpService"):JSONEncode( {Table} )
		return JSON
	end)
	return "Failed pcall ?"
end

Library.toTable = function(JSON)
	pcall(function()
		local Table = game:GetService("HttpService"):JSONDecode( {JSON} )
		return Table
	end)
	return "Failed pcall ?"
end

Library.EnumToString = function(KeyCode)
	pcall(function()
		local SplitString = string.split(tostring(KeyCode), ".")
		local Name = SplitString[3]
		return Name
	end)
	return "Failed pcall ?"
end

Library.Draggable = function(DragPoint, ToMove)
	pcall(function()
		local Dragging, DragInput, MousePos, FramePos = nil, nil, nil, nil
		DragPoint.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = true
				MousePos = Input.Position
				FramePos = ToMove.Position

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)
		DragPoint.InputChanged:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				DragInput = Input
			end
		end)
		UserInputService.InputChanged:Connect(function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				Library.Tween(ToMove, "Position", UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y), "Out", "Quint", 0.15)
			end
		end)
	end)
end

Library.Click = function(Table)
	local Click = Library.Create("TextButton", Table[1], {
		BackgroundTransparency = 1,
		Text = "",
		Size = UDim2.new(1,0,1,0),
		AutoButtonColor = false,
	})
	Click.Activated:Connect(function()
		if Table.Callback then
			return Table.Callback()
		end
	end)
	return Click
end

return Library

