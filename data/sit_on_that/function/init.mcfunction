scoreboard objectives add sit_on_that.BOOL dummy
scoreboard objectives add sit_on_that.ACCUM dummy

scoreboard objectives add sit trigger
scoreboard objectives add sit_on_that.sit_state dummy
scoreboard objectives add sit_on_that.message_should_be_displayed dummy

scoreboard objectives add sit_on_that.rotation dummy

scoreboard objectives add sit_on_that.config dummy
execute unless score #sit_on_that.players_knock_out_of_sitting_position sit_on_that.config matches -2147483648..2147483647 run scoreboard players set #sit_on_that.players_knock_out_of_sitting_position sit_on_that.config 1

tellraw @a "\"Sit On That\" is loaded!"