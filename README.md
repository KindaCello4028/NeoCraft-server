# 🎮 Minecraft 服务器插件详细管理文档
> 适用于 Paper 1.20.1 服务端（基岩 & Java 互通），包含 153 个插件的详细说明  
> 本文档公开开源，欢迎服主参考与改进。

---

## 📌 项目介绍
- **服务端版本**：Paper 1.20.1
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
（待补充）

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