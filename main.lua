display.setStatusBar( display.HiddenStatusBar )

local physics = require 'physics'
physics.start()

local constants = require 'constants'

local bg = display.newRect( constants._W * 0.5, constants._H * 0.5, constants._W, constants._H )
bg:setFillColor( unpack( constants.colorWhite ) )

local leftWall = display.newRect( constants.wallWidth * 0.5, constants._H * 0.5, constants.wallWidth, constants._H )
leftWall:setFillColor( unpack( constants.colorBlack ) )
physics.addBody( leftWall, 'static' )

local rightWall = display.newRect( constants._W - constants.wallWidth * 0.5, constants._H * 0.5, constants.wallWidth, constants._H )
rightWall:setFillColor( unpack( constants.colorBlack ) )
physics.addBody( rightWall, 'static' )

local floor = display.newRect( constants._W * 0.5, constants._H - constants.floorHeight * 0.5, constants._W, constants.floorHeight )
floor:setFillColor( unpack( constants.colorBlack ) )
physics.addBody( floor, 'static' )

local function createBall()
    local ball = display.newCircle( math.random(0, constants._W ), -100, 10 )
    ball:setFillColor( math.random(), math.random(), math.random() )
    physics.addBody( ball, 'dynamic', { bounce = 1.0 } )

    function ball:collision()
        self:setFillColor( math.random(), math.random(), math.random() )
    end
    ball:addEventListener( 'collision' )
end

timer.performWithDelay( 500, function()
    local displayNum = math.random( 5, 10 )
    for _ = 1, displayNum do
        createBall()
    end
end, -1 )