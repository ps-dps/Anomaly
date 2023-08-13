
store result storage ps:anomaly temp.block_limit int 1 gamerule commandModificationBlockLimit
gamerule commandModificationBlockLimit 28000000

fill ~-150 0 ~-150 ~150 255 ~150 air
kill @e[type=!player,distance=..1000]

execute function ~/set_block_limit with storage ps:anomaly temp:
    $gamerule commandModificationBlockLimit $(block_limit)
