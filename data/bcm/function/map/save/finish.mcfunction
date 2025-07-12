# y offset
execute as @e[type=marker,tag=render_box,tag=save] at @s run tp ~ ~.9 ~
tag @e[type=marker,tag=render_box,tag=save] remove start_point
tag @e[type=marker,tag=render_box,tag=save] remove end_point

scoreboard players set .enabled select_area 1

# time
function bcm:end_timer
tellraw @a ["final time: ",{nbt:"timer.m",storage:"bcm",interpret:true},{nbt:"timer.s",storage:"bcm",interpret:true},{nbt:"timer.ms",storage:"bcm",interpret:true}]