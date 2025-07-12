## safety checks
scoreboard players set .can_save_map calc 1

# all areas set?
execute unless score .save select_area matches 3 store success score .can_save_map calc run function bcm:fail/tellraw {input:'"Failed to save map: No save area set"'}
execute unless score .red_spawn select_area matches 3 store success score .can_save_map calc run function bcm:fail/tellraw {input:'"Failed to save map: No red spawn area set"'}
execute unless score .blue_spawn select_area matches 3 store success score .can_save_map calc run function bcm:fail/tellraw {input:'"Failed to save map: No blue spawn area set"'}
# spawn areas completely inside save area?
execute at @s as @e[type=marker,tag=render_box,tag=!save] unless function bcm:map/save/area_check run scoreboard players set .can_save_map calc 0

# max wall height set and inside save area?
execute store result score .wh calc run data get entity @n[type=block_display,tag=render_box,tag=wall_height] Pos[1] 100
scoreboard players remove .wh calc 5
execute store result score .y1 calc run data get entity @n[type=block_display,tag=render_box,tag=save,tag=y,tag=1] Pos[1] 100
execute store result score .y2 calc run data get entity @n[type=block_display,tag=render_box,tag=save,tag=y,tag=2] Pos[1] 100
execute unless entity @n[type=block_display,tag=render_box,tag=wall_height] store success score .can_save_map calc run function bcm:fail/tellraw {input:'"Failed to save map: No max wall height set"'}
#execute unless entity @n[type=block_display,tag=render_box,tag=wall_height] run tellraw @s {text:"No max wall height set, defaulting to top of save area",color:"yellow"}
#execute unless entity @n[type=block_display,tag=render_box,tag=wall_height] run scoreboard players operation .wh calc = .y2 calc
execute if score .wh calc > .y2 calc store success score .can_save_map calc run function bcm:fail/tellraw {input:'"Failed to save map: Max wall height is outside (above) the save area"'}
execute if score .wh calc < .y1 calc store success score .can_save_map calc run function bcm:fail/tellraw {input:'"Failed to save map: Max wall height is outside (under) the save area"'}

# spawnpoints set?
execute unless entity @n[type=marker,tag=red_spawnpoint] store success score .can_save_map calc run function bcm:fail/tellraw {input:'["Failed to save map: No red spawn ",{italic:true,text:"point"}]'}
execute unless entity @n[type=marker,tag=blue_spawnpoint] store success score .can_save_map calc run function bcm:fail/tellraw {input:'["Failed to save map: No blue spawn ",{italic:true,text:"point"}]'}
# spawnpoints inside save area?
execute at @s as @e[type=marker,tag=spawnpoint] unless function bcm:map/save/area_check run scoreboard players set .can_save_map calc 0

# flags set?
execute unless entity @n[type=block_display,tag=red_flag] store success score .can_save_map calc run function bcm:fail/tellraw {input:'"Failed to save map: No red flag"'}
execute unless entity @n[type=block_display,tag=blue_flag] store success score .can_save_map calc run function bcm:fail/tellraw {input:'"Failed to save map: No blue flag"'}
# flags inside save area?
execute at @s as @e[type=block_display,tag=flag] unless function bcm:map/save/area_check run scoreboard players set .can_save_map calc 0

# intro camera set?
execute unless entity @n[type=marker,tag=intro_camera] store success score .can_save_map calc run function bcm:fail/tellraw {input:'"Failed to save map: No map intro camera"'}
# intro camera inside save area?
execute at @s as @e[type=marker,tag=intro_camera] unless function bcm:map/save/area_check run scoreboard players set .can_save_map calc 0

# generators inside save area? (may be nonexistant)
execute at @s as @e[type=block_display,tag=generator] unless function bcm:map/save/area_check run scoreboard players set .can_save_map calc 0

# if any of the above checks fail, don't save
execute if score .can_save_map calc matches 0 run return fail


## save map
# disable ability to change area selections
scoreboard players set .enabled select_area 0

# relative wall height (must happen before abs->rel conversion, based on slightly offset y1)
execute store result storage bcm map.max_wall_height int 0.01 run scoreboard players operation .wh calc -= .y1 calc

# convert absolute positions to relative
function bcm:map/save/relative with storage bcm map.save

# flags
execute as @n[type=block_display,tag=red_flag] at @s run function bcm:map/save/flag {color:"red"}
execute as @n[type=block_display,tag=blue_flag] at @s run function bcm:map/save/flag {color:"blue"}

# item generators
data modify storage bcm map.generators set value []
execute as @e[type=block_display,tag=generator] at @s run function bcm:map/save/generator

# special blocks
data modify storage bcm map.targets set value []
scoreboard players set .crates calc 0
scoreboard players set .targets calc 0

# y offset
execute as @e[type=marker,tag=render_box,tag=save] at @s run tp ~ ~-.9 ~
tag @n[type=marker,tag=render_box,tag=save,tag=pos1] add start_point
tag @n[type=marker,tag=render_box,tag=save,tag=pos2] add end_point

# timer
function bcm:start_timer

# save blocks
function item_structures:save

# time estimate (after saving begins for volume calculation)
scoreboard players operation .l calc = system vect_x
scoreboard players operation .l calc *= system vect_y
scoreboard players operation .l calc *= system vect_z
scoreboard players operation .l calc /= .save_blocks/s calc
scoreboard players operation .s calc = .l calc
scoreboard players operation .l calc /= #60 calc
scoreboard players operation .s calc %= #60 calc
execute if score .l calc matches 0 run tellraw @s ["estimated time to save: ",{score:{name:".s",objective:"calc"}},"s @ 20tps"]
execute if score .l calc matches 1.. run tellraw @s ["estimated time to save: ",{score:{name:".l",objective:"calc"}},"m ",{score:{name:".s",objective:"calc"}},"s @ 20tps"]