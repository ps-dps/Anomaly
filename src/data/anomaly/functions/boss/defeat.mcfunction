
advancement ~/ { "criteria": { "requirement": { "trigger": "minecraft:player_killed_entity", "conditions": {
    "entity": [{ "condition": "minecraft:entity_scores", "entity": "this", "scores": {
        "anomaly.id": {
            "min": 1,
            "max": 2147483647 }}}]}}},
    "rewards": { "function": "anomaly:boss/defeat" }
    }

advancement revoke @s only anomaly:boss/defeat

playsound minecraft:entity.ender_dragon.death hostile @a ~ ~ ~ 10

# MAYBE SPAWN THE EYE OF THE ANOMALY HERE; NOT SURE HOW TO HANDLE THAT YET

store result storage ps:temp temp.id int 1 scoreboard players operation #id anomaly = @s anomaly.id
execute function ~/../remove_bossbar with storage ps:temp temp:
    $bossbar remove anomaly:boss/$(id)

tp @e[tag=anomaly.boss,predicate=./../match_id,distance=..500] ~ -100 ~
kill @e[tag=anomaly.boss,predicate=./../match_id,distance=..500]
