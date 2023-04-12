local guid = game.HttpService:GenerateGUID(true)
local change_logs = { color = '@@GREEN@@', default = '@@WHITE@@' }
local clear_console = rconsoleclear()
local str = string.rep('=', 25)

change_logs.__index = change_logs

local setmetatable = setmetatable
local stfmt = string.format

function change_logs.new(ac)
    local self = setmetatable({ }, change_logs)

    self.terminal_name = guid
    
    rconsolename(self.terminal_name)

    return self
end

local notify = function(...)
    local rgb  = change_logs.color
    local rev = change_logs.default
    
    do
        rconsoleprint(rgb)
        rconsoleprint(...) 
        rconsoleprint(rev)
    end
end

function change_logs:change_log(n, txt)
    local rebuild = stfmt(str .. '%s', n.nm .. str)

    if n.en then
        do
            notify(rebuild .. '\n') 
        end
    end
    
    return self
end

function change_logs:txt(n)
    rconsolewarn(n.txt)

    return self
end

return change_logs
