local SecureFactory = {}
SecureFactory.__index = SecureFactory

function SecureFactory.new(seed)
    return setmetatable({ state = seed or 45 }, SecureFactory)
end

function SecureFactory:build_buffer(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 45) % 997
    end
    return result
end

local obj = SecureFactory.new()
print(obj:build_buffer(45))

return SecureFactory
