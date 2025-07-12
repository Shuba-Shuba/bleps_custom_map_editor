## bleps
execute if block ~ ~ ~ #bcm:special run function bcm:map/save/special_block

## original function
# block -> int @ save.stack
# same as previous block?
execute store result score different commands run function item_structures:zprivate/save/block_get

# if >131071 in a row, treat as different b/c we can't store the streak length in 17 bits anymore
execute if score same_count commands matches 131071 run scoreboard players set different commands 1

# if nbt, treat as different to prevent data loss
execute if data block ~ ~ ~ {} run scoreboard players set different commands 1
execute if data block ~ ~ ~ {} run data modify storage item_structures save.nbts append from block ~ ~ ~ {}

# add entry
execute if score different commands matches 0 run scoreboard players add same_count commands 1
execute if score different commands matches 0 if score @s vect_x matches 1 if score @s vect_y matches 1 if score @s vect_z matches 1 run function item_structures:zprivate/save/compress
execute if score different commands matches 1 if score same_count commands matches 1.. run function item_structures:zprivate/save/compress
execute if score different commands matches 1 run data modify storage item_structures save.blocks append from storage item_structures save.stack

# current data becomes previous data for next iteration
#data modify storage item_structures prev set from storage item_structures save.stack

scoreboard players add @s commands 50