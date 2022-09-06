local Library = {}
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

function getId()
	local str = {"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
	local toReturn = ""
	for i, v in pairs(str) do
		local addNew = math.random(1, #str)
		addNew = str[addNew]
		toReturn = toReturn .. addNew
	end
	return toReturn
end

function Library.Create(Class, Parent, Table)
	local newObj = Instance.new(Class)
	newObj.Parent = Parent
	newObj.Name = getId()
	for i, v in pairs(Table) do
		local success, err = pcall(function()
			return newObj[i]
		end)
		if (success) then
			newObj[i] = v
		else
			warn(err)
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
	-- implement TweenService
	local nTweenInfo = TweenInfo.new(Duration, Enum.EasingStyle[Style], Enum.EasingDirection[Direction])
	local Tween = TweenService:Create(GuiObj, nTweenInfo, {[Property] = Value})
	Tween:Play()
end

return Library
