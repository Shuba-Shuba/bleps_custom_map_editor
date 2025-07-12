# get absolute position
$summon marker $(abs) {Tags:[tmp]}
execute store result score .x calc run data get entity @n[type=marker,tag=tmp] Pos[0]
execute store result score .y calc run data get entity @n[type=marker,tag=tmp] Pos[1]
execute store result score .z calc run data get entity @n[type=marker,tag=tmp] Pos[2]
$execute positioned $(abs) run kill @n[type=marker,tag=tmp]

# calculate relative position
execute store result storage bcm macro.x int 1 run scoreboard players operation .x calc -= .x1 calc
execute store result storage bcm macro.y int 1 run scoreboard players operation .y calc -= .y1 calc
execute store result storage bcm macro.z int 1 run scoreboard players operation .z calc -= .z1 calc

# stringify
function bcm:xyz_string with storage bcm macro
$data modify storage bcm map.$(from) set from storage bcm tmp.pos