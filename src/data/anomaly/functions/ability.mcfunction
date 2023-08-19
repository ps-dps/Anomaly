
function ~/1:
#> heal
    effect give @s instant_health 1 0 true
    scoreboard players set .cooldown anomaly.ability 100

function ~/2:
#> turtle
    effect give @s slowness 2 3 true
    effect give @s resistance 2 4 true
    scoreboard players set .cooldown anomaly.ability 100

function ~/3:
#> ekko
    tag @s add anomaly.ability.ekko
    function gu:generate
    execute summon marker function ~/init_marker:
        tag @s add anomaly.ability
        tag @s add anomaly.ability.activate
        scoreboard players set @s anomaly.id 3
        scoreboard players operation @s anomaly.time = .gametime anomaly
        scoreboard players add @s anomaly.time 80
        data modify entity @s data.uuid set from storage gu:main out
    scoreboard players set .cooldown anomaly.ability 300
function ~/3/activate:
    execute function ~/../teleport with entity @s data:
        $tp $(uuid) @s
        $tag $(uuid) remove anomaly.ability.ekko
    kill @s

function ~/4:
#> beam
    tag @s add anomaly.temp.damage
    function ./raycast {distance:150,callback:{block:"anomaly:ability/4/hit",entity:"anomaly:ability/4/hit",fallback:"anomaly:ability/4/hit"}}
    scoreboard players set .cooldown anomaly.ability 40
    tag @s remove anomaly.temp.damage
function ~/4/hit:
    particle portal ~ ~ ~ 0 2 0 2 100
    particle end_rod ~ ~ ~ 0 2 0 0 50
    particle dust 0.8 0 0.8 2 ~ ~ ~ 0.2 2 0.2 0 200
    playsound minecraft:block.beacon.power_select hostile @a ~ ~ ~ 1 2
    positioned ~-0.5 ~-4 ~-0.5 as @e[tag=!anomaly.temp.damage,dx=0,dy=7,dz=0] damage @s 4 arrow by @a[tag=anomaly.temp.damage,limit=1]

function ~/5:
#> eye of the anomaly (tp home)
    scoreboard players set .cooldown anomaly.ability 0
    unless dimension anomaly:abyss return 0
    function ./return_from_anomaly
    scoreboard players set .cooldown anomaly.ability 1000
