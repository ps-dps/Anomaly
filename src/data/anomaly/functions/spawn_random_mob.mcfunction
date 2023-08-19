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

kill @s
