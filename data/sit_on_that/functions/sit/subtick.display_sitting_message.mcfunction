advancement revoke @s only sit_on_that:subtick.display_sitting_message
execute if score @s sit_on_that.message_should_be_displayed matches 0 run return 0
title @s actionbar "You are now sitting!"
scoreboard players set @s sit_on_that.message_should_be_displayed 0