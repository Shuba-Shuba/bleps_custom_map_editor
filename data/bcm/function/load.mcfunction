scoreboard objectives add set_bcm_settings trigger
scoreboard objectives add set_render_box trigger
scoreboard players add display.save set_render_box 0
scoreboard players add display.spawn set_render_box 0
scoreboard players add display.spawnpoint set_render_box 0
scoreboard players add display.flags set_render_box 0
scoreboard players add display.gens set_render_box 0
scoreboard players add display.wall_height set_render_box 0
scoreboard players add display.camera set_render_box 0
scoreboard objectives add set_pos_and_rot trigger
scoreboard objectives add set_item_generator trigger

scoreboard objectives add calc dummy
scoreboard players set #-1 calc -1
scoreboard players set #5 calc 5
scoreboard players set #10 calc 10
scoreboard players set #20 calc 20
scoreboard players set #60 calc 60
scoreboard players set #100 calc 100
scoreboard players set #1000 calc 1000

# save rate is very constant -> very accurate save ETA
# @ 5k blocks: 12500 blocks/s
# @ 500k blocks: 12000 blocks/s
# @ 6M blocks: 11300 blocks/s
scoreboard players set .save_blocks/s calc 12000

# load rate changes wildly -> inaccurate load ETA
# @ 47k entries (500k): 11000 entries/s
# @ 190k entries (6M): 4000 entries/s
scoreboard players set .load_entries/s calc 10000

scoreboard objectives add select_area dummy
scoreboard objectives add place_object dummy
scoreboard objectives add place_object_egg minecraft.used:minecraft.panda_spawn_egg

scoreboard objectives add bcm_generator_time dummy
scoreboard objectives add bcm_generator_warmup dummy