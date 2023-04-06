local setmetatable = setmetatable

local n = setmetatable({ }, { __index = function(self, k) return game:GetService(k) end });
local str_rep = string.rep;
local replic_nm = 30;
local change_logs = { lent = { } };

local rconsolewarn = rconsolewarn
local rconsolename = rconsolename
local rconsoleclear = rconsoleclear
local tins = table.insert

change_logs.__index = change_logs;

function change_logs.new(ac)
    local self = setmetatable({}, change_logs);
    
    self.terminal_name = n.HttpService:GenerateGUID(false);
    
    if ac then
        rconsolename(self.terminal_name);
        do
            rconsoleclear();
        end;
    end;
    
    do
        return self;
    end
end;

local function nw(...)
    do
        rconsolewarn(...)
    end
end

function change_logs:change_log(n)
    local rep_str = str_rep('=', replic_nm);
    
    do
        if n.en then
            do
                nw(rep_str .. ' ' .. n.nm .. ' ' ..  rep_str)
            end;
        end
    end;
    
    do
        return self;
    end;
end;

function change_logs:txt(n)
    do
        tins(change_logs.lent, #change_logs.lent);
    end;
    
    rconsoleerr('['..#change_logs.lent..']' .. n.split .. n.txt);

    return self;
end;

return change_logs;
