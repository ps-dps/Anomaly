#> FLOATING ISLANDS

if loaded ~ ~ ~
say MADE FLOTTING ISLANGS

scoreboard players operation #id anomaly = @s anomaly.id

positioned ~-103 ~-12 ~-74 function ~/place_main:
    positioned ~   ~   ~   place template anomaly:dungeon/1/0
    positioned ~   ~   ~47 place template anomaly:dungeon/1/1
    positioned ~47 ~   ~   place template anomaly:dungeon/1/2
    positioned ~47 ~   ~47 place template anomaly:dungeon/1/3
    positioned ~95 ~   ~   place template anomaly:dungeon/1/4
    positioned ~95 ~   ~47 place template anomaly:dungeon/1/5

as @e[type=marker,tag=anomaly.mob.spawn] at @s function ./../spawn_random_mob

store result storage ps:temp boss.id int 1 random value 1..2
positioned ~-15 ~-5 ~-119 summon marker function ~/place_boss with storage ps:temp boss:
    tag @s add anomaly.bossarena
    scoreboard players operation @s anomaly.id = #id anomaly
    $function anomaly:boss/$(id)/spawn
