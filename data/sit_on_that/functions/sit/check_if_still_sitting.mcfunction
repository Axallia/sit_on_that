execute store result score *player sit_on_that.rotation run data get entity @s Rotation[0]
scoreboard players set *is_still_sitting sit_on_that.BOOL 0
execute on vehicle if entity @s[tag=sit_on_that.sit_place] run function sit_on_that:sit/check_if_still_sitting.set_and_rotate
execute if score *is_still_sitting sit_on_that.BOOL matches 1 run return 0

scoreboard players set @s sit_on_that.sit_state 0
execute at @s as @e[distance=..3,type=armor_stand,tag=sit_on_that.sit_place] run function sit_on_that:sit/check_if_still_being_sit_on
title @s actionbar "You are no longer sitting!"