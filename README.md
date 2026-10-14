# KPCUI

> Thư viện giao diện (UI Library) dành cho Roblox Executor — nhẹ, đẹp, dễ dùng, có sẵn Logo + Avatar và 7 theme.
> A lightweight UI Library for Roblox Executors — clean, easy to use, built-in Logo + Avatar and 7 themes.

![Version](https://img.shields.io/badge/version-1.3.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Language](https://img.shields.io/badge/lang-Lua-purple)

---

## 📖 Mục lục / Table of Contents

### 🇻🇳 Tiếng Việt
- [Giới thiệu](#giới-thiệu)
- [Cài đặt](#cài-đặt)
- [Bắt đầu nhanh](#bắt-đầu-nhanh)
- [Window](#window)
- [Tab](#tab)
- [Elements](#elements)
  - [Section](#section)
  - [Label](#label)
  - [Button](#button)
  - [Toggle](#toggle)
  - [Slider](#slider)
  - [Input](#input)
  - [Dropdown](#dropdown)
  - [ColorPicker](#colorpicker)
  - [Keybind](#keybind)
- [Notify](#notify)
- [Theme](#theme)
- [Logo](#logo)
- [Avatar](#avatar)
- [Chống trồng menu (Guard)](#chống-trồng-menu-guard)
- [Flag System](#flag-system)
- [Ví dụ đầy đủ](#ví-dụ-đầy-đủ)
- [API Reference](#api-reference-tiếng-việt)

### 🇬🇧 English
- [Introduction](#introduction)
- [Installation](#installation)
- [Quick Start](#quick-start-1)
- [Window](#window-1)
- [Tab](#tab-1)
- [Elements](#elements-1)
- [Notify](#notify-1)
- [Theme](#theme-1)
- [Logo](#logo-1)
- [Avatar](#avatar-1)
- [Single-Instance Guard](#single-instance-guard)
- [Flag System](#flag-system-1)
- [Full Example](#full-example)
- [API Reference](#api-reference-english)

---

# 🇻🇳 Tiếng Việt

## Giới thiệu

**KPCUI** là thư viện giao diện (UI Library) dành cho Roblox Executor, được thiết kế với triết lý:

- **Nhẹ** — Chỉ ~2000 dòng code, load nhanh, không phụ thuộc thư viện ngoài
- **Đẹp** — 7 theme sẵn có, animation mượt, hỗ trợ logo + avatar
- **Dễ dùng** — API đơn giản, tương tự Rayfield
- **Linh hoạt** — Đổi theme ngay lập tức, tắt/bật mọi thành phần qua config hoặc API
- **An toàn** — Cơ chế chống trồng menu (single-instance guard), không bị nhiều menu chồng lên nhau

**Tính năng nổi bật:**

| Tính năng | Mô tả |
|---|---|
| 🎨 7 Theme | BloodRed, DarkBlue, Amethyst, Green, Ocean, Serenity, Light |
| 🖼️ Logo | Bật sẵn, bám cứng menu, tuỳ chỉnh ảnh/kích thước/vị trí |
| 👤 Avatar | Bật sẵn, hiển thị cạnh menu, tuỳ chỉnh viền/kích thước/vị trí |
| 🛡️ Guard | Tự xoá menu cũ khi chạy script nhiều lần |
| 🔍 Search | Tìm kiếm tab trong sidebar |
| 📢 Notify | Thông báo trượt từ phải sang, có progress bar |
| 🎯 Flag | Lưu trữ giá trị của mọi element |
| 🎬 Animation | Mọi thao tác đều có tween mượt mà |
| 📱 Mobile | Tự động điều chỉnh kích thước cho mobile |
| 🖱️ Drag | Kéo thả menu tự do, có clamp vào viewport |

**Yêu cầu:**
- Roblox Executor có `loadstring` + `game:HttpGet` (hầu hết đều có)
- Executor hỗ trợ `Instance.new`, `TweenService`, `RunService` (mặc định đều có)

---

## Cài đặt

### Link CDN (khuyên dùng — nhanh, có cache)

```lua
local KPCUI = loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/HoangQuocKhanh0504/KPCHOOK@root/KPC-Hub/KPCUI.lua"))()
