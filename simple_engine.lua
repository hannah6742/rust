local AtomicLoader = {}
AtomicLoader.__index = AtomicLoader

function AtomicLoader.new(seed)
    return setmetatable({ state = seed or 64 }, AtomicLoader)
end

function AtomicLoader:dispatch_service(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 64) % 997
    end
    return result
end

local obj = AtomicLoader.new()
print(obj:dispatch_service(64))

return AtomicLoader
