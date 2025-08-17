# XcodeCleaner

XcodeCleaner 是一个 macOS 桌面应用，用于一键清理 Xcode 产生的缓存和无用文件。通过简单的界面，帮助开发者释放磁盘空间、加快 Xcode 启动和构建速度。

## 功能介绍

- 一键清理 Xcode 相关缓存目录，包括：
  - `DerivedData`
  - `Archives`
  - `ModuleCache`
  - `Logs`
- 进度可视化，实时显示当前清理的类型和进度。
- 简洁直观的界面，适合所有 macOS 用户。

## 使用方法

1. 打开 XcodeCleaner 应用。
2. 点击 “开始清理” 按钮。
3. 程序会依次清理上述目录，完成后会提示 “✅ 清理完成！”。

> ⚠️ 清理操作会删除 Xcode 的临时构建文件和历史归档，请确保没有需要保留的数据。

## 构建与运行

1. 使用 Xcode 打开本项目。
2. 选择合适的签名证书（如有必要）。
3. 编译并运行即可。

## 主要技术

- Swift
- SwiftUI
- macOS App

## 贡献

欢迎提交 Issue 或 Pull Request 帮助改进本项目。

## License

MIT
