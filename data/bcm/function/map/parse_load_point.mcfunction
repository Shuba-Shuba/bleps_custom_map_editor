$summon marker $(load_point) {Tags:[tmp]}
execute store result storage maps:active settings.mapSize.x1 int 1 store result score .x1 calc run data get entity @n[type=marker,tag=tmp] Pos[0]
execute store result storage maps:active settings.mapSize.y1 int 1 store result score .x1 calc run data get entity @n[type=marker,tag=tmp] Pos[1]
execute store result storage maps:active settings.mapSize.z1 int 1 store result score .x1 calc run data get entity @n[type=marker,tag=tmp] Pos[2]
$execute positioned $(load_point) run kill @n[type=marker,tag=tmp]