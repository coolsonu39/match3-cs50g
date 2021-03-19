--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    if (math.random(40) == 1) then
        self.isShiny = true
    else
        self.isShiny = false
    end

    self.shinyAlpha = 0.5 --spec3
    self.colorTimer = Timer.every(0.6, function()
        if (self.shinyAlpha == 0) then self.shinyAlpha = 0.5 else self.shinyAlpha = 0 end
    end)
    
end

function Tile:render(x, y)
    
    -- draw shadow
    -- if (self.isShiny) then
    --     love.graphics.setColor(34, 32, 52, self.shinyAlpha)
    -- else
    -- end
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
    self.x + x, self.y + y)
    if (self.isShiny) then
        love.graphics.setColor(255, 255, 255, self.shinyAlpha)
        love.graphics.rectangle("fill", self.x + x, self.y + y, 32, 32, 10 )
        -- love.graphics.setColor(255, 255, 255, self.shinyAlpha)
    -- else
    end
end