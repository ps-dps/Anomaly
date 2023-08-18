
append function_tag load:load {"values":["anomaly:load"]}

#> LOAD FUNCTION

scoreboard objectives add anomaly dummy
scoreboard objectives add anomaly.const dummy
scoreboard objectives add anomaly.remove dummy
scoreboard objectives add anomaly.travel dummy
scoreboard objectives add anomaly.id dummy
scoreboard objectives add anomaly.timeout dummy
scoreboard objectives add anomaly.time dummy
scoreboard objectives add anomaly.spawn dummy

scoreboard objectives add anomaly.boss.health dummy
scoreboard objectives add anomaly.boss.max_health dummy
scoreboard objectives add anomaly.boss.phase dummy
scoreboard objectives add anomaly.bossvar.0 dummy

scoreboard objectives add anomaly.passive.head dummy
scoreboard objectives add anomaly.passive.chest dummy
scoreboard objectives add anomaly.passive.legs dummy
scoreboard objectives add anomaly.passive.feet dummy

scoreboard objectives add anomaly.mob dummy

scoreboard objectives add anomaly.raycast dummy

scoreboard objectives add anomaly.ability minecraft.used:minecraft.warped_fungus_on_a_stick

scoreboard players set #100 anomaly 100
scoreboard players set #20 anomaly 20

data modify storage ps:anomaly spawn_range set value {min:3600,max:24000}
unless data storage ps:anomaly anomalies data modify storage ps:anomaly anomalies set value []



execute function ./tick:
    schedule function ./tick 1

    #> TICKING FUNCTION
    store result score .gametime anomaly time query gametime

    as @e[type=item_display,tag=anomaly.anomaly] at @s function ./tick_as_anomaly:
        particle portal ~ ~ ~ 0 0 0 3 1

        scoreboard players add @a[distance=..4] anomaly.travel 1
        effect give @a[distance=..4,scores={anomaly.travel=1}] nausea 8 0 true
        unless score @s anomaly.id = @s anomaly.id if entity @a[distance=..4,scores={anomaly.travel=100..}] function ./generate_anomaly/id
        if     score @s anomaly.id = @s anomaly.id if entity @a[distance=..4,scores={anomaly.travel=100..}] function ./generate_anomaly/just_tp
        as @s[tag=anomaly.await_loaded] function ./generate_anomaly/await_loaded

        if entity @s[tag=anomaly.active] function ./tick_as_active_anomaly:
            scoreboard players operation #id anomaly = @s anomaly.id
            unless entity @a[predicate=./match_id,limit=1] scoreboard players add @s anomaly.timeout 1
            if score @s anomaly.timeout matches 3600.. function ./generate_anomaly/remove

        if score @s anomaly.remove <= .gametime anomaly function ./generate_anomaly/remove

    as @a at @s function ./tick_as_player:
        if entity @s[tag=anomaly.passive.tick.head] store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.head
        if entity @s[tag=anomaly.passive.tick.head] function ./tick_passive with storage ps:temp passive
        if entity @s[tag=anomaly.passive.tick.chest] store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.chest
        if entity @s[tag=anomaly.passive.tick.chest] function ./tick_passive with storage ps:temp passive
        if entity @s[tag=anomaly.passive.tick.legs] store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.legs
        if entity @s[tag=anomaly.passive.tick.legs] function ./tick_passive with storage ps:temp passive
        if entity @s[tag=anomaly.passive.tick.feet] store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.feet
        if entity @s[tag=anomaly.passive.tick.feet] function ./tick_passive with storage ps:temp passive:
            $function anomaly:passive/$(id)/tick

        if score @s anomaly.ability matches 1.. function ./wfoas

        if score @s anomaly.travel matches 1.. unless entity @e[type=item_display,tag=anomaly.anomaly,distance=..4,limit=1] scoreboard players reset @s anomaly.travel

        if score @s anomaly.id matches 1.. unless dimension anomaly:abyss gamemode survival @s[gamemode=!creative,gamemode=!spectator]
        if score @s anomaly.id matches 1.. unless dimension anomaly:abyss scoreboard players reset @s anomaly.id

        if score @s anomaly.spawn <= .gametime anomaly function ~/spawn_anomaly:
            if dimension minecraft:overworld function ./anomaly/place_random
            function ./utils/rand_range with storage ps:anomaly spawn_range
            scoreboard players operation #spawn anomaly.spawn = .gametime anomaly
            scoreboard players operation #spawn anomaly.spawn += .random anomaly
            as @a[distance=..100] if score @s anomaly.spawn < #spawn anomaly.spawn
                scoreboard players operation @s anomaly.spawn = #spawn anomaly.spawn

    as @e[type=marker,tag=anomaly.bossarena] at @s function ./tick_boss_arena:
        store result storage ps:temp id.id int 1 scoreboard players get @s anomaly.id

        unless entity @a[dx=47,dy=47,dz=47,limit=1] if entity @s[tag=anomaly.active] function ~/deactivate with storage ps:temp id:
            tag @s remove anomaly.active
            $bossbar set anomaly:boss/$(id) visible false
            $execute store result storage ps:temp id.boss int 1 run scoreboard players get .$(id) anomaly.id
            execute function ~/../deactivate_call with storage ps:temp id:
                $function anomaly:boss/$(boss)/deactivate

        if entity @a[dx=47,dy=47,dz=47,limit=1] unless entity @s[tag=anomaly.active] unless entity @s[tag=anomaly.defeated] function ~/activate with storage ps:temp id:
            tag @s add anomaly.active
            $bossbar set anomaly:boss/$(id) visible true
            $execute store result storage ps:temp id.boss int 1 run scoreboard players get .$(id) anomaly.id
            execute function ~/../activate_call with storage ps:temp id:
                $function anomaly:boss/$(boss)/activate
        
        execute function ./tick_boss_arena2 with storage ps:temp id:
            $execute store result storage ps:temp id.boss int 1 run scoreboard players get .$(id) anomaly.id
            execute function ./tick_boss_arena3 with storage ps:temp id:
                $function anomaly:boss/$(boss)/tick
    
    as @e[tag=anomaly.mob.tick] function ./mob/main/tick

predicate ./match_id { "condition": "minecraft:entity_scores", "entity": "this", "scores": {
    "anomaly.id": {
        "min": { "type": "minecraft:score", "target": { "type": "minecraft:fixed",
            "name": "#id" },
            "score": "anomaly"},
        "max": { "type": "minecraft:score", "target": { "type": "minecraft:fixed",
            "name": "#id" },
            "score": "anomaly" }}
    }}

