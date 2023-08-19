
function ~/give_all_loot:
    loot give @s loot ./infected_headpiece
    loot give @s loot ./infected_chestpiece
    loot give @s loot ./infected_legpiece
    loot give @s loot ./infected_boots
    loot give @s loot ./infected_jelly_cap
    loot give @s loot ./greater_infected_turtle_shell
    loot give @s loot ./sludge_pants
    loot give @s loot ./end_stone_boots
    loot give @s loot ./sculk_helmet
    loot give @s loot ./warped_leggings
    loot give @s loot ./root_boots
    loot give @s loot ./eye_of_the_anomaly
    loot give @s loot ./beam_staff
    loot give @s loot ./infected_shell
    loot give @s loot ./intertwined_fate
    loot give @s loot ./sludgesicle

function ~/spawn_random_mob:
    setblock ~ ~ ~ air
    store result score #mob anomaly random value 2..10
    if score #mob anomaly matches 2 function ./../mob/1/spawn
    if score #mob anomaly matches 3 run summon enderman ~ ~ ~ {PersistenceRequired:1b}
    if score #mob anomaly matches 4 run summon endermite ~ ~ ~ {PersistenceRequired:1b}
    if score #mob anomaly matches 5..8 run summon zombie ~ ~ ~ {PersistenceRequired:1b, ArmorDropChances:[0f,0f,0f,0f], ArmorItems:[
        {id:"minecraft:leather_boots",Count:1b,tag:{display:{color:1}}},
        {id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:1}}},
        {id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:1}}},
        {id:"minecraft:leather_helmet",Count:1b,tag:{display:{color:1}}}]}
    if score #mob anomaly matches 9..10 run summon skeleton ~ ~ ~ {PersistenceRequired:1b, HandItems:[{id:"minecraft:bow",Count:1b},{}], ArmorDropChances:[0f,0f,0f,0f], ArmorItems:[
        {id:"minecraft:leather_boots",Count:1b,tag:{display:{color:1}}},
        {id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:1}}},
        {id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:1}}},
        {id:"minecraft:leather_helmet",Count:1b,tag:{display:{color:1}}}]}
    
    as @e[tag=anomaly.setup] tag @s remove anomaly.setup



loot_table ./infected_headpiece { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:leather_helmet",
    "functions": [
        { "function": "minecraft:set_attributes", "modifiers": [
            { "attribute": "minecraft:generic.armor", "name": "anomaly.armor", "amount": 1, "operation": "addition", "id": "2557-0-2557-0-1", "slot": "head" },
            { "attribute": "minecraft:generic.luck", "name": "anomaly.passive", "amount": -0.00000000000101, "operation": "addition", "id": "c-0-a455-0-c", "slot": "head" }]},
        { "function": "minecraft:set_nbt", "tag": "{display:{color:1},CustomModelData:255901,HideFlags:66,anomaly:{passive:{id:3,onApply:1b,onRemove:1b}}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "Lets the wearer see in the dark", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Infected Headpiece", "color": "light_purple", "italic": false }}
    ]}]}]}

loot_table ./infected_chestpiece { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:leather_chestplate",
    "functions": [
        { "function": "minecraft:set_attributes", "modifiers": [
            { "attribute": "minecraft:generic.armor", "name": "anomaly.armor", "amount": 4, "operation": "addition", "id": "2557-0-2557-0-2", "slot": "chest" },
            { "attribute": "minecraft:generic.luck", "name": "anomaly.passive", "amount": -0.00000000000101, "operation": "addition", "id": "c-0-a455-0-d", "slot": "chest" }]},
        { "function": "minecraft:set_nbt", "tag": "{display:{color:1},CustomModelData:255901,HideFlags:66,anomaly:{passive:{id:1,onHurt:1b}}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "Aids the wearers fresh wounds", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Infected Chestpiece", "color": "light_purple", "italic": false }}
    ]}]}]}

loot_table ./infected_legpiece { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:leather_leggings",
    "functions": [
        { "function": "minecraft:set_attributes", "modifiers": [
            { "attribute": "minecraft:generic.armor", "name": "anomaly.armor", "amount": 3, "operation": "addition", "id": "2557-0-2557-0-3", "slot": "legs" },
            { "attribute": "minecraft:generic.luck", "name": "anomaly.passive", "amount": -0.00000000000101, "operation": "addition", "id": "c-0-a455-0-e", "slot": "legs" }]},
        { "function": "minecraft:set_nbt", "tag": "{display:{color:1},CustomModelData:255901,HideFlags:66}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "You can see the infection spreading", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Infected Legpiece", "color": "light_purple", "italic": false }}
    ]}]}]}

loot_table ./infected_boots { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:leather_boots",
    "functions": [
        { "function": "minecraft:set_attributes", "modifiers": [
            { "attribute": "minecraft:generic.armor", "name": "anomaly.armor", "amount": 1, "operation": "addition", "id": "2557-0-2557-0-5", "slot": "feet" },
            { "attribute": "minecraft:generic.luck", "name": "anomaly.passive", "amount": -0.00000000000101, "operation": "addition", "id": "c-0-a455-0-f", "slot": "feet" }]},
        { "function": "minecraft:set_nbt", "tag": "{display:{color:1},CustomModelData:255901,HideFlags:66}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "You can see the infection spreading", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Infected Boots", "color": "light_purple", "italic": false }}
    ]}]}]}


loot_table ./infected_jelly_cap { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:leather_helmet",
    "functions": [
        { "function": "minecraft:set_attributes", "modifiers": [
            { "attribute": "minecraft:generic.armor", "name": "anomaly.armor", "amount": 2, "operation": "addition", "id": "2557-0-2557-0-11", "slot": "head" },
            { "attribute": "minecraft:generic.luck", "name": "anomaly.passive", "amount": -0.00000000000101, "operation": "addition", "id": "c-0-a455-0-c", "slot": "head" }]},
        { "function": "minecraft:set_nbt", "tag": "{display:{color:2},CustomModelData:255903,HideFlags:66,anomaly:{passive:{id:6,onHurt:1b}}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "Ejects explosive spores on contact", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Infected Jelly Cap", "color": "light_purple", "italic": false }}
    ]}]}]}

loot_table ./greater_infected_turtle_shell { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:leather_chestplate",
    "functions": [
        { "function": "minecraft:set_attributes", "modifiers": [
            { "attribute": "minecraft:generic.armor", "name": "anomaly.armor", "amount": 5, "operation": "addition", "id": "2557-0-2557-0-12", "slot": "chest" },
            { "attribute": "minecraft:generic.luck", "name": "anomaly.passive", "amount": -0.00000000000101, "operation": "addition", "id": "c-0-a455-0-d", "slot": "chest" }]},
        { "function": "minecraft:set_nbt", "tag": "{display:{color:2},CustomModelData:255903,HideFlags:66,anomaly:{passive:{id:7,onHurt:1b}}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "Protects the wearer after taking damage", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Geater Infected Turtle Shell", "color": "light_purple", "italic": false }}
    ]}]}]}

loot_table ./sludge_pants { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:leather_leggings",
    "functions": [
        { "function": "minecraft:set_attributes", "modifiers": [
            { "attribute": "minecraft:generic.armor", "name": "anomaly.armor", "amount": 5, "operation": "addition", "id": "2557-0-2557-0-13", "slot": "legs" },
            { "attribute": "minecraft:generic.luck", "name": "anomaly.passive", "amount": -0.00000000000101, "operation": "addition", "id": "c-0-a455-0-e", "slot": "legs" }]},
        { "function": "minecraft:set_nbt", "tag": "{display:{color:2},CustomModelData:255903,HideFlags:66,anomaly:{passive:{id:5,onApply:1b,onRemove:1b}}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "A parasitic living sludge", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Sludge Pants", "color": "light_purple", "italic": false }}
    ]}]}]}

loot_table ./end_stone_boots { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:leather_boots",
    "functions": [
        { "function": "minecraft:set_attributes", "modifiers": [
            { "attribute": "minecraft:generic.armor", "name": "anomaly.armor", "amount": 2, "operation": "addition", "id": "2557-0-2557-0-14", "slot": "feet" },
            { "attribute": "minecraft:generic.luck", "name": "anomaly.passive", "amount": -0.00000000000101, "operation": "addition", "id": "c-0-a455-0-f", "slot": "feet" }]},
        { "function": "minecraft:set_nbt", "tag": "{display:{color:2},CustomModelData:255903,HideFlags:66,anomaly:{passive:{id:2,onApply:1b,onRemove:1b}}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "Float like a floating end stone island, soar up uppon taking damage", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "End Stone Boots", "color": "light_purple", "italic": false }}
    ]}]}]}


loot_table ./sculk_helmet { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:leather_helmet",
    "functions": [
        { "function": "minecraft:set_attributes", "modifiers": [
            { "attribute": "minecraft:generic.armor", "name": "anomaly.armor", "amount": 2, "operation": "addition", "id": "2557-0-2557-0-16", "slot": "head" },
            { "attribute": "minecraft:generic.luck", "name": "anomaly.passive", "amount": -0.00000000000101, "operation": "addition", "id": "c-0-a455-0-c", "slot": "head" }]},
        { "function": "minecraft:set_nbt", "tag": "{display:{color:3},CustomModelData:255902,HideFlags:66,anomaly:{passive:{id:9,onApply:1b,onRemove:1b}}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "The wearers abilities are cast more swiftly", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Sculk Helmet", "color": "cyan", "italic": false }}
    ]}]}]}

loot_table ./warped_leggings { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:leather_leggings",
    "functions": [
        { "function": "minecraft:set_attributes", "modifiers": [
            { "attribute": "minecraft:generic.armor", "name": "anomaly.armor", "amount": 3, "operation": "addition", "id": "2557-0-2557-0-19", "slot": "legs" },
            { "attribute": "minecraft:generic.luck", "name": "anomaly.passive", "amount": -0.00000000000101, "operation": "addition", "id": "c-0-a455-0-e", "slot": "legs" }]},
        { "function": "minecraft:set_nbt", "tag": "{display:{color:3},CustomModelData:255902,HideFlags:66,anomaly:{passive:{id:8,onTick:1b,onRemove:1b}}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "When your health drops low, you feel a rush", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Warped Leggings", "color": "cyan", "italic": false }}
    ]}]}]}

loot_table ./root_boots { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:leather_boots",
    "functions": [
        { "function": "minecraft:set_attributes", "modifiers": [
            { "attribute": "minecraft:generic.armor", "name": "anomaly.armor", "amount": 1, "operation": "addition", "id": "2557-0-2557-0-aa", "slot": "feet" },
            { "attribute": "minecraft:generic.luck", "name": "anomaly.passive", "amount": -0.00000000000101, "operation": "addition", "id": "c-0-a455-0-f", "slot": "feet" }]},
        { "function": "minecraft:set_nbt", "tag": "{display:{color:3},CustomModelData:255902,HideFlags:66,anomaly:{passive:{id:4,onApply:1b,onRemove:1b}}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "The wearer feels a strong pull towards the soil beneath them, taking off all fall damage", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Root Boots", "color": "cyan", "italic": false }}
    ]}]}]}


loot_table ./eye_of_the_anomaly { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:warped_fungus_on_a_stick",
    "functions": [
        { "function": "minecraft:set_nbt", "tag": "{CustomModelData:255902,anomaly:{ability:\"anomaly:ability/5\"}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "Instantly return from an anomaly, keeping all your gear", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Eye of the Anomaly", "color": "light_purple", "italic": false }}
    ]}]}]}

loot_table ./beam_staff { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:warped_fungus_on_a_stick",
    "functions": [
        { "function": "minecraft:set_nbt", "tag": "{CustomModelData:255907,anomaly:{ability:\"anomaly:ability/4\"}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "Summon a beam of infection where you look", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Radient Staff", "color": "light_purple", "italic": false }}
    ]}]}]}

loot_table ./infected_shell { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:warped_fungus_on_a_stick",
    "functions": [
        { "function": "minecraft:set_nbt", "tag": "{CustomModelData:255908,anomaly:{ability:\"anomaly:ability/2\"}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "Use, to gain invincibility for a short duration", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Smaller Infected Shell", "color": "light_purple", "italic": false }}
    ]}]}]}

loot_table ./intertwined_fate { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:warped_fungus_on_a_stick",
    "functions": [
        { "function": "minecraft:set_nbt", "tag": "{CustomModelData:255909,anomaly:{ability:\"anomaly:ability/3\"}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "Return to your previous location, shortly after using the item", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Intertwined Fate", "color": "light_purple", "italic": false }}
    ]}]}]}

loot_table ./sludgesicle { "pools": [ { "rolls": 1, "entries": [{ "type": "minecraft:item",
    "name": "minecraft:warped_fungus_on_a_stick",
    "functions": [
        { "function": "minecraft:set_nbt", "tag": "{CustomModelData:255910,anomaly:{ability:\"anomaly:ability/1\"}}" },
        { "function": "minecraft:set_lore", "lore":
            [{ "text": "Lick on it to regain some health", "color": "white", "italic": false }]},
        { "function": "minecraft:set_name", "name":
            { "text": "Sludgesicle", "color": "light_purple", "italic": false }}
    ]}]}]}

loot_table ./chest/anomaly {
    "type": "minecraft:chest",
    "pools": [
        { "rolls": { "type": "minecraft:binomial", "n": 2, "p": 0.1 },
            "entries": [
            { "type": "minecraft:loot_table", "name": "anomaly:infected_headpiece" },
            { "type": "minecraft:loot_table", "name": "anomaly:infected_chestpiece" },
            { "type": "minecraft:loot_table", "name": "anomaly:infected_legpiece" },
            { "type": "minecraft:loot_table", "name": "anomaly:infected_boots" },
            { "type": "minecraft:loot_table", "name": "anomaly:infected_jelly_cap" },
            { "type": "minecraft:loot_table", "name": "anomaly:greater_infected_turtle_shell" },
            { "type": "minecraft:loot_table", "name": "anomaly:sludge_pants" },
            { "type": "minecraft:loot_table", "name": "anomaly:end_stone_boots" },
            { "type": "minecraft:loot_table", "name": "anomaly:sculk_helmet" },
            { "type": "minecraft:loot_table", "name": "anomaly:warped_leggings" },
            { "type": "minecraft:loot_table", "name": "anomaly:root_boots" },
            { "type": "minecraft:loot_table", "name": "anomaly:eye_of_the_anomaly" },
            { "type": "minecraft:loot_table", "name": "anomaly:beam_staff" },
            { "type": "minecraft:loot_table", "name": "anomaly:infected_shell" },
            { "type": "minecraft:loot_table", "name": "anomaly:intertwined_fate" },
            { "type": "minecraft:loot_table", "name": "anomaly:sludgesicle" }]},
        { "rolls": { "min": 2, "max": 5 }, "entries": [
            { "type": "minecraft:item",
                "weight": 3,
                "name": "minecraft:golden_apple",
                "functions": [{ "function": "minecraft:set_count", "count": { "min": 1, "max": 3 }}]},
            { "type": "minecraft:item",
                "weight": 1,
                "name": "minecraft:budding_amethyst" },
            { "type": "minecraft:item",
                "weight": 4,
                "name": "minecraft:ender_eye" },
            { "type": "minecraft:item",
                "weight": 1,
                "name": "minecraft:echo_shard" },
            { "type": "minecraft:item",
                "weight": 8,
                "name": "minecraft:chorus_fruit",
                "functions": [{ "function": "minecraft:set_count", "count": { "min": 1, "max": 17 }}]},
            { "type": "minecraft:item",
                "weight": 5,
                "name": "minecraft:ender_pearl",
                "functions": [{ "function": "minecraft:set_count", "count": { "min": 1, "max": 4 }}]}]}]}

