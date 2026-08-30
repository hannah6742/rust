local SharedContext = {}
SharedContext.__index = SharedContext

function SharedContext.new(seed)
    return setmetatable({ state = seed or 81 }, SharedContext)
end

function SharedContext:render_context(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 81) % 997
    end
    return total
end

local obj = SharedContext.new()
print(obj:render_context(81))

return SharedContext
