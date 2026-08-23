-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

-- Monitor scale is Hyprland's scale for the output. It sizes everything
-- Wayland-native, accepts fractions (1.6, 1.75), and applies immediately.
-- "auto" lets Hyprland pick per display.
local omarchy_monitor_scale = 1.6
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

-- GDK scale is GDK_SCALE, the factor GTK draws its own UI at. It's what
-- sizes X11/XWayland windows, which Omarchy leaves unscaled so they stay
-- crisp instead of being stretched by the compositor. GTK only honors whole
-- numbers, so use the nearest integer to the monitor scale, and restart an
-- app for a change to reach it.
local omarchy_gdk_scale = 2
hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

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
