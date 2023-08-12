
$scoreboard players set #dist ps-dpjten.raycast $(distance)
$data modify storage ps:raycast callback set value $(callback)
scoreboard players set #hit ps-dpjten.raycast 0

tag @s add ps-dpjten.raycaster
at @s anchored eyes positioned ^ ^ ^ run function ~/recursive:
    scoreboard players remove #dist ps-dpjten.raycast 1

    unless block ~ ~ ~ #./pass_through
        run function ~/../hit/block

    if score #hit ps-dpjten.raycast matches 0
        positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!ps-dpjten.raycaster,dx=0]
        positioned ~-0.85 ~-0.85 ~-0.85 if entity @s[dx=0]
        positioned ~0.9 ~0.9 ~0.9
        run function ~/../hit/entity

    if score #hit ps-dpjten.raycast matches 0
        if score #dist ps-dpjten.raycast matches ..0
        run function ~/../hit/fallback

    if score #hit ps-dpjten.raycast matches 0
        positioned ^ ^ ^0.1
        run function ~/
tag @s remove ps-dpjten.raycaster


for cb in ["block", "entity", "fallback"]:
    function f'ps-dpjten:raycast/hit/{cb}':
        scoreboard players set #hit ps-dpjten.raycast 1
        execute unless data storage ps:raycast f'callback.{cb}' run return 0
        data modify storage ps:raycast call.function set from storage ps:raycast f'callback.{cb}'
        function ./utils/run_function with storage ps:raycast call
