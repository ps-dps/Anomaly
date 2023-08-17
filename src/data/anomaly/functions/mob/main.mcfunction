
function ~/spawn:
    $function anomaly:mob/$(id)/spawn

function ~/spawn_clean:
    $function anomaly:mob/$(id)/spawn
    tag @e[tag=anomaly.mob,tag=anomaly.setup] remove anomaly.setup

function ~/tick:
    store result storage ps:temp mob.id int 1 scoreboard players get @s anomaly.mob
    at @s function ~/../tick2 with storage ps:temp mob:
        $function anomaly:mob/$(id)/tick
