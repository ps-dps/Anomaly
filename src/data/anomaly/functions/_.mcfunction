
function ~/give_test_armor:
    give @s leather_chestplate{
        AttributeModifiers: [{
            AttributeName: "minecraft:generic.luck",
            Name: "tungsten.chest",Amount:-0.000000000001,
            Operation: 0,
            UUID: [I;12,42069,0,13],
            Slot: "chest" }],
        display: {
            color: 15204572 },
        anomaly: {
            passive: {
                id: 1,
                onHurt: 1b,
                onTick: 0b,
                onApply: 0b,
                onRemove: 0b }}
        }
