
function ~/place_random:
    store result storage ps:anomaly spawn.x int 1 random value 25..50 anomaly:anomaly
    store result storage ps:anomaly spawn.z int 1 random value 25..50 anomaly:anomaly
    if predicate ~/../50percent store result storage ps:anomaly spawn.x int -1 data get storage ps:anomaly spawn.x
    if predicate ~/../50percent store result storage ps:anomaly spawn.z int -1 data get storage ps:anomaly spawn.z
    function ~/../place_relative with storage ps:anomaly spawn

function ~/place_relative:
    $execute positioned ~$(x) ~ ~$(z) positioned over motion_blocking_no_leaves run function anomaly:anomaly/place

function ~/place:
    positioned ~ ~1 ~ summon item_display function ~/../initiate:
        tag @s add anomaly.anomaly
        item replace entity @s container.0 with warped_fungus_on_a_stick{CustomModelData:255901}
        data merge entity @s { billboard: "vertical", item_display: "gui" }
        scoreboard players operation @s anomaly.remove = .gametime anomaly
        scoreboard players add @s anomaly.remove 6000

function ~/tick:
    particle portal ~ ~ ~ 0 0 0 3 1

    scoreboard players add @a[distance=..4] anomaly.travel 1
    effect give @a[distance=..4,scores={anomaly.travel=1}] nausea 8 0 true
    unless score @s anomaly.id = @s anomaly.id if entity @a[distance=..4,scores={anomaly.travel=100..}] function ./generate_anomaly/id
    if     score @s anomaly.id = @s anomaly.id if entity @a[distance=..4,scores={anomaly.travel=100..}] function ./generate_anomaly/just_tp
    as @s[tag=anomaly.await_loaded] function ./generate_anomaly/await_loaded

    if score @s anomaly.remove <= .gametime anomaly function ./generate_anomaly/remove

predicate ~/50percent { "condition": "minecraft:random_chance", "chance": 0.5 }
