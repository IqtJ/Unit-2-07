-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
display.setDefault( "background", 255, 0, 0 )
------------------------------
-------------------
-----
-----------------------------------------------
local image = display.newImageRect( "assets/bubble.png", 300, 100)
image.x = 160
image.y = 55
image.id = "bubble"
local diameterOfPizzaTextField = native.newTextField( display.contentCenterX, display.contentCenterY + 150, 250, 50 )
diameterOfPizzaTextField.id = "diameter textField"

local costOfPizzaText = display.newText( "Cost", display.contentCenterX, display.contentCenterY - 200, native.systemFont, 30)
costOfPizzaText.id = "cost text"
costOfPizzaText:setFillColor( 255, 0, 0)

local enterText = display.newText( "Enter diameter (inches)" , 160, 345, native.systemFont, 25)
enterText.id = "enter text"
enterText:setFillColor( 1, 1, 1)

local pizza = display.newImageRect( "assets/pizza.png", 250, 150)
pizza.x = 160
pizza.y = 200
pizza.id = "pizza"


local calculateButton = display.newImageRect( "assets/cost.png", 200, 77 )
calculateButton.x = 160
calculateButton.y = 475
calculateButton.id = "calculate button"

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end
 
local function calculateButtonTouch( event )
    -- this function calculates the area of a square given the length of one of its sides
 
    local diameterOfPizza
    local costOfPizza
 
    diameterOfPizza = diameterOfPizzaTextField.text
    costOfPizza = ( ( 0.50 * diameterOfPizza ) + 0.75 + 1.00) *1.13
    costOfPizza = round(costOfPizza,2)
    -- print( areaOfSquare )
    costOfPizzaText.text = "The cost is $" .. costOfPizza


    return true
end

calculateButton:addEventListener( "touch", calculateButtonTouch )