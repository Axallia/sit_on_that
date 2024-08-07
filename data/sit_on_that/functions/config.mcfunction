tellraw @s {"text": "- \"Sit On That\"'s config -"}

execute if score *sit_on_that.players_knock_out_of_sitting_position sit_on_that.config matches 0 run tellraw @s [\
    {"text": "players_knock_out_of_sitting_position: disabled."},\
    {"text": " [enable]", "color": "gray", "clickEvent": {"action": "run_command", "value": "function sit_on_that:config/players_knock_out_of_sitting_position.enable"}, "hoverEvent": {"action": "show_text", "contents": "click to select."}}\
]
execute if score *sit_on_that.players_knock_out_of_sitting_position sit_on_that.config matches 1 run tellraw @s [\
    {"text": "players_knock_out_of_sitting_position: enabled."},\
    {"text": " [disable]", "color": "gray", "clickEvent": {"action": "run_command", "value": "function sit_on_that:config/players_knock_out_of_sitting_position.disable"}, "hoverEvent": {"action": "show_text", "contents": "click to select."}}\
]

execute unless score *sit_on_that.players_knock_out_of_sitting_position sit_on_that.config matches 0..1 run tellraw @s [\
    {"text": "players_knock_out_of_sitting_position: corrupted."},\
    {"text": " [enable]", "color": "gray", "clickEvent": {"action": "run_command", "value": "function sit_on_that:config/players_knock_out_of_sitting_position.enable"}, "hoverEvent": {"action": "show_text", "contents": "click to select."}},\
    {"text": " [disable]", "color": "gray", "clickEvent": {"action": "run_command", "value": "function sit_on_that:config/players_knock_out_of_sitting_position.disable"}, "hoverEvent": {"action": "show_text", "contents": "click to select."}}\
]
