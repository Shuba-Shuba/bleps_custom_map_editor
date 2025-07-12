# copy transformation and start point x & z to max wall height display
data modify entity @s transformation.scale[0] set from storage bcm tmp.size.x
data modify entity @s transformation.scale[2] set from storage bcm tmp.size.z
data modify entity @s Pos[0] set from storage bcm tmp.start.x
data modify entity @s Pos[2] set from storage bcm tmp.start.z