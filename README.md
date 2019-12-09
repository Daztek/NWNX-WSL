# NWNX:EE on WSL1, a brief guide

Installing WSL1 is not covered in this guide, you can follow the steps in [this article](https://www.computerhope.com/issues/ch001879.htm). Only do the `Installing WSL.` and `Getting Started with your Linux subsystem.` steps. Be sure to install the `Ubuntu` distro, not `Ubuntu 16.04 LTS` or `Ubuntu 18.04 LTS`.

---

**This guide will only support SQLite for NWNX_SQL.**

**Advanced plugins like the Profiler, Lua, Ruby and DotNET plugins are not covered.**

## Initial Setup

#### 1) Start Ubuntu

#### 2) Updating Ubuntu 

- `sudo apt update && sudo apt upgrade -y`

#### 3) Installing dependencies 

- `sudo apt install -y git unzip zip cmake build-essential libsqlite3-dev libssl-dev`

#### 4) Getting NWNX:EE

- `git clone https://github.com/nwnxee/unified.git`

#### 5) Compiling NWNX:EE

- `cd ~/unified`
- `./Scripts/buildnwnx.sh -j 4`

#### 6) Getting the dedicated server package

- `cd ~/`
- `mkdir server`
- `cd server`
- `wget https://nwnx.io/nwnee-dedicated-8193.2.zip`
- `unzip nwnee-dedicated-8193.1.zip`
- `rm nwnee-dedicated-8193.1.zip`
- `cd bin/linux-x86`
- `./nwserver-linux`
- `exit`
- `cd`

#### 7) Setting up aliases 

If your Windows NWN Userdirectory is `C:\Users\<Username>\Documents\Neverwinter Nights\` it can be accessed in WSL through `/mnt/c/Users/<Username>/Documents/Neverwinter Nights/`

- `nano ~/.local/share/Neverwinter\ Nights/nwn.ini`

  Change the `MODULES`, `HAK` and `TLK` aliases to your windows nwn userdirectory:

  `MODULES=/mnt/c/Users/<Username>/Documents/Neverwinter Nights/modules`

  `HAK=/mnt/c/Users/<Username>/Documents/Neverwinter Nights/hak`

  `TLK=/mnt/c/Users/<Username>/Documents/Neverwinter Nights/tlk`

  Press `Ctrl+x` to exit and `y` to save

#### 8) Setting up run-server.sh

- `wget https://raw.githubusercontent.com/Daztek/NWNX-WSL/master/run-server.sh`
- `chmod +x run-server.sh`
- `nano run-server.sh`

  Edit the file to your liking, by default all plugins but `ServerLogRedirector` are disabled. Don't forget to set `MODNAME` to your module filename, without .mod.

  Press `Ctrl+x` to exit and `y` to save.

#### 9) Running the server

- `./run-server.sh`

  It'll automatically load your module from the windows side and start the server, by default it's only accessible through LAN.

  To stop the server, just type `exit` in the console.

## Maintenance

#### Updating NWNX:EE

If you want to update NWNX:EE at some point you can do the following:

- `cd ~/unified`
- `git pull`
- `./Scripts/buildnwnx.sh -j 4`
- `cd`

#### Updating NWServer (when needed)

When Beamdog releases a patch you'll need to update nwserver-linux, this is how:

Replace XXXX with the needed version, for example 8193

- `cd ~/server`
- `rm -r bin data`
- `wget https://nwnx.io/nwnee-dedicated-XXXX.zip`
- `unzip nwnee-dedicated-XXXX.zip`
- `rm nwnee-dedicated-XXXX.zip`
- `cd`

#### Editing server settings

If you want to edit settings like "Sticky Player Names", "Show DM Joined Messages" etc you can do the following:

- `nano ~/.local/share/Neverwinter\ Nights/settings.tml`

Change the settings you want and press `Ctrl+x` to exit and `y` to save.

## Extra

#### Setting up Redis

If you want Redis support, you can do the following:

- `sudo apt install -y redis-server`
- `sudo nano /etc/redis/redis.conf`

  Find the `supervised no` line and change it to `supervised systemd`

  Press `Ctrl+x` to exit and `y` to save.

- `sudo service redis-server start`

  **This starts the redis server and has to be done every time your PC is restarted.**
