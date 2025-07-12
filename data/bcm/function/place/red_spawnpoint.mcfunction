# create new or move existing spawnpoint
execute unless entity @n[type=block_display,tag=red_spawnpoint] run summon block_display ~ ~ ~ {Tags:[red_spawnpoint,spawnpoint],block_state:{Name:"player_head"},Glowing:1b,glow_color_override:16733525}
execute unless entity @n[type=marker,tag=red_spawnpoint] run summon marker ~ ~ ~ {Tags:[red_spawnpoint,spawnpoint]}
execute anchored eyes run tp @n[type=block_display,tag=red_spawnpoint] ^ ^ ^ ~ ~
execute anchored feet run tp @n[type=marker,tag=red_spawnpoint] ~ ~ ~ ~ ~
data modify entity @n[type=block_display,tag=red_spawnpoint] transformation.translation set value [-.5f,-.25f,-.5f]

# visiblity state
execute store result entity @n[type=block_display,tag=red_spawnpoint] view_range float 1 run scoreboard players get display.spawnpoint set_render_box

# save to storage
data modify storage bcm macro.x set from entity @n[type=marker,tag=red_spawnpoint] Pos[0]
data modify storage bcm macro.y set from entity @n[type=marker,tag=red_spawnpoint] Pos[1]
data modify storage bcm macro.z set from entity @n[type=marker,tag=red_spawnpoint] Pos[2]
data modify storage bcm macro.yaw set from entity @n[type=marker,tag=red_spawnpoint] Rotation[0]
data modify storage bcm macro.pitch set from entity @n[type=marker,tag=red_spawnpoint] Rotation[1]
data modify storage bcm macro.type set value "red_spawnpoint"
function bcm:place/point_macro with storage bcm macro