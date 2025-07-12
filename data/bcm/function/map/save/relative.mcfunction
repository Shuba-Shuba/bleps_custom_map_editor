# get origin
$summon marker $(start) {Tags:[tmp]}
execute store result score .x1 calc run data get entity @n[type=marker,tag=tmp] Pos[0]
execute store result score .y1 calc run data get entity @n[type=marker,tag=tmp] Pos[1]
execute store result score .z1 calc run data get entity @n[type=marker,tag=tmp] Pos[2]
$execute positioned $(start) run kill @n[type=marker,tag=tmp]

data remove storage bcm macro

function bcm:map/save/relative_point {from:"red_spawn.start"}
function bcm:map/save/relative_point {from:"blue_spawn.start"}
function bcm:map/save/relative_point {from:"red_spawnpoint"}
function bcm:map/save/relative_point {from:"blue_spawnpoint"}
function bcm:map/save/relative_point {from:"intro_camera"}

data remove storage bcm tmp