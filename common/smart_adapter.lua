local SecureContext = {}
SecureContext.__index = SecureContext

function SecureContext.new(seed)
    return setmetatable({ state = seed or 91 }, SecureContext)
end

function SecureContext:compute_buffer(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 91) % 997
    end
    return count
end

local obj = SecureContext.new()
print(obj:compute_buffer(91))

return SecureContext
