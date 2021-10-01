--[[
RBXEvent Library
RBXEvent.lua
Written by chasedig1. Contact for inquiries.
This script is licensed to the public, and is open source.
]]
local RBXEvent = {};
RBXEvent.__index = RBXEvent;

local EventListener = require(script.EventListener);

function RBXEvent.new()
	local RBXEventObject = {};
	setmetatable(RBXEventObject, RBXEvent);
	RBXEventObject.observers = {};
	return RBXEventObject;
end;

function RBXEvent:Fire(...) -- Fire the event
	for _,observer in pairs(self.observers) do
		observer:FireListener(...); -- Fire the listener with the variable number of arguments
	end;
end;

function RBXEvent:DisconnectListener(id)
	table.remove(self.observers, id);
end

function RBXEvent:Connect(callback)
	if (callback == nil) then
		error("The event callback function provided was nil");
		return;
	end
	local listener = EventListener.new(callback, function(id)
		self:DisconnectListener(id);
	end);
	listener.id = #self.observers + 1;
	table.insert(self.observers, listener);
	return listener;
end

return RBXEvent;
