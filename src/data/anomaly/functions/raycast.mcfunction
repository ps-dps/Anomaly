
$scoreboard players set #dist anomaly.raycast $(distance)
$data modify storage ps:raycast callback set value $(callback)
scoreboard players set #hit anomaly.raycast 0

tag @s add anomaly.raycaster
at @s anchored eyes positioned ^ ^ ^ run function ~/recursive:
    scoreboard players remove #dist anomaly.raycast 1

    unless block ~ ~ ~ #./pass_through
        run function ~/../hit/block

    if score #hit anomaly.raycast matches 0
        positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!anomaly.raycaster,dx=0]
        positioned ~-0.85 ~-0.85 ~-0.85 if entity @s[dx=0]
        positioned ~0.9 ~0.9 ~0.9
        run function ~/../hit/entity

    if score #hit anomaly.raycast matches 0
        if score #dist anomaly.raycast matches ..0
        run function ~/../hit/fallback

    if score #hit anomaly.raycast matches 0
        positioned ^ ^ ^0.1
        run function ~/
tag @s remove anomaly.raycaster


for cb in ["block", "entity", "fallback"]:
    function f'anomaly:raycast/hit/{cb}':
        scoreboard players set #hit anomaly.raycast 1
        execute unless data storage ps:raycast f'callback.{cb}' run return 0
        data modify storage ps:raycast call.function set from storage ps:raycast f'callback.{cb}'
        function ./utils/run_function with storage ps:raycast call
