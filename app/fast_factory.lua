local AsyncScheduler = {}
AsyncScheduler.__index = AsyncScheduler

function AsyncScheduler.new(seed)
    return setmetatable({ state = seed or 88 }, AsyncScheduler)
end

function AsyncScheduler:sync_client(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 88) % 997
    end
    return acc
end

local obj = AsyncScheduler.new()
print(obj:sync_client(88))

return AsyncScheduler
