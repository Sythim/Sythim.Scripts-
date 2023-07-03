-- # // was going to add more hooks localized for now.

local hooks = { }

local getnamecallmethod = getnamecallmethod;
local hookmetamethod = hookmetamethod;
do
    hooks.nc1 = hookmetamethod(game, '__namecall', newcclosure(function(...)
        local self, args = ..., { ... };

        if table.remove(args, 1) and getnamecallmethod() == 'FireServer' and self.Name == 'EatSenzu' and args[1] ~= true then
            do
                return;
            end;
        end;

        return hooks.nc1(...);
    end));
end;
