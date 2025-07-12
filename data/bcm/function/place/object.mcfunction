execute if entity @s[tag=red_flag] store result score flag.red place_object run return run function bcm:place/red_flag
execute if entity @s[tag=blue_flag] store result score flag.blue place_object run return run function bcm:place/blue_flag
execute if entity @s[tag=generator] store result score .generator place_object run return run function bcm:place/generator

# this should never run
kill @s
execute as @p at @s run return run function bcm:fail/tellraw {input:'"ERROR: invalid object placer marker"'}