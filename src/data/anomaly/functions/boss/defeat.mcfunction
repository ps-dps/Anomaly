
advancement ~/ { "criteria": { "requirement": { "trigger": "minecraft:player_killed_entity", "conditions": {
    "entity": [{ "condition": "minecraft:entity_scores", "entity": "this", "scores": {
        "anomaly.id": {
            "min": 1,
            "max": 2147483647 }}},
        { "condition": "minecraft:entity_properties", "entity": "this",
        "predicate": { "nbt": "{Tags:[\"anomaly.boss\"]}" }}]}}},
    "rewards": { "function": "anomaly:boss/defeat" }
    }

advancement revoke @s only anomaly:boss/defeat

store result storage ps:temp defeat.id int 1 scoreboard players operation #id anomaly = @s anomaly.id
as @e[type=marker,tag=anomaly.bossarena,predicate=./../match_id,limit=1] at @s function ~/../defeat2 with storage ps:temp defeat:
    playsound minecraft:entity.ender_dragon.death hostile @a ~24.5 ~10 ~24.5 10
    $bossbar remove anomaly:boss/$(id)
    $execute store result storage ps:temp defeat.boss int 1 run scoreboard players get .$(id) anomaly.id
    execute function ~/../defeat3 with storage ps:temp defeat:
        $function anomaly:boss/$(boss)/death

# MAYBE SPAWN THE EYE OF THE ANOMALY HERE; NOT SURE HOW TO HANDLE THAT YET
