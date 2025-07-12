$scoreboard players set 10^digits calc $(10_exp_digits)
$scoreboard players set .max calc $(max)

$execute store result score .value calc run scoreboard players operation .i calc = @s $(objective)
execute if score .i calc matches ..-1 store result score .value calc run scoreboard players operation .i calc *= #-1 calc
scoreboard players operation .i calc /= 10^digits calc
scoreboard players operation .i calc %= .max calc

#tellraw @a [".value = ",{score:{name:".value",objective:"calc"}},"\n.i = ",{score:{name:".i",objective:"calc"}}]
$execute unless score .i calc matches $(sentinel) run return fail

scoreboard players operation .value calc %= 10^digits calc
$scoreboard players operation @s $(objective) /= 10^digits calc

return 1