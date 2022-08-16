execute @e[scores={tpa:math=0},c=1,type=minecraft:armor_stand] ~ ~ ~ kill @s
#清理代表实体



scoreboard players reset * tpa:math
#清理计算用计分板上的数据
execute @a[tag=!tpa:ute_true] ~ ~ ~ scoreboard players operation @s tpa:math = @s uid
#同步uid数据到计算用计分板
execute @a[tag=!tpa:ute_true] ~ ~ ~ scoreboard players operation @s tpa:math -= @a[tag=tpa:ute_true] tpa:panel_int
#减分
#计算出要通知的目标玩家

execute @a[tag=tpa:ute_true] ~ ~ ~ tellraw @s {"rawtext":[{"text":"§a已成功§o§c撤销§r§a向§e"},{"selector":"@a[scores={tpa:math=0}]"},{"text":"§f(UID§3-§b"},{"score":{"objective":"uid","name":"@a[scores={tpa:math=0}]"}},{"text":"§f)§a发送的传送请求§f！"}]}
execute @a[scores={tpa:math=0}] ~ ~ ~ tellraw @s {"rawtext":[{"text":"§f[§dTpa§f·§c通知§f] §a玩家"},{"selector":"@a[tag=tpa:ute_true]"},{"text":"§f(UID§3-§b"},{"score":{"objective":"uid","name":"@a[tag=tpa:ute_true]"}},{"text":"§f)§a向你发送的传送请求已被其§o§c撤销§r§f！"}]}
execute @a[tag=tpa:ute_true] ~ ~ ~ playsound random.levelup @s ~ ~ ~ 1.00 1.00 1.00
execute @a[scores={tpa:math=0}] ~ ~ ~ playsound random.toast @s ~ ~ ~ 1.00 1.00 1.00
#发送通知和播放音效



execute @a[tag=tpa:ute_true] ~ ~ ~ tp ~ ~ ~ ~ 0.01
execute @a[tag=tpa:ute_true] ~ ~ ~ scoreboard players set @s tpa:wait 7
execute @a[tag=tpa:ute_true] ~ ~ ~ tag @s add tpa:wait
#更改朝向



execute @a[tag=tpa:ute_true,scores={tpa:screen=7}] ~ ~ ~ tag @s add tpa:change_player
execute @a[tag=tpa:ute_true,scores={tpa:screen=7}] ~ ~ ~ tag @s add tpa:change_player_system
#切换显示对象



execute @a[tag=tpa:rte_true] ~ ~ ~ scoreboard players remove @s tpa:request_num 1
#减少已请求数(增加可请求数)



execute @a[tag=tpa:rte_true] ~ ~ ~ tag @s remove tpa:undo_teleport
execute @a[tag=tpa:rte_true] ~ ~ ~ tag @s remove tpa:ut_ergodic
execute @a[tag=tpa:rte_true] ~ ~ ~ tag @s remove tpa:ute_allow_16
execute @a[tag=tpa:rte_true] ~ ~ ~ tag @s remove tpa:ute_allow_17
execute @a[tag=tpa:rte_true] ~ ~ ~ tag @s remove tpa:ute_allow_18
execute @a[tag=tpa:rte_true] ~ ~ ~ tag @s remove tpa:ute_true
#清理标签并结束遍历状态