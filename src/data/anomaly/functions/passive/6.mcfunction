#> ON HURT DAMAGE RETALIATE (INFECTED JELLY CAP)

# function ~/apply:
# function ~/remove:
# function ~/tick:
function ~/hurt:
    tag @s add anomaly.temp.hurt
    positioned ~-1.5 ~-0.5 ~-1.5 as @e[tag=!anomaly.temp.hurt,dx=2,dy=2,dz=2] damage @s 3 anomaly:infection by @a[tag=anomaly.temp.hurt,limit=1]
    tag @s remove anomaly.temp.hurt
    particle dust 0.8 0 0.8 2 ~ ~1 ~ 0.6 0.6 0.6 0 200
