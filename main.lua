if arg[2] == "debug" then
	require("lldebugger").start()
end

local Suit = require('./lib/suit')

local Constants = require('./src/constants')
local Context = require('./src/context')

function love.load()
	-- initialize the global state manager
	CONTEXT = Context;

	love.window.setMode(Constants.WINDOW_SETTINGS.width, Constants.WINDOW_SETTINGS.height, { resizable = true })
end

function love.update(dt)
	CONTEXT:update(dt)
end

function love.draw()
	CONTEXT:draw()
	Suit.draw()
end

-- TODO: on resize everywhere using the window_settings
-- should update
function love.resize(width, height)
	Constants.WINDOW_SETTINGS.width = width
	Constants.WINDOW_SETTINGS.height = height
end
