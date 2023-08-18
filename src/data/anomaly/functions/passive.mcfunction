
append function_tag argon:entity_hurt_player {"values":["anomaly:passive/hurt"]}
function ~/hurt:
    if entity @s[tag=anomaly.passive.hurt.head] function ~/head:
        store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.head
        function ~/../call with storage ps:temp passive
    if entity @s[tag=anomaly.passive.hurt.chest] function ~/chest:
        store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.chest
        function ~/../call with storage ps:temp passive
    if entity @s[tag=anomaly.passive.hurt.legs] function ~/legs:
        store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.legs
        function ~/../call with storage ps:temp passive
    if entity @s[tag=anomaly.passive.hurt.feet] function ~/feet:
        store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.feet
        execute function ~/../call with storage ps:temp passive:
            $function anomaly:passive/$(id)/hurt
