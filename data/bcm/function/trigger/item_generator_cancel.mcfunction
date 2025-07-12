tag @s add this
execute as @e[type=block_display,tag=generator,tag=editing] at @s if function bcm:owned_by_this run tag @s add this

scoreboard players reset @s set_item_generator

execute as @e[type=block_display,tag=this] on passengers run kill @s
tag @e[type=block_display,tag=this] remove editing
tag @e[type=block_display] remove this
tag @s remove this