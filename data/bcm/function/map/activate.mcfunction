### THIS CONVERTS MAP DATA FROM SHUBA'S SYSTEM TO AIDEN'S SYSTEM
# copies from "minecraft:bcm map" to "maps:active {}"
# editor doesn't have disabled items or invulnerability times

# you can't directly set/delete root objects
data modify storage maps:active settings set value {}
data modify storage maps:active spawn set value {}
data modify storage maps:active objectives set value {}
data modify storage maps:active gens set value {}


## origin
# all other coordinates are saved relative to this point unless stated otherwise
data modify storage maps:active origin set from storage bcm map.load_point
execute unless data storage bcm map.load_point run say activating UNSAVED map - only use briefly for testing, and REMEMBER TO SAVE!
execute unless data storage bcm map.load_point run data modify storage maps:active origin set from storage bcm map.save.start


## settings
# DIFFERENT: bounding box origin
data modify storage maps:active settings.spectatorBoundingBox set from storage bcm map.save.area
data modify storage maps:active settings.spectatorBoundingBoxOrigin set from storage bcm map.save.start
data modify storage maps:active settings.spectatorJoinLocation set from storage bcm map.intro_camera

# DIFFERENT: position and rotation stored as one string, no flipped tag
# this requires either:
# (1) rewriting the map editor code to force the intro cutscene into one of 2 angles (easier, less customizable), or
# (2) rewriting the intro cutscene code to render from any angle (harder, more customizable)
data modify storage maps:active settings.introCutscene set from storage bcm map.intro_camera

# no tickingScript

data modify storage maps:active settings.wallHeight set from storage bcm map.max_wall_height
data modify storage maps:active settings.disabledItems set value []

# "x1 y1 z1" + [dx,dy,dz] -> {x1,y1,z1,x2,y2,z2}
# converts to ABSOLUTE coordinates
function bcm:map/parse_load_point with storage bcm map
execute store result score .x calc run data get storage item_structures save.size[0]
execute store result score .y calc run data get storage item_structures save.size[1]
execute store result score .z calc run data get storage item_structures save.size[2]
execute store result storage maps:active settings.mapSize.x2 int 1 run scoreboard players operation .x calc += .x1 calc
execute store result storage maps:active settings.mapSize.y2 int 1 run scoreboard players operation .y calc += .y1 calc
execute store result storage maps:active settings.mapSize.z2 int 1 run scoreboard players operation .z calc += .z1 calc
#data modify storage maps:active settings.mapSize.dx set from storage item_structures save.size[0]
#data modify storage maps:active settings.mapSize.dy set from storage item_structures save.size[1]
#data modify storage maps:active settings.mapSize.dz set from storage item_structures save.size[2]


## spawn
# DIFFERENT: bounding box origin
data modify storage maps:active spawn.redSpawnBoundingBox set from storage bcm map.red_spawn.area
data modify storage maps:active spawn.redSpawnBoundingBoxOrigin set from storage bcm map.red_spawn.start
data modify storage maps:active spawn.blueSpawnBoundingBox set from storage bcm map.blue_spawn.area
data modify storage maps:active spawn.blueSpawnBoundingBoxOrigin set from storage bcm map.blue_spawn.start

data modify storage maps:active spawn.redSpawn set from storage bcm map.red_spawnpoint
data modify storage maps:active spawn.blueSpawn set from storage bcm map.blue_spawnpoint

data modify storage maps:active spawn.ctfInvulnTime set value 40
data modify storage maps:active spawn.infectionInvulnTime set value 40


## objectives
data modify storage maps:active objectives.redFlag set from storage bcm map.red_flag
data modify storage maps:active objectives.blueFlag set from storage bcm map.blue_flag
# no infection generator (always at blue flag)


## gens
# DIFFERENT: time between items and warmup delay
data modify storage maps:active gens set from storage bcm map.generators