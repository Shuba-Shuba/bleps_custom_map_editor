$title @s title [{text:"",color:"red"},$(title)]
$title @s subtitle [{text:"",color:"gray"},$(subtitle)]

stopsound @s ui entity.enderman.teleport
playsound entity.enderman.teleport ui @s ~ ~ ~ 1 0.5

return fail