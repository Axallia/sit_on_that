scoreboard players set *is_still_sitting sit_on_that.BOOL 1
execute store result entity @s Rotation[0] float 1.0 run scoreboard players get *player sit_on_that.rotation
# it doesn't like actually rotate with the player, but eh, itsafeaturenotabug
#execute rotated as @s positioned as @s run tp @s ~ ~ ~ ~ ~

#execute rotated as @s positioned as @s run particle ash ^ ^ ^1