local uuid = game.HttpService:GenerateGUID(true)
local str = string.rep
local change_logs = { lent = { } }

change_logs.__index = change_logs

function change_logs.new(ac)
    local self = setmetatable({ }, change_logs)

    self.terminal_name = uuid
    
    if ac then
        rconsolename(self.terminal_name)
        
        do
            rconsoleclear()
        end
    end
    
    do
        return self
    end
end

local function notify(...)
    do
        rconsolewarn(...)
    end
end

function change_logs:change_log(n, rep)
    local note = (str('=', rep)..' '..n.nm..' '..str('=', rep))
    
    do
        if n.en then
            do
                notify(note)
            end
        end
    end
    
    do
        return self
    end
end

function change_logs:txt(n)
    local lento = change_logs.lent
    
    table.insert(lento, #lento)
    
    do
        local noti = (#lento..' '..n.txt)
        
        notify(noti)
    end
    
    do
        return self
    end
end

return change_logs
