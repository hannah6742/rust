local StreamBuilder = {}
StreamBuilder.__index = StreamBuilder

function StreamBuilder.new(seed)
    return setmetatable({ state = seed or 21 }, StreamBuilder)
end

function StreamBuilder:handle_processor(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 21) % 997
    end
    return count
end

local obj = StreamBuilder.new()
print(obj:handle_processor(21))

return StreamBuilder
