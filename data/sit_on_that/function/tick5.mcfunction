scoreboard players enable @a sit
execute as @a[scores={sit=1..}] run function sit_on_that:sit/toggle
execute as @a[scores={sit_on_that.sit_state=1}] run function sit_on_that:sit/check_if_still_sitting

schedule function sit_on_that:tick5 5t replace