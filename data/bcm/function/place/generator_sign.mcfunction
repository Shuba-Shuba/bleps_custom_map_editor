# no block displays for generator signs for 2 reasons:
# - block displays are bugged in 1.21.7: all signs render as default-state standing signs
# - the display would cover up text on the sign block

# don't place if inside a block
$setblock ~ ~ ~ birch_wall_sign[facing=$(facing)]{front_text:{messages:[{text:"Item Generator",click_event:{action:"run_command",command:"function bcm:dialog/item_generator"}},"","DEFAULT","SETTINGS"]}} keep
$execute unless block ~ ~ ~ birch_wall_sign[facing=$(facing)] run kill @s
$execute unless block ~ ~ ~ birch_wall_sign[facing=$(facing)] as @p[scores={place_object_egg=1..}] run return run function bcm:fail/actionbar {input:'"Could not set the sign block (facing $(facing))"'}

# rotation
$data modify entity @s Rotation set value $(rotation)

return 1