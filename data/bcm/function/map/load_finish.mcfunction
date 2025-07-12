# remove load point
kill @e[type=marker,tag=start_point]
# y offset
# deprecated: load at save area pos1
#execute as @e[type=marker,tag=render_box,tag=save] at @s run tp ~ ~.9 ~
#tag @e[type=marker,tag=render_box,tag=save] remove start_point

# time
function bcm:end_timer
tellraw @a ["final time: ",{nbt:"timer.m",storage:"bcm",interpret:true},{nbt:"timer.s",storage:"bcm",interpret:true},{nbt:"timer.ms",storage:"bcm",interpret:true}]