#> CITY SCAPE ISLANDS

execute if loaded ~ ~ ~
say dfsf

scoreboard players operation #id anomaly = @s anomaly.id

positioned ~-42 ~-1 ~-57 function ~/place_main:
    positioned ~   ~   ~   place template anomaly:dungeon/2/0
    positioned ~   ~   ~47 place template anomaly:dungeon/2/1
    positioned ~   ~   ~95 place template anomaly:dungeon/2/2
    positioned ~47 ~   ~   place template anomaly:dungeon/2/3
    positioned ~47 ~   ~47 place template anomaly:dungeon/2/4
    positioned ~47 ~   ~95 place template anomaly:dungeon/2/5
    positioned ~   ~47 ~   place template anomaly:dungeon/2/6
    positioned ~   ~47 ~47 place template anomaly:dungeon/2/7
    positioned ~   ~47 ~95 place template anomaly:dungeon/2/8
    positioned ~47 ~47 ~   place template anomaly:dungeon/2/9
    positioned ~47 ~47 ~47 place template anomaly:dungeon/2/10
    positioned ~47 ~47 ~95 place template anomaly:dungeon/2/11

as @e[type=marker,tag=anomaly.mob.spawn] at @s function ./../spawn_random_mob

store result storage ps:temp boss.id int 1 random value 1..2
positioned ~-23 ~-5 ~-104 summon marker function ~/place_boss with storage ps:temp boss:
    tag @s add anomaly.bossarena
    scoreboard players operation @s anomaly.id = #id anomaly
    $function anomaly:boss/$(id)/spawn
