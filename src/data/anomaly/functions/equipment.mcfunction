
for slot in ["head","chest","legs","feet"]:
    append function_tag f'tungsten:swap/{slot}' {"values":[f'anomaly:equipment/{slot}']}
    function f'anomaly:equipment/{slot}':
        scoreboard players add @s f'anomaly.passive.{slot}' 0
        unless score @s f'anomaly.passive.{slot}' matches 0 function ~/pre:
            if entity @s[tag=f'anomaly.passive.remove.{slot}'] store result storage ps:temp passive.id int 1 scoreboard players get @s f'anomaly.passive.{slot}'
            if entity @s[tag=f'anomaly.passive.remove.{slot}'] function ~/../../passive_remove with storage ps:temp passive
            tag @s remove f'anomaly.passive.hurt.{slot}'
            tag @s remove f'anomaly.passive.tick.{slot}'
            tag @s remove f'anomaly.passive.remove.{slot}'

        store result score @s f'anomaly.passive.{slot}' data get storage tungsten:player Item.tag.anomaly.passive.id

        unless score @s f'anomaly.passive.{slot}' matches 0 function ~/post:
            if data storage tungsten:player {Item:{tag:{anomaly:{passive:{onApply:1b}}}}} function ~/../../passive_apply with storage tungsten:player Item.tag.anomaly.passive
            if data storage tungsten:player {Item:{tag:{anomaly:{passive:{onHurt:1b}}}}} tag @s add f'anomaly.passive.hurt.{slot}'
            if data storage tungsten:player {Item:{tag:{anomaly:{passive:{onTick:1b}}}}} tag @s add f'anomaly.passive.tick.{slot}'
            if data storage tungsten:player {Item:{tag:{anomaly:{passive:{onRemove:1b}}}}} tag @s add f'anomaly.passive.remove.{slot}'

function ~/passive_apply:
    $function anomaly:passive/$(id)/apply
function ~/passive_remove:
    $function anomaly:passive/$(id)/remove
