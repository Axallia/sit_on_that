scoreboard players set #sit_on_that.has_other_vehicle sit_on_that.BOOL 0
execute on vehicle unless entity @s[tag=sit_on_that.sit_place] run scoreboard players set #sit_on_that.has_other_vehicle sit_on_that.BOOL 1
execute if score #sit_on_that.has_other_vehicle sit_on_that.BOOL matches 1 run return -1

ride @s dismount
scoreboard players set @s sit_on_that.sit_state 0
execute at @s as @e[distance=..3,type=item_display,tag=sit_on_that.sit_place] run function sit_on_that:sit/check_if_still_being_sit_on
title @s actionbar "You are no longer sitting!"