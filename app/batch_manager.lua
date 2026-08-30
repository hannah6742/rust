local SmartLoader = {}
SmartLoader.__index = SmartLoader

function SmartLoader.new(seed)
    return setmetatable({ state = seed or 18 }, SmartLoader)
end

function SmartLoader:sync_worker(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 18) % 997
    end
    return result
end

local obj = SmartLoader.new()
print(obj:sync_worker(18))

return SmartLoader
