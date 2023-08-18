
append function_tag argon:player_hurt_entity {"values":["anomaly:hit_match/hit_enemy"]}
function ~/hit_enemy:
    say @s
    if entity @s[tag=anomaly.boss] function ~/../hit_boss:
        store result storage ps:temp temp.id int 1 scoreboard players get @s anomaly.id
        execute function ~/../hit_boss2 with storage ps:temp temp:
            $execute store result storage ps:temp temp.boss int 1 run scoreboard players get .$(id) anomaly.id
            execute function ~/../hit_boss3 with storage ps:temp temp:
                $function anomaly:boss/$(boss)/hit_match
