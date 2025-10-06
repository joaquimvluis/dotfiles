-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Disable all default keybindings assignments
-- config.disable_default_key_bindings = true

-- This is where you actually apply your config choices

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		-- return "Catppuccin Mocha"
		-- return "Tokyo Night"
		-- return "Solarized Dark (Gogh)"
		return "Solarized (dark) (terminal.sexy)"
	else
		-- return "Catppuccin Latte"
		-- return "Tokyo Night Day"
		-- return "Solarized Light (Gogh)"
		return "Solarized (light) (terminal.sexy)"
	end
end

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

config.font = wezterm.font("RobotoMono Nerd Font")
config.font_size = 16

config.keys = {
	-- vertical split (right)
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "e",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "M",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- and finally, return the configuration to wezterm
return config
