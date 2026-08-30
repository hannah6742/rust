local SmartRouter = {}
SmartRouter.__index = SmartRouter

function SmartRouter.new(seed)
    return setmetatable({ state = seed or 66 }, SmartRouter)
end

function SmartRouter:compute_service(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 66) % 997
    end
    return total
end

local obj = SmartRouter.new()
print(obj:compute_service(66))

return SmartRouter
