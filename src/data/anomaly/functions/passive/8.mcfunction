#> DAMAGE BOOST WHEN LOWW ("Warped" Leggings)

# function ~/hurt:
# function ~/apply:
function ~/remove:
    attribute @s minecraft:generic.attack_damage modifier remove 2559999-2559-2559-0-2
    attribute @s minecraft:generic.attack_damage modifier remove 2559999-2559-2559-0-3

function ~/tick:
    if entity @s[tag=anomaly.passive.8.10] if score @s anomaly.health matches 11.. attribute @s minecraft:generic.attack_damage modifier remove 2559999-2559-2559-0-2
    if entity @s[tag=anomaly.passive.8.10] if score @s anomaly.health matches 11.. tag @s remove anomaly.passive.8.10
    if score @s anomaly.health matches ..10 attribute @s minecraft:generic.attack_damage modifier add 2559999-2559-2559-0-2 anomaly.passive.8 0.1 multiply
    if score @s anomaly.health matches ..10 tag @s add anomaly.passive.8.10
    if entity @s[tag=anomaly.passive.8.5] if score @s anomaly.health matches 6.. attribute @s minecraft:generic.attack_damage modifier remove 2559999-2559-2559-0-3
    if entity @s[tag=anomaly.passive.8.5] if score @s anomaly.health matches 6.. tag @s remove anomaly.passive.8.5
    if score @s anomaly.health matches ..5 attribute @s minecraft:generic.attack_damage modifier add 2559999-2559-2559-0-3 anomaly.passive.8 0.1 multiply
    if score @s anomaly.health matches ..5 tag @s add anomaly.passive.8.5
