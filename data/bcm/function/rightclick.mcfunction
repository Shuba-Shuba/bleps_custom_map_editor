execute store result score .l calc run data get entity @s active_effects[{id:"minecraft:luck"}].amplifier
execute if score .l calc matches 31 run function bcm:place/red_spawnpoint
execute if score .l calc matches 32 run function bcm:place/blue_spawnpoint
execute if score .l calc matches 33 run function bcm:place/intro_camera
execute if score .l calc matches 34 run function bcm:dialog/render_box
execute if score .l calc matches 35 run function bcm:dialog/pos_and_rot