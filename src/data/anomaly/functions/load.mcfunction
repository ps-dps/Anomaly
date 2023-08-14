
append function_tag load:load {"values":["anomaly:load"]}

#> LOAD FUNCTION

scoreboard objectives add anomaly dummy
scoreboard objectives add anomaly.const dummy
scoreboard objectives add anomaly.remove dummy
scoreboard objectives add anomaly.travel dummy
scoreboard objectives add anomaly.id dummy
scoreboard objectives add anomaly.timeout dummy
scoreboard objectives add anomaly.spawn dummy

scoreboard objectives add anomaly.raycast dummy

scoreboard objectives add anomaly.ability minecraft.used:minecraft.warped_fungus_on_a_stick

data merge storage ps:anomaly {anomalies:[],spawn_range:{min:3600,max:24000}}


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
            if score @s anomaly.timeout matches 3600.. kill @s

        if score @s anomaly.remove <= .gametime anomaly kill @s

    as @a at @s function ./tick_as_player:
        if score @s anomaly.ability matches 1.. function ./wfoas
        if score @s anomaly.travel matches 1.. unless entity @e[type=item_display,tag=anomaly.anomaly,distance=..4,limit=1] scoreboard players reset @s anomaly.travel
        if score @s anomaly.id matches 1.. unless dimension anomaly:abyss scoreboard players reset @s anomaly.id
        if score @s anomaly.spawn <= .gametime anomaly function ~/spawn_anomaly:
            function ./anomaly/place_random
            function ./utils/rand_range with storage ps:anomaly spawn_range
            scoreboard players operation #spawn anomaly.spawn = .gametime anomaly
            scoreboard players operation #spawn anomaly.spawn += .random anomaly
            as @a[distance=..100] if score @s anomaly.spawn < #spawn anomaly.spawn
                scoreboard players operation @s anomaly.spawn = #spawn anomaly.spawn

predicate ./match_id { "condition": "minecraft:entity_scores", "entity": "this", "scores": {
    "anomaly.id": {
        "min": { "type": "minecraft:score", "target": { "type": "minecraft:fixed",
            "name": "#id" },
            "score": "anomaly"},
        "max": { "type": "minecraft:score", "target": { "type": "minecraft:fixed",
            "name": "#id" },
            "score": "anomaly" }}
    }}

