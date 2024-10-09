#particle ash ~0.125 ~0.625 ~0.125
##TODO: make checks for trapdoors being opened
scoreboard players set #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM 0
execute if block ~0.125 ~0.5 ~0.125 #sit_on_that:cannot_sit_on run scoreboard players add #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM 1
execute if block ~0.125 ~0.5 ~-0.125 #sit_on_that:cannot_sit_on run scoreboard players add #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM 1
execute if block ~-0.125 ~0.5 ~0.125 #sit_on_that:cannot_sit_on run scoreboard players add #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM 1
execute if block ~-0.125 ~0.5 ~-0.125 #sit_on_that:cannot_sit_on run scoreboard players add #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM 1
execute if score #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM matches ..3 run return 0


ride @s dismount
scoreboard players set @s sit_on_that.sit_state 0
execute at @s as @e[distance=..3,type=item_display,tag=sit_on_that.sit_place] run function sit_on_that:sit/check_if_still_being_sit_on
title @s actionbar "You are no longer sitting, as you cannot sit in midair!"