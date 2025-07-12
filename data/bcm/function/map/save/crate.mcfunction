#$tellraw @a "crate @ ~$(x) ~$(y) ~$(z)"

$execute align xyz run summon marker ~.5 ~ ~.5 {Tags:[crate_difficulty_check,init],data:{pos:"~$(x) ~$(y) ~$(z)",d:-1b}}
scoreboard players add .crates calc 1

tag @e[type=marker] remove init