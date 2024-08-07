execute as @a[scores={sit_on_that.sit_state=1},predicate=sit_on_that:has_sit_place] at @s run function sit_on_that:sit/check_if_not_sitting_in_midair

schedule function sit_on_that:tick20 20t replace