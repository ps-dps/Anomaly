from beet import Context
from beet.contrib.vanilla import Vanilla



def beet_default(ctx: Context):

    vanilla = ctx.inject(Vanilla)
    print(vanilla)

    for texture in ctx.assets.textures:
        if len(texture.split('.')) != 3: continue

        name, item, cmd = texture.split('.')
        print(name, item, cmd)
        print(ctx.assets.models.get(f'minecraft:item/{item}'))
