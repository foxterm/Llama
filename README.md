# Llama

[English](README.md) | [中文文档](README_CN.md)

FoxTerm app dedicated llama.cpp framework — a prebuilt [llama.cpp](https://github.com/ggml-org/llama.cpp) dynamic XCFramework with Metal GPU acceleration, for local LLM inference.

> This library is a dedicated core component for the [FoxTerm](https://foxterm.app/) app. Download it here: [https://foxterm.app/](https://foxterm.app/)

## Requirements

| Platform | Minimum Version |
|----------|----------------|
| iOS      | 16.4           |
| macOS    | 13.3           |

## Features

- Based on [llama.cpp v0.8.0](https://github.com/ggml-org/llama.cpp/releases/tag/v0.8.0)
- **Dynamic framework** — built by the official llama.cpp [build-xcframework.sh](https://github.com/ggml-org/llama.cpp/blob/master/build-xcframework.sh)
- Backends: Metal (Apple GPU) + Accelerate BLAS + CPU
- The `.metallib` is embedded inside the framework — no external resources needed
- Supports multimodal models (mtmd / CLIP vision encoder)
- Slices: macOS arm64/x86_64 (universal), iOS arm64, iOS Simulator arm64/x86_64
- Module name: `llama` (lowercase, `import llama`)

## Build

The `llama.xcframework` is automatically built by [xcframework_build](https://github.com/foxterm/xcframework_build) CI/CD pipeline (which runs the official `./build-xcframework.sh ios-sim ios-device macos`) and pushed to this repository. Manual building is not required for normal usage.

## Integration

This library is consumed as a prebuilt XCFramework via Swift Package Manager. Add this repository as a package dependency and `import llama`:

```swift
import llama

// C API is available directly after import
llama_backend_init()
defer { llama_backend_free() }

let params = llama_model_default_params()
// params.n_gpu_layers = 99  // offload to GPU
```

## Repository Structure

```
Llama/
├── llama.xcframework/            # Prebuilt dynamic xcframework (auto-built by CI)
└── Package.swift
```

## License

MIT License. The bundled binary is built from [llama.cpp](https://github.com/ggml-org/llama.cpp) which is licensed under the [MIT License](https://github.com/ggml-org/llama.cpp/blob/master/LICENSE).
