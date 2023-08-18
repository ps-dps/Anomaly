
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
    tag @s remove anomaly.active
    tag @s add anomaly.defeated
    playsound minecraft:entity.ender_dragon.death hostile @a ~24.5 ~10 ~24.5 10
    $bossbar remove anomaly:boss/$(id)
    $execute store result storage ps:temp defeat.boss int 1 run scoreboard players get .$(id) anomaly.id
    execute function ~/../defeat3 with storage ps:temp defeat:
        $function anomaly:boss/$(boss)/death

    positioned ~23 ~7 ~23 summon item_display:
        data modify entity @s transformation.translation set value [0d,0.5d,0d]
        tag @s add anomaly.eye
        item replace entity @s container.0 with warped_fungus_on_a_stick{CustomModelData:255902}
        summon interaction ~ ~ ~ {Tags:["anomaly.eye","anomaly.setup"]}
        ride @e[type=interaction,distance=..3,tag=anomaly.setup,tag=anomaly.eye,limit=1] mount @s
        particle portal ~ ~0.5 ~ 0 0 0 10 2000


advancement ./interact_with_eye { "criteria": { "requirement": { "trigger": "minecraft:player_interacted_with_entity", "conditions": {
    "entity": [{ "condition": "minecraft:entity_properties", "entity": "this",
            "predicate": {
                "type": "minecraft:interaction",
                "nbt": "{Tags:[\"anomaly.eye\"]}" }}]}}},
    "rewards": { "function": "anomaly:boss/interact_with_eye" }
    }
function ./interact_with_eye:
    advancement revoke @s only ./interact_with_eye

    data modify storage ps:temp anomalies set from storage ps:anomaly anomalies
    if data storage ps:temp anomalies[0] function ~/recursive with storage ps:temp anomalies[-1]:
        $execute if score $(uuid) anomaly.id = @s anomaly.id run scoreboard players set $(uuid) anomaly.remove -1
        $execute if score $(uuid) anomaly.remove matches -1 run data remove storage ps:anomaly anomalies[{uuid:"$(uuid)"}]
        data remove storage ps:temp anomalies[-1]
        if data storage ps:temp anomalies[0] function ~/ with storage ps:temp anomalies[-1]

    unless data storage ps:anomaly anomalies[0] scoreboard players reset .global anomaly.id
    function ./../return_from_anomaly
