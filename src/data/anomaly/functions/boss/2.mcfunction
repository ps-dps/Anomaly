
function ~/spawn:
    place template anomaly:boss/2
    store result score @s anomaly.bossvar.0 random value 4..8
    store result storage ps:temp boss.id int 1 scoreboard players get @s anomaly.id
    positioned ~23 ~9 ~23 summon item_display function ~/model with storage ps:temp boss:
        data modify entity @s teleport_duration set value 200
        tag @s add anomaly.boss
        tag @s add anomaly.radience
        $scoreboard players set #id anomaly $(id)
        scoreboard players operation @s anomaly.id = #id anomaly
        $scoreboard players set .$(id) anomaly.id 2
        item replace entity @s container.0 with minecraft:warped_fungus_on_a_stick{CustomModelData:255903}
        data modify entity @s transformation.translation set value [0d,4d,0d]
        data modify entity @s transformation.scale set value [8d,8d,8d]
        data modify entity @s billboard set value "vertical"
        summon giant ~ ~ ~ {
            Invulnerable: 1b,
            NoAI:1b,
            Tags:["anomaly.boss","anomaly.radience"],
            active_effects:[{
                id:"minecraft:invisibility",
                amplifier:0b,
                duration:-1,
                show_particles:0b}],
            CustomName:'{"text":"Radience"}'
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
        positioned ~ ~-9 ~ summon item_display function ~/../acid:
            data modify entity @s teleport_duration set value 3
            data modify entity @s transformation.scale set value [48.01f,48.01f,48.01f]
            data modify entity @s transformation.translation set value [0f,-24f,0f]
            tag @s add anomaly.boss
            tag @s add anomaly.radience
            tag @s add anomaly.radience.acid
            scoreboard players operation @s anomaly.id = #id anomaly
            item replace entity @s container.0 with magenta_stained_glass


function ~/tick:
    scoreboard players operation #id anomaly = @s anomaly.id
    as @e[type=item_display,tag=anomaly.radience,tag=!anomaly.radience.acid,predicate=./../match_id,limit=1] function ~/../tick_as_item_display
    if entity @s[tag=anomaly.active] function ~/../tick_active:
        as @e[type=item_display,tag=anomaly.radience.acid,predicate=./../match_id,limit=1] at @s function ~/../tick_acid
        as @e[type=marker,tag=anomaly.radience.beam,predicate=./../match_id] if score @s anomaly.time <= .gametime anomaly at @s function ~/../attack/beam3
        store result score #temp anomaly scoreboard players add @s anomaly.time 1
        if score @s anomaly.time matches 0.. scoreboard players operation #temp anomaly /= #20 anomaly
        if score #temp anomaly >= @s anomaly.bossvar.0 function ~/../attack

function ~/tick_as_item_display:
    scoreboard players set #temp anomaly 0
    on passengers scoreboard players set #temp anomaly 1
    if score #temp anomaly matches 0 at @s function ~/../natural_death:
        function ./defeat

function ~/tick_acid:
    positioned ~-24 ~ ~-24 if entity @e[type=marker,tag=anomaly.bossarena,limit=1,distance=..47] tp ~24 ~0.003 ~24
    positioned ~-24 ~-2.5 ~-24 effect give @e[dx=47,dy=-47,dz=47] darkness 2 0 true
    scoreboard players operation #id anomaly = @s anomaly.id
    positioned ~-24 ~-2.5 ~-24 as @e[dx=47,dy=-47,dz=47,tag=!anomaly.boss,tag=!anomaly.boss.minion] damage @s 1 arrow by @e[type=giant,limit=1,tag=anomaly.boss,tag=anomaly.radience,predicate=./../match_id]


function ~/death:
    tp @e[tag=anomaly.boss.minion,predicate=./../match_id] ~ -100 ~
    tp @e[tag=anomaly.boss,predicate=./../match_id] ~ -100 ~
    kill @e[tag=anomaly.boss.minion,predicate=./../match_id]
    kill @e[tag=anomaly.boss,predicate=./../match_id]


function ~/hit_match:
    store result storage ps:temp boss.id int 1 scoreboard players operation #id anomaly = @s anomaly.id
    store result score #health anomaly data get entity @s Health 10
    execute function ~/../update_bossbar with storage ps:temp boss:
        $execute store result bossbar anomaly:boss/$(id) value run scoreboard players get #health anomaly
    as @e[type=item_display,tag=anomaly.boss,tag=anomaly.radience,tag=!anomaly.radience.acid,predicate=./../match_id] function ~/../phase_check:
        unless score @s anomaly.boss.phase matches 1.. if score #health anomaly matches ..2000 function ~/../phase1:
            scoreboard players set @s anomaly.boss.phase 1
            at @e[type=marker,tag=anomaly.bossarena,predicate=./../match_id] tp ~24 ~20 ~24
        unless score @s anomaly.boss.phase matches 2.. if score #health anomaly matches ..1000 function ~/../phase2:
            scoreboard players set @s anomaly.boss.phase 2
            at @e[type=marker,tag=anomaly.bossarena,predicate=./../match_id] tp ~24 ~41 ~24


function ~/activate:
    scoreboard players operation #id anomaly = @s anomaly.id
    data modify entity @e[limit=1,type=giant,tag=anomaly.radience,predicate=./../match_id] Invulnerable set value 0b


function ~/deactivate:
    scoreboard players operation #id anomaly = @s anomaly.id
    store result storage ps:temp boss.id int 1 scoreboard players get @s anomaly.id
    at @s as @e[type=item_display,tag=anomaly.boss,tag=anomaly.radience,tag=!anomaly.radience.acid,predicate=./../match_id] function ~/../deactivate_item_display:
        scoreboard players reset @s anomaly.boss.phase
        tp ~23 ~9 ~23
    as @e[limit=1,type=giant,tag=anomaly.radience,predicate=./../match_id] function ~/../deactivate_giant with storage ps:temp boss:
        data modify entity @s Invulnerable set value 1b
        store result entity @s Health float 0.1 scoreboard players get @s anomaly.boss.max_health
        $execute store result bossbar anomaly:boss/$(id) value run scoreboard players get @s anomaly.boss.max_health
    tp @e[tag=anomaly.boss.minion,predicate=./../match_id] ~ -100 ~
    kill @e[tag=anomaly.boss.minion,predicate=./../match_id]
    tp @e[type=item_display,tag=anomaly.radience.acid,predicate=./../match_id,limit=1] ~24 ~ ~24
    scoreboard players reset @s anomaly.time


function ~/attack:
    store result score @s anomaly.bossvar.0 random value 4..8
    scoreboard players set @s anomaly.time -120
    store result score #spawn anomaly if predicate ~/../spawn_chance function ~/minion_spawn:
        function ./../mob/1/spawn
        function ./../mob/1/spawn
        function ./../mob/1/spawn
        scoreboard players operation #id anomaly = @s anomaly.id
        as @e[tag=anomaly.setup,tag=anomaly.mob,distance=..100] function ~/../minion_setup:
            scoreboard players operation @s anomaly.id = #id anomaly
            tag @s add anomaly.boss.minion
            tag @s remove anomaly.setup
            store result storage ps:temp tp.x int 1 random value 0..47
            store result storage ps:temp tp.y int 1 random value 0..47
            store result storage ps:temp tp.z int 1 random value 0..47
            execute function ~/../minion_tp with storage ps:temp tp:
                $tp ~$(x).5 ~$(y) ~$(z).5
    if predicate ~/../beam_chance function ~/beam


function ~/attack/beam:
    scoreboard players set #amt anomaly 3
    scoreboard players operation #id anomaly = @s anomaly.id
    at @a[predicate=./../match_id] summon marker function ~/../beam2:
        scoreboard players operation @s anomaly.bossvar.0 = #amt anomaly
        scoreboard players remove @s anomaly.bossvar.0 1
        tag @s add anomaly.boss.minion
        tag @s add anomaly.radience.beam
        scoreboard players operation @s anomaly.id = #id anomaly
        scoreboard players operation @s anomaly.time = .gametime anomaly
        scoreboard players add @s anomaly.time 20
        particle portal ~ ~ ~ 0 25 0 2 1000
        particle end_rod ~ ~ ~ 0 25 0 0 500
        playsound minecraft:block.beacon.activate hostile @a ~ ~ ~ 1 2
function ~/attack/beam3:
    particle dust 0.8 0 0.8 2 ~ ~ ~ 0.5 25 0.5 0 2000
    playsound minecraft:block.beacon.power_select hostile @a ~ ~ ~ 1 2
    scoreboard players operation #id anomaly = @s anomaly.id
    positioned ~-1 ~-25 ~-1 as @a[dx=1,dy=49,dz=1] damage @s 5 arrow by @s from @e[type=giant,limit=1,tag=anomaly.boss,tag=anomaly.radience,predicate=./../match_id] #! ADD DAMAGE TYPE FOR ALL DAMAGE COMMAND THINGS
    scoreboard players operation #amt anomaly = @s anomaly.bossvar.0
    if score @s anomaly.bossvar.0 matches 1.. at @p summon marker function ~/../beam2
    kill @s

predicate ~/beam_chance { "condition": "minecraft:random_chance", "chance": 0.8 }
predicate ~/spawn_chance { "condition": "minecraft:random_chance", "chance": 0.3 }
