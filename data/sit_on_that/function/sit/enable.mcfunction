scoreboard players set @s sit 0

scoreboard players set #sit_on_that.has_other_vehicle sit_on_that.BOOL 0
execute on vehicle unless entity @s[tag=sit_on_that.sit_place] run scoreboard players set #sit_on_that.has_other_vehicle sit_on_that.BOOL 1
execute if score #sit_on_that.has_other_vehicle sit_on_that.BOOL matches 1 run function sit_on_that:sit/discard.has_other_vehicle
execute if score #sit_on_that.has_other_vehicle sit_on_that.BOOL matches 1 run return -1

scoreboard players set #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM 0
execute if block ~0.125 ~-0.125 ~0.125 #sit_on_that:cannot_sit_on run scoreboard players add #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM 1
execute if block ~0.125 ~-0.125 ~-0.125 #sit_on_that:cannot_sit_on run scoreboard players add #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM 1
execute if block ~-0.125 ~-0.125 ~0.125 #sit_on_that:cannot_sit_on run scoreboard players add #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM 1
execute if block ~-0.125 ~-0.125 ~-0.125 #sit_on_that:cannot_sit_on run scoreboard players add #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM 1
execute if score #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM matches 4 run function sit_on_that:sit/discard.cannot_sit_in_midair
execute if score #sit_on_that.cannot_sit_on_it sit_on_that.ACCUM matches 4 run return -2

#finally the sitting part
execute summon item_display run function sit_on_that:sit/enable.setup_sit_place
ride @s mount @e[type=item_display, tag=sit_on_that.sit_place,tag=sit_on_that.new, limit=1]
tag @e[type=item_display] remove sit_on_that.new
scoreboard players set @s sit_on_that.sit_state 1


scoreboard players set @s sit_on_that.message_should_be_displayed 1