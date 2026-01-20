--------------------------
-- 0 ) boiler plate config
--------------------------

local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end
local act = wezterm.action

config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

------------------
-- 1) THEME
------------------

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
		--return "Tokyo Night"
	end
	return "Catppuccin Latte"
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

----------------------
-- 2) WINDOW / TABS
----------------------

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = { left = 4.0, right = 4.0, top = 2.0, bottom = 2.0 }

-------------------------
-- 3) TERMINAL BEHAVIOR
-------------------------

config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font Mono",
	--weight = "Medium",
	--harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 15.0
config.line_height = 1.0
config.default_cursor_style = "BlinkingBar"
config.bold_brightens_ansi_colors = true
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.status_update_interval = 1000

---------------------------------------------------------------------
-- 4) MINIMAL STATUS BAR (right side only)
---------------------------------------------------------------------

------------------
-- 5) KEYBINDS
------------------

local function move_pane(key, direction)
	return {
		key = key,
		mods = "CMD|SHIFT",
		action = act.ActivatePaneDirection(direction),
	}
end

local function resize_pane(key, direction)
	return {
		key = key,
		action = wezterm.action.AdjustPaneSize({ direction, 3 }),
	}
end

config.leader = { key = "i", mods = "CMD", timeout_milliseconds = 1000 }
config.keys = {
	-- splits
	{ key = "-", mods = "LEADER", action = act.SplitVertical },
	{ key = "|", mods = "LEADER", action = act.SplitHorizontal },
	-- closures
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
	-- navigation
	move_pane("h", "Left"),
	move_pane("j", "Down"),
	move_pane("k", "Up"),
	move_pane("l", "Right"),
	--resize
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.ActivateKeyTable({
			name = "resize_panes",
			one_shot = false,
			timeout_milliseconds = 1000,
		}),
	},
	-- tabs
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "l", mods = "CMD", action = act.ActivateTabRelative(1) },
	{ key = "h", mods = "CMD", action = act.ActivateTabRelative(-1) },
}

config.key_tables = {
	resize_panes = {
		resize_pane("j", "Down"),
		resize_pane("k", "Up"),
		resize_pane("h", "Left"),
		resize_pane("l", "Right"),
	},
}

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		theme = "Catppuccin Mocha",
		tabs_enabled = true,
		component_separators = { left = "", right = "<>" },
		section_separators = { left = " ", right = " " },
		tab_separators = { left = "|", right = "|" },
	},
	sections = {
		tab_active = { "index", { "process", padding = { left = 0, right = 1 } } },
		tabline_x = {},
		tabline_y = { "ram", "cpu" },
		tabline_z = { "domain" },
	},
})
return config
