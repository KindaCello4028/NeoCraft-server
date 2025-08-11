# NeoCraft（新纪元工艺）服务端
# 🎮 Minecraft 服务器插件详细管理文档
> 适用于 Paper 1.21 服务端（基岩 & Java 互通），有着 153 个插件，包含了大部分插件的详细说明  
> 本文档公开开源，欢迎服主参考与改进。

---

## 📌 项目介绍
- **服务端版本**：Paper 1.21
- **客户端兼容**：Java 版 & 基岩版互通（Geyser-Spigot + Floodgate）
- **玩法定位**：科技 + 生存 + 多世界探索 + 自定义玩法
- **插件总数**：153 个

---

## 📑 目录

1. [核心插件（必需类）](#核心插件必需类)
2. [管理与世界控制插件](#管理与世界控制插件)
3. [Slimefun 主体与附属插件](#slimefun-主体与附属插件)
4. [特色玩法插件](#特色玩法插件)
5. [辅助与优化插件](#辅助与优化插件)
6. [基岩版互通设置](#基岩版互通设置)
7. [性能与安全优化](#性能与安全优化)
8. [命令与权限大全](#命令与权限大全)
9. [插件下载与更新链接](#插件下载与更新链接)

---

## 核心插件（必需类）
> 权限、经济、跨版本、互通、地图编辑、区域保护等必需依赖插件。

### LuckPerms
- **功能介绍**  
  强大的权限管理插件，支持组与玩家权限配置、继承关系、多世界权限、临时权限等。可配合 Web 编辑器可视化管理。
- **常用命令**

/lp editor /lp user <玩家> permission set <节点> [true/false] /lp group create <组名> /lp group <组名> parent set <父组> /lp sync

- **常用权限**

luckperms.*

- **配置要点**
- 后端存储建议用 `MySQL` 保证多服同步  
- 使用 `/lp editor` 在浏览器批量管理权限  
- 与 `Vault` 配合实现经济、聊天插件的权限读取
- **链接**
- [官网](https://luckperms.net/)  
- [SpigotMC](https://www.spigotmc.org/resources/luckperms.28140/)

### Vault
- **功能介绍**  
经济、权限、聊天 API 桥接插件，几乎所有经济类、商店类插件的必需依赖。
- **常用命令**

/vault-info

- **配置要点**
- 无需复杂配置，只需安装并与经济/权限插件搭配  
- 必须和 `LuckPerms` + 经济插件（如 XConomy）一起使用
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/vault.34315/)

### ViaVersion / ViaBackwards
- **功能介绍**  
允许不同版本客户端与服务器互通。
- **常用命令**

/viaversion list /viaversion dump

- **配置要点**
- `ViaVersion` 放入插件文件夹即可运行  
- 可限制允许的最低客户端版本  
- 与 Geyser 配合使用时注意兼容性
- **链接**
- [ViaVersion 官网](https://viaversion.com/)

### Geyser-Spigot
- **功能介绍**  
让基岩版客户端可直接连接 Java 版服务器的跨平台网关插件。
- **常用命令**

/geyser help /geyser reload

- **配置要点**
- 在 `config.yml` 中设置基岩监听端口（默认 19132）  
- 建议与 `Floodgate` 搭配使用  
- 防火墙需开放端口
- **链接**
- [Geyser 官网](https://geysermc.org/)

### AuthMe / LiteSignIn
- **功能介绍**  
防止盗号、确保玩家身份安全。
- **常用命令**

/login <密码> /register <密码> <确认密码> /changepassword <新密码>

- **常用权限**

authme.admin

- **配置要点**
- 设置 `sessions` 以减少重复登录  
- 与 Floodgate 配合时可让基岩玩家免登录
- **链接**
- [AuthMe Reloaded](https://www.spigotmc.org/resources/authme-reloaded.6269/)

### WorldEdit
- **功能介绍**  
强大的地图编辑工具。
- **常用命令**

//wand //pos1 / //pos2 //set <方块> //copy / //paste

- **常用权限**

worldedit.*

- **配置要点**
- 大范围操作前建议备份地图  
- 与 WorldGuard 配合可保护区域
- **链接**
- [EngineHub](https://enginehub.org/worldedit/)

### WorldGuard
- **功能介绍**  
区域保护插件。
- **常用命令**

/rg define <名字> /rg flag <名字> <flag> allow/deny /rg remove <名字>

- **常用权限**

worldguard.region.*

- **配置要点**
- 与 WorldEdit 结合定义保护区域  
- 可与 Residence 分配领地
- **链接**
- [WorldGuard 文档](https://worldguard.enginehub.org/)

---

## 管理与世界控制插件
> 用于多世界管理、传送、地皮、领地、公会等功能的插件，帮助服主控制地图结构与玩家活动范围。

### Multiverse-Core
- **功能介绍**  
  多世界管理插件，可创建、加载、卸载、删除多个世界，并支持世界间传送。
- **常用命令**

/mv create <世界名> <环境> [类型] /mv delete <世界名> /mv tp <玩家> <世界名> /mv list

- **常用权限**

multiverse.core.*

- **配置要点**
- 建议配合 `Multiverse-Portals` 或菜单插件实现便捷传送  
- 不同世界可使用不同的游戏模式与规则
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/multiverse-core.390/)

---

### Residence
- **功能介绍**  
玩家自助领地保护系统，可防止破坏、盗窃和怪物破坏。
- **常用命令**

/res create <领地名> /res remove <领地名> /res tp <领地名> /res set <flag> true/false

- **常用权限**

residence.admin.* residence.create

- **配置要点**
- 与经济插件结合可收取领地费用  
- 可限制领地最大尺寸与数量
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/residence.11480/)

---

### EssentialsX 系列
- **功能介绍**  
多功能插件集合，提供基础命令（回家、传送、信息查询）、玩家管理（踢人、封禁）、经济系统等功能。
- **常用命令**

/spawn /home <名字> /sethome <名字> /tp <玩家> /msg <玩家> <信息>

- **常用权限**

essentials.* essentials.tp essentials.kick

- **配置要点**
- 通过 `config.yml` 启用/禁用不需要的命令  
- 经济部分建议与 Vault 搭配使用
- **链接**
- [EssentialsX 官网](https://essentialsx.net/)

---

### DeluxeMenus
- **功能介绍**  
自定义 GUI 菜单插件，可用于商店、传送、信息展示等功能。
- **常用命令**

/dm reload

- **常用权限**

deluxemenus.admin

- **配置要点**
- 配置文件使用 YAML 格式，可绑定命令、权限检查、占位符显示  
- 依赖 PlaceholderAPI 获取动态数据
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/deluxemenus.11734/)

---

### PlayerPoints
- **功能介绍**  
积分系统插件，可与商店、菜单、任务系统绑定，作为非经济货币。
- **常用命令**

/points give <玩家> <数量> /points take <玩家> <数量> /points me

- **常用权限**

playerpoints.admin

- **配置要点**
- 可作为 DeluxeMenus / QuickShop 等插件的支付方式  
- 支持 MySQL 存储
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/playerpoints.80745/)

---

### QuickShop-Hikari
- **功能介绍**  
高性能的玩家商店插件，支持购买/出售方块、物品。
- **常用命令**

/qs create buy/sell <价格> /qs remove

- **常用权限**

quickshop.create quickshop.remove

- **配置要点**
- 依赖 Vault + 经济插件  
- 可限制商店创建位置（如仅在安全区）
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/quickshop-hikari.104930/)

---

### SagaGuild
- **功能介绍**  
公会系统插件，支持公会创建、成员管理、领地等。
- **常用命令**

/guild create <名字> /guild invite <玩家> /guild claim

- **常用权限**

sagaguild.admin

- **配置要点**
- 可与经济插件绑定收取公会维护费  
- 建议结合 WorldGuard / Residence 做领地保护


---
## Slimefun 主体与附属插件
> Slimefun 是一个仿科技类模组的 Bukkit/Spigot 插件，通过原版物品与机器实现科技、自动化、农业、能源等玩法。  
> 你的服务器安装了大量 Slimefun 附属，覆盖机器扩展、农作物扩展、装备扩展、资源生成等多个方面。

---

### Slimefun
- **功能介绍**  
  Slimefun 是核心插件，提供大量科技玩法，包括机器、发电机、矿物、武器、盔甲、食物、自动化系统等。
- **常用命令**

/sf guide                      # 打开 Slimefun 指南 /sf cheat <物品ID> <数量>       # 获取物品（管理员） /sf stats                       # 查看玩家 Slimefun 进度 /sf versions                    # 查看已安装附属版本

- **常用权限**

slimefun.cheat                  # 作弊模式获取物品 slimefun.stats                   # 查看进度

- **配置要点**
- 建议开启 `researches` 系统，让玩家逐步解锁物品  
- 根据服务器性能调整机器运作频率  
- 多个附属需与核心版本匹配，更新前请确认兼容性
- **链接**
- [Slimefun GitHub](https://github.com/Slimefun/Slimefun4)

---

### InfinityExpansion
- **功能介绍**  
为 Slimefun 添加高端科技，如无限发电机、高级机器、高容量能源存储等。
- **常用命令**

/sf give <玩家> infinity_generator

- **配置要点**
- 高级机器产量和耗电可在配置中调整  
- 某些物品制作成本较高，建议服主平衡经济
- **链接**
- [InfinityExpansion GitHub](https://github.com/Mooy1/InfinityExpansion)

---

### ExoticGarden
- **功能介绍**  
添加大量可种植的新作物和树木，以及它们的衍生食物和饮品。
- **配置要点**
- 作物可自然生成或通过种子获取  
- 可与市场/商店插件联动增加经济玩法
- **链接**
- [ExoticGarden GitHub](https://github.com/Slimefun/ExoticGarden)

---

### DynaTech
- **功能介绍**  
提供多种独特机器，如树液收集器、太阳能机器、植物自动化工具等。
- **配置要点**
- 某些机器依赖自然环境（如光照、雨水）运行  
- 可与 ExoticGarden 联动种植作物
- **链接**
- [DynaTech GitHub](https://github.com/PluginBugs/Issues-DynaTech)

---

### FinalTECH
- **功能介绍**  
高性能的科技扩展，提供先进的发电机、资源合成器、自动化处理设备。
- **配置要点**
- 部分机器为终局装备，需玩家大量投入资源  
- 建议在经济系统中保持稀有度
- **链接**
- [FinalTECH GitHub](https://github.com/Slimefun-Addons/FinalTECH)

---

### ExtraTools
- **功能介绍**  
增加多种新工具和武器，提供不同挖掘速度与特殊能力。
- **配置要点**
- 某些工具可能破坏平衡，建议调整制作成本

---

### ExtraGear
- **功能介绍**  
添加额外的盔甲和武器，带有特殊属性（抗性、速度提升等）。
- **配置要点**
- 可与 PVP 插件联动  
- 建议平衡属性避免过度强大

---

### SlimyBees
- **功能介绍**  
蜜蜂养殖扩展，通过繁育不同品种的蜜蜂获取资源。
- **配置要点**
- 需要养蜂场和花卉支持  
- 产出可用于经济交易或其他机器加工

---

### SlimyTreeTaps
- **功能介绍**  
树液收集系统，可从树木获取原料（如橡胶）。
- **配置要点**
- 配合 DynaTech 可实现全自动化生产

---

### SlimeHUD
- **功能介绍**  
在屏幕 HUD 显示机器状态、能源、研究进度等信息。
- **配置要点**
- 可在配置中调整显示位置与内容

---

### SlimeTinker
- **功能介绍**  
添加可定制化的工具与武器，允许玩家组合不同材料与能力。
- **配置要点**
- 建议结合经济或任务系统开放高级配方

---

### SlimefunOreChunks
- **功能介绍**  
添加矿石碎片系统，可组合成完整矿石进行冶炼。
- **配置要点**
- 碎片产出量可在配置中调整，控制经济平衡

---

### SlimefunLuckyBlocks
- **功能介绍**  
幸运方块玩法，打开后随机获得奖励或挑战。
- **配置要点**
- 奖励与惩罚可在配置中自定义

---

### SlimeVision
- **功能介绍**  
增加视觉增强效果（夜视、透视机器状态）。
- **配置要点**
- 可绑定权限让特定职业或玩家使用

---

### SlimefunWarfare
- **功能介绍**  
提供武器、炮塔、弹药等战斗相关科技设备。
- **配置要点**
- 建议与 PVP 世界或战场玩法结合

---

### SlimefunServerEssentials
- **功能介绍**  
服务器管理用的 Slimefun 附属，提供额外的管理工具与物品。
- **配置要点**
- 适合服主与管理组快速维护科技世界

---

### 其他附属说明
服务器还包含以下 Slimefun 附属插件，每个附属都为核心玩法提供额外扩展：

---

#### Quaptics
- **功能介绍**  
  量子科技扩展，提供量子计算机、量子传输、超高效能源系统等。
- **配置要点**
  - 能源与产物效率非常高，建议限制获取途径  
  - 可作为游戏后期科技目标

---

#### ObsidianExpansion
- **功能介绍**  
  黑曜石主题扩展，添加黑曜石系高耐久机器与防御装备。
- **配置要点**
  - 防御装备耐久度极高，建议平衡其制作成本  
  - 可与 PVP 或 Boss 战结合

---

#### Liquid
- **功能介绍**  
  增加液体运输、存储、处理相关的机器与系统。
- **配置要点**
  - 液体种类可在配置文件中启用/禁用  
  - 可结合自动化机器实现液体全流程管理

---

#### ElementManipulation
- **功能介绍**  
  元素操控扩展，允许玩家提取、合成各种元素材料，用于高级配方。
- **配置要点**
  - 资源获取难度较高，可作为中期解锁科技

---

#### Gastronomicon
- **功能介绍**  
  美食与烹饪扩展，添加大量可制作的食物与饮品。
- **配置要点**
  - 食物可与任务或经济系统结合，增加玩家互动  
  - 适合与 ExoticGarden 联动提供原料

---

#### GeneticChickengineering
- **功能介绍**  
  基因鸡养殖玩法，可繁育不同品种的鸡产出稀有资源。
- **配置要点**
  - 各品种鸡可在配置文件中调整产量与生成条件  
  - 可结合经济系统作为稳定资源来源

---

#### Galactifun
- **功能介绍**  
  太空科技扩展，允许玩家建造飞船探索行星，获取独特资源。
- **配置要点**
  - 行星资源稀有，适合作为终局内容  
  - 需要配合发电机和高级机器使用

---

#### BetterReactor
- **功能介绍**  
  提供多种高效反应堆与能源核心。
- **配置要点**
  - 建议调整能量产出，防止能源过剩  
  - 与 EcoPower 配合可形成能源体系

---

#### EcoPower
- **功能介绍**  
  环保型发电机与能源管理系统。
- **配置要点**
  - 产出较平衡，适合中前期使用  
  - 可作为高级能源的前置科技

---

#### UltimateGenerators2
- **功能介绍**  
  终极发电机扩展，提供高输出能源设备。
- **配置要点**
  - 适合后期科技树  
  - 注意与 InfinityExpansion 的能源平衡

---

#### EnderCargo
- **功能介绍**  
  末影传输系统，允许跨世界、跨区块传输物品。
- **配置要点**
  - 大规模传输可能增加 TPS 压力，建议优化频率

---

#### ElectricSpawners
- **功能介绍**  
  可通过能源驱动的刷怪笼系统，替代原版刷怪方式。
- **配置要点**
  - 刷怪速度可调节  
  - 建议与经济系统结合收取运行费用

---

#### GeneticChickengineering
- **功能介绍**  
  基因工程养殖不同类型的鸡来生产各种资源。
- **配置要点**
  - 可用作经济玩法  
  - 配合 ExoticGarden 提供饲料资源

---

#### ExtraHeads
- **功能介绍**  
  增加更多头颅收集种类，部分可用于合成或装饰。
- **配置要点**
  - 可与任务系统结合，增加收集玩法

---

#### ExtraGear
- **功能介绍**  
  添加额外盔甲与武器，带有特殊效果。
- **配置要点**
  - 平衡装备属性，避免破坏 PVP 公平性

---

#### ExtraTools
- **功能介绍**  
  新工具与机械，可加快生产效率。
- **配置要点**
  - 调整耐久与效率参数平衡游戏节奏

---

#### RelicsOfCthonia
- **功能介绍**  
  添加神秘遗物与特殊装备，通常伴随特殊能力或副作用。
- **配置要点**
  - 可作为高难度副本奖励

---

#### SpiritsUnchained
- **功能介绍**  
  增加灵魂系装备与材料，常用于高级合成。
- **配置要点**
  - 适合作为后期解锁科技

---

#### SoulJars
- **功能介绍**  
  灵魂收集系统，可捕获并利用生物灵魂制作物品。
- **配置要点**
  - 掉落率可调节  
  - 适合与战斗玩法结合

---

#### SFMobDrops
- **功能介绍**  
  为生物添加特殊掉落物，可在 Slimefun 合成中使用。
- **配置要点**
  - 掉落物种类和几率可自定义

---

#### ViewSlimeChunk
- **功能介绍**  
  显示当前区块是否为史莱姆区块。
- **配置要点**
  - 仅提供信息显示，不影响游戏平衡

---

> 以上附属建议根据服务器经济和玩家发展速度调整产出与解锁条件，确保玩法长期可持续。


---

## 特色玩法插件
> 这类插件为服务器带来独特的游戏体验，包括自定义 NPC、建筑生成、枪械系统、任务、副本等。它们大多属于非必需插件，但能极大提升玩法丰富度与沉浸感。

---

### CustomNPCs
- **功能介绍**  
  可创建可交互的 NPC，用于任务、商店、剧情引导、传送等功能。
- **常用命令**

/npc create <名字>               # 创建 NPC /npc remove                      # 删除 NPC /npc look                        # 设置 NPC 朝向

- **常用权限**

customnpcs.admin

- **配置要点**
- NPC 行为（对话、触发事件）可与菜单、任务系统结合  
- 建议统一 NPC 外观风格保持世界观一致
- **链接**
- （需查找具体版本发布页）

---

### BetterStructures
- **功能介绍**  
随机在世界中生成预设建筑（地牢、遗迹、村庄扩展等）。
- **配置要点**
- 建筑生成频率、坐标范围可在配置中调整  
- 适合与冒险、副本玩法结合，提供探索动力
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/betterstructures.103906/)

---

### QualityArmory
- **功能介绍**  
添加现代枪械、弹药、近战武器，并支持开镜、射击、换弹等动作。
- **常用命令**

/qa give <玩家> <武器ID>    # 给玩家武器

- **常用权限**

qualityarmory.admin

- **配置要点**
- 武器伤害、射速可在配置文件调整  
- 建议与 PVP 区域或战争玩法配合
- **链接**
- [QualityArmory GitHub](https://github.com/ZombieStriker/QualityArmory)

---

### MissileWarfare
- **功能介绍**  
增加导弹系统，可用于 PVP 战争或基地防御。
- **配置要点**
- 需限制在特定世界使用，防止破坏主世界环境  
- 建议绑定权限避免滥用

---

### SagaGuild
- **功能介绍**  
公会系统，支持公会领地、成员管理、公会升级等功能。
- **常用命令**

/guild create <名字> /guild invite <玩家> /guild claim

- **常用权限**

sagaguild.admin

- **配置要点**
- 建议结合经济插件设置维护费  
- 可与 WorldGuard / Residence 联动保护公会领地

---

### VillagerTrade / VillagerUtil
- **功能介绍**  
自定义村民交易内容与职业行为。
- **配置要点**
- 可平衡交易物品避免刷物资  
- 适合与经济系统绑定形成稳定交易渠道

---

### Wildernether
- **功能介绍**  
改造下界生态，增加更多生物群系、建筑与挑战。
- **配置要点**
- 适合冒险和 PVE 玩法  
- 可与世界生成插件配合使用

---

### TerraformGenerator
- **功能介绍**  
高度可定制的世界生成器，可生成独特的地形、生物群系和结构。
- **配置要点**
- 大地图生成需较高性能，建议生成前完成预渲染  
- 与 BetterStructures 配合可丰富世界细节
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/terraformgenerator.75132/)

---

### SpiritsUnchained
- **功能介绍**  
灵魂系装备与材料，可制作具有特殊能力的武器装备。
- **配置要点**
- 适合作为高难度副本奖励  
- 可与任务系统绑定

---

### RelicsOfCthonia
- **功能介绍**  
神秘遗物系统，提供强力物品与隐藏能力。
- **配置要点**
- 建议作为稀有战利品或终局奖励  
- 可在副本或 BOSS 战中掉落

---

### HotbarPets
- **功能介绍**  
可在物品栏召唤宠物，并赋予玩家特殊增益效果。
- **配置要点**
- 宠物能力可自定义  
- 注意平衡性避免过强

---

### InfernalExpansion
- **功能介绍**  
增加更多下界怪物、装备与机制，强化下界探索体验。
- **配置要点**
- 适合与 Wildernether 搭配使用  
- 怪物强度需与服务器整体难度匹配

---

### SmallSpace
- **功能介绍**  
允许玩家进入缩小空间（微型房间、地下密室）。
- **配置要点**
- 可用于隐藏彩蛋或特殊副本设计

---

### PublicBin
- **功能介绍**  
提供公共物品箱系统，玩家可自由存取资源。
- **配置要点**
- 适合公益玩法或活动奖励  
- 建议定期清理以防堆积


---


## 辅助与优化插件
> 这些插件用于提升服务器性能、便捷管理、增强兼容性和优化玩家体验，不直接改变玩法，但能确保服务器长期稳定运行。

---

### ClearLag
- **功能介绍**  
  自动清理掉落物、闲置生物、无用实体，减少 TPS 压力。
- **常用命令**

/lagg clear              # 立即清理 /lagg check              # 查看实体数量

- **常用权限**

clearlag.*

- **配置要点**
- `config.yml` 可调整清理间隔与排除物品  
- 建议保留重要实体（如盔甲架、命名生物）
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/clearlagg.68271/)

---

### CoreProtect
- **功能介绍**  
方块与物品操作日志插件，可回滚玩家操作，防止破坏。
- **常用命令**

/co inspect               # 进入检查模式 /co rollback <参数>       # 回滚操作 /co lookup <参数>         # 查询记录

- **常用权限**

coreprotect.*

- **配置要点**
- 建议使用 MySQL 存储提升性能  
- 可设置日志保留时间，平衡性能与追溯能力
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/coreprotect.8631/)

---

### PlugManX
- **功能介绍**  
热加载、卸载、重载插件，无需重启服务器。
- **常用命令**

/plugman load <插件>       # 加载插件 /plugman unload <插件>     # 卸载插件 /plugman reload <插件>     # 重载插件

- **常用权限**

plugman.admin

- **配置要点**
- 某些插件不支持热加载，可能导致报错  
- 适合测试环境，不建议生产环境频繁使用
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/plugmanx.88135/)

---

### ProtocolLib
- **功能介绍**  
提供拦截与修改 Minecraft 数据包的 API，许多插件的依赖项。
- **配置要点**
- 无需配置，安装即可为依赖插件提供支持  
- 更新版本需与服务器版本匹配
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/protocollib.1997/)

---

### SkinsRestorer
- **功能介绍**  
为离线模式玩家设置和保存皮肤，支持 Java 与基岩版。
- **常用命令**

/skin set <皮肤名>         # 设置皮肤 /skin clear                # 清除皮肤

- **常用权限**

skinsrestorer.playercmds skinsrestorer.admin

- **配置要点**
- 需要开放网络访问以获取皮肤数据  
- 可与 Geyser/Floodgate 配合使用
- **链接**
- [SkinsRestorer GitHub](https://github.com/SkinsRestorer/SkinsRestorerX)

---

### TAB
- **功能介绍**  
自定义 Tab 玩家列表、侧边栏、BossBar，支持 PlaceholderAPI 动态数据。
- **常用命令**

/tab reload                # 重载配置 /tab player <玩家>         # 查看玩家信息

- **常用权限**

tab.admin

- **配置要点**
- `config.yml` 可自定义布局、颜色、显示数据  
- 占位符需安装 PlaceholderAPI
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/tab-1-5-x-1-20-x-reborn.57806/)

---

### LiteSignIn
- **功能介绍**  
轻量级玩家签到插件，支持奖励与统计。
- **常用命令**

/signin                     # 打开签到界面

- **常用权限**

litesignin.admin

- **配置要点**
- 可自定义签到奖励  
- 建议与经济、积分系统联动
- **链接**
- [SpigotMC](https://www.spigotmc.org/resources/litesignin.92041/)

---

### LiteXpansion
- **功能介绍**  
Slimefun 附属，提供额外物品与机器（此处归为辅助类）。
- **配置要点**
- 确保版本与 Slimefun 核心匹配  
- 可在配置文件调整产出速度

---

### UseTranslatedNames
- **功能介绍**  
使物品、方块显示为翻译后的名称，方便多语言玩家。
- **配置要点**
- 确保服务器语言文件完整  
- 可结合自定义语言包使用

---

### ViewSlimeChunk
- **功能介绍**  
显示玩家所在区块是否为史莱姆区块。
- **配置要点**
- 仅提供信息，不会影响生成机制

---

### NoCreeperCraters
- **功能介绍**  
防止苦力怕爆炸破坏地形。
- **配置要点**
- 适合保护主城和重要建筑


---

## 基岩版互通设置
> 基岩版互通功能让 Bedrock 客户端玩家（手机、Win10 版、主机等）可以直接连接 Java 版服务器。  
> 本服务器使用 **Geyser-Spigot + Floodgate** 实现跨平台互通，并与登录、皮肤、权限系统集成。

---

### Geyser-Spigot
- **功能介绍**  
  作为 Java ↔ 基岩互通的桥接插件，将基岩玩家的网络协议转换为 Java 协议。
- **安装步骤**
  1. 将 `Geyser-Spigot.jar` 放入服务器 `plugins` 文件夹。
  2. 启动服务器生成配置文件。
  3. 打开 `config.yml`，修改：
     ```yaml
     bedrock:
       port: 19132          # 基岩版连接端口
       address: 0.0.0.0     # 监听所有地址
     remote:
       address: 127.0.0.1   # Java 服务器地址
       port: 25565          # Java 服务器端口
     ```
  4. 确保防火墙开放 19132 UDP 端口。
- **常用命令**

/geyser help /geyser reload

- **注意事项**
- 基岩版使用的端口是 **UDP**，Java 版是 **TCP**。
- 与 Floodgate 配合可让基岩玩家免输入 Java 账号密码。
- **链接**
- [Geyser 官网](https://geysermc.org/)

---

### Floodgate
- **功能介绍**  
基岩玩家免注册登录插件，配合 Geyser 使用，为基岩玩家生成虚拟 Java 账号。
- **安装步骤**
1. 下载 Floodgate 对应版本，放入 `plugins` 文件夹。
2. 启动服务器生成配置文件。
3. 打开 `config.yml`，确认：
   ```yaml
   username-prefix: "."
   ```
   这样基岩玩家的名字会带上前缀（防止与 Java 玩家重复）。
- **常用命令**

/floodgate reload

- **注意事项**
- 基岩玩家不会与 Java 玩家冲突，但建议保持名称区分度。
- 可以与 AuthMe 配置免登录白名单，实现 Java 玩家需要登录，基岩玩家无需输入密码。
- **链接**
- [Floodgate 文档](https://wiki.geysermc.org/floodgate/)

---

### SkinsRestorer
- **功能介绍**  
为基岩玩家和离线模式 Java 玩家提供皮肤功能。
- **配置要点**
- 基岩玩家可使用 `/skin set <皮肤名>` 来换皮肤。
- 需开放网络访问以获取皮肤数据。
- **链接**
- [SkinsRestorer GitHub](https://github.com/SkinsRestorer/SkinsRestorerX)

---

### AuthMe / LiteSignIn 集成
- **功能介绍**  
保障 Java 玩家账号安全，同时为基岩玩家提供免登录功能。
- **配置方法**
- 在 AuthMe 配置文件中，将 Floodgate 生成的基岩玩家 UUID 列入免登录白名单。
- LiteSignIn 同理，可通过权限节点让基岩玩家跳过登录。
- **注意事项**
- 即便基岩玩家免登录，也建议绑定密码以防盗号（可在菜单中引导设置）。

---

### ViaVersion / ViaBackwards 配合
- **作用**  
允许不同版本的基岩客户端通过 Geyser 连接到服务器。
- **配置要点**
- 确保 Via 系列插件与 Geyser 版本兼容。
- 可在 ViaVersion 配置中限制最低连接版本，防止低版本客户端出现严重兼容问题。

---

### 常见问题与优化建议
1. **基岩玩家无法连接**
 - 检查 19132 UDP 端口是否开放。
 - 确认 `config.yml` 地址与端口配置无误。
2. **延迟高**
 - Geyser 转包需要额外性能，建议服务器内存和带宽充足。
 - 避免同时运行过多高延迟插件。
3. **皮肤不显示**
 - 检查 SkinsRestorer 是否正常运行。
 - 确保网络可以访问 Mojang 与 Geyser API。


---

## 性能与安全优化
> 这些插件与配置建议旨在保障服务器长期稳定运行，减少卡顿，防止恶意行为，提升整体体验。

---

### ClearLag
- **功能介绍**  
  自动清理掉落物、闲置生物、无用实体，减少服务器压力。
- **优化建议**
  - 设置清理间隔在 **2~5 分钟**，根据玩家数量调整。
  - 使用 `exempt` 列表保护重要实体（如命名生物、展示框）。
  - 定期检查 TPS 与实体数量，合理调整配置。

---

### Spark
- **功能介绍**  
  高性能分析工具，实时监控 TPS、内存、CPU 使用情况，生成性能报告。
- **常用命令**

/spark profiler start      # 开始性能分析 /spark profiler stop       # 停止分析并生成报告 /spark health              # 查看服务器健康状况

- **优化建议**
- 用于定位卡顿插件或任务，减少盲目调整。
- 可导出网页报告，与开发者共享分析结果。
- **链接**
- [Spark GitHub](https://github.com/lucko/spark)

---

### CoreProtect
- **功能介绍**  
方块与物品日志插件，防止破坏与盗窃，支持回滚。
- **安全建议**
- 定期备份数据库。
- 只给予可信管理组 `/co rollback` 权限。
- 结合权限组细化操作权限。

---

### WorldGuard
- **功能介绍**  
区域保护插件，可阻止方块破坏、爆炸、PVP、火焰蔓延等。
- **安全建议**
- 主城、活动区必须设为保护区域。
- 关闭火焰蔓延、TNT 爆炸等破坏性功能。
- 配合 Residence 给玩家自主领地权限。

---

### AuthMe / LiteSignIn
- **功能介绍**  
玩家登录验证，防止盗号与冒名顶替。
- **安全建议**
- 启用密码加密存储。
- 允许基岩玩家免登录，但需绑定唯一识别码或 IP 限制。
- 定期清理长时间未登录的账号。

---

### ViaVersion / ViaBackwards
- **功能介绍**  
跨版本支持，让不同版本客户端进入服务器。
- **安全建议**
- 限制最低版本，防止旧版本客户端漏洞利用。
- 定期更新以修复协议层漏洞。

---

### 其他性能优化建议
1. **分配合理内存**  
 - Paper 服务器建议内存：**6~10GB**（视玩家数量与插件多少）。
2. **Paper 配置优化**  
 - 编辑 `paper.yml`、`spigot.yml`、`bukkit.yml`，减少不必要的实体追踪与区块加载。
3. **磁盘与备份**  
 - 使用 SSD 提升存储性能。
 - 定期自动备份世界与配置文件。
4. **异步任务**  
 - 优先使用异步处理的插件，减少主线程压力。
5. **定期重启**  
 - 设定每天低峰时段自动重启，释放内存与缓存。

---

### 安全防护插件推荐（可选）
- **ExploitFixer**：修复已知 Minecraft 漏洞与崩服手法。  
- **AntiVPN**：阻止 VPN 登录，防止恶意用户刷号。  
- **CMILib + CommandBlocker**：限制特定命令执行权限。  
- **Orebfuscator**：反 X-Ray 挖矿。


---

## 命令与权限大全
> 点击插件名可快速跳转到上方该插件的详细介绍部分。  
> 以下是服务器常用插件的主要命令与权限节点汇总，方便服主管理与分配权限。

---

### 核心与管理类
| 插件 | 命令 | 权限节点 | 说明 |
|------|------|---------|------|
| [LuckPerms](#luckperms) | `/lp editor` | `luckperms.*` | 打开 Web 编辑器管理权限 |
| [LuckPerms](#luckperms) | `/lp user <玩家> permission set <节点> [true/false]` | `luckperms.user` | 给玩家设置权限 |
| [Vault](#vault) | 无命令 | 无 | 权限/经济 API，供其他插件调用 |
| [Multiverse-Core](#multiverse-core) | `/mv create <世界名> <环境>` | `multiverse.core.create` | 创建世界 |
| [Multiverse-Core](#multiverse-core) | `/mv tp <玩家> <世界名>` | `multiverse.teleport.self` | 传送到世界 |
| [Residence](#residence) | `/res create <领地名>` | `residence.create` | 玩家创建领地 |
| [Residence](#residence) | `/resadmin` | `residence.admin` | 管理所有领地 |
| [EssentialsX](#essentialsx-系列) | `/spawn` | `essentials.spawn` | 回到出生点 |
| [EssentialsX](#essentialsx-系列) | `/home [名字]` | `essentials.home` | 回家 |
| [EssentialsX](#essentialsx-系列) | `/sethome <名字>` | `essentials.sethome` | 设置家 |
| [EssentialsX](#essentialsx-系列) | `/tp <玩家>` | `essentials.tp` | 传送到玩家 |
| [EssentialsX](#essentialsx-系列) | `/msg <玩家> <信息>` | `essentials.msg` | 私聊 |
| [DeluxeMenus](#deluxemenus) | `/dm reload` | `deluxemenus.admin` | 重载菜单配置 |
| [PlayerPoints](#playerpoints) | `/points give <玩家> <数量>` | `playerpoints.admin` | 增加积分 |
| [QuickShop-Hikari](#quickshop-hikari) | `/qs create buy/sell <价格>` | `quickshop.create` | 创建商店 |
| [QuickShop-Hikari](#quickshop-hikari) | `/qs remove` | `quickshop.remove` | 删除商店 |

---

### Slimefun 系列（含附属）
| 插件 | 命令 | 权限节点 | 说明 |
|------|------|---------|------|
| [Slimefun](#slimefun) | `/sf guide` | `slimefun.guide` | 打开科技指南 |
| [Slimefun](#slimefun) | `/sf cheat <物品ID> <数量>` | `slimefun.cheat` | 获取物品（管理员） |
| [Slimefun](#slimefun) | `/sf stats` | `slimefun.stats` | 查看玩家进度 |
| [InfinityExpansion](#infinityexpansion) | 无命令 | 依赖 Slimefun | 高端科技扩展 |
| [ExoticGarden](#exoticgarden) | 无命令 | 依赖 Slimefun | 新作物与食物 |
| [DynaTech](#dynatech) | 无命令 | 依赖 Slimefun | 独特机器扩展 |
| [FinalTECH](#finaltech) | 无命令 | 依赖 Slimefun | 高性能科技 |
| [SlimyBees](#slimybees) | 无命令 | 依赖 Slimefun | 蜜蜂养殖系统 |
| [SlimyTreeTaps](#slimytreetaps) | 无命令 | 依赖 Slimefun | 树液收集器 |
| [SlimeTinker](#slimetinker) | 无命令 | 依赖 Slimefun | 工具定制 |
| [SlimefunOreChunks](#slimefunorechunks) | 无命令 | 依赖 Slimefun | 矿石碎片系统 |
| [SlimefunLuckyBlocks](#slimefunluckyblocks) | 无命令 | 依赖 Slimefun | 幸运方块玩法 |
| [SlimeVision](#slimevision) | 无命令 | 依赖 Slimefun | 视觉增强 |
| [SlimefunWarfare](#slimefunwarfare) | 无命令 | 依赖 Slimefun | 科技战斗系统 |

---

### 特色玩法类
| 插件 | 命令 | 权限节点 | 说明 |
|------|------|---------|------|
| [CustomNPCs](#customnpcs) | `/npc create <名字>` | `customnpcs.admin` | 创建 NPC |
| [CustomNPCs](#customnpcs) | `/npc remove` | `customnpcs.admin` | 删除 NPC |
| [BetterStructures](#betterstructures) | 无命令 | 无 | 世界生成建筑 |
| [QualityArmory](#qualityarmory) | `/qa give <玩家> <武器ID>` | `qualityarmory.admin` | 给玩家武器 |
| [QualityArmory](#qualityarmory) | `/qa menu` | `qualityarmory.menu` | 打开枪械菜单 |
| [SagaGuild](#sagaguild) | `/guild create <名字>` | `sagaguild.create` | 创建公会 |
| [SagaGuild](#sagaguild) | `/guild invite <玩家>` | `sagaguild.invite` | 邀请成员 |
| [TerraformGenerator](#terraformgenerator) | 无命令 | 无 | 世界生成器 |
| [VillagerTrade](#villagertrade--villagerutil) | 无命令 | 无 | 自定义村民交易 |
| [VillagerUtil](#villagertrade--villagerutil) | 无命令 | 无 | 村民行为管理 |

---

### 辅助与优化类
| 插件 | 命令 | 权限节点 | 说明 |
|------|------|---------|------|
| [ClearLag](#clearlag) | `/lagg clear` | `clearlag.clear` | 清理实体 |
| [ClearLag](#clearlag) | `/lagg check` | `clearlag.check` | 查看实体数量 |
| [CoreProtect](#coreprotect) | `/co inspect` | `coreprotect.inspect` | 检查方块日志 |
| [CoreProtect](#coreprotect) | `/co rollback` | `coreprotect.rollback` | 回滚更改 |
| [PlugManX](#plugmanx) | `/plugman reload <插件>` | `plugman.admin` | 重载插件 |
| [ProtocolLib](#protocollib) | 无命令 | 无 | 数据包 API |
| [SkinsRestorer](#skinsrestorer) | `/skin set <皮肤名>` | `skinsrestorer.playercmds` | 换皮肤 |
| [SkinsRestorer](#skinsrestorer) | `/skin clear` | `skinsrestorer.playercmds` | 清除皮肤 |
| [TAB](#tab) | `/tab reload` | `tab.admin` | 重载配置 |
| [LiteSignIn](#litesignin) | `/signin` | `litesignin.use` | 打开签到界面 |
| [LiteXpansion](#litexpansion) | 无命令 | 依赖 Slimefun | 扩展物品 |
| [UseTranslatedNames](#usetranslatednames) | 无命令 | 无 | 显示翻译名称 |

---

### 基岩版互通相关
| 插件 | 命令 | 权限节点 | 说明 |
|------|------|---------|------|
| [Geyser-Spigot](#geyser-spigot) | `/geyser help` | `geyser.admin` | 查看帮助 |
| [Geyser-Spigot](#geyser-spigot) | `/geyser reload` | `geyser.admin` | 重载配置 |
| [Floodgate](#floodgate) | `/floodgate reload` | `floodgate.admin` | 重载配置 |
| [AuthMe](#authme--litesignin) | `/login <密码>` | `authme.player` | 玩家登录 |
| [AuthMe](#authme--litesignin) | `/register <密码> <确认密码>` | `authme.player` | 玩家注册 |
| [AuthMe](#authme--litesignin) | `/authme reload` | `authme.admin` | 重载配置 |

---

## 插件下载与更新链接
> 以下为服务器所用插件的官方下载或更新地址，建议定期检查版本更新以保持兼容与安全。

---

### 核心插件
- **LuckPerms**：[SpigotMC](https://www.spigotmc.org/resources/luckperms.28140/) / [官网](https://luckperms.net/)
- **Vault**：[SpigotMC](https://www.spigotmc.org/resources/vault.34315/)
- **Multiverse-Core**：[SpigotMC](https://www.spigotmc.org/resources/multiverse-core.390/)
- **Residence**：[SpigotMC](https://www.spigotmc.org/resources/residence.11480/)
- **EssentialsX**：[官网](https://essentialsx.net/)

---

### Slimefun 及附属
- **Slimefun4**：[GitHub](https://github.com/Slimefun/Slimefun4)
- **InfinityExpansion**：[GitHub](https://github.com/Mooy1/InfinityExpansion)
- **ExoticGarden**：[GitHub](https://github.com/Slimefun/ExoticGarden)
- **DynaTech**：[GitHub](https://github.com/PluginBugs/Issues-DynaTech)
- **FinalTECH**：[GitHub](https://github.com/Slimefun-Addons/FinalTECH)
- **SlimyBees**：[GitHub](https://github.com/Slimefun/SlimyBees)

---

### 特色玩法
- **CustomNPCs**：（需搜索版本对应下载）
- **BetterStructures**：[SpigotMC](https://www.spigotmc.org/resources/betterstructures.103906/)
- **QualityArmory**：[GitHub](https://github.com/ZombieStriker/QualityArmory)
- **SagaGuild**：（需搜索发布页）
- **TerraformGenerator**：[SpigotMC](https://www.spigotmc.org/resources/terraformgenerator.75132/)

---

### 辅助与优化
- **ClearLag**：[SpigotMC](https://www.spigotmc.org/resources/clearlagg.68271/)
- **CoreProtect**：[SpigotMC](https://www.spigotmc.org/resources/coreprotect.8631/)
- **PlugManX**：[SpigotMC](https://www.spigotmc.org/resources/plugmanx.88135/)
- **ProtocolLib**：[SpigotMC](https://www.spigotmc.org/resources/protocollib.1997/)
- **SkinsRestorer**：[GitHub](https://github.com/SkinsRestorer/SkinsRestorerX)
- **TAB**：[SpigotMC](https://www.spigotmc.org/resources/tab-1-5-x-1-20-x-reborn.57806/)


---
