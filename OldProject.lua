--[[
    no wait functions, no pcalls, and better preformance, this will have an update checker later.
    got bored so i figured why not upload some old scripts.
]]

local move_spam = {move_1 = '',  move_2 = '', move_3 = '', move_4 = '', move_5 = '', move_6 = '' };
local configureable_settings = { check_updates = true };
local hooks = { };
local array = { state1 = "HumanoidParallelRemoveNoPhysicsNoSimulate2", state2 = "HumanoidParallelRemoveNoPhysics" };

local fn_teleport = function()
    if (game.PlaceId == 882375367) then
        return (true);
    end;

    game.TeleportService:Teleport(882375367);
end;

local finallized;
do
    local newcclosure = newcclosure;
    local getnamecallmethod = getnamecallmethod;
    local hook = hooks.__oldnc;
    
    hook = hookmetamethod(game, '__namecall', newcclosure(function(...)
        local self, args = ..., { self };
        local tlcond = (self.ClassName == 'Tool' and getnamecallmethod() == 'Activate');
        if (tlcond) then
            do
                finallized = self.Name;
            end;
        end;
        return hook(...);
    end));
end;

local lplr = game.Players.LocalPlayer;
local ipairs = ipairs;
local tostring = tostring;
local strf = string.find;
local stepped = game.RunService.stepped;
local humanoid = lplr.Character.Humanoid;
local tpack = table.pack;
local teleport = fn_teleport();
local setfflag = setfflag;

if (not teleport) then
    return;
end;

local function humanoid_para_remno_physics(n)
    do
        return setfflag(n, "False");
    end;
end;

local st1, st2 = humanoid_para_remno_physics(array.state1), humanoid_para_remno_physics(array.state2);

local function get_npc()
    local npc_found;
    for i,v in ipairs(game.Workspace.Live:GetChildren()) do
        local condit = strf(tostring(v), 'Goku');
        do
            if (condit) then
                npc_found = tostring(v.Name);
            end;
        end;
    end;
    return npc_found;
end;

local hardPunch = function()
    local kv = lplr.Character.Ki.Value;
    do
        if ((finallized ~= nil) and kv < 10) then
            -- # // todo
        end;
    end;
end;

local punch = stepped:connect(hardPunch);
