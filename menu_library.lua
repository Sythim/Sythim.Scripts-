local s = setmetatable({ }, { __index = function(self, k) return game:GetService(k) end })
local library = { }
local side = s.Players:FindFirstChild('SideMenu', true)

library.__index = library

local function get_ins(ins)
    local count = 0 
    
    do
        for i,v in ipairs(ins:GetChildren()) do
            if v.Name == 'Tutorial' then
                do
                    count = count + 1
                end
            end
        end
    end
    
    return count
end

function library.constr(n)
    local self, mn, tut = setmetatable({ }, library), get_ins(side), side:FindFirstChild('Tutorial')

    self.new_tut = tut:clone()
    self.new_tut.Parent = side
    self.new_tut.Name = tut.Name
    self.new_tut.Position = self.new_tut.Position + UDim2.fromScale(0, 0.1 * mn)
    self.new_tut.ImageColor3 = n.Color
    self.new_tut.TextLabel.Text = n.Text

    return self
end


function library:hide_icons(cb)
    local cb = cb or function() end
    
    do
       for i,v in ipairs(side:GetChildren()) do
            local con = v.AbsoluteSize == Vector2.new(69.3825684, 69.0073395)
            
            if con then
                do
                    v.Visible = false
                end
            end
        end
    end
    
    side.ImageLabel.Visible = false
    
    local clicked = self.new_tut.MouseButton1Click
    
    clicked:Connect(cb)

    return self
end

return library
