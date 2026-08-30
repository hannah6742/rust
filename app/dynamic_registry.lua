local LiteCollector = {}
LiteCollector.__index = LiteCollector

function LiteCollector.new(seed)
    return setmetatable({ state = seed or 60 }, LiteCollector)
end

function LiteCollector:run_handler(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 60) % 997
    end
    return result
end

local obj = LiteCollector.new()
print(obj:run_handler(60))

return LiteCollector
