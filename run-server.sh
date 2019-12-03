#!/bin/bash

MODNAME=Empty

pushd ~/server/bin/linux-x86

export NWNX_CORE_SKIP_ALL=y
export NWNX_CORE_LOAD_PATH=~/unified/Binaries
export NWNX_CORE_LOG_LEVEL=7

export NWNX_SERVERLOGREDIRECTOR_LOG_LEVEL=6
export NWNX_SQL_TYPE=SQLITE

export NWNX_ADMINISTRATION_SKIP=y
export NWNX_APPEARANCE_SKIP=y
export NWNX_AREA_SKIP=y
export NWNX_CHAT_SKIP=y
export NWNX_COMBATMODES_SKIP=y
export NWNX_CREATURE_SKIP=y
export NWNX_DAMAGE_SKIP=y
export NWNX_DATA_SKIP=y
export NWNX_DIALOG_SKIP=y
export NWNX_DOTNET_SKIP=y
export NWNX_ELC_SKIP=y
export NWNX_EFFECT_SKIP=y
export NWNX_ENCOUNTER_SKIP=y
export NWNX_EVENTS_SKIP=y
export NWNX_EXPERIMENTAL_SKIP=y
export NWNX_FEEDBACK_SKIP=y
export NWNX_ITEM_SKIP=y
export NWNX_ITEMPROPERTY_SKIP=y
export NWNX_LUA_SKIP=y
export NWNX_MAXLEVEL_SKIP=y
export NWNX_METRICS_INFLUXDB_SKIP=y
export NWNX_OBJECT_SKIP=y
export NWNX_PLAYER_SKIP=y
export NWNX_PROFILER_SKIP=y
export NWNX_RACE_SKIP=y
export NWNX_REDIS_SKIP=y
export NWNX_REGEX_SKIP=y
export NWNX_REVEAL_SKIP=y
export NWNX_RUBY_SKIP=y
export NWNX_SQL_SKIP=y
export NWNX_SERVERLOGREDIRECTOR_SKIP=n
export NWNX_SKILLRANKS_SKIP=y
export NWNX_SPELLCHECKER_SKIP=y
export NWNX_THREADWATCHDOG_SKIP=y
export NWNX_TIME_SKIP=y
export NWNX_TRACKING_SKIP=y
export NWNX_TWEAKS_SKIP=y
export NWNX_UTIL_SKIP=y
export NWNX_VISIBILITY_SKIP=y
export NWNX_WEAPON_SKIP=y
export NWNX_WEBHOOK_SKIP=y

LD_PRELOAD=~/unified/Binaries/NWNX_Core.so \
 ./nwserver-linux \
  -module "$MODNAME" \
  -maxclients 32 \
  -minlevel 1 \
  -maxlevel 40 \
  -pauseandplay 0 \
  -pvp 2 \
  -servervault 0 \
  -elc 1 \
  -ilr 1 \
  -gametype 3 \
  -oneparty 0 \
  -difficulty 3 \
  -autosaveinterval 0 \
  -playerpassword '' \
  -dmpassword '' \
  -servername 'WSL NWNX:EE Server' \
  -publicserver 0 \
  -reloadwhenempty 0 \
  -port 5121

popd
