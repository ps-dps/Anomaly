
scoreboard players reset @s ps-dpjten.ability

data remove storage ps:wfoas call.function
scoreboard players set #executed ps-dpjten.ability 0

if predicate ~/mainhand run function ~/mainhand:
    scoreboard players set #executed ps-dpjten.ability 1

    store result score #has_ability ps-dpjten.ability
        data modify storage ps:wfoas call.function set from entity @s SelectedItem.tag.ps-dpjten.ability

    if score #has_ability ps-dpjten.ability matches 0 return 0

    store result score #cooldown ps-dpjten.ability data get entity @s SelectedItem.tag.ps-dpjten.cooldown
    store result score .gametime ps-dpjten time query gametime
    if score #cooldown ps-dpjten.ability > .gametime ps-dpjten return 0
    
    function ./utils/run_function with storage ps:wfoas call
    store result storage ps:wfoas item.cooldown int 1 scoreboard players operation .cooldown ps-dpjten.ability += .gametime ps-dpjten
    item modify entity @s weapon.mainhand ~/../cooldown

if score #executed ps-dpjten.ability matches 0 if predicate ~/offhand run function ~/offhand:
    
    store result score #has_ability ps-dpjten.ability
        data modify storage ps:wfoas call.function set from entity @s Inventory[{Slot:-106b}].tag.ps-dpjten.ability

    if score #has_ability ps-dpjten.ability matches 0 return 0

    store result score #cooldown ps-dpjten.ability data get entity @s Inventory[{Slot:-106b}].tag.ps-dpjten.cooldown
    store result score .gametime ps-dpjten time query gametime
    if score #cooldown ps-dpjten.ability > .gametime ps-dpjten return 0
    
    function ./utils/run_function with storage ps:wfoas call
    store result storage ps:wfoas item.cooldown int 1 scoreboard players operation .cooldown ps-dpjten.ability += .gametime ps-dpjten
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
        "target": "ps-dpjten.cooldown",
        "op": "replace" }]
    }

