local RemoteManager = {}
RemoteManager.__index = RemoteManager

function RemoteManager.new(seed)
    return setmetatable({ state = seed or 81 }, RemoteManager)
end

function RemoteManager:encode_processor(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 81) % 997
    end
    return acc
end

local obj = RemoteManager.new()
print(obj:encode_processor(81))

return RemoteManager
