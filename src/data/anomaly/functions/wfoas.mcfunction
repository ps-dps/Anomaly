
scoreboard players reset @s anomaly.ability

data remove storage ps:wfoas call.function
scoreboard players set #executed anomaly.ability 0

if predicate ~/mainhand run function ~/mainhand:
    scoreboard players set #executed anomaly.ability 1

    store result score #has_ability anomaly.ability
        data modify storage ps:wfoas call.function set from entity @s SelectedItem.tag.anomaly.ability

    if score #has_ability anomaly.ability matches 0 return 0

    store result score #cooldown anomaly.ability data get entity @s SelectedItem.tag.anomaly.cooldown
    store result score .gametime anomaly time query gametime
    if score #cooldown anomaly.ability > .gametime anomaly title @s actionbar {"text":"This ability is on cooldown","color":"red"}
    if score #cooldown anomaly.ability > .gametime anomaly return 0
    
    function ./utils/run_function with storage ps:wfoas call
    if entity @s[tag=anomaly.passive.9] scoreboard players operation .cooldown anomaly.ability /= #2 anomaly
    store result storage ps:wfoas item.cooldown int 1 scoreboard players operation .cooldown anomaly.ability += .gametime anomaly
    item modify entity @s weapon.mainhand ~/../cooldown

if score #executed anomaly.ability matches 0 if predicate ~/offhand run function ~/offhand:
    
    store result score #has_ability anomaly.ability
        data modify storage ps:wfoas call.function set from entity @s Inventory[{Slot:-106b}].tag.anomaly.ability

    if score #has_ability anomaly.ability matches 0 return 0

    store result score #cooldown anomaly.ability data get entity @s Inventory[{Slot:-106b}].tag.anomaly.cooldown
    store result score .gametime anomaly time query gametime
    if score #cooldown anomaly.ability > .gametime anomaly title @s actionbar {"text":"This ability is on cooldown","color":"red"}
    if score #cooldown anomaly.ability > .gametime anomaly return 0
    
    function ./utils/run_function with storage ps:wfoas call
    if entity @s[tag=anomaly.passive.9] scoreboard players operation .cooldown anomaly.ability /= #2 anomaly
    store result storage ps:wfoas item.cooldown int 1 scoreboard players operation .cooldown anomaly.ability += .gametime anomaly
    item modify entity @s weapon.offhand ~/../cooldown








predicate ~/mainhand { "condition": "minecraft:entity_properties", "entity": "this", "predicate": {
    "equipment": { "mainhand": {
            "items": [ "minecraft:warped_fungus_on_a_stick" ]
    }}}}
predicate ~/offhand { "condition": "minecraft:entity_properties", "entity": "this", "predicate": {
    "equipment": { "offhand": {
            "items": [ "minecraft:warped_fungus_on_a_stick" ]
    }}}}

item_modifier ~/cooldown {
    "function": "minecraft:copy_nbt",
    "source": {
        "type": "minecraft:storage",
        "source": "ps:wfoas" },
    "ops": [{
        "source": "item.cooldown",
        "target": "anomaly.cooldown",
        "op": "replace" }]
    }

