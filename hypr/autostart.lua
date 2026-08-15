-- Extra autostart processes.
-- o.launch_on_start("my-service")
o.launch_on_start("rclone mount gdrive:/ $HOME/gdrive/")
o.launch_on_start("bitwarden-desktop")
