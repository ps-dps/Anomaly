
advancement ~/ { "criteria": {
    "killed_dragon": { "trigger": "minecraft:player_killed_entity", "conditions": {
        "entity": [{
            "condition": "minecraft:entity_properties",
            "entity": "this",
            "predicate": { "type": "minecraft:ender_dragon" }}]}}},
    "rewards": { "function": "anomaly:start_anomaly" }
    }

tellraw @s ["",{"text":"The Infection spreads..."}]
