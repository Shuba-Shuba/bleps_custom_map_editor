# create load point
summon marker ~ ~ ~ {Tags:[start_point]}
execute store result storage bcm macro.x int 1 run data get entity @n[type=marker,tag=start_point] Pos[0]
execute store result storage bcm macro.y int 1 run data get entity @n[type=marker,tag=start_point] Pos[1]
execute store result storage bcm macro.z int 1 run data get entity @n[type=marker,tag=start_point] Pos[2]
function bcm:xyz_string_abs with storage bcm macro
data modify storage bcm map.load_point set from storage bcm tmp.pos
data remove storage bcm tmp
# y offset
# deprecated: load at save area pos1
#execute as @e[type=marker,tag=render_box,tag=save] at @s run tp ~ ~-.9 ~
#tag @n[type=marker,tag=render_box,tag=save,tag=pos1] add start_point
execute as @e[type=marker,tag=save_point] at @s run tp ~ ~-.9 ~

# time estimate
execute store result score .l calc run data get storage minecraft:item_structures save.blocks
scoreboard players operation .l calc /= .load_entries/s calc
scoreboard players operation .s calc = .l calc
scoreboard players operation .l calc /= #60 calc
scoreboard players operation .s calc %= #60 calc
execute if score .l calc matches 0 run tellraw @s ["estimated time to load: ",{score:{name:".s",objective:"calc"}},"s @ 20tps"]
execute if score .l calc matches 1.. run tellraw @s ["estimated time to load: ",{score:{name:".l",objective:"calc"}},"m ",{score:{name:".s",objective:"calc"}},"s @ 20tps"]

# timer
function bcm:start_timer

# load
function item_structures:load