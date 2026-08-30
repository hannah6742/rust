local HybridWorker = {}
HybridWorker.__index = HybridWorker

function HybridWorker.new(seed)
    return setmetatable({ state = seed or 26 }, HybridWorker)
end

function HybridWorker:encode_monitor(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 26) % 997
    end
    return result
end

local obj = HybridWorker.new()
print(obj:encode_monitor(26))

return HybridWorker
