-- # // made this along time ago.
-- # // a simple cache.

local strs = { data1 = 'normal data', data2 = 'diffrent data'};
local get_data = { };

get_data.cache = { }

local setmetatable = setmetatable;

local metatable = { __call = function(tblx, k) 
    -- # // new cached data
    
    if tblx.cache[k] then 
        do
            return tblx.cache[k];
        end;
    end;
    
    -- # // not cached data
    
    local object = { name = k };
    
    tblx.cache[k] = object;
    
    return object;
end };

local cached_data = setmetatable(get_data, metatable);

local print = print;

local results = {
    test = get_data(strs.data1),
    name = get_data(strs.data2),
};

local n = print(results.test, results.test.name);
local o = print(results.name, results.name.name);
