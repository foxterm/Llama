# Llama

[English](README.md) | [中文文档](README_CN.md)

FoxTerm APP 专用 llama.cpp 静态库 — 预编译的 [llama.cpp](https://github.com/ggml-org/llama.cpp) XCFramework，内置 Metal GPU 加速，用于本地大模型推理。

> 本库为 [FoxTerm](https://foxterm.app/) APP 专用核心组件，欢迎下载使用：[https://foxterm.app/](https://foxterm.app/)

## 环境要求

| 平台 | 最低版本 |
|------|---------|
| iOS  | 17.0    |
| macOS | 14.0   |

## 特性

- 基于 [llama.cpp v0.8.0](https://github.com/ggml-org/llama.cpp/releases/tag/v0.8.0)
- 后端：Metal (Apple GPU) + Accelerate BLAS + CPU
- `.metallib` 已嵌入静态库内部 — 无需任何外部资源
- 支持多模态模型（mtmd / CLIP 视觉编码器）
- 架构：macOS arm64/x86_64（通用）、iOS arm64、iOS 模拟器 arm64

## 构建

`llama.xcframework` 由 [xcframework_build](https://github.com/foxterm/xcframework_build) CI/CD 流水线自动编译并推送到本仓库，正常使用无需手动构建。

## 集成方式

本库通过 Swift Package Manager 以预编译 XCFramework 形式消费。将本仓库添加为包依赖后 `import Llama` 即可：

```swift
import Llama

// import 后 C API 直接可用
llama_backend_init()
defer { llama_backend_free() }

let params = llama_model_default_params()
// params.n_gpu_layers = 99  // 全量 GPU 卸载
```

## 仓库结构

```
Llama/
├── llama.xcframework/            # 预编译 xcframework（CI 自动构建）
└── Package.swift
```

## 许可证

MIT License。内置二进制由 [llama.cpp](https://github.com/ggml-org/llama.cpp) 构建，其遵循 [MIT License](https://github.com/ggml-org/llama.cpp/blob/master/LICENSE)。
