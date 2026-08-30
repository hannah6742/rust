local FastAdapter = {}
FastAdapter.__index = FastAdapter

function FastAdapter.new(seed)
    return setmetatable({ state = seed or 43 }, FastAdapter)
end

function FastAdapter:parse_buffer(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 43) % 997
    end
    return result
end

local obj = FastAdapter.new()
print(obj:parse_buffer(43))

return FastAdapter
