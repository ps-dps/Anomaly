
function ~/spawn:
    store result storage ps:temp boss.id int 1 scoreboard players get @s anomaly.id
    execute summon item_display function ~/model with storage ps:temp boss:
        tag @s add anomaly.boss
        tag @s add anomaly.root_nexus
        tag @s add anomaly.root_nexus.model
        $scoreboard players set @s anomaly.id $(id)
        item replace entity @s container.0 with stone
        data modify entity @s transformation.scale set value [7f,7f,7f]
        data modify entity @s transformation.translation set value [0f,3.5f,0f]
        summon slime ~ ~ ~ {
            Size:12,
            NoAI:1b,
            Tags:["anomaly.boss","anomaly.root_nexus"],
            active_effects:[{
                id:"minecraft:invisibility",
                amplifier:0b,
                duration:-1,
                show_particles:0b}]
            }
        ride @e[type=slime,limit=1,tag=anomaly.root_nexus] mount @s
        $bossbar add anomaly:boss/$(id) {"text":"Root Nexus","color":"red"}
        store result score @s anomaly.boss.health store result score @s anomaly.boss.max_health attribute @s minecraft:generic.max_health get 10
        $execute on passengers store result bossbar anomaly:boss/$(id) max run scoreboard players get @s anomaly.boss.max_health


function ~/remove:
    tp ~ -100 ~
    on passengers kill @s
    kill @s


function ~/tick:
    scoreboard players operation #temp anomaly = .gametime anomaly
    scoreboard players operation #temp anomaly %= #100 anomaly
    if score #temp anomaly matches 0 data merge entity @s {start_interpolation:0,interpolation_duration:50,transformation:{scale:[6.4f,7.5f,6.4f],translation:[0f,3.75f,0f]}}
    if score #temp anomaly matches 50 data merge entity @s {start_interpolation:0,interpolation_duration:50,transformation:{scale:[7f,7f,7f],translation:[0f,3.5f,0f]}}

    unless entity @s[tag=anomaly.boss.active] at @s if entity @a[limit=1,distance=..40] function ~/../activate:
        store result storage ps:temp boss.id int 1 scoreboard players get @s anomaly.id
        function ./boss/activate_bossbar with storage ps:temp boss
        tag @s add anomaly.boss.active


function ~/get_hit:
    store result storage ps:temp boss.id int 1 scoreboard players get @s anomaly.id
    on passengers function ~/../get_hit_hitbox with storage ps:temp boss:
        $execute store result bossbar anomaly:boss/$(id) value run data get entity @s Health 10
    if predicate ~/../40percent function ~/../summon_spread_minion


function ~/summon_spread_minion:
    say SUMMON
    # TODO: Implement this function


predicate ~/40percent { "condition": "minecraft:random_chance", "chance": 0.4 }

