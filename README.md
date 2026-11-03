# KPCHOOK v6

<div align="center">

![Version](https://img.shields.io/badge/version-6.0-orange)
![Platform](https://img.shields.io/badge/platform-Roblox-blue)
![Language](https://img.shields.io/badge/language-Lua-purple)

**Script toàn diện cho Rivals trên Roblox — Aimbot, Silent Aim, Ragebot, ESP, Cosmetics, World Visuals, Identity Spoofing và hơn thế nữa**

[🇻🇳 Tiếng Việt](#-tiếng-việt) | [🇬🇧 English](#-english)

</div>

---

## 🇻🇳 Tiếng Việt

### 📖 Giới thiệu

**KPCHOOK v6** là script hỗ trợ toàn diện dành riêng cho **Rivals** trên Roblox. Được xây dựng trên kiến trúc **ReactiveStore** hiện đại với hệ thống **Config Profiles** mạnh mẽ, **Cosmetic Skin Changer**, **Movement Recorder**, **World Visuals**, **Identity Spoofing** và giao diện song ngữ Việt–Anh hoạt động mượt trên cả PC lẫn Mobile.

> Script được **build riêng cho Rivals**. Nếu chạy ở game khác, script sẽ dừng và báo `PlayerScripts.Controllers not found` trong F9 console. Hãy xóa khỏi autoexec nếu không chơi Rivals.

### ✨ Tính năng

#### 🎯 Aimbot
- Aim theo camera, khóa mục tiêu (Target Lock)
- Aim Modes: **Lock / Linear / Spring / AI**
- Target Lock Modes: **ToggleLock / AutoLock / ManualOnly** (keybind riêng)
- Aim Point: **Center / Surface** (với Surface Reduction %, Preserve Depth)
- Hitbox Selection: **ClosestToCrosshair / Random** (với trọng số Head %)
- Activation Rules, Target Filters, Reaction Delay, Switch Delay
- FOV tùy chỉnh (Radius, Thickness, Fill, Animated, Follow Target)

#### 🎯 Silent Aim
- Aim không lộ — bullet bay thẳng vào hitbox
- Manipulate: **OnBestTarget / OnAllTargets** (đẩy hitbox khỏi tầm nhìn)
- Activation Chance (%), Reaction Delay, Switch Delay
- Activation Rules (NotReloading, ScopedIn)
- Target Filters, Hitbox Selection, Aim Point như Aimbot
- FOV + Follow Target
- Hỗ trợ hitbox R6/R15: HitboxHead, HitboxBody, HitboxHeadSmall, HitboxBodySmall

#### 🎯 Triggerbot
- Tự động bắn khi tâm ngắm vào địch
- Reaction Delay, Release Delay
- Activation Rules, Target Filters, Hitbox Selection

#### 🖱️ Flickbot
- Flick camera cực nhanh tới mục tiêu (Curvature + Humanness)
- Flick Duration, Shot Delay, Cooldown
- **Shoot** toggle (tự bắn sau khi flick)

#### ⚡ Ragebot
- **Hitscan Strategy** — bắn cực nhanh, desync
- **Melee Strategy** — auto attack, auto backstab (Knife), Riot Shield
- **Weapon Strategy**: Priority (Primary → Secondary → Melee), Enabled, On Empty (Reload/Swap/SwapOrReload)
- **Evasion**: Random / Translocate / **ProjectileBreaker**
  - ProjectileBreaker: DepthForward, DepthUp, Frequency, RepositionInterval, Fallback radius
- **Utilize Health Lead**, **Prioritize Hackers**, **Shoot Frames**, **Stability**
- **Reload Transport** — tự động reload khi hết đạn
- **Forced Crouch** trong lúc rage

#### 👁️ ESP (Player ESP)
- **Box**: Full / Corner, Filled Box + Animation (Swirl)
- **Box Image**: custom PNG
- **Name**, **Health Bar** (Solid/Gradient/Reactive), **Health Number**
- **Ammo Bar** (Solid/Gradient/Reactive)
- **Held Weapon**, **Distance**, **Rank** (Rank Spoof), **Winstreak**, **Deflecting**
- **Chams**: Legacy (BoxHandleAdornment) / Highlight + Glow
- **Skeleton** (limb lines), **Head Marker** (Cross/Circle/Diamond), **Tracer** (Origin/Target/Outline)
- **Text**: Font, Size, Case, Surround, Distance Scaling
- **Team-specific** styling (Enemy / Team tabs riêng)
- **Cull Heavy Operations** — tối ưu FPS ở khoảng cách xa

#### 🎵 Sound ESP
- Visualize footsteps và âm thanh khác
- **Source**: All / Enemies / Team / Self
- **Types**: Footsteps / Other
- **Mode**: Circle / Origin
- **Min Volume**, **Use Loudness Color**

#### 🎨 Custom Crosshair
- **Style**: Lines / Image
- **Lines**: Length, Thickness, Gap, Outline, Top/Bottom/Left/Right (màu riêng)
- **Rotation**: Angle (static) + Speed (spin)
- **Spread**: Range Min/Max + Speed (animated)
- **Animation**: Shimmer / Perimeter / PingPong
- **Text**: Content, Font, Size, Offset, Color, Outline, Animation
- **Follow Target**: Crosshair / Crosshair + Text
- **Baked texture** tự động khi xoay (tối ưu hiệu năng)

#### 🌀 Weapon Visuals
- **Viewmodel Position**: X/Y/Z/Pitch/Yaw/Roll offset
- **Bullet Tracers**: Style (Plain/Beam/Lightning/Trail/Zigzag/Heartrate/Chain/Glitch/Swirl)
  - Width, Lifetime, FadeTime, TextureLength, TextureSpeed, Emission, Glow, Expand Speed/Damper
- **Chams**: Arms / Held Item (Material, Color, Transparency, Strip Textures)
- **ViewModel Highlight**: Fill/Outline, AlwaysOnTop
- **Wireframe**: Arms / Held Item
- **Suppressions**: NoMuzzleFlash, NoGunTracers, NoShoot/Sprint/Equip/Reload Animation, NoMotion, NoCameraShake, NoCameraSway, NoSpread
- **Fire Rate Override**, **Recoil Reduction**, **Aim Speed**, **Cooldown Override**, **Melee Cooldown**, **Dash Cooldown**, **Extend Melee Range**, **Always Backstab**, **Infinite Double Jumps**
- **Grenade Fuse**: Impact / Throw, Remove Fuse

#### 🌀 Spin Camera
- Xoay camera (yaw/pitch) với tốc độ tùy chỉnh
- Spin Character *(Premium)*

#### 🏃 Movement
- **Walk Speed**: Multiplier 1–10
- **Sliding**: Multiplier riêng
- **Jump Power**: Multiplier 0.1–10
- **Flight**: Speed 25–500 *(Premium)*
- **Noclip** *(Premium)*
- **Auto Strafe**: Speed 1–200
- **Long Jump**: Under Feet / Camera Look, Force, UpwardVelocity, Behind
- **Infinite Double Jumps** *(Premium)*

#### 🎥 Movement Recorder
- Ghi/phát lại route di chuyển
- **Look Align Speed**, **Look Smoothness**, **Align Snap Distance**
- **Open Distance**, **Render Distance**
- **Recording Library** theo Map
- **Record** và **Replay** keybind riêng
- Phát lại có **Alignment Check** (tự phát hiện lệch hướng → dừng)

#### 🔓 Cosmetics (Rivals)
- **Unlock All Cosmetics**: Skin / Wrap / Charm / Finisher / Emote
- **Unlock by Rarity**: Legendary, Mythical, Unobtainable, v.v.
- **Skin Changer**: Apply To (All Weapons / từng weapon), Search
- **Wrap Changer**: Inverted toggle
- **Charm Changer** + **Rank Charm Override** (Season + Rank + Leaderboard Rank)
- **Finisher Changer**
- **Reroll Random Cosmetics**
- **Cosmetic Preset Library**: Create / Load / Save / Delete / Export / Import
- **Auto Save / Auto Load** preset
- **Show Active Cosmetics**, **Share Skins** (UserServer)

#### 🎭 Player / Character / Identity
- **Animation Player**: 26 emote có sẵn + Custom ID, Speed, Start/End range
- **Character Chams**: Material, Color, Transparency, Strip Textures
- **Device Spoof**: Desktop / Mobile / Console / VR
- **Identity Spoofing**:
  - **Local Player**: Name, DisplayName, Avatar, Ping, Keys, EventCurrency, Winstreak, Level, CasualWins, RankedWins, Win%, RankedELO, LeaderboardRank, FavoriteMap, NametagStatus (Prime/Contraband), Influencer, RobloxEmployee, VerifiedBadge, NosniyTeam
  - **Other Players**: tương tự + Winstreak, Level, Wins, Win%, ELO, LeaderboardRank

#### 🤖 Automation
- **Auto Queue**: Chọn Queue từ Matchmaking + Arcade
- **Auto Map Vote**: Chọn Maps
- **Auto Weapon Ban**: First Ban + Second Ban choices
- **Auto Loadout**: Per-Map / MultipleLoadouts / LoadoutPriority
- **Auto Pickup**: Ammo / Health
- **Auto Respawn**
- **Anti Katana**
- **Subspace Tripmines**: Auto Trigger, Team Trigger

#### 🔍 Detection
- **Hacker Detector**: Phát hiện speed hack, rotation bất thường — Notify, Color
- **Moderator Detector**: Check group 3461453 rank ≥ 100 — Notify/Kick/ToLobby
- **Mod Friends**: Bạn bè của moderator

#### 🌍 World Visuals
- **Lighting Override**:
  - ClockTime, GeographicLatitude, Brightness, ExposureCompensation
  - DisableGlobalShadows, ShadowSoftness, LightingStyle (Realistic/Soft), ShadowColor
  - Ambient (Indoor/Outdoor), ColorShift (Top/Bottom)
  - EnvironmentDiffuseScale, EnvironmentSpecularScale
  - Fog (Color/Start/End), Atmosphere (Density/Offset/Glare/Haze)
  - Prioritize Lighting Quality
- **Post Processing**:
  - Bloom (Intensity/Size/Threshold)
  - ColorCorrection (Tint/Saturation/Brightness/Contrast)
  - ColorGrading (Default/Retro)
  - DepthOfField, MotionBlur, SunRays
- **Skybox**: 39+ preset (GreenHaze, Space2, PinkMountains, Valentine, Galaxy, Storm, Nebula, Hell, v.v.) + Custom (6 face textures)
- **Ambient Sound**: Soft Rain, Light Rain + Custom sound, Volume
- **Weather**: Snow / Rain / Blizzard
  - Intensity, Rate, Height, Speed, Glow, Size, Spread
  - Wind Strength, Wind Angle
- **Lightning**:
  - Interval, Distance, Height, Thickness, Jaggedness, Branches, Flash
  - Sparks: Count, Thickness, Distance, Speed, Jaggedness
  - Explosion: Size, Bolts
  - Sound: Volume, Delay (theo khoảng cách), Sound ID

#### 🎨 UI / Theme
- **7 theme**: BloodRed, DarkBlue, Amethyst, Green, Ocean, Serenity, Light
- **Theme Colors**: Accent, Background, ElementBackground, Outline, SelectedTab, Text, ToggleCircle, ToggleBackground
- **Language**: English / Tiếng Việt (lưu tại `kpchookv6/lang.cfg`)
- **Menu Keybind** (mặc định `RightShift`)
- **Show Watermark** (FPS + Ping + Username + Tier)
- **Show Keybinds** (floating list có thể kéo)
- **Hide Floating Menu Button** (Mobile)
- **Edit On-screen Keybinds** (Mobile drag mode)
- **Notifications**: Enabled, Side, Size, Font, Offset
- **Config Profiles**: Create / Load / Save / Delete / Import / Export JSON
- **Auto Save / Auto Load** config
- **Silent Load** (không hiện menu khi load)
- **Re-run After Teleport** (queue_on_teleport)
- **Unload KPCHOOKv6**
- **Search Palette** (Ctrl+F) tìm setting nhanh
- **Sidebar** có thể thu gọn
- **Info Admin** (avatar 4LC_KFJ2)

### 📦 Hướng dẫn cài đặt

1. Mở executor (**Delta, Fluxus, Arceus X, Hydrogen, Wave...**)
2. Copy toàn bộ nội dung file `KPCHOOK_v6.lua`
3. Paste vào executor và Execute
4. Chọn ngôn ngữ (English / Tiếng Việt) lần đầu — lưu tại `kpchookv6/lang.cfg`
5. Script tự chờ `PlayerScripts.Controllers` sẵn sàng (tối đa 30s)
6. Menu tự mở sau khi boot (trừ khi bật `Silent Load`)
7. Mở/đóng menu bằng `RightShift`

### ⌨️ Phím tắt mặc định

| Phím | Chức năng |
|------|-----------|
| `RightShift` | Mở/Đóng Menu |
| `Ctrl + F` | Mở Search Palette |
| `Escape` | Đóng dialog/popup |
| `↑` / `↓` | Di chuyển trong Search |
| `Enter` | Chọn kết quả Search |

> Keybind từng tính năng (Aimbot, Silent Aim, Triggerbot, Ragebot, Flickbot, Movement, Long Jump, Movement Recorder) được cấu hình trong menu Settings hoặc trực tiếp trong tab tương ứng.

### 💎 FREE vs PREMIUM

| Tính năng | FREE | PREMIUM |
|-----------|:----:|:-------:|
| Aimbot | ✅ | ✅ |
| Silent Aim | ✅ | ✅ |
| Triggerbot | ✅ | ✅ |
| Flickbot | ✅ | ✅ |
| Ragebot (RageV1 + RageV2 + Evasion) | ❌ | ✅ |
| ESP (Player, Chams, Skeleton, Tracer, HeadMarker) | ✅ | ✅ |
| Sound ESP | ✅ | ✅ |
| Custom Crosshair | ✅ | ✅ |
| Weapon Visuals (Tracers, Chams, Highlight, Wireframe) | ✅ | ✅ |
| World Visuals (Lighting, PostFX, Sky, Weather, Lightning) | ✅ | ✅ |
| Movement (WalkSpeed, Jump, Sliding, Flight, AutoStrafe, LongJump) | ✅ | ✅ |
| Noclip | ❌ | ✅ |
| Infinite Double Jumps | ❌ | ✅ |
| Movement Recorder | ✅ | ✅ |
| Cosmetics (Skin/Wrap/Charm/Finisher/Emote + Rank Charm) | ❌ | ✅ |
| Identity Spoofing (Name, Avatar, Stats, Rank, Leaderboard) | ✅ | ✅ |
| Device Spoof | ✅ | ✅ |
| Animation Player | ✅ | ✅ |
| Automation (Queue/Vote/Ban/Loadout/Pickup/Respawn) | ✅ | ✅ |
| Hacker Detector | ✅ | ✅ |
| Moderator Detector | ✅ | ✅ |

> FREE chỉ thấy các tab trong `FREE_TABS`. Premium lấy tier từ API; nếu server down, script **retry vô hạn** mỗi 3s cho đến khi kết nối lại (chỉ dừng khi lỗi logic: key sai/hết hạn).

### 🌐 Mua Premium

Truy cập: `https://kph-key.vyk103736.workers.dev/buy`

Hỗ trợ **multi-tier** — nếu tài khoản có nhiều gói, script hiện **Tier Picker** khi boot (chọn gói hoặc tự động chọn gói đầu sau 60s).

### 📁 Cấu trúc file
