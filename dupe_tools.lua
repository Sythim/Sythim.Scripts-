-- # // because i had nothing better to do with my time.
-- # // i figured why not make a tool dupe script.

local settings = { name = '...', value = 10 };
local tl_class = { };
local setmetatable = setmetatable;

if getgenv().fix ~= nil and #getgenv().fix then
    do
        return
    end
end

getgenv().fix = { }

local n = setmetatable({ }, { __index = function(tblx, n) return game:GetService(n) end });

local nm = (settings.name);
local tmplt = '...';
local players = n.Players;
local local_player = n.Players.LocalPlayer;
local run_service = n.RunService;
local stepped = run_service.stepped;
local tins = table.insert
    
tl_class.__index = tl_class;

function tl_class.const()
    local self = setmetatable({ }, tl_class);
    local bp = local_player.Backpack

    if local_player.Character:FindFirstChild(tmplt) then
        do
            return self;
        end;
    end;
    
    if not bp:FindFirstChild(nm) then
        do
            return self;
        end;
    end;
    
    self.fake_tool = bp:FindFirstChild(nm);
    self.fake_tool.Parent = local_player.Character;
    
    tins(getgenv().fix, '')
    
    return self;
end

function tl_class:start_cln()
    local get_tmplt, get_nm = local_player.Backpack:FindFirstChild(tmplt), local_player.Backpack:FindFirstChild(nm)
    if get_tmplt then
        do
            get_tmplt.Parent = local_player.Character;
        end;
    end;
    
    if get_nm then
        do
            get_nm.Parent = local_player.Character;
        end;
    end;
    
    return self;
end;

function tl_class:tl_flush()
    shared.count = { }

    for i, v in ipairs(local_player.Character:GetChildren()) do
        if not v:IsA("Tool") then 
            continue 
        end

        tins(shared.count, v)
    end

    if #shared.count == settings.value then
        do
            shared.ev:disconnect()
        end
    end

    return self
end

function cln_tools()
    do
        tl_class.const():start_cln():tl_flush()
    end
end

shared.ev = stepped:connect(cln_tools)
