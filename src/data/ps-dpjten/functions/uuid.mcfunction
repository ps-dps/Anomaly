
macro // cmd=brigadier:string{"type":"greedy"}:
    raw f'# {cmd.value}'

function ~/uuid/set:
    // Credit to https://github.com/gibbsly/mud
    data merge storage ps:temp {hex:{0:0,1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,a:0,b:0,c:0,d:0,e:0,f:0}}
    data modify storage ps:temp hex.in set from entity @s UUID

    store result score #hex.0 ps-dpjten store result score #hex.1 ps-dpjten data get storage ps:temp hex.in[0]
    store result storage ps:temp hex.0 int 1 scoreboard players operation #hex.0 ps-dpjten %= .256 ps-dpjten.const
    store result score #hex.2 ps-dpjten scoreboard players operation #hex.1 ps-dpjten /= .256 ps-dpjten.const
    store result storage ps:temp hex.1 int 1 scoreboard players operation #hex.1 ps-dpjten %= .256 ps-dpjten.const
    store result score #hex.3 ps-dpjten scoreboard players operation #hex.2 ps-dpjten /= .256 ps-dpjten.const
    store result storage ps:temp hex.2 int 1 scoreboard players operation #hex.2 ps-dpjten %= .256 ps-dpjten.const
    store result storage ps:temp hex.3 int 1 scoreboard players operation #hex.3 ps-dpjten /= .256 ps-dpjten.const

    store result score #hex.0 ps-dpjten store result score #hex.1 ps-dpjten data get storage ps:temp hex.in[1]
    store result storage ps:temp hex.4 int 1 scoreboard players operation #hex.0 ps-dpjten %= .256 ps-dpjten.const
    store result score #hex.2 ps-dpjten scoreboard players operation #hex.1 ps-dpjten /= .256 ps-dpjten.const
    store result storage ps:temp hex.5 int 1 scoreboard players operation #hex.1 ps-dpjten %= .256 ps-dpjten.const
    store result score #hex.3 ps-dpjten scoreboard players operation #hex.2 ps-dpjten /= .256 ps-dpjten.const
    store result storage ps:temp hex.6 int 1 scoreboard players operation #hex.2 ps-dpjten %= .256 ps-dpjten.const
    store result storage ps:temp hex.7 int 1 scoreboard players operation #hex.3 ps-dpjten /= .256 ps-dpjten.const

    store result score #hex.0 ps-dpjten store result score #hex.1 ps-dpjten data get storage ps:temp hex.in[2]
    store result storage ps:temp hex.8 int 1 scoreboard players operation #hex.0 ps-dpjten %= .256 ps-dpjten.const
    store result score #hex.2 ps-dpjten scoreboard players operation #hex.1 ps-dpjten /= .256 ps-dpjten.const
    store result storage ps:temp hex.9 int 1 scoreboard players operation #hex.1 ps-dpjten %= .256 ps-dpjten.const
    store result score #hex.3 ps-dpjten scoreboard players operation #hex.2 ps-dpjten /= .256 ps-dpjten.const
    store result storage ps:temp hex.a int 1 scoreboard players operation #hex.2 ps-dpjten %= .256 ps-dpjten.const
    store result storage ps:temp hex.b int 1 scoreboard players operation #hex.3 ps-dpjten /= .256 ps-dpjten.const

    store result score #hex.0 ps-dpjten store result score #hex.1 ps-dpjten data get storage ps:temp hex.in[3]
    store result storage ps:temp hex.c int 1 scoreboard players operation #hex.0 ps-dpjten %= .256 ps-dpjten.const
    store result score #hex.2 ps-dpjten scoreboard players operation #hex.1 ps-dpjten /= .256 ps-dpjten.const
    store result storage ps:temp hex.d int 1 scoreboard players operation #hex.1 ps-dpjten %= .256 ps-dpjten.const
    store result score #hex.3 ps-dpjten scoreboard players operation #hex.2 ps-dpjten /= .256 ps-dpjten.const
    store result storage ps:temp hex.e int 1 scoreboard players operation #hex.2 ps-dpjten %= .256 ps-dpjten.const
    store result storage ps:temp hex.f int 1 scoreboard players operation #hex.3 ps-dpjten /= .256 ps-dpjten.const

    function ~/../convert_hex with storage ps:temp hex
    function ~/../concat with storage ps:temp hex

function ~/uuid/convert_hex:
    // Credit to https://github.com/gibbsly/mud
    $data modify storage ps:uuid hex.0 set from storage ps:uuid hex.convert[$(0)]
    $data modify storage ps:uuid hex.1 set from storage ps:uuid hex.convert[$(1)]
    $data modify storage ps:uuid hex.2 set from storage ps:uuid hex.convert[$(2)]
    $data modify storage ps:uuid hex.3 set from storage ps:uuid hex.convert[$(3)]
    $data modify storage ps:uuid hex.4 set from storage ps:uuid hex.convert[$(4)]
    $data modify storage ps:uuid hex.5 set from storage ps:uuid hex.convert[$(5)]
    $data modify storage ps:uuid hex.6 set from storage ps:uuid hex.convert[$(6)]
    $data modify storage ps:uuid hex.7 set from storage ps:uuid hex.convert[$(7)]
    $data modify storage ps:uuid hex.8 set from storage ps:uuid hex.convert[$(8)]
    $data modify storage ps:uuid hex.9 set from storage ps:uuid hex.convert[$(9)]
    $data modify storage ps:uuid hex.a set from storage ps:uuid hex.convert[$(a)]
    $data modify storage ps:uuid hex.b set from storage ps:uuid hex.convert[$(b)]
    $data modify storage ps:uuid hex.c set from storage ps:uuid hex.convert[$(c)]
    $data modify storage ps:uuid hex.d set from storage ps:uuid hex.convert[$(d)]
    $data modify storage ps:uuid hex.e set from storage ps:uuid hex.convert[$(e)]
    $data modify storage ps:uuid hex.f set from storage ps:uuid hex.convert[$(f)]

function ~/uuid/concat:
    // Credit to https://github.com/gibbsly/mud
    $data modify storage ps:edb entity.uuid set value "$(3)$(2)$(1)$(0)-$(7)$(6)-$(5)$(4)-$(b)$(a)-$(9)$(8)$(f)$(e)$(d)$(c)"
