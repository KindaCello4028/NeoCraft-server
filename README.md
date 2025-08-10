# 🎮 Minecraft 服务器插件详细管理文档
> 适用于 Paper 1.20.1 服务端（基岩 & Java 互通），包含 153 个插件的详细说明  
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




---

Multiverse-Core

功能介绍
多世界管理插件，可创建、加载、卸载、删除多个世界，并支持世界间传送。

常用命令

/mv create <世界名> <环境> [类型]   # 创建世界
/mv delete <世界名>                 # 删除世界
/mv tp <玩家> <世界名>               # 传送玩家到指定世界
/mv list                             # 列出所有世界

常用权限

multiverse.core.*       # 所有 Multiverse-Core 权限

配置要点

建议配合 Multiverse-Portals 或菜单插件实现便捷传送

不同世界可使用不同的游戏模式与规则


链接

SpigotMC




---

Residence

功能介绍
玩家自助领地保护系统，可防止破坏、盗窃和怪物破坏。

常用命令

/res create <领地名>         # 创建领地
/res remove <领地名>         # 删除领地
/res tp <领地名>             # 传送到领地
/res set <flag> true/false   # 设置领地权限

常用权限

residence.admin.*           # 管理员控制全部领地
residence.create            # 创建领地

配置要点

与经济插件结合可收取领地费用

可限制领地最大尺寸与数量


链接

SpigotMC




---

EssentialsX 系列

功能介绍
多功能插件集合，提供基础命令（回家、传送、信息查询）、玩家管理（踢人、封禁）、经济系统等功能。

常用命令

/spawn                      # 回出生点
/home <名字>                # 回家
/sethome <名字>             # 设置家
/tp <玩家>                  # 传送到玩家
/msg <玩家> <信息>           # 私聊

常用权限

essentials.*                # 所有 EssentialsX 权限
essentials.tp               # 传送权限
essentials.kick             # 踢人权限

配置要点

通过 config.yml 启用/禁用不需要的命令

经济部分建议与 Vault 搭配使用


链接

EssentialsX 官网




---

DeluxeMenus

功能介绍
自定义 GUI 菜单插件，可用于商店、传送、信息展示等功能。

常用命令

/dm reload                  # 重载菜单配置

常用权限

deluxemenus.admin           # 管理菜单

配置要点

配置文件使用 YAML 格式，可绑定命令、权限检查、占位符显示

依赖 PlaceholderAPI 获取动态数据


链接

SpigotMC




---

PlayerPoints

功能介绍
积分系统插件，可与商店、菜单、任务系统绑定，作为非经济货币。

常用命令

/points give <玩家> <数量>   # 增加积分
/points take <玩家> <数量>   # 扣除积分
/points me                  # 查看自己积分

常用权限

playerpoints.admin          # 管理积分

配置要点

可作为 DeluxeMenus / QuickShop 等插件的支付方式

支持 MySQL 存储


链接

SpigotMC




---

QuickShop-Hikari

功能介绍
高性能的玩家商店插件，支持购买/出售方块、物品。

常用命令

/qs create buy/sell <价格>   # 创建商店
/qs remove                   # 删除商店

常用权限

quickshop.create             # 创建商店
quickshop.remove             # 删除商店

配置要点

依赖 Vault + 经济插件

可限制商店创建位置（如仅在安全区）


链接

SpigotMC




---

SagaGuild

功能介绍
公会系统插件，支持公会创建、成员管理、领地等。

常用命令

/guild create <名字>         # 创建公会
/guild invite <玩家>         # 邀请成员
/guild claim                 # 公会领地

常用权限

sagaguild.admin              # 公会管理权限

配置要点

可与经济插件绑定收取公会维护费

建议结合 WorldGuard / Residence 做领地保护




---

## Slimefun 主体与附属插件
（待补充）

## 特色玩法插件
（待补充）

## 辅助与优化插件
（待补充）

## 基岩版互通设置
（待补充）

## 性能与安全优化
（待补充）

## 命令与权限大全
（待补充）

## 插件下载与更新链接
（待补充）


---