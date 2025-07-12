# place object
execute as @e[type=#bcm:place,tag=init,tag=map_editor] at @s run function bcm:place_new_entity
scoreboard players set @a place_object_egg 0

# rightclick
execute as @a[gamemode=creative] if predicate {condition:"minecraft:entity_properties",entity:"this",predicate:{effects:{"minecraft:luck":{}}}} at @s run function bcm:rightclick

# delete objects if their block is destroyed
execute as @e[type=block_display,tag=map_editor,tag=place,tag=generator] at @s if block ^ ^ ^1 #air run setblock ~ ~ ~ air destroy
execute as @e[type=block_display,tag=map_editor,tag=place] at @s if block ~ ~ ~ #air run function bcm:place/delete

# trigger
execute as @a[scores={set_render_box=1..}] run function bcm:trigger/render_box
execute as @a[scores={set_pos_and_rot=1..}] run function bcm:trigger/pos_and_rot
execute as @a[scores={set_pos_and_rot=..-1}] run function bcm:trigger/pos_and_rot
execute as @a[scores={set_item_generator=1..}] at @s run function bcm:trigger/item_generator
execute as @a[scores={set_item_generator=-1}] at @s run function bcm:trigger/item_generator_default
execute as @a[scores={set_item_generator=..-2}] at @s run function bcm:trigger/item_generator_cancel

# editor area boundaries
execute as @a[gamemode=creative,tag=in_map_editor] at @s run function bcm:editor/boundary