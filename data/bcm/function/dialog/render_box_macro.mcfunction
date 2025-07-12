$return run dialog show @s {\
  "type": "minecraft:notice",\
  "title": "block display settings",\
  "inputs": [\
    {\
      "type": "minecraft:boolean",\
      "key": "save",\
      "label": "show save area (black)",\
      "initial": $(save),\
      "on_true": "2",\
      "on_false": "1"\
    },\
    {\
      "type": "minecraft:boolean",\
      "key": "wall_height",\
      "label": "show max wall height (white)",\
      "initial": $(wall_height),\
      "on_true": "1",\
      "on_false": "0"\
    },\
    {\
      "type": "minecraft:boolean",\
      "key": "spawns",\
      "label": "show spawn areas",\
      "initial": $(spawns),\
      "on_true": "1",\
      "on_false": "0"\
    },\
    {\
      "type": "minecraft:boolean",\
      "key": "spawnpoints",\
      "label": "show spawn points",\
      "initial": $(spawnpoints),\
      "on_true": "1",\
      "on_false": "0"\
    },\
    {\
      "type": "minecraft:boolean",\
      "key": "camera",\
      "label": "show intro camera (white)",\
      "initial": $(camera),\
      "on_true": "1",\
      "on_false": "0"\
    },\
    {\
      "type": "minecraft:boolean",\
      "key": "flags",\
      "label": "glow flags",\
      "initial": $(flags),\
      "on_true": "1",\
      "on_false": "0"\
    },\
    {\
      "type": "minecraft:boolean",\
      "key": "gens",\
      "label": "glow item generators",\
      "initial": $(gens),\
      "on_true": "1",\
      "on_false": "0"\
    }\
  ],\
  "action": {\
    "label": {\
      "translate": "compliance.playtime.message"\
    },\
    "width": 300,\
    "action": {\
      "type": "dynamic/run_command",\
      "template": "trigger set_render_box set $(macro)"\
    }\
  }\
}