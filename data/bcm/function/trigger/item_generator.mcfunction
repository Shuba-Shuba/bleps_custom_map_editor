## parse input right to left
# input format: <time>789<warmup>
tag @s add this
execute as @e[type=block_display,tag=generator,tag=editing] at @s if function bcm:owned_by_this run tag @s add this

# warmup: [0,180] - unknown length 1 to 3 digits, followed by 789
scoreboard players set .l set_item_generator 0
# 1 digit?
execute if score .l set_item_generator matches 0 store success score .l set_item_generator run function bcm:trigger/check_length {10_exp_digits:10,objective:"set_item_generator",max:1000,sentinel:789}
# 2 digits?
execute if score .l set_item_generator matches 0 store success score .l set_item_generator run function bcm:trigger/check_length {10_exp_digits:100,objective:"set_item_generator",max:1000,sentinel:789}
# 3 digits?
execute if score .l set_item_generator matches 0 store success score .l set_item_generator run function bcm:trigger/check_length {10_exp_digits:1000,objective:"set_item_generator",max:1000,sentinel:789}
# get value
execute if score .l set_item_generator matches 0 run function bcm:fail/tellraw {input:'"Can\'t parse input"'}
scoreboard players operation @n[type=block_display,tag=this] bcm_generator_warmup = .value calc

# time: [1,180]
execute store result score @n[type=block_display,tag=this] bcm_generator_time run scoreboard players operation @s set_item_generator /= #1000 calc

# update sign
execute as @n[type=block_display,tag=this] at @s run data modify block ^ ^ ^1 front_text.messages[2] set value ["Item every ",{score:{name:"@n[type=block_display,tag=this]",objective:"bcm_generator_time"}},"s"]
execute as @n[type=block_display,tag=this] at @s run data modify block ^ ^ ^1 front_text.messages[3] set value ["Warm-up: ",{score:{name:"@n[type=block_display,tag=this]",objective:"bcm_generator_warmup"}},"s"]

tag @s remove this
scoreboard players reset @s set_item_generator

execute as @e[type=block_display,tag=this] on passengers run kill @s
tag @e[type=block_display,tag=this] remove editing
tag @e[type=block_display] remove this