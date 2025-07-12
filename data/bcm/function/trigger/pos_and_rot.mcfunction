## parse input right to left
# input format: <pitch>789<yaw><a> + 1

# block alignment: 0=don't align, 1=align to center, 2=align to corner
execute store result score .value set_pos_and_rot run scoreboard players remove @s set_pos_and_rot 1
scoreboard players operation .value set_pos_and_rot %= #10 calc
execute if score .value set_pos_and_rot matches 1 at @s align xyz run tp ~.5 ~ ~.5
execute if score .value set_pos_and_rot matches 2 at @s align xyz run tp ~ ~ ~
scoreboard players operation @s set_pos_and_rot /= #10 calc

# yaw: [0,360] - unknown length 1 to 3 digits, followed by 789
data remove storage bcm macro
# 1 digit?
execute unless data storage bcm macro.yaw run function bcm:trigger/check_length {10_exp_digits:10,objective:"set_pos_and_rot",max:1000,sentinel:789}
execute unless data storage bcm macro.yaw if score .i calc matches 789 store result storage bcm macro.yaw int 1 run scoreboard players get .value calc
# 2 digits?
execute unless data storage bcm macro.yaw run function bcm:trigger/check_length {10_exp_digits:100,objective:"set_pos_and_rot",max:1000,sentinel:789}
execute unless data storage bcm macro.yaw if score .i calc matches 789 store result storage bcm macro.yaw int 1 run scoreboard players get .value calc
# 3 digits?
execute unless data storage bcm macro.yaw run function bcm:trigger/check_length {10_exp_digits:1000,objective:"set_pos_and_rot",max:1000,sentinel:789}
execute unless data storage bcm macro.yaw if score .i calc matches 789 store result storage bcm macro.yaw int 1 run scoreboard players get .value calc

# pitch: [-90,90]
execute store result storage bcm macro.pitch int 1 run scoreboard players operation @s set_pos_and_rot /= #1000 calc

# tp
#tellraw @s {nbt:"macro",storage:"bcm"}
execute at @s run function bcm:trigger/pos_and_rot_macro with storage bcm macro

scoreboard players reset @s set_pos_and_rot