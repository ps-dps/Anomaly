
function ~/just_tp:
    store result storage ps:anomaly generate.offset int 1 scoreboard players get @s anomaly.id
    scoreboard players operation @a[distance=..4,scores={anomaly.travel=100..}] anomaly.id = @s anomaly.id
    execute as @a[distance=..4,scores={anomaly.travel=100..}] function ~/../teleport with storage ps:anomaly generate

function ~/id:
    scoreboard players add .global anomaly.id 10000
    store result storage ps:anomaly generate.offset int 1 scoreboard players operation @s anomaly.id = .global anomaly.id
    scoreboard players operation @a[distance=..4,scores={anomaly.travel=100..}] anomaly.id = @s anomaly.id
    say @a[distance=..4,scores={anomaly.travel=100..}] should habe the score
    as @a[distance=..4,scores={anomaly.travel=100..}] function ~/../teleport with storage ps:anomaly generate
    tag @s add anomaly.await_loaded
    scoreboard players reset @s anomaly.remove

function ~/await_loaded:
    store result storage ps:anomaly generate.offset int 1 scoreboard players get @s anomaly.id
    execute function ~/../check_loaded with storage ps:anomaly generate:
        $execute store result score #loaded anomaly in anomaly:abyss if loaded $(offset) 101 0
    if score #loaded anomaly matches 0 return 0

    tag @s remove anomaly.await_loaded
    tag @s add anomaly.active
    store result storage ps:anomaly generate.dungeon int 1 random value 1..3 anomaly:dungeon
    in anomaly:abyss function ~/../generate_dungeon with storage ps:anomaly generate:
        $execute positioned $(offset) 101 0 run function anomaly:dungeon/remove
        $execute positioned $(offset) 101 0 run function anomaly:dungeon/$(dungeon)
        $execute positioned $(offset) 101 0 as @a[distance=..101] run say dfesfhgh
        $execute positioned $(offset) 101 0 as @a[distance=..101] run tp $(offset) 101 0

function ~/teleport:
    $execute in anomaly:abyss run tp $(offset) 101 0
    effect give @s slow_falling 20 0 true
