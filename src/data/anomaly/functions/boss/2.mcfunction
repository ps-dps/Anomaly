
function ~/spawn:
    store result storage ps:temp boss.id int 1 scoreboard players get @s anomaly.id
    positioned ~ ~ ~ summon item_display function ~/model with storage ps:temp boss: #! ADJUST POSITION TO REFLECT CORRECT POSITION IN ARENA
        tag @s add anomaly.boss
        tag @s add anomaly.radience
        $scoreboard players set #id anomaly $(id)
        scoreboard players operation @s anomaly.id = #id anomaly
        $scoreboard players set .$(id) anomaly.id 2
        item replace entity @s container.0 with iron_chestplate
        summon giant ~ ~ ~ {
            Invulnerable: 1b,
            NoAI:1b,
            Tags:["anomaly.boss","anomaly.radience"],
            active_effects:[{
                id:"minecraft:invisibility",
                amplifier:0b,
                duration:-1,
                show_particles:0b}]
            }
        scoreboard players operation @e[type=giant,limit=1,tag=anomaly.radience,distance=..3] anomaly.id = #id anomaly
        ride @e[type=giant,limit=1,tag=anomaly.radience,distance=..3] mount @s
        on passengers attribute @s minecraft:generic.max_health base set 300
        on passengers store result score @s anomaly.boss.health store result score @s anomaly.boss.max_health attribute @s minecraft:generic.max_health get 10
        on passengers store result entity @s Health float 0.1 scoreboard players get @s anomaly.boss.max_health
        $bossbar add anomaly:boss/$(id) {"text":"Radience","color":"light_purple"}
        $execute on passengers store result bossbar anomaly:boss/$(id) max run scoreboard players get @s anomaly.boss.max_health
        $execute on passengers store result bossbar anomaly:boss/$(id) value run scoreboard players get @s anomaly.boss.health
        $bossbar set anomaly:boss/$(id) color red
        $bossbar set anomaly:boss/$(id) players @a[predicate=anomaly:match_id]
        $bossbar set anomaly:boss/$(id) visible false


function ~/tick:
    scoreboard players operation #id anomaly = @s anomaly.id
    as @e[type=item_display,tag=anomaly.radience,predicate=./../match_id,limit=1] function ~/../tick_as_item_display

function ~/tick_as_item_display:
    # if score @s anomaly.boss.time matches 100.. scoreboard players reset @s anomaly.boss.time
    # scoreboard players add @s anomaly.boss.time 1
    # if score @s anomaly.boss.time matches 1 data merge entity @s {start_interpolation:0,interpolation_duration:50,transformation:{scale:[6.4f,7.5f,6.4f],translation:[0f,3.75f,0f]}}
    # if score @s anomaly.boss.time matches 51 data merge entity @s {start_interpolation:0,interpolation_duration:50,transformation:{scale:[7f,7f,7f],translation:[0f,3.5f,0f]}}

    scoreboard players set #temp anomaly 0
    on passengers scoreboard players set #temp anomaly 1
    if score #temp anomaly matches 0 at @s function ~/../natural_death:
        function ./defeat


function ~/death:
    tp @e[tag=anomaly.boss.minion,predicate=./../match_id] ~ -100 ~
    tp @e[tag=anomaly.boss,predicate=./../match_id] ~ -100 ~
    kill @e[tag=anomaly.boss.minion,predicate=./../match_id]
    kill @e[tag=anomaly.boss,predicate=./../match_id]


function ~/hit_match:
    store result storage ps:temp boss.id int 1 scoreboard players get @s anomaly.id
    execute function ~/../update_bossbar with storage ps:temp boss:
        $execute store result bossbar anomaly:boss/$(id) value run data get entity @s Health 10

# function ~/summon_spread_minion:
#     scoreboard players operation #id anomaly = @s anomaly.id
#     at @s summon zombie function ~/summon_spread_minion_setup:
#         tag @s add anomaly.boss.minion
#         scoreboard players operation @s anomaly.id = #id anomaly
#         spreadplayers ~ ~ 4 20 false @s


function ~/activate:
    scoreboard players operation #id anomaly = @s anomaly.id
    data modify entity @e[limit=1,type=giant,tag=anomaly.radience,predicate=./../match_id] Invulnerable set value 0b


function ~/deactivate:
    scoreboard players operation #id anomaly = @s anomaly.id
    store result storage ps:temp boss.id int 1 scoreboard players get @s anomaly.id
    as @e[limit=1,type=giant,tag=anomaly.radience,predicate=./../match_id] function ~/../deactivate_giant with storage ps:temp boss:
        data modify entity @s Invulnerable set value 1b
        store result entity @s Health float 0.1 scoreboard players get @s anomaly.boss.max_health
        $execute store result bossbar anomaly:boss/$(id) value run scoreboard players get @s anomaly.boss.max_health
    tp @e[tag=anomaly.boss.minion,predicate=./../match_id] ~ -100 ~
    kill @e[tag=anomaly.boss.minion,predicate=./../match_id]


function ~/attack/arrow:
    scoreboard players operation #id anomaly = @s anomaly.id
    store result score #random anomaly random value 1..4
    if score #random anomaly matches 1 function ~/../arrow2
    if score #random anomaly matches 2 positioned ~24 ~ ~ function ~/../arrow2
    if score #random anomaly matches 3 positioned ~24 ~ ~24 function ~/../arrow2
    if score #random anomaly matches 4 positioned ~ ~ ~24 function ~/../arrow2:
        for x in range(24):
            for z in range(24):
                positioned ~x ~ ~z positioned over motion_blocking summon arrow function ~/../arrow3
function ~/attack/arrow3:
    data modify entity @s Motion set value [0d,2d,0d]
    tag @s add anomaly.boss.minion
    scoreboard players operation @s anomaly.id = #id anomaly
    unless entity @s[y=1,dy=300] kill @s


function ~/attack/farrow:
    scoreboard players operation #id anomaly = @s anomaly.id
    at @a[predicate=./../match_id] positioned ~ ~30 ~ summon arrow function ~/../farrow2:
        data modify entity @s Motion set value [0d,-2d,0d]
        tag @s add anomaly.boss.minion
        scoreboard players operation @s anomaly.id = #id anomaly



# predicate ~/40percent { "condition": "minecraft:random_chance", "chance": 0.4 }
