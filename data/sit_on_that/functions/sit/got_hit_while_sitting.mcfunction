advancement revoke @s only sit_on_that:got_hit_while_sitting
execute unless score *sit_on_that.players_knock_out_of_sitting_position sit_on_that.config matches 1 run return -1

ride @s dismount
scoreboard players set @s sit_on_that.sit_state 0
execute at @s as @e[distance=..3,type=armor_stand,tag=sit_on_that.sit_place] run function sit_on_that:sit/check_if_still_being_sit_on
title @s actionbar "You are no longer sitting, as you got knocked out of sitting position!"