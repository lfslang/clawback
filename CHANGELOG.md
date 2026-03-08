# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.9.175] - 2026-03-08

### Added
- 创建安装程序包 (install.sh)
- 添加 README.txt 说明文档
- 交付物与开发环境解耦
- 创建 DELIVERY_MANIFEST.txt 明确交付文件
- 添加 .gitattributes 防止开发文件混入

## [0.9.174] - 2026-03-08

### Changed
- 交付物与开发环境解耦
- 移动开发文档到 docs/ 目录
- 创建纯净交付物构建流程

## [0.9.173] - 2026-03-08

### Added
- 添加完整开发工具集
- TUI 退出检查脚本
- 版本号自动递增脚本
- 一键提交推送脚本
- 开发前检查清单脚本
- 开发工具帮助脚本

## [0.9.172] - 2026-03-08

### Added
- 添加版本管理规范文档
- 创建自动提交脚本
- 创建自动备份脚本
- 建立防丢失机制

## [0.9.171] - 2026-03-08

### Changed
- 移除手动创建快照的5分钟限制
- 5分钟限制仅用于自动备份

## [0.9.170] - 2026-03-08

### Fixed
- 修复硬编码中文，统一使用语言包
- 修复列表页导航提示
- 修复创建快照页面的 ESC 提示
- 修复查看完整配置页面的 Q 键提示

## [0.9.169] - 2026-03-08

### Changed
- 更新菜单文字样式
- menu_create: 简化为"手动创建快照"
- menu_language: 添加[language]标记
- list_navigate: 更新为查看模式提示
- detail_navigate: 新增字段用于详情页导航
- 同步更新所有7种语言包

## [0.9.168] - 2026-03-08

### Fixed
- 修复符号链接路径解析
- 正确处理 SCRIPT_DIR，支持通过符号链接运行

## [0.9.167] - 2026-03-08

### Changed
- 统一所有语言包字段
- 添加缺失的 3 个字段到所有语言包

## [0.9.166] - 2026-03-08

### Added
- 从 0.9.162 备份恢复
- 添加全局 ESC 键支持字段
- 统一语言包字段数量（96字段）
- 新增字段：esc_cancel, press_q_back, compare_preview_title 等
- 修复 lib/compare.sh 语言包加载
- 支持 7 种语言

### Fixed
- 修复代码丢失问题
- 建立完整的版本管理流程

## [0.9.162] - 2026-03-06

### Added
- 最后备份版本
- 完整功能实现

## [0.9.111] - 2026-03-04

### Added
- 项目初始化
- 基础 TUI 界面
- 多语言框架
- 快照管理功能
- 回滚功能

---

## Release Notes Template

### Added
- New features

### Changed
- Changes in existing functionality

### Deprecated
- Soon-to-be removed features

### Removed
- Now removed features

### Fixed
- Bug fixes

### Security
- Security improvements
