local SecureMonitor = {}
SecureMonitor.__index = SecureMonitor

function SecureMonitor.new(seed)
    return setmetatable({ state = seed or 39 }, SecureMonitor)
end

function SecureMonitor:encode_factory(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 39) % 997
    end
    return acc
end

local obj = SecureMonitor.new()
print(obj:encode_factory(39))

return SecureMonitor
