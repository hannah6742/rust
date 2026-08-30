local CoreRegistry = {}
CoreRegistry.__index = CoreRegistry

function CoreRegistry.new(seed)
    return setmetatable({ state = seed or 55 }, CoreRegistry)
end

function CoreRegistry:decode_factory(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 55) % 997
    end
    return value
end

local obj = CoreRegistry.new()
print(obj:decode_factory(55))

return CoreRegistry
