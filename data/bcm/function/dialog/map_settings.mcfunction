scoreboard players enable @s set_bcm_settings

dialog show @s \
{\
  "type": "minecraft:notice",\
  "title": "Bleps Custom Map Settings",\
  "inputs": [\
    {\
      "type": "minecraft:single_option",\
      "key": "brosucks",\
      "label": "bro sucks",\
      "options": [\
        {\
          "id": "1",\
          "display": "bruh",\
          "initial": true\
        },\
        {\
          "id": "2",\
          "display": "option 2"\
        }\
      ]\
    }\
  ],\
  "action": {\
    "label": "Save & Close (Esc)",\
    "action": {\
      "type": "dynamic/run_command",\
      "template": "trigger set_bcm_settings set $(brosucks)"\
    }\
  }\
}