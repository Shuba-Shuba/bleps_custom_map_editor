# calculate block's position relative to save area start point
scoreboard players operation .x calc = system vect_x
scoreboard players operation .y calc = system vect_y
scoreboard players operation .z calc = system vect_z
scoreboard players operation .x calc -= @s vect_x
scoreboard players operation .y calc -= @s vect_y
scoreboard players operation .z calc -= @s vect_z
execute store result storage bcm macro.x int 1 run scoreboard players remove .x calc 1
execute store result storage bcm macro.y int 1 run scoreboard players remove .y calc 1
execute store result storage bcm macro.z int 1 run scoreboard players remove .z calc 1

execute if block ~ ~ ~ target run function bcm:map/save/target with storage bcm macro
#execute if block ~ ~ ~ deepslate_copper_ore run function bcm:map/save/crate with storage bcm macro

# don't save the actual block as part of the map
setblock ~ ~ ~ air strict