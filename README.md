<h1 align="center">
    nvimconfig
</h1>

<p align="center">
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
    <img
        alt="Neovim Version Capability"
        src="https://img.shields.io/badge/Supports%20Nvim-v0.11-A6D895?style=for-the-badge&colorA=363A4F&logo=neovim&logoColor=D9E0EE">
    </a>
    <a href="https://github.com/Jint-lzxy/nvimconfig/issues">
    <img
        alt="Issues"
        src="https://img.shields.io/github/issues-raw/Jint-lzxy/nvimconfig?colorA=363A4f&colorB=F5A97F&logo=github&logoColor=D9E0EE&style=for-the-badge">
    </a>
    <img
        alt="Code Size"
        src="https://img.shields.io/github/languages/code-size/Jint-lzxy/nvimconfig?colorA=363A4F&colorB=DDB6F2&logo=gitlfs&logoColor=D9E0EE&style=for-the-badge">
</p>

## 🪷 Introduction

This repo hosts my [Neovim](https://neovim.io/) configuration for Linux, macOS, and Windows. `init.lua` is the config entry point.

Branch info:

<div align="center">

|   Branch   | Supported Neovim version |
| :--------: | :----------------------: |
|   master   |     nvim 0.11 stable     |
|    0.10    |        nvim 0.10         |
| legacy-0.9 |         nvim 0.9         |

</div>

> [!CAUTION]
> This Neovim config is provided as-is, and I've only tested it on my own devices, so bugs are possible, especially on Windows, and I **won't** be fixing them. If you're interested in this config, please kindly have a look at [ayamir/nvimdots](https://github.com/ayamir/nvimdots) which we maintain. It also offers many wonderful features that I personally don't need, such as NixOS support.

### 🎐 Features

- **Fast.** Less than **50ms** to start (Depends on SSD and CPU, tested on Apple<sup>&reg;</sup> MacBookPro16,1).
- **Simple.** Runs out of the box.
- **Modern.** Pure `lua` config.
- **Modular.** Easy to customize.
- **Powerful.** Full functionality to code.

## 🏗 How to Install

Simply run the following interactive bootstrap command, and you should be all set 👍

- **Windows** _(Note: This script REQUIRES `pwsh` > `v7.1`)_

```pwsh
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Jint-lzxy/nvimconfig/HEAD/scripts/install.ps1'))
```

- **\*nix**

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Jint-lzxy/nvimconfig/HEAD/scripts/install.sh)"
```

## 🎉 Acknowledgement

- [ayamir/nvimdots](https://github.com/ayamir/nvimdots)

## 📜 License

This Neovim configuration is released under the BSD 3-Clause license, which grants the following permissions:

- Commercial use
- Distribution
- Modification
- Private use

For more convoluted language, see the [LICENSE](https://github.com/Jint-lzxy/nvimconfig/blob/master/LICENSE).
