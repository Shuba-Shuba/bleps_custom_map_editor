# if same spot, don't change
execute if entity @e[type=#bcm:place,tag=place,tag=red_flag,tag=!init,distance=..0.1] run return run kill @s

# don't place if inside a block
setblock ~ ~ ~ red_banner keep
execute unless block ~ ~ ~ red_banner run kill @s
execute unless block ~ ~ ~ red_banner as @p[scores={place_object_egg=1..}] run return run function bcm:fail/actionbar {input:'"Could not set the block"'}

playsound minecraft:block.wood.place block @a[distance=..16] ~ ~ ~ 1 0.8

# visibility state
execute store result entity @s view_range float 1 run scoreboard players get display.flags set_render_box

# delete old flag
execute at @e[type=#bcm:place,tag=place,tag=red_flag,tag=!init] run setblock ~ ~ ~ air strict
kill @e[type=#bcm:place,tag=place,tag=red_flag,tag=!init]
tag @s remove init
return 1