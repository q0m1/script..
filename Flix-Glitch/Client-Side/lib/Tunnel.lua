Tools = {}
local b = {}
function Tools.newIDGenerator()
    local b = setmetatable({}, {__index = b})
    b:construct()
    return b
end
function b:construct() self:clear() end
function b:clear()
    self.max = 0
    self.ids = {}
end
function b:gen()
    if #self.ids > 0 then
        return table.remove(self.ids)
    else
        local b = self.max
        self.max = self.max + 1
        return b
    end
end
function b:free(b) table.insert(self.ids, b) end
Tunnel = {}
local function b(b, c)
    local d = getmetatable(b)
    local e = d.name
    local f = d.tunnel_ids
    local g = d.tunnel_callbacks
    local d = d.identifier
    local d = function(b, h)
        if b == nil then b = {} end
        if type(h) == "function" then
            local f = f:gen()
            g[f] = h
            TriggerServerEvent(e .. ":tunnel_req", c, b, d, f)
        else
            TriggerServerEvent(e .. ":tunnel_req", c, b, "", -1)
        end
    end
    b[c] = d
    return d
end
function Tunnel.bindInterface(b, c)
    RegisterNetEvent(b .. ":tunnel_req")
    AddEventHandler(b .. ":tunnel_req", function(d, e, f, g)
        local c = c[d]
        local d = false
        local h = {}
        if type(c) == "function" then
            TUNNEL_DELAYED = function()
                d = true
                return function(c)
                    c = c or {}
                    if g >= 0 then
                        TriggerServerEvent(b .. ":" .. f .. ":tunnel_res", g, c)
                    end
                end
            end
            h = {c(table.unpack(e))}
        end
        if not d and g >= 0 then
            TriggerServerEvent(b .. ":" .. f .. ":tunnel_res", g, h)
        end
    end)
end
function Tunnel.getInterface(c, d)
    local e = Tools.newIDGenerator()
    local f = {}
    local b = setmetatable({}, {
        __index = b,
        name = c,
        tunnel_ids = e,
        tunnel_callbacks = f,
        identifier = d
    })
    RegisterNetEvent(c .. ":" .. d .. ":tunnel_res")
    AddEventHandler(c .. ":" .. d .. ":tunnel_res", function(b, c)
        local d = f[b]
        if d ~= nil then
            e:free(b)
            f[b] = nil
            d(table.unpack(c))
        end
    end)
    return b
end
