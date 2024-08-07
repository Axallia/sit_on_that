execute as @a unless score @s sit_on_that.sit_state matches -2147483648..2147483647 run function sit_on_that:sit/setup_player
execute as @e[type=armor_stand] run function sit_on_that:sit/check_if_still_being_sit_on

schedule function sit_on_that:tick256 256t replace