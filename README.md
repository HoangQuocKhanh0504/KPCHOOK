# KPCHOOK v6

<div align="center">

![Version](https://img.shields.io/badge/version-6.0-orange)
![Platform](https://img.shields.io/badge/platform-Roblox-blue)
![Game](https://img.shields.io/badge/game-Rivals-red)
![Language](https://img.shields.io/badge/language-Lua-purple)

**Script hỗ trợ game bắn súng Roblox Rivals với đầy đủ tính năng Aimbot, Silent Aim, ESP, Ragebot, Cosmetics, World Visuals và nhiều hơn nữa**

[🇻🇳 Tiếng Việt](#-tiếng-việt) | [🇬🇧 English](#-english)

</div>

---

## 🇻🇳 Tiếng Việt

### 📖 Giới thiệu

**KPCHOOK v6** là script toàn diện dành riêng cho **Rivals** trên Roblox. Script cung cấp giao diện hiện đại với 7 theme tùy chỉnh, hỗ trợ song ngữ Việt - Anh, hoạt động trên cả PC lẫn Mobile, tích hợp hệ thống Key (FREE / PREMIUM) và tự động chọn gói khi tài khoản có nhiều key.

### ✨ Tính năng chính

#### 🎯 Combat
- **Aimbot**: Hỗ trợ ngắm theo camera với Target Lock, FOV, Reaction Delay, Switch Delay
  - Chế độ ngắm: Lock, Linear, Spring, AI
  - Target Lock: Toggle Lock / Auto Lock / Manual Only
- **Silent Aim**: Chuyển đạn về mục tiêu mà không di chuyển camera
  - Tùy chỉnh Activation Chance, FOV, Hitbox, Manipulation
- **Triggerbot**: Tự động bắn khi tâm ngắm vào địch
- **Ragebot**: Ngắm cực nhanh, tự động bắn, auto swap/reload vũ khí
  - Evasion: Random, Translocate, Projectile Breaker
  - Weapon Priority & On-Empty behavior
- **Flickbot**: Flick camera nhanh vào mục tiêu với độ cong & độ "người" tùy chỉnh

#### 🎨 Cosmetics
- **Unlock All Cosmetics**: Mở khóa Skin, Wrap, Charm, Finisher, Emote theo độ hiếm
- **Skin Changer**: Áp dụng Skin/Wrap/Charm/Finisher cho từng vũ khí hoặc "All Weapons"
- **Rank Charm Override**: Ghi đè charm rank theo mùa (Season) & Rank tùy chỉnh
- **Share Skins**: Chia sẻ cosmetic với người chơi khác qua UserServer
- **Cosmetic Preset**: Lưu / tải / auto save / auto load toàn bộ diện mạo

#### 👁️ Visuals
- **Player ESP**: Box, Name, Health Bar, Ammo Bar, Distance, Rank, Winstreak, Held Weapon, Chams, Skeleton, Head Marker, Tracer
  - Dynamic/Static Box, ESP theo Team/Enemy
  - Distance Scaling, Display Name, Rank Spoof
- **Crosshair tùy chỉnh**: Lines, Image, Text, Outline, Rotation, Spread, Animation (Shimmer/Perimeter/PingPong), Follow Target
- **Sound ESP**: Hiển thị bước chân & âm thanh khác theo nguồn và âm lượng
- **Weapon Visuals**: Viewmodel Offset, Chams, Highlight, Wireframe, Bullet Tracers
- **Camera & Screen**: Third Person, Camera FOV, Stretched Resolution, Removables (no flash, no scope overlay, no hitmarker...)

#### 🌍 World Visuals
- **Lighting Override**: Time, Exposure, Shadows, Ambient, Fog, Color Shift
- **Post Processing**: Bloom, Color Correction, Color Grading, Depth of Field, Sun Rays, Motion Blur
- **Skybox & Weather**: Skybox preset tùy chỉnh, Ambient Sound, Weather (Snow / Rain / Blizzard), Lightning (Sparks, Explosion, Thunder Sound)
- **Atmosphere**

#### 🏃 Player
- **Movement**: WalkSpeed, Sliding, Noclip, Auto Strafe, JumpPower, Flight, Infinite Double Jumps, Long Jump
- **Movement Recorder**: Ghi / phát lại lộ trình, quản lý thư viện bản ghi theo map
- **Character**: Animation Player, Character Chams
- **Identity Spoofing**: Device Spoof, Player Spoofer (tên, avatar, ping, level, wins, ELO, leaderboard rank...)

#### 🤖 Automation
- **Auto Queue**, **Auto Vote** (map), **Auto Ban** (vũ khí), **Auto Respawn**
- **Auto Pickup** (ammo / health), **Subspace Tripmines** auto trigger
- **Auto Loadout**: Chọn vũ khí theo map / loadout dự phòng
- **Hacker Detector** & **Moderator Detector** (notify / kick / to lobby)

#### ⚙️ Item Modifiers
- Fast Shoot, Fast Projectile, Full Auto, No Spread
- Fire Rate / Aim Speed / Fire Cooldown / Aim Cooldown / Melee Cooldown / Dash Cooldown override
- Always Backstab, Extend Melee Range, Grenade Fuse Override
- No Shoot / Sprint / Equip / Reload Animation, No Motion, No Camera Shake/Sway

#### 🎨 Giao diện
- 7 theme: **BloodRed, DarkBlue, Amethyst, Green, Ocean, Serenity, Light**
- Song ngữ Việt - Anh (lưu tại `kpchookv6/lang.cfg`)
- Tùy chỉnh Avatar border, Logo, vị trí menu, Watermark (FPS + Ping)
- Config Profiles: tạo / lưu / tải / xóa / import / export / auto save / auto load
- Search Palette (Ctrl+F) để tìm nhanh setting
- Mobile: nút bấm nổi, chỉnh vị trí bằng drag mode
- Hỗ trợ **multi-tier Premium** — tài khoản có nhiều gói sẽ được chọn gói khi khởi động

### 📦 Hướng dẫn cài đặt

1. Mở executor hỗ trợ (Delta, Fluxus, Arceus X, Hydrogen, Wave...)
2. Copy toàn bộ nội dung file `KPCHOOK_v6.lua`
3. Paste vào executor và Execute
4. Chọn ngôn ngữ (English / Tiếng Việt) ở lần chạy đầu tiên
5. Chờ script khởi động (khoảng vài giây sau khi vào trận)
6. Mở menu bằng phím `RightShift` (mặc định, có thể đổi trong Settings → Menu Keybind)

### 🔑 Hệ thống Key

- Script yêu cầu key để sử dụng tính năng **PREMIUM**
- Key được xác thực qua API: `https://kph-key.vyk103736.workers.dev`
- Script **không lưu key lên server** — chỉ lưu tier đã chọn tại `kpchook/selected_tier.json`
- Nếu tài khoản có nhiều gói Premium → hiện bảng chọn gói (tự động chọn sau 60s nếu không chọn)

### ⌨️ Phím tắt mặc định

| Phím | Chức năng |
|------|-----------|
| `RightShift` | Mở/Đóng Menu |
| `Ctrl + F` | Mở Search Palette |
| `Escape` | Đóng menu / dialog hiện tại |

> Phím tắt từng feature (Aimbot, Silent Aim, Ragebot, Movement...) có thể đổi trong menu của từng feature.

### 💎 FREE vs PREMIUM

Script phân quyền theo **tab** và **setting key**. Khi ở FREE mode:
- Chỉ các tab trong `FREE_TABS` được hiển thị: `Settings`, `General`, `Config Profiles`, `Theme`, `Combat`, `Aimbot`, `Silent Aim`, `Automation`, `Match Flow`, `Auto Loadout`, `In-Match Automation`, `Detection`, `Cosmetics`, `Presets`, `Overview`, `Skins`, `Wraps`, `Charms`, `Finishers`, `Visuals`, `Player ESP`, `Crosshair`, `Player`, `Movement`
- Các setting thuộc `FREE_CONFIG_KEYS` được áp dụng (Theme, Esp, Aimbot, SilentAim, Movement, AutoLoadout, AutoRespawn, AutoVote, AutoQueue, AutoBan, HackerDetector, ModDetector...)
- Các setting PREMIUM bị ẩn khỏi UI và **không bị xoá khỏi file config** (vẫn được giữ khi save)

> Chi tiết cụ thể từng tính năng FREE / PREMIUM vui lòng xem trực tiếp trong menu sau khi chạy script (tab bị ẩn = PREMIUM).

### 🌐 Mua Premium

Truy cập: `https://kph-key.vyk103736.workers.dev/buy`

### 📂 Đường dẫn lưu trữ

| Mục đích | Đường dẫn |
|----------|-----------|
| Config chính | `kpchookv6/rivals_v3/configs/` |
| Cosmetics preset | `kpchookv6/rivals_v3/cosmetics/states/` |
| General state | `kpchookv6/rivals/` |
| Ngôn ngữ | `kpchookv6/lang.cfg` |
| Logo | `kpchookv6/logo.png` |
| Image custom | `kpchookv6/image_storage.json` + `kpchookv6/rivals/esp_images/` |
| Sound custom | `kpchookv6/sfx_sounds.json` |
| Skybox custom | `kpchookv6/rivals/skyboxes.json` |
| Movement recorder | `kpchookv6/rivals/movement_recorder/` |
| Tier đã chọn | `kpchook/selected_tier.json` |

### ⚠️ Lưu ý

- Script **không** lưu key của bạn lên server
- Script được build **riêng cho Rivals** — chạy sai game sẽ báo lỗi và dừng
- Cần executor hỗ trợ: `hookmetamethod`, `getgc`, `getrawmetatable`, `setrawmetatable`, `setconstant`, `getconstants`, `setupvalue`, `getupvalues`, `firetouchinterest`, `getcustomasset`, `Drawing`, `setclipboard`, `queue_on_teleport`, `gethui`
- Nên dùng trên **tài khoản phụ** — sử dụng có trách nhiệm
- Khi script báo "PlayerScripts.Controllers not found" → bạn đang ở sai game hoặc game chưa load xong, hãy xoá khỏi autoexec và thử lại

---

## 🇬🇧 English

### 📖 Introduction

**KPCHOOK v6** is a comprehensive script built specifically for **Rivals** on Roblox. It features a modern UI with 7 customizable themes, bilingual support (Vietnamese - English), works on both PC and Mobile, includes a Key system (FREE / PREMIUM) and auto-selects a tier when the account owns multiple keys.

### ✨ Key Features

#### 🎯 Combat
- **Aimbot**: Camera-based aim assistance with Target Lock, FOV, Reaction Delay, Switch Delay
  - Aim modes: Lock, Linear, Spring, AI
  - Target Lock: Toggle Lock / Auto Lock / Manual Only
- **Silent Aim**: Redirect projectiles toward targets without moving the camera
  - Customizable Activation Chance, FOV, Hitbox, Manipulation
- **Triggerbot**: Auto-fire when crosshair is on an enemy
- **Ragebot**: Ultra-fast aim, auto-fire, auto swap/reload weapons
  - Evasion: Random, Translocate, Projectile Breaker
  - Weapon Priority & On-Empty behavior
- **Flickbot**: Fast camera flick to target with configurable curvature & humanness

#### 🎨 Cosmetics
- **Unlock All Cosmetics**: Unlock Skin, Wrap, Charm, Finisher, Emote by rarity
- **Skin Changer**: Apply Skin/Wrap/Charm/Finisher per weapon or "All Weapons"
- **Rank Charm Override**: Override rank charm per Season & custom Rank
- **Share Skins**: Share cosmetics with other players via UserServer
- **Cosmetic Preset**: Save / load / auto save / auto load full appearance

#### 👁️ Visuals
- **Player ESP**: Box, Name, Health Bar, Ammo Bar, Distance, Rank, Winstreak, Held Weapon, Chams, Skeleton, Head Marker, Tracer
  - Dynamic/Static Box, Team/Enemy ESP
  - Distance Scaling, Display Name, Rank Spoof
- **Custom Crosshair**: Lines, Image, Text, Outline, Rotation, Spread, Animation (Shimmer/Perimeter/PingPong), Follow Target
- **Sound ESP**: Visualize footsteps & other sounds by source and loudness
- **Weapon Visuals**: Viewmodel Offset, Chams, Highlight, Wireframe, Bullet Tracers
- **Camera & Screen**: Third Person, Camera FOV, Stretched Resolution, Removables (no flash, no scope overlay, no hitmarker...)

#### 🌍 World Visuals
- **Lighting Override**: Time, Exposure, Shadows, Ambient, Fog, Color Shift
- **Post Processing**: Bloom, Color Correction, Color Grading, Depth of Field, Sun Rays, Motion Blur
- **Skybox & Weather**: Custom skybox presets, Ambient Sound, Weather (Snow / Rain / Blizzard), Lightning (Sparks, Explosion, Thunder Sound)
- **Atmosphere**

#### 🏃 Player
- **Movement**: WalkSpeed, Sliding, Noclip, Auto Strafe, JumpPower, Flight, Infinite Double Jumps, Long Jump
- **Movement Recorder**: Record / replay routes, manage recording library per map
- **Character**: Animation Player, Character Chams
- **Identity Spoofing**: Device Spoof, Player Spoofer (name, avatar, ping, level, wins, ELO, leaderboard rank...)

#### 🤖 Automation
- **Auto Queue**, **Auto Vote** (map), **Auto Ban** (weapons), **Auto Respawn**
- **Auto Pickup** (ammo / health), **Subspace Tripmines** auto trigger
- **Auto Loadout**: Pick weapons per map / fallback loadout
- **Hacker Detector** & **Moderator Detector** (notify / kick / to lobby)

#### ⚙️ Item Modifiers
- Fast Shoot, Fast Projectile, Full Auto, No Spread
- Fire Rate / Aim Speed / Fire Cooldown / Aim Cooldown / Melee Cooldown / Dash Cooldown override
- Always Backstab, Extend Melee Range, Grenade Fuse Override
- No Shoot / Sprint / Equip / Reload Animation, No Motion, No Camera Shake/Sway

#### 🎨 UI
- 7 themes: **BloodRed, DarkBlue, Amethyst, Green, Ocean, Serenity, Light**
- Bilingual Vietnamese - English (saved at `kpchookv6/lang.cfg`)
- Custom Avatar border, Logo, menu position, Watermark (FPS + Ping)
- Config Profiles: create / save / load / delete / import / export / auto save / auto load
- Search Palette (Ctrl+F) to quickly find any setting
- Mobile: floating buttons, drag-to-reposition mode
- **Multi-tier Premium** support — accounts with multiple keys will be prompted to pick a tier on startup

### 📦 Installation

1. Open a supported executor (Delta, Fluxus, Arceus X, Hydrogen, Wave...)
2. Copy the entire content of `KPCHOOK_v6.lua`
3. Paste into executor and Execute
4. Select language (English / Tiếng Việt) on first run
5. Wait for the script to boot (a few seconds after spawning)
6. Open menu with `RightShift` (default, changeable in Settings → Menu Keybind)

### 🔑 Key System

- Script requires a key to use **PREMIUM** features
- Keys are validated via API: `https://kph-key.vyk103736.workers.dev`
- The script **does not** store your key on any server — only the selected tier at `kpchook/selected_tier.json`
- If the account owns multiple Premium keys → a tier picker popup appears (auto-picks after 60s if ignored)

### ⌨️ Default Keybinds

| Key | Function |
|-----|----------|
| `RightShift` | Open/Close Menu |
| `Ctrl + F` | Open Search Palette |
| `Escape` | Close menu / current dialog |

> Per-feature keybinds (Aimbot, Silent Aim, Ragebot, Movement...) can be changed in each feature's menu.

### 💎 FREE vs PREMIUM

The script gates features by **tab** and **setting key**. In FREE mode:
- Only tabs in `FREE_TABS` are shown: `Settings`, `General`, `Config Profiles`, `Theme`, `Combat`, `Aimbot`, `Silent Aim`, `Automation`, `Match Flow`, `Auto Loadout`, `In-Match Automation`, `Detection`, `Cosmetics`, `Presets`, `Overview`, `Skins`, `Wraps`, `Charms`, `Finishers`, `Visuals`, `Player ESP`, `Crosshair`, `Player`, `Movement`
- Settings under `FREE_CONFIG_KEYS` are applied (Theme, Esp, Aimbot, SilentAim, Movement, AutoLoadout, AutoRespawn, AutoVote, AutoQueue, AutoBan, HackerDetector, ModDetector...)
- PREMIUM settings are hidden from UI and **preserved in the config file** (not deleted on save)

> For exact FREE / PREMIUM breakdown per feature, check the menu after running the script (hidden tabs = PREMIUM).

### 🌐 Buy Premium

Visit: `https://kph-key.vyk103736.workers.dev/buy`

### 📂 Storage Paths

| Purpose | Path |
|---------|------|
| Main config | `kpchookv6/rivals_v3/configs/` |
| Cosmetics preset | `kpchookv6/rivals_v3/cosmetics/states/` |
| General state | `kpchookv6/rivals/` |
| Language | `kpchookv6/lang.cfg` |
| Logo | `kpchookv6/logo.png` |
| Custom images | `kpchookv6/image_storage.json` + `kpchookv6/rivals/esp_images/` |
| Custom sounds | `kpchookv6/sfx_sounds.json` |
| Custom skyboxes | `kpchookv6/rivals/skyboxes.json` |
| Movement recorder | `kpchookv6/rivals/movement_recorder/` |
| Selected tier | `kpchook/selected_tier.json` |

### ⚠️ Notes

- The script **does not** store your key on any server
- Built **specifically for Rivals** — running in the wrong game will error and abort
- Requires executor support: `hookmetamethod`, `getgc`, `getrawmetatable`, `setrawmetatable`, `setconstant`, `getconstants`, `setupvalue`, `getupvalues`, `firetouchinterest`, `getcustomasset`, `Drawing`, `setclipboard`, `queue_on_teleport`, `gethui`
- Recommended to use on **alternate accounts** — use responsibly
- If the script prints "PlayerScripts.Controllers not found" → wrong game or game not loaded yet; remove from autoexec and retry

---

<div align="center">

**Made with ❤️ by KPCHOOK Team**

*Script được cung cấp cho mục đích giáo dục. Sử dụng có trách nhiệm.*
*Script is provided for educational purposes. Use responsibly.*

</div>
