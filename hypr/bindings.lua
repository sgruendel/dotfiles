-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

local paths = require("default.hypr.paths")

hl.unbind("SUPER + SHIFT + C")
o.bind("SUPER + SHIFT + C", "Calendar", { webapp = "https://calendar.google.com" })
o.bind("SUPER + SHIFT + ALT + C", "Calendar Work", "omarchy-launch-webapp 'https://outlook.office.com/calendar' --user-data-dir='" .. paths.home .. "/.config/chromium-profile/garmin'")
hl.unbind("SUPER + SHIFT + E")
o.bind("SUPER + SHIFT + E", "Email", { webapp = "https://gmail.com" })
hl.unbind("SUPER + SHIFT + ALT + E")
o.bind("SUPER + SHIFT + ALT + E", "Email Work", "omarchy-launch-webapp 'https://outlook.office.com/mail' --user-data-dir='" .. paths.home .. "/.config/chromium-profile/garmin'")
o.bind("SUPER + SHIFT + ALT + T", "Teams Work", "omarchy-launch-webapp 'https://teams.microsoft.com/v2' --user-data-dir='" .. paths.home .. "/.config/chromium-profile/garmin'")

o.bind("SUPER + CTRL + M", "Sonos", "omarchy-launch-tui sinuous -d 192.168.7.103,192.168.7.104")
hl.unbind("SUPER + CTRL + P") -- unbind Power
o.bind("SUPER + CTRL + P", "Color picker", "pkill hyprpicker || hyprpicker -a")

-- Logitech MX Keys examples:
hl.unbind("SUPER + SHIFT + S") -- unbind Google Maps
o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
o.bind("SUPER + H", nil, "voxtype record toggle")
o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
