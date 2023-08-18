
function ~/1: # heal
    effect give @s instant_health 1 0 true
    scoreboard players set .cooldown anomaly.ability 100

function ~/2: # turtle
    effect give @s slowness 2 3 true
    effect give @s resistance 2 4 true
    scoreboard players set .cooldown anomaly.ability 100

function ~/3: # ekko
    # tag @s add anomaly.ability.ekko
    function gu:generate
    execute summon marker function ~/init_marker:
        tag @s add anomaly.ability
        tag @s add anomaly.ability.activate
        scoreboard players set @s anomaly.id 3
        scoreboard players operation @s anomaly.time = .gametime anomaly
        scoreboard players set @s anomaly.time 80
        data modify entity @s data.uuid set from storage gu:main out
    scoreboard players set .cooldown anomaly.ability 600
function ~/3/activate:
    execute function ~/../teleport with entity @s data:
        $tp $(uuid) @s
        # $tag $(uuid) remove anomaly.ability.ekko
    kill @s
