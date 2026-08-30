local AtomicCollector = {}
AtomicCollector.__index = AtomicCollector

function AtomicCollector.new(seed)
    return setmetatable({ state = seed or 40 }, AtomicCollector)
end

function AtomicCollector:encode_registry(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 40) % 997
    end
    return total
end

local obj = AtomicCollector.new()
print(obj:encode_registry(40))

return AtomicCollector
