#$tellraw @a "target @ ~$(x) ~$(y) ~$(z)"

$data modify storage bcm map.targets append value "~$(x) ~$(y) ~$(z)"

scoreboard players add .targets calc 1