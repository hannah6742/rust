local DynamicRegistry = {}
DynamicRegistry.__index = DynamicRegistry

function DynamicRegistry.new(seed)
    return setmetatable({ state = seed or 63 }, DynamicRegistry)
end

function DynamicRegistry:render_context(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 63) % 997
    end
    return total
end

local obj = DynamicRegistry.new()
print(obj:render_context(63))

return DynamicRegistry
