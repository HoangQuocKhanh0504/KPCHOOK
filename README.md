# KPCUI

> Thư viện giao diện (UI Library) dành cho Roblox Executor — nhẹ, đẹp, dễ dùng, có sẵn Logo + Avatar và 7 theme.
> A lightweight UI Library for Roblox Executors — clean, easy to use, built-in Logo + Avatar and 7 themes.

![Version](https://img.shields.io/badge/version-1.3.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Language](https://img.shields.io/badge/lang-Lua-purple)

---

## 📖 Mục lục / Table of Contents

### 🇻🇳 Tiếng Việt
- Giới thiệu
- Cài đặt
- Bắt đầu nhanh
- Window
- Tab
- Elements
- Notify
- Theme
- Logo
- Avatar
- Chống trồng menu (Guard)
- Flag System
- Ví dụ đầy đủ
- API Reference
- Web Playground

### 🇬🇧 English
- Introduction
- Installation
- Quick Start
- Window
- Tab
- Elements
- Notify
- Theme
- Logo
- Avatar
- Single-Instance Guard
- Flag System
- Full Example
- API Reference
- Web Playground

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
```

### Link Raw (dự phòng)

```lua
local KPCUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangQuocKhanh0504/KPCHOOK/refs/heads/root/KPC-Hub/KPCUI.lua"))()
```

### Load an toàn (có error handling)

```lua
local success, KPCUI = pcall(function()
    return loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/HoangQuocKhanh0504/KPCHOOK@root/KPC-Hub/KPCUI.lua"))()
end)

if not success or not KPCUI then
    warn("[KPCUI] Không thể load thư viện")
    return
end

print("[KPCUI] Loaded v" .. KPCUI.Version)
```

---

## Bắt đầu nhanh

Script tối thiểu để tạo 1 menu:

```lua
local KPCUI = loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/HoangQuocKhanh0504/KPCHOOK@root/KPC-Hub/KPCUI.lua"))()

local Window = KPCUI:CreateWindow({
    Name = "My Script",
    ToggleUIKeybind = Enum.KeyCode.RightShift,
})

local Tab = Window:CreateTab("Main", "🏠")

Tab:CreateButton({
    Name = "Click Me",
    Callback = function()
        KPCUI:Notify({ Title = "Hello", Content = "Button clicked!", Duration = 3 })
    end,
})
```

**Kết quả:** Menu hiện ra với:
- Logo (mặc định bật)
- Avatar (mặc định bật)
- 1 tab "Main" với 1 button
- Bấm `RightShift` để bật/tắt menu

---

## Window

`Window` là cửa sổ chính chứa tất cả tab và element.

### Cú pháp

```lua
local Window = KPCUI:CreateWindow(cfg)
```

### Bảng config

| Thuộc tính | Kiểu | Mặc định | Mô tả |
|---|---|---|---|
| `Name` | string | `"KPCUI"` | Tên hiển thị trên title bar |
| `LoadingTitle` | string | `Name` | Tiêu đề lúc khởi động |
| `LoadingSubtitle` | string | `""` | Phụ đề lúc khởi động |
| `ToggleUIKeybind` | KeyCode | `RightShift` | Phím bật/tắt menu |
| `Width` | number | `720` | Chiều rộng (chỉ PC) |
| `Height` | number | `480` | Chiều cao (chỉ PC) |

### Config Logo

```lua
Logo = {
    Enabled = true,
    Image = "https://...",
    Size = 120,
    OffsetY = 0,
}
```

### Config Avatar

```lua
Avatar = {
    Enabled = true,
    Side = "Left",
    Size = 110,
    OffsetY = 70,
    BorderColor = Color3.fromRGB(255, 90, 30),
    BorderThickness = 3,
}
```

### Config Guard

```lua
Guard = {
    Enabled = true,
    Key = "KPCUI_INSTANCE",
}
```

### Ví dụ đầy đủ

```lua
local Window = KPCUI:CreateWindow({
    Name = "KPC Script Hub",
    LoadingTitle = "KPC Script Hub v1.0",
    LoadingSubtitle = "by KPC",
    ToggleUIKeybind = Enum.KeyCode.RightShift,
    Width = 800,
    Height = 500,

    Logo = {
        Enabled = true,
        Image = "https://cdn.jsdelivr.net/gh/HoangQuocKhanh0504/KPCHOOK@root/LOGO-KPCHOOK.png",
        Size = 130,
        OffsetY = -20,
    },

    Avatar = {
        Enabled = true,
        Side = "Left",
        Size = 120,
        OffsetY = 80,
        BorderColor = Color3.fromRGB(0, 200, 255),
        BorderThickness = 4,
    },

    Guard = {
        Enabled = true,
    },
})
```

### Phương thức của Window

| Method | Trả về | Mô tả |
|---|---|---|
| `Window:CreateTab(name, icon)` | Tab | Tạo tab mới |
| `Window:SelectTab(name)` | — | Chuyển sang tab chỉ định |
| `Window:UpdateStats(fps, ping)` | — | Hiển thị FPS/Ping ở title bar |
| `Window:Collapse()` | — | Thu nhỏ menu |
| `Window:Expand()` | — | Mở rộng menu |
| `Window:IsVisible()` | bool | Menu đang hiện hay ẩn |
| `Window:SetTitle(text)` | — | Đổi tiêu đề |
| `Window:SetSubtitle(text)` | — | Đổi phụ đề |
| `Window:Destroy()` | — | Xoá window |

### Ví dụ

```lua
-- Cập nhật stats mỗi giây
task.spawn(function()
    while task.wait(1) do
        local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
        local ping = math.floor(game:GetService("Players").LocalPlayer:GetNetworkPing() * 1000)
        Window:UpdateStats(fps, ping)
    end
end)

-- Đổi tiêu đề động
Window:SetTitle("KPC Hub — " .. game.PlaceId)
```

---

## Tab

Tab là nơi chứa các element, hiển thị trên sidebar.

### Cú pháp

```lua
local Tab = Window:CreateTab(name, icon)
```

| Tham số | Kiểu | Mô tả |
|---|---|---|
| `name` | string | Tên tab hiển thị |
| `icon` | string | Emoji hoặc ký tự (có thể `""`) |

### Ví dụ

```lua
local TabMain     = Window:CreateTab("Main", "🏠")
local TabCombat   = Window:CreateTab("Combat", "⚔️")
local TabVisual   = Window:CreateTab("Visual", "👁️")
local TabMovement = Window:CreateTab("Movement", "🏃")
local TabSettings = Window:CreateTab("Settings", "⚙️")
```

### Điều khiển tab

```lua
Window:SelectTab("Combat")
```

### Search

Gõ vào ô search ở đầu sidebar → tab không khớp tên sẽ tự ẩn. Tìm kiếm không phân biệt hoa thường.

---

## Elements

### Section

```lua
Tab:CreateSection("General Settings")
```

### Label

```lua
local label = Tab:CreateLabel("Player: Loading...")
label:Set("Player: NewName")
label:Get()
```

| Method | Trả về | Mô tả |
|---|---|---|
| `label:Set(text)` | — | Đổi nội dung |
| `label:Get()` | string | Lấy nội dung hiện tại |

### Button

```lua
local btn = Tab:CreateButton({
    Name = "Teleport to Spawn",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
        end
    end,
})
btn:Set("New Text")
btn:Get()
```

| Thuộc tính | Kiểu | Bắt buộc | Mô tả |
|---|---|---|---|
| `Name` | string | ✅ | Text hiển thị trên nút |
| `Callback` | function | ❌ | Hàm gọi khi click |

### Toggle

```lua
local toggle = Tab:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Flag = "ESP_Enabled",
    Callback = function(value)
        print("ESP:", value)
    end,
})
toggle:Set(true)
toggle:Get()
```

| Thuộc tính | Kiểu | Bắt buộc | Mô tả |
|---|---|---|---|
| `Name` | string | ✅ | Text hiển thị |
| `CurrentValue` | bool | ❌ | Trạng thái ban đầu |
| `Flag` | string | ❌ | Lưu vào FlagStore |
| `Callback` | function | ❌ | Nhận `(value: bool)` |

### Slider

```lua
local slider = Tab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(value)
        print("Speed:", value)
    end,
})
slider:Set(100)
slider:Get()
```

| Thuộc tính | Kiểu | Bắt buộc | Mô tả |
|---|---|---|---|
| `Name` | string | ✅ | Text hiển thị |
| `Range` | `{min, max}` | ✅ | Khoảng giá trị |
| `Increment` | number | ❌ | Bước nhảy (mặc định `1`) |
| `Suffix` | string | ❌ | Đơn vị (VD: `"%"`, `" px"`) |
| `CurrentValue` | number | ❌ | Giá trị ban đầu |
| `Flag` | string | ❌ | Lưu vào FlagStore |
| `Callback` | function | ❌ | Nhận `(value: number)` |

### Input

```lua
local input = Tab:CreateInput({
    Name = "Webhook URL",
    PlaceholderText = "https://discord.com/api/webhooks/...",
    CurrentValue = "",
    Flag = "WebhookURL",
    Callback = function(text)
        print("Input:", text)
    end,
})
input:Set("new")
input:Get()
```

| Thuộc tính | Kiểu | Bắt buộc | Mô tả |
|---|---|---|---|
| `Name` | string | ✅ | Text hiển thị |
| `PlaceholderText` | string | ❌ | Placeholder khi rỗng |
| `CurrentValue` | string | ❌ | Giá trị ban đầu |
| `Flag` | string | ❌ | Lưu vào FlagStore |
| `Callback` | function | ❌ | Nhận `(text: string)` |

### Dropdown

```lua
local dropdown = Tab:CreateDropdown({
    Name = "Aim Part",
    Options = {"Head", "Torso", "Random", "Nearest"},
    CurrentOption = {"Head"},
    Flag = "AimPart",
    Callback = function(opt)
        print("Selected:", opt[1])
    end,
})
dropdown:Set("Torso")
dropdown:Get()
dropdown:Refresh({"New A", "New B"}, true)
```

| Thuộc tính | Kiểu | Bắt buộc | Mô tả |
|---|---|---|---|
| `Name` | string | ✅ | Text hiển thị |
| `Options` | `{string...}` | ✅ | Danh sách options |
| `CurrentOption` | `{string}` | ❌ | Option ban đầu (bọc trong `{}`) |
| `Flag` | string | ❌ | Lưu vào FlagStore dạng `{option}` |
| `Callback` | function | ❌ | Nhận `(opt: {string})` — `opt[1]` là giá trị |

### ColorPicker

```lua
local picker = Tab:CreateColorPicker({
    Name = "ESP Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "ESPColor",
    Callback = function(color)
        print("Color:", color.R, color.G, color.B)
    end,
})
picker:Set(Color3.fromRGB(0, 255, 0))
picker:Get()
```

| Thuộc tính | Kiểu | Bắt buộc | Mô tả |
|---|---|---|---|
| `Name` | string | ✅ | Text hiển thị |
| `Color` | Color3 | ❌ | Màu ban đầu |
| `Flag` | string | ❌ | Lưu Color3 vào FlagStore |
| `Callback` | function | ❌ | Nhận `(color: Color3)` |

### Keybind

```lua
local keybind = Tab:CreateKeybind({
    Name = "Toggle Key",
    CurrentKeybind = Enum.KeyCode.F,
    Flag = "ToggleKey",
    Callback = function(key)
        print("Key:", key.Name)
    end,
})
keybind:Set(Enum.KeyCode.G)
keybind:Get()
```

| Thuộc tính | Kiểu | Bắt buộc | Mô tả |
|---|---|---|---|
| `Name` | string | ✅ | Text hiển thị |
| `CurrentKeybind` | KeyCode | ❌ | Phím ban đầu |
| `Flag` | string | ❌ | Lưu KeyCode vào FlagStore |
| `Callback` | function | ❌ | Nhận `(key: Enum.KeyCode)` |

---

## Notify

```lua
KPCUI:Notify({
    Title = "Thông báo",
    Content = "Nội dung thông báo",
    Duration = 3,
})
```

| Thuộc tính | Kiểu | Bắt buộc | Mô tả |
|---|---|---|---|
| `Title` | string | ❌ | Tiêu đề (mặc định `"Thông báo"`) |
| `Content` | string | ❌ | Nội dung |
| `Duration` | number | ❌ | Thời gian hiển thị (giây, mặc định `3`) |

**Lịch sử thông báo:**

```lua
KPCUI:GetHistory()    -- trả về table lịch sử
KPCUI:ClearHistory()  -- xoá lịch sử
```

Giới hạn 50 thông báo gần nhất.

---

## Theme

**7 theme có sẵn:**

| Theme | Màu chủ đạo | Phù hợp |
|---|---|---|
| `BloodRed` | Đỏ cam | Mặc định, mạnh mẽ |
| `DarkBlue` | Xanh dương đậm | Chuyên nghiệp, công nghệ |
| `Amethyst` | Tím | Sang trọng, bí ẩn |
| `Green` | Xanh lá | Tự nhiên, tươi mát |
| `Ocean` | Xanh biển | Dịu mắt, mát mẻ |
| `Serenity` | Xám bạc | Tối giản, thanh lịch |
| `Light` | Trắng sáng | Ban ngày, dễ đọc |

### Đổi theme

```lua
KPCUI:SetTheme("DarkBlue")
```

**Theme sẽ áp dụng NGAY LẬP TỨC** cho toàn bộ UI — không cần restart hay recreate.

### Lấy thông tin theme

```lua
print(KPCUI:GetTheme())    -- "DarkBlue"
print(KPCUI:GetThemes())   -- {"Amethyst", "BloodRed", "DarkBlue", ...}
```

### Ví dụ dropdown chọn theme

```lua
Tab:CreateDropdown({
    Name = "Theme",
    Options = KPCUI:GetThemes(),
    CurrentOption = {KPCUI:GetTheme()},
    Callback = function(opt)
        KPCUI:SetTheme(opt[1])
        KPCUI:Notify({ Title = "Theme", Content = "Đã đổi: " .. opt[1], Duration = 2 })
    end,
})
```

---

## Logo

**Mặc định BẬT.** Logo hiển thị phía trên menu, giữa theo chiều ngang, và **bám cứng** theo menu khi kéo.

### Điều khiển

```lua
KPCUI:SetLogoEnabled(false)                       -- Tắt
KPCUI:SetLogoEnabled(true)                        -- Bật lại
KPCUI:SetLogoImage("https://example.com/logo.png")-- Đổi ảnh
KPCUI:SetLogoSize(150)                            -- Kích thước (px)
KPCUI:SetLogoOffsetY(-50)                         -- Dịch dọc (âm = lên)
KPCUI:GetLogoConfig()                             -- Lấy config
```

### Ví dụ

```lua
-- Tắt logo ngay khi tạo window
local Window = KPCUI:CreateWindow({
    Name = "My Script",
    Logo = { Enabled = false },
})

-- Hoặc tắt sau
KPCUI:SetLogoEnabled(false)
```

---

## Avatar

**Mặc định BẬT.** Avatar hiển thị **cạnh menu** (trái hoặc phải), bám cứng theo menu khi kéo.

### Điều khiển

```lua
KPCUI:SetAvatarEnabled(false)                              -- Tắt
KPCUI:SetAvatarSide("Right")                               -- "Left" hoặc "Right"
KPCUI:SetAvatarSize(130)                                   -- Kích thước (px)
KPCUI:SetAvatarOffsetY(50)                                 -- Dịch dọc từ title bar
KPCUI:SetAvatarBorderColor(Color3.fromRGB(0, 200, 255))    -- Màu viền
KPCUI:SetAvatarBorderThickness(5)                          -- Độ dày viền
KPCUI:GetAvatarConfig()                                    -- Lấy config
```

### Ví dụ

```lua
-- Tắt avatar ngay khi tạo window
local Window = KPCUI:CreateWindow({
    Name = "My Script",
    Avatar = { Enabled = false },
})

-- Đổi sang phải
KPCUI:SetAvatarSide("Right")

-- Viền cầu vồng
task.spawn(function()
    local hue = 0
    while task.wait(0.05) do
        hue = (hue + 0.01) % 1
        KPCUI:SetAvatarBorderColor(Color3.fromHSV(hue, 1, 1))
    end
end)
```

---

## Chống trồng menu (Guard)

**Mặc định BẬT.** Khi bạn chạy script **nhiều lần liên tiếp**, menu cũ sẽ **tự động bị xoá** trước khi tạo menu mới.

### Điều khiển

```lua
KPCUI:SetGuardEnabled(true)
KPCUI:IsGuardEnabled()        -- true / false
KPCUI:SetGuardKey("MY_KEY")   -- Đổi key lưu trong getgenv()
KPCUI:GetGuardKey()           -- "MY_KEY"
KPCUI:ClearOtherInstances()   -- Xoá tất cả instance khác
KPCUI:GetInstanceCount()      -- Đếm số instance đang chạy
```

### Tắt guard

```lua
local Window = KPCUI:CreateWindow({
    Name = "My Script",
    Guard = { Enabled = false },
})
```

---

## Flag System

**Flag** là cơ chế lưu trữ giá trị của element, giúp bạn truy cập giá trị mà không cần reference đến element.

### Khai báo flag

```lua
Tab:CreateToggle({
    Name = "Enable ESP",
    Flag = "ESP_Enabled",
    Callback = function(v) end,
})

Tab:CreateSlider({
    Name = "Distance",
    Range = {50, 3000},
    Flag = "ESP_Distance",
    Callback = function(v) end,
})
```

### Đọc/ghi flag

```lua
local enabled = KPCUI:GetFlag("ESP_Enabled")     -- bool
local distance = KPCUI:GetFlag("ESP_Distance")   -- number

KPCUI:SetFlag("ESP_Enabled", true)
KPCUI:SetFlag("ESP_Distance", 1500)
```

### Đọc toàn bộ flags

```lua
local allFlags = KPCUI:GetAllFlags()
for name, value in pairs(allFlags) do
    print(name, value)
end
```

### Lưu config (ví dụ)

```lua
-- Lưu
local function saveConfig()
    local data = KPCUI:GetAllFlags()
    writefile("myconfig.json", game:GetService("HttpService"):JSONEncode(data))
end

-- Load
local function loadConfig()
    if not isfile("myconfig.json") then return end
    local data = game:GetService("HttpService"):JSONDecode(readfile("myconfig.json"))
    for flag, value in pairs(data) do
        KPCUI:SetFlag(flag, value)
    end
end
```

---

## Ví dụ đầy đủ

```lua
-- ============================================================
-- KPCUI Full Demo
-- ============================================================

local KPCUI = loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/HoangQuocKhanh0504/KPCHOOK@root/KPC-Hub/KPCUI.lua"))()

local Window = KPCUI:CreateWindow({
    Name = "KPCUI Demo",
    LoadingTitle = "KPCUI Demo v1.0",
    LoadingSubtitle = "Full showcase",
    ToggleUIKeybind = Enum.KeyCode.RightShift,
})

-- TAB 1: MAIN
local TabMain = Window:CreateTab("Main", "🏠")

TabMain:CreateSection("Buttons")
TabMain:CreateButton({
    Name = "Show Notification",
    Callback = function()
        KPCUI:Notify({
            Title = "Hello!",
            Content = "This is a notification",
            Duration = 3,
        })
    end,
})

TabMain:CreateSection("Toggles")
local espToggle = TabMain:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Flag = "ESP_Enabled",
    Callback = function(v)
        KPCUI:Notify({
            Title = "ESP",
            Content = v and "Enabled" or "Disabled",
            Duration = 2,
        })
    end,
})

TabMain:CreateSection("Sliders")
TabMain:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(v)
        local hum = game.Players.LocalPlayer.Character
                    and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end,
})

TabMain:CreateSection("Inputs")
TabMain:CreateInput({
    Name = "Player Name",
    PlaceholderText = "Enter name...",
    Flag = "PlayerName",
    Callback = function(text) end,
})

-- TAB 2: SELECTION
local TabSelect = Window:CreateTab("Selection", "🎯")

TabSelect:CreateSection("Dropdown")
TabSelect:CreateDropdown({
    Name = "Aim Part",
    Options = {"Head", "Torso", "Random", "Nearest"},
    CurrentOption = {"Head"},
    Flag = "AimPart",
    Callback = function(opt)
        print("Aim:", opt[1])
    end,
})

TabSelect:CreateSection("Color")
TabSelect:CreateColorPicker({
    Name = "Highlight Color",
    Color = Color3.fromRGB(255, 90, 30),
    Flag = "HighlightColor",
    Callback = function(color) end,
})

TabSelect:CreateSection("Keybind")
TabSelect:CreateKeybind({
    Name = "Toggle Key",
    CurrentKeybind = Enum.KeyCode.F,
    Flag = "ToggleKey",
    Callback = function(key)
        print("Key:", key.Name)
    end,
})

-- TAB 3: SETTINGS
local TabSettings = Window:CreateTab("Settings", "⚙️")

TabSettings:CreateSection("Theme")
TabSettings:CreateDropdown({
    Name = "Chọn Theme",
    Options = KPCUI:GetThemes(),
    CurrentOption = {KPCUI:GetTheme()},
    Callback = function(opt)
        KPCUI:SetTheme(opt[1])
        KPCUI:Notify({ Title = "Theme", Content = "Đã đổi: " .. opt[1], Duration = 2 })
    end,
})

TabSettings:CreateSection("Logo")
TabSettings:CreateToggle({
    Name = "Hiện Logo",
    CurrentValue = true,
    Callback = function(v) KPCUI:SetLogoEnabled(v) end,
})

TabSettings:CreateSection("Avatar")
TabSettings:CreateToggle({
    Name = "Hiện Avatar",
    CurrentValue = true,
    Callback = function(v) KPCUI:SetAvatarEnabled(v) end,
})

TabSettings:CreateButton({
    Name = "Đổi Avatar sang phải",
    Callback = function() KPCUI:SetAvatarSide("Right") end,
})

TabSettings:CreateButton({
    Name = "Đổi Avatar sang trái",
    Callback = function() KPCUI:SetAvatarSide("Left") end,
})
```

---

## API Reference (Tiếng Việt)

### KPCUI (main)

| Method | Trả về | Mô tả |
|---|---|---|
| `KPCUI:CreateWindow(cfg)` | Window | Tạo cửa sổ |
| `KPCUI:Notify(opts)` | — | Hiện thông báo |
| `KPCUI:SetFlag(flag, value)` | — | Set giá trị flag |
| `KPCUI:GetFlag(flag)` | any | Lấy giá trị flag |
| `KPCUI:GetAllFlags()` | table | Lấy toàn bộ flag |
| `KPCUI:SetTheme(name)` | bool | Đổi theme |
| `KPCUI:GetTheme()` | string | Theme hiện tại |
| `KPCUI:GetThemes()` | table | Danh sách theme |
| `KPCUI:SetToggleKeybind(kc)` | — | Đổi phím toggle UI |
| `KPCUI:SetKeybind(kc)` | — | Alias của SetToggleKeybind |
| `KPCUI:GetHistory()` | table | Lịch sử notify |
| `KPCUI:ClearHistory()` | — | Xoá lịch sử |
| `KPCUI:GetScreen()` | ScreenGui | Lấy ScreenGui chính |
| `KPCUI:Destroy()` | — | Xoá toàn bộ UI |
| `KPCUI.Version` | string | Version thư viện |

### Logo

| Method | Mô tả |
|---|---|
| `KPCUI:SetLogoEnabled(bool)` | Bật/tắt logo |
| `KPCUI:SetLogoImage(url)` | Đổi ảnh logo |
| `KPCUI:SetLogoSize(px)` | Đổi kích thước |
| `KPCUI:SetLogoOffsetY(px)` | Dịch dọc |
| `KPCUI:GetLogoConfig()` | Lấy config |

### Avatar

| Method | Mô tả |
|---|---|
| `KPCUI:SetAvatarEnabled(bool)` | Bật/tắt |
| `KPCUI:SetAvatarSide("Left"/"Right")` | Đổi bên |
| `KPCUI:SetAvatarSize(px)` | Đổi kích thước |
| `KPCUI:SetAvatarOffsetY(px)` | Dịch dọc |
| `KPCUI:SetAvatarBorderColor(Color3)` | Đổi màu viền |
| `KPCUI:SetAvatarBorderThickness(px)` | Độ dày viền |
| `KPCUI:GetAvatarConfig()` | Lấy config |

### Guard

| Method | Mô tả |
|---|---|
| `KPCUI:SetGuardEnabled(bool)` | Bật/tắt guard |
| `KPCUI:IsGuardEnabled()` | Kiểm tra |
| `KPCUI:SetGuardKey(str)` | Đổi key |
| `KPCUI:GetGuardKey()` | Lấy key |
| `KPCUI:ClearOtherInstances()` | Xoá instance khác |
| `KPCUI:GetInstanceCount()` | Đếm instance |

---

## Web Playground

Bạn có thể test KPCUI **trực tiếp trên trình duyệt** mà không cần Roblox executor!

**Truy cập:** `/page/index.html` (trong repo này)

**Tính năng:**
- 🖥️ **Trình mô phỏng GUI** — xem menu render như thế nào
- ✍️ **Trình soạn code** — viết code Lua KPCUI và xem kết quả
- ▶️ **Nút Run** — chạy code demo
- 🎨 **Đổi theme trực tiếp** — test 7 theme ngay lập tức
- 📱 **Responsive** — dùng được trên mobile
- 📚 **Ví dụ sẵn có** — 5 demo mẫu để học

**Ví dụ code test nhanh:**

```lua
Window("My Test")
Tab("Main", "🏠")
Section("General")
Button("Click Me", function()
    Notify("Hello", "Button clicked!")
end)
Toggle("Enable ESP", false, function(v)
    Notify("ESP", v and "ON" or "OFF")
end)
Slider("Speed", 16, 500, 100, " studs")
Dropdown("Aim Part", {"Head", "Torso", "Random"})
Input("Name", "Enter name...")
ColorPicker("Color", "#FF5A1E")
Keybind("Toggle Key", "F")
```

---

# 🇬🇧 English

## Introduction

**KPCUI** is a UI Library for Roblox Executors, designed with the philosophy:

- **Lightweight** — Only ~2000 lines of code, fast loading, no external dependencies
- **Beautiful** — 7 built-in themes, smooth animations, Logo + Avatar support
- **Easy to use** — Simple API, similar to Rayfield
- **Flexible** — Change theme instantly, toggle any component via config or API
- **Safe** — Single-instance guard prevents stacking menus

**Key Features:**

| Feature | Description |
|---|---|
| 🎨 7 Themes | BloodRed, DarkBlue, Amethyst, Green, Ocean, Serenity, Light |
| 🖼️ Logo | Built-in, sticks to menu, customizable |
| 👤 Avatar | Built-in, shows beside menu, customizable |
| 🛡️ Guard | Auto-destroy old menu on re-run |
| 🔍 Search | Search tabs in sidebar |
| 📢 Notify | Slide-in notifications with progress bar |
| 🎯 Flag | Store values from any element |
| 🎬 Animation | Every action has smooth tween |
| 📱 Mobile | Auto-adjust size for mobile |
| 🖱️ Drag | Free menu drag with viewport clamp |

---

## Installation

### CDN Link (recommended)

```lua
local KPCUI = loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/HoangQuocKhanh0504/KPCHOOK@root/KPC-Hub/KPCUI.lua"))()
```

### Raw Link (fallback)

```lua
local KPCUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangQuocKhanh0504/KPCHOOK/refs/heads/root/KPC-Hub/KPCUI.lua"))()
```

---

## Quick Start

```lua
local KPCUI = loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/HoangQuocKhanh0504/KPCHOOK@root/KPC-Hub/KPCUI.lua"))()

local Window = KPCUI:CreateWindow({
    Name = "My Script",
    ToggleUIKeybind = Enum.KeyCode.RightShift,
})

local Tab = Window:CreateTab("Main", "🏠")

Tab:CreateButton({
    Name = "Click Me",
    Callback = function()
        KPCUI:Notify({ Title = "Hello", Content = "Button clicked!", Duration = 3 })
    end,
})
```

---

## Window

```lua
local Window = KPCUI:CreateWindow({
    Name = "My Script",
    LoadingTitle = "My Script v1.0",
    LoadingSubtitle = "by KPC",
    ToggleUIKeybind = Enum.KeyCode.RightShift,
    Width = 720,
    Height = 480,

    Logo = {
        Enabled = true,
        Image = "https://...",
        Size = 120,
        OffsetY = 0,
    },

    Avatar = {
        Enabled = true,
        Side = "Left",
        Size = 110,
        OffsetY = 70,
        BorderColor = Color3.fromRGB(255, 90, 30),
        BorderThickness = 3,
    },

    Guard = {
        Enabled = true,
    },
})
```

| Method | Description |
|---|---|
| `Window:CreateTab(name, icon)` | Create new tab |
| `Window:SelectTab(name)` | Switch to tab |
| `Window:UpdateStats(fps, ping)` | Show FPS/Ping |
| `Window:Collapse()` | Minimize |
| `Window:Expand()` | Expand |
| `Window:IsVisible()` | Check visibility |
| `Window:SetTitle(text)` | Set title |
| `Window:SetSubtitle(text)` | Set subtitle |
| `Window:Destroy()` | Destroy window |

---

## Tab

```lua
local Tab = Window:CreateTab("Main", "🏠")
```

---

## Elements

### Section

```lua
Tab:CreateSection("General")
```

### Label

```lua
local label = Tab:CreateLabel("Text")
label:Set("New")
label:Get()
```

### Button

```lua
Tab:CreateButton({
    Name = "Click",
    Callback = function() end,
})
```

### Toggle

```lua
Tab:CreateToggle({
    Name = "Enable",
    CurrentValue = false,
    Flag = "Flag",
    Callback = function(v) end,
})
```

### Slider

```lua
Tab:CreateSlider({
    Name = "Speed",
    Range = {0, 100},
    Increment = 1,
    Suffix = "%",
    CurrentValue = 50,
    Callback = function(v) end,
})
```

### Input

```lua
Tab:CreateInput({
    Name = "Name",
    PlaceholderText = "...",
    Callback = function(text) end,
})
```

### Dropdown

```lua
Tab:CreateDropdown({
    Name = "Select",
    Options = {"A", "B"},
    CurrentOption = {"A"},
    Callback = function(opt) end,
})
```

### ColorPicker

```lua
Tab:CreateColorPicker({
    Name = "Color",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(color) end,
})
```

### Keybind

```lua
Tab:CreateKeybind({
    Name = "Key",
    CurrentKeybind = Enum.KeyCode.F,
    Callback = function(key) end,
})
```

---

## Notify

```lua
KPCUI:Notify({
    Title = "Title",
    Content = "Content",
    Duration = 3,
})
```

---

## Theme

**7 themes:** `BloodRed`, `DarkBlue`, `Amethyst`, `Green`, `Ocean`, `Serenity`, `Light`

```lua
KPCUI:SetTheme("DarkBlue")
KPCUI:GetTheme()
KPCUI:GetThemes()
```

---

## Logo

```lua
KPCUI:SetLogoEnabled(false)
KPCUI:SetLogoImage("https://...")
KPCUI:SetLogoSize(150)
KPCUI:SetLogoOffsetY(-50)
```

---

## Avatar

```lua
KPCUI:SetAvatarEnabled(false)
KPCUI:SetAvatarSide("Right")
KPCUI:SetAvatarSize(130)
KPCUI:SetAvatarBorderColor(Color3.fromRGB(0, 200, 255))
KPCUI:SetAvatarBorderThickness(5)
```

---

## Single-Instance Guard

```lua
KPCUI:SetGuardEnabled(true)
KPCUI:IsGuardEnabled()
KPCUI:ClearOtherInstances()
KPCUI:GetInstanceCount()
```

---

## Flag System

```lua
KPCUI:GetFlag("MyFlag")
KPCUI:SetFlag("MyFlag", value)
KPCUI:GetAllFlags()
```

---

## Full Example

See Vietnamese section for the full example.

---

## API Reference (English)

### Main

| Method | Returns | Description |
|---|---|---|
| `KPCUI:CreateWindow(cfg)` | Window | Create window |
| `KPCUI:Notify(opts)` | — | Show notification |
| `KPCUI:SetFlag(flag, value)` | — | Set flag |
| `KPCUI:GetFlag(flag)` | any | Get flag |
| `KPCUI:GetAllFlags()` | table | Get all flags |
| `KPCUI:SetTheme(name)` | bool | Change theme |
| `KPCUI:GetTheme()` | string | Current theme |
| `KPCUI:GetThemes()` | table | All themes |
| `KPCUI:SetToggleKeybind(kc)` | — | Change toggle key |
| `KPCUI:GetHistory()` | table | Notify history |
| `KPCUI:ClearHistory()` | — | Clear history |
| `KPCUI:Destroy()` | — | Destroy all UI |

---

## Web Playground

Test KPCUI **directly in your browser** without a Roblox executor!

**Access:** `/page/index.html`

**Features:**
- 🖥️ **GUI Simulator** — See how the menu renders
- ✍️ **Code Editor** — Write Lua KPCUI code and preview
- ▶️ **Run Button** — Execute demo code
- 🎨 **Live Theme Switch** — Test all 7 themes
- 📱 **Responsive** — Works on mobile
- 📚 **Examples** — 5 built-in demos

---

## 📝 License / Giấy phép

MIT License — Free to use for personal projects.
MIT License — Miễn phí sử dụng cho dự án cá nhân.

## 👤 Author / Tác giả

**KPC**
