# validate item
execute unless data entity @s SelectedItem.components."minecraft:custom_data".bleps_map run return run function bcm:fail/title {title:'"FAILED to import"',subtitle:'"This isn\'t a custom bleps map item!"'}

# bleps-specific map data
data modify storage bcm map set from entity @s SelectedItem.components."minecraft:custom_data".bleps_map

# map name
data modify storage bcm map.name set value "Unnamed Map"
execute if data entity @s SelectedItem.components."minecraft:custom_name" run data modify storage bcm map.name set from entity @s SelectedItem.components."minecraft:custom_name"

# blocks
function item_structures:import

# save map to array
data remove storage bcm tmp
data modify storage bcm tmp.map set from storage bcm map
data modify storage bcm tmp.structure set from storage item_structures save
data modify storage bcm maps append from storage bcm tmp
data remove storage bcm tmp