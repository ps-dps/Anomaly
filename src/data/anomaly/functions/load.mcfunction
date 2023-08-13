
append function_tag load:load {"values":["anomaly:load"]}

#> LOAD FUNCTION

scoreboard objectives add anomaly dummy
scoreboard objectives add anomaly.const dummy
scoreboard objectives add anomaly.remove dummy
scoreboard objectives add anomaly.travel dummy
scoreboard objectives add anomaly.id dummy
scoreboard objectives add anomaly.timeout dummy

scoreboard objectives add anomaly.raycast dummy

scoreboard objectives add anomaly.ability minecraft.used:minecraft.warped_fungus_on_a_stick

scoreboard players set .256 anomaly.const 256

data modify storage ps:uuid hex.convert set value ["00","01","02","03","04","05","06","07","08","09","0a","0b","0c","0d","0e","0f","10","11","12","13","14","15","16","17","18","19","1a","1b","1c","1d","1e","1f","20","21","22","23","24","25","26","27","28","29","2a","2b","2c","2d","2e","2f","30","31","32","33","34","35","36","37","38","39","3a","3b","3c","3d","3e","3f","40","41","42","43","44","45","46","47","48","49","4a","4b","4c","4d","4e","4f","50","51","52","53","54","55","56","57","58","59","5a","5b","5c","5d","5e","5f","60","61","62","63","64","65","66","67","68","69","6a","6b","6c","6d","6e","6f","70","71","72","73","74","75","76","77","78","79","7a","7b","7c","7d","7e","7f","80","81","82","83","84","85","86","87","88","89","8a","8b","8c","8d","8e","8f","90","91","92","93","94","95","96","97","98","99","9a","9b","9c","9d","9e","9f","a0","a1","a2","a3","a4","a5","a6","a7","a8","a9","aa","ab","ac","ad","ae","af","b0","b1","b2","b3","b4","b5","b6","b7","b8","b9","ba","bb","bc","bd","be","bf","c0","c1","c2","c3","c4","c5","c6","c7","c8","c9","ca","cb","cc","cd","ce","cf","d0","d1","d2","d3","d4","d5","d6","d7","d8","d9","da","db","dc","dd","de","df","e0","e1","e2","e3","e4","e5","e6","e7","e8","e9","ea","eb","ec","ed","ee","ef","f0","f1","f2","f3","f4","f5","f6","f7","f8","f9","fa","fb","fc","fd","fe","ff"]


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
            unless entity @a[predicate=./match_id] scoreboard players add @s anomaly.timeout 1
            if score @s anomaly.timeout matches 3600.. kill @s

        if score @s anomaly.remove <= .gametime anomaly kill @s

    as @a at @s function ./tick_as_player:
        if score @s anomaly.ability matches 1.. function ./wfoas
        if score @s anomaly.travel matches 1.. unless entity @e[type=item_display,tag=anomaly.anomaly,distance=..4,limit=1] scoreboard players reset @s anomaly.travel
        if score @s anomaly.id matches 1.. unless dimension anomaly:abyss scoreboard players reset @s anomaly.id

predicate ./match_id { "condition": "minecraft:entity_scores", "entity": "this", "scores": {
    "anomaly.id": {
        "min": { "type": "minecraft:score", "target": { "type": "minecraft:fixed",
            "name": "#id" },
            "score": "anomaly"},
        "max": { "type": "minecraft:score", "target": { "type": "minecraft:fixed",
            "name": "#id" },
            "score": "anomaly" }}
    }}

