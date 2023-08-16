from beet import Context, Model
from beet.contrib.vanilla import Vanilla



def beet_default(ctx: Context):

    ctx.require('beet.contrib.model_merging')

    vanilla = ctx.inject(Vanilla)
    vanilla.mount('assets/minecraft/models/item')

    new_textures = {}

    for texture in ctx.assets.textures:
        if len(texture.split('.')) != 3: continue
        
        name, item, cmd = texture.split('.')

        vanilla_model_path = f'minecraft:item/{item}'

        model = ctx.assets.models.get(vanilla_model_path)

        if not model:
            if not vanilla_model_path in vanilla.assets.models: continue
            model = ctx.assets.models[vanilla_model_path] = vanilla.assets.models[vanilla_model_path].copy()

        if not ctx.assets.models.get(name):
            ctx.assets.models[name] = Model({
	            "parent": "minecraft:item/generated",
	            "textures": { "layer0": name }})

        new_model = model.data.copy()
        new_model['overrides'] = [{"predicate": { "custom_model_data": int(cmd) }, "model": name}]
        new_model = Model(new_model)
        ctx.generate(vanilla_model_path,merge=new_model)

        new_textures[name] = texture

        print("[Auto-CMD] Generated model and overrides for", name, item, cmd)

    for name, texture in new_textures.items():
        ctx.assets.textures[name] = ctx.assets.textures[texture]
        del ctx.assets.textures[texture]
