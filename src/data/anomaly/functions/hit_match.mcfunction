
append function_tag argon:player_hurt_entity {"values":["anomaly:hit_match/hit_enemy"]}
function ~/hit_enemy:
    if entity @s[type=player] return 0
    if entity @s[tag=anomaly.boss] function ~/../hit_boss:
        if entity @s[tag=anomaly.root_nexus] on vehicle function ./boss/root_nexus/get_hit

