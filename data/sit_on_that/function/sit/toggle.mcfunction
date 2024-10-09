execute if score @s sit_on_that.sit_state matches 0 at @s run function sit_on_that:sit/enable
execute if score @s sit matches 1 if score @s sit_on_that.sit_state matches 1 run function sit_on_that:sit/disable
scoreboard players set @s sit 0