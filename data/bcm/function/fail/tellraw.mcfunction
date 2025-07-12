$tellraw @s [{text:"",color:"red"},$(input)]

stopsound @s ui entity.enderman.teleport
playsound entity.enderman.teleport ui @s ~ ~ ~ 1 0.5

return fail