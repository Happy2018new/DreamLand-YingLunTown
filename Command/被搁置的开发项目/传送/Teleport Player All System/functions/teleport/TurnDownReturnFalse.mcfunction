execute @a[tag=tpa:tdte_false,tag=!tpa:tdte_allow_13] ~ ~ ~ tellraw @s {"rawtext":[{"text":"§c未能找到目标玩家§fUID§3-§b"},{"score":{"objective":"tpa:panel_int","name":"@s"}},{"text":"§f！"}]}
execute @a[tag=tpa:tdte_false,tag=tpa:tdte_allow_13] ~ ~ ~ tellraw @s {"rawtext":[{"text":"§c该传送请求已失效§f！"}]}
#返回错误信息

execute @a[tag=tpa:tdte_false] ~ ~ ~ tp ~ ~ ~ ~ 0.01
execute @a[tag=tpa:tdte_false] ~ ~ ~ scoreboard players set @s tpa:wait 7
execute @a[tag=tpa:tdte_false] ~ ~ ~ tag @s add tpa:wait
#更改朝向

execute @a[tag=tpa:tdte_false] ~ ~ ~ playsound random.break @s ~ ~ ~ 1.00 1.00 1.00
#播放音效

execute @a[tag=tpa:tdte_false,scores={tpa:screen=8}] ~ ~ ~ tag @s add tpa:change_player
execute @a[tag=tpa:tdte_false,scores={tpa:screen=8}] ~ ~ ~ tag @s add tpa:change_player_system
#切换当前显示对象

execute @a[tag=tpa:tdte_false,tag=tpa:tdte_allow_14] ~ ~ ~ kill @e[scores={tpa:math=0},c=1,type=minecraft:armor_stand]
#清理代表实体

execute @a[tag=tpa:tdte_false] ~ ~ ~ tag @s remove tpa:tdte_allow_13
execute @a[tag=tpa:tdte_false] ~ ~ ~ tag @s remove tpa:tdte_allow_14
execute @a[tag=tpa:tdte_false] ~ ~ ~ tag @s remove tpa:tdte_allow_15
execute @a[tag=tpa:tdte_false] ~ ~ ~ tag @s remove tpa:turn_down_teleport
execute @a[tag=tpa:tdte_false] ~ ~ ~ tag @s remove tpa:tdt_ergodic
execute @a[tag=tpa:tdte_false] ~ ~ ~ tag @s remove tpa:tdte_false
#清理标签并结束遍历状态