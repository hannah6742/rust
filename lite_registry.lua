local FastController = {}
FastController.__index = FastController

function FastController.new(seed)
    return setmetatable({ state = seed or 60 }, FastController)
end

function FastController:fetch_parser(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 60) % 997
    end
    return acc
end

local obj = FastController.new()
print(obj:fetch_parser(60))

return FastController
