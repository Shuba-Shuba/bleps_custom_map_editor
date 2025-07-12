tag @s add this
execute as @e[type=block_display,tag=generator,tag=editing] at @s if function bcm:owned_by_this run tag @s add this

scoreboard players set @n[type=block_display,tag=this] bcm_generator_time 45
scoreboard players set @n[type=block_display,tag=this] bcm_generator_warmup 5

execute as @n[type=block_display,tag=this] at @s run data modify block ^ ^ ^1 front_text.messages[2] set value "DEFAULT"
execute as @n[type=block_display,tag=this] at @s run data modify block ^ ^ ^1 front_text.messages[3] set value "SETTINGS"

scoreboard players reset @s set_item_generator

execute as @e[type=block_display,tag=this] on passengers run kill @s
tag @e[type=block_display,tag=this] remove editing
tag @e[type=block_display] remove this
tag @s remove this