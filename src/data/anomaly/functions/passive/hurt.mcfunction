
append function_tag argon:entity_hurt_player {"values":["anomaly:passive/hurt"]}

unless score @s anomaly.passive.head matches 0 store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.head
unless score @s anomaly.passive.head matches 0 function ~/call with storage ps:temp passive

unless score @s anomaly.passive.chest matches 0 store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.chest
unless score @s anomaly.passive.chest matches 0 function ~/call with storage ps:temp passive

unless score @s anomaly.passive.legs matches 0 store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.legs
unless score @s anomaly.passive.legs matches 0 function ~/call with storage ps:temp passive

unless score @s anomaly.passive.feet matches 0 store result storage ps:temp passive.id int 1 scoreboard players get @s anomaly.passive.feet
unless score @s anomaly.passive.feet matches 0 function ~/call with storage ps:temp passive

function ~/call:
    $function anomaly:passive/$(id)/hurt
