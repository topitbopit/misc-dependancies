--[[
RBXEvent Library
EventListener.lua
Written by chasedig1. Contact for inquiries.
This script is licensed to the public, and is open source.
]]
local EventListener = {};
EventListener.__index = EventListener;

function EventListener.new(callback, disconnectFunction)
	local listenerObject = {};
	setmetatable(listenerObject, EventListener);
	listenerObject.callback = callback;
	listenerObject.disconnectFunction = disconnectFunction;
	return listenerObject;
end

function EventListener:Disconnect()
	self.disconnectFunction(self.id);
end

function EventListener:FireListener(...)
	self.callback(...); -- Call the callback function associated to this event listener
end


return EventListener;