
data remove storage ps:edb entity
function ./edb/load with entity @s
execute function ./return_from_anomaly2 with storage ps:edb entity.anomaly:
    $execute in $(return_dim) run tp $(return_x) $(return_y) $(return_z)
function ./edb/save with entity @s

