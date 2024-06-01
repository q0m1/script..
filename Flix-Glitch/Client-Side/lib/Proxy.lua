Proxy = {}
local b = {}
local function c(c) b = c end
local function d(d, e)
    local f = getmetatable(d).name
    local b = function(d, g)
        if d == nil then d = {} end
        TriggerEvent(f .. ":proxy", e, d, c)
        return table.unpack(b)
    end
    d[e] = b
    return b
end
function Proxy.addInterface(b, c)
    AddEventHandler(b .. ":proxy", function(b, d, e)
        local b = c[b]
        if type(b) == "function" then
            e({b(table.unpack(d))})
        else
        end
    end)
end
function Proxy.getInterface(b)
    local b = setmetatable({}, {__index = d, name = b})
    return b
end
