# this should not change the position
execute align xyz run tp @s ~.5 ~ ~.5

execute if entity @s[tag=render_box] align xyz run return run function bcm:render_box/set_pos
execute if entity @s[tag=place] run return run function bcm:place/object

# this should never run
kill @s
execute as @p at @s run return run function bcm:fail/tellraw {input:'"ERROR: invalid map editor marker"'}