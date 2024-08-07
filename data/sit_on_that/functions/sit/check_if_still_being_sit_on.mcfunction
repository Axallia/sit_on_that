scoreboard players set *is_still_sitting sit_on_that.BOOL 0
execute on passengers run scoreboard players set *is_still_sitting sit_on_that.BOOL 1
execute if score *is_still_sitting sit_on_that.BOOL matches 1 run return 0

kill @s