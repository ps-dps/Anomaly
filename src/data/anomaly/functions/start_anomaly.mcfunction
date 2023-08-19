
advancement ~/ { "criteria": {
    "killed_dragon": { "trigger": "minecraft:player_killed_entity", "conditions": {
        "entity": [{
            "condition": "minecraft:entity_properties",
            "entity": "this",
            "predicate": { "type": "minecraft:ender_dragon" }}]}}},
    "rewards": { "function": "anomaly:start_anomaly" }
    }

tellraw @s ["",{"text":"The infection spreads...","color":"light_purple"}]

function ./utils/rand_range with storage ps:anomaly spawn_range
scoreboard players operation @s anomaly.spawn = .gametime anomaly
scoreboard players operation @s anomaly.spawn += .random anomaly
