This fork butchers the source to function how I need it to.  
If you want to also use it for some reason, I pushed it out to the [docker hub](https://hub.docker.com/repository/docker/cryotheum/garrysmod).

# Mounting Content
Set these environment varialbes to 1 if you want the content mounted.  
If a login is required, you will need to manually inout your login to steamcmd. Games that require login will not update themselves on start.
| Variable | Default | Login | Game Title
| :---: | :---: | :---: | :---
| `MOUNT_CSGO` | `0` | `yes` | Counter-Strike: Global Offensive
| `MOUNT_CSS` | `1` | `no` | Counter-Strike: Source
| `MOUNT_DOD` | `0` | `yes` | Day of Defeat
| `MOUNT_HL1` | `0` | `yes` | Half-Life: Source
| `MOUNT_HL2_EP1` | `0` | `yes` | Half-Life 2: Episode 1
| `MOUNT_HL2_EP2` | `0` | `yes` | Half-Life 2: Episode 2
| `MOUNT_HL2_LOST_COAST` | `0` | `yes` | Half-Life 2: Lost Coast
| `MOUNT_L4D` | `0` | `yes` | Left 4 Dead
| `MOUNT_L4D2` | `0` | `yes` | Left 4 Dead 2
| `MOUNT_PORTAL` | `0` | `yes` | Portal
| `MOUNT_PORTAL2` | `0` | `yes` | Portal 2
| `MOUNT_TF` | `0` | `no` | Team Fortress 2

# Removed Environment Variables
Environment variables not included from ceifa's version.
| Variable | Why
| :---: | :---
| `GAMEMODE` | This can be set in `autoexec.cfg` and does not need to be set early.
| `MAP` | Same as `GAMEMODE`.
