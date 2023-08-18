
function ~/spawn:
    execute summon item_display function ~/../spawn2:
        tag @s add anomaly.mob
        tag @s add anomaly.mob.tick
        scoreboard players set @s anomaly.mob 2
        item replace entity @s container.0 with warped_fungus_on_a_stick{CustomModelData:255905}
        data modify entity @s transformation.scale set value [3d,3d,3d]
        data modify entity @s transformation.left_rotation set value [0.707d,0d,0d,0.707d]
        data modify entity @s CustomName set value '{"text":"Infected Sludge"}'
        tag @s add anomaly.setup

function ~/tick:
    tag @s add anomaly.temp.damage
    positioned ~-1.5 ~-0.5 ~-1.5 as @e[dx=2,dy=0,dz=2] damage @s 3 arrow by @e[type=item_display,tag=anomaly.temp.damage,limit=1,distance=..4]
    tag @s remove anomaly.temp.damage
    scoreboard players add @s anomaly.time 1
    if score @s anomaly.time matches 600.. kill @s
