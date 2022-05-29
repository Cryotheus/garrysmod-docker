This fork butchers the source to function how I need it to.  
If you want to also use it for some reason, I pushed it out to the [docker hub](https://hub.docker.com/repository/docker/cryotheum/garrysmod).

# Environment Variables
This only covers the differences against ceifa's version.
| Variable | Default | Description
| :---: | --- | :---
| `MOUNT_CSS` | `0` | Should Counter Strike Source be mounted?
| `MOUNT_TF` | `0` | Should Team Fortress 2 be mounted?

Removed variables
| Variable | Why
| :---: | :---
| `GAMEMODE` | This can be set in `autoexec.cfg` and does not need to be set early.
| `MAP` | Same as `GAMEMODE`.
