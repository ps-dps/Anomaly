
advancement ~/ { "criteria": { "requirement": {
    "trigger": "minecraft:inventory_changed", "conditions": {
        "player": [
            { "condition": "minecraft:location_check", "predicate": { "dimension": "anomaly:abyss" }},
            { "condition": "minecraft:reference", "name": "anomaly:destroy_elytra" }]
    }}},
    "rewards": { "function": "anomaly:destroy_elytra" }
    }

predicate ~/ { "condition": "minecraft:entity_properties", "entity": "this", "predicate": {
    "equipment": { "chest": { "items": [
        "minecraft:elytra" ],
        "durability": {
            "min": 2,
            "max": 500 }}}
    }}

item_modifier ~/ {
    "function": "minecraft:set_nbt",
    "tag": "{Damage:431}"
    }

advancement revoke @s only ~/
item modify entity @s armor.chest ~/
