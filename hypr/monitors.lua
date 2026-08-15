-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 1.6

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

-- Dell XPS13
hl.monitor({ output = "desc:AU Optronics", mode = "preferred", position = "auto", scale = 1.25 })

-- Left monitor (U2722DE)
hl.monitor({ output = "desc:Dell Inc. DELL P2725QE 4GVXPB4", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Right monitor (U2722DE)
hl.monitor({ output = "desc:Dell Inc. DELL P2725QE 45BXPB4", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

hl.workspace_rule({ workspace = "1", monitor = "desc:AU Optronics", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "desc:Dell Inc. DELL P2725QE 4GVXPB4", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "desc:Dell Inc. DELL P2725QE 4GVXPB4", persistent = true })
hl.workspace_rule({ workspace = "6", monitor = "desc:Dell Inc. DELL P2725QE 4GVXPB4", persistent = true })
hl.workspace_rule({ workspace = "8", monitor = "desc:Dell Inc. DELL P2725QE 4GVXPB4", persistent = true })
hl.workspace_rule({ workspace = "10", monitor = "desc:Dell Inc. DELL P2725QE 4GVXPB4", persistent = true })

hl.workspace_rule({ workspace = "3", monitor = "desc:Dell Inc. DELL P2725QE 45BXPB4", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "desc:Dell Inc. DELL P2725QE 45BXPB4", persistent = true })
hl.workspace_rule({ workspace = "7", monitor = "desc:Dell Inc. DELL P2725QE 45BXPB4", persistent = true })
hl.workspace_rule({ workspace = "9", monitor = "desc:Dell Inc. DELL P2725QE 45BXPB4", persistent = true })
