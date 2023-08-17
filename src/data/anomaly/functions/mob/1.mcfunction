
function ~/spawn:
    execute summon item_display function ~/../spawn2:
        tag @s add anomaly.mob
        tag @s add anomaly.mob.tick
        scoreboard players set @s anomaly.mob 1
        summon creeper ~ ~ ~ {Tags:["anomaly.mob","anomaly.setup","anomaly.setup.temp"],CustomName:'{"text":"Infected Jelly"}',
            active_effects:[{
                id:"minecraft:invisibility",
                amplifier:0b,
                duration:-1,
                show_particles:0b}]}
        data modify entity @s teleport_duration set value 3
        item replace entity @s container.0 with tnt
        ride @e[type=creeper,limit=1,tag=anomaly.setup.temp,distance=..1] mount @s
        tag @e[type=creeper,limit=1,tag=anomaly.setup.temp,distance=..1] remove anomaly.setup.temp
        tag @s add anomaly.setup

function ~/tick:
    if entity @a[distance=..50,limit=1] facing entity @p feet tp ^ ^ ^0.01
    scoreboard players set #temp anomaly 0
    on passengers scoreboard players set #temp anomaly 1
    if score #temp anomaly matches 0 kill @s
    if score #temp anomaly matches 0 kill @e[type=area_effect_cloud,limit=1,distance=..1]
    if score #temp anomaly matches 0 effect give @e[distance=..5] slowness 3 3 false
