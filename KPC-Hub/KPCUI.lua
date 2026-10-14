-- ============================================================
-- KPCUI — Library giao diện cho Roblox Executor
-- Tác giả: KPC*
-- Version: 1.3.0
-- ============================================================

local KPCUI = {}
KPCUI.__index = KPCUI
KPCUI.Version = "1.0.0"

-- ============================================================
-- SERVICES
-- ============================================================
local Players              = game:GetService("Players")
local UserInputService     = game:GetService("UserInputService")
local RunService           = game:GetService("RunService")
local TweenService         = game:GetService("TweenService")
local CoreGui              = game:GetService("CoreGui")
local Lighting             = game:GetService("Lighting")
local ContextActionService = game:GetService("ContextActionService")
local lplr                 = Players.LocalPlayer

-- ============================================================
-- THEMES
-- ============================================================
local THEMES = {
    BloodRed = {
        bg = Color3.fromRGB(14, 8, 6), bg2 = Color3.fromRGB(22, 13, 10),
        panel = Color3.fromRGB(30, 17, 13), panel2 = Color3.fromRGB(40, 22, 17),
        accent = Color3.fromRGB(255, 90, 30), accent2 = Color3.fromRGB(255, 145, 85),
        text = Color3.fromRGB(242, 238, 234), textDim = Color3.fromRGB(165, 148, 140),
        stroke = Color3.fromRGB(85, 45, 30),
        success = Color3.fromRGB(70, 220, 110),
        danger = Color3.fromRGB(255, 70, 70),
        warning = Color3.fromRGB(255, 200, 70),
    },
    DarkBlue = {
        bg = Color3.fromRGB(6, 9, 18), bg2 = Color3.fromRGB(10, 16, 30),
        panel = Color3.fromRGB(16, 24, 44), panel2 = Color3.fromRGB(22, 34, 58),
        accent = Color3.fromRGB(70, 150, 255), accent2 = Color3.fromRGB(130, 190, 255),
        text = Color3.fromRGB(232, 240, 255), textDim = Color3.fromRGB(130, 150, 180),
        stroke = Color3.fromRGB(40, 65, 110),
        success = Color3.fromRGB(70, 220, 110),
        danger = Color3.fromRGB(255, 70, 70),
        warning = Color3.fromRGB(255, 200, 70),
    },
    Amethyst = {
        bg = Color3.fromRGB(14, 6, 20), bg2 = Color3.fromRGB(22, 12, 34),
        panel = Color3.fromRGB(32, 17, 48), panel2 = Color3.fromRGB(44, 24, 64),
        accent = Color3.fromRGB(185, 90, 255), accent2 = Color3.fromRGB(215, 140, 255),
        text = Color3.fromRGB(242, 232, 255), textDim = Color3.fromRGB(155, 135, 185),
        stroke = Color3.fromRGB(75, 45, 110),
        success = Color3.fromRGB(70, 220, 110),
        danger = Color3.fromRGB(255, 70, 70),
        warning = Color3.fromRGB(255, 200, 70),
    },
    Green = {
        bg = Color3.fromRGB(6, 14, 10), bg2 = Color3.fromRGB(10, 22, 16),
        panel = Color3.fromRGB(15, 32, 24), panel2 = Color3.fromRGB(22, 45, 33),
        accent = Color3.fromRGB(50, 220, 130), accent2 = Color3.fromRGB(100, 240, 170),
        text = Color3.fromRGB(228, 246, 236), textDim = Color3.fromRGB(125, 165, 145),
        stroke = Color3.fromRGB(35, 85, 60),
        success = Color3.fromRGB(70, 220, 110),
        danger = Color3.fromRGB(255, 70, 70),
        warning = Color3.fromRGB(255, 200, 70),
    },
    Ocean = {
        bg = Color3.fromRGB(6, 12, 18), bg2 = Color3.fromRGB(10, 20, 30),
        panel = Color3.fromRGB(16, 30, 44), panel2 = Color3.fromRGB(24, 42, 60),
        accent = Color3.fromRGB(40, 180, 220), accent2 = Color3.fromRGB(90, 210, 245),
        text = Color3.fromRGB(228, 244, 250), textDim = Color3.fromRGB(125, 160, 180),
        stroke = Color3.fromRGB(40, 80, 105),
        success = Color3.fromRGB(70, 220, 110),
        danger = Color3.fromRGB(255, 70, 70),
        warning = Color3.fromRGB(255, 200, 70),
    },
    Serenity = {
        bg = Color3.fromRGB(12, 12, 18), bg2 = Color3.fromRGB(20, 20, 30),
        panel = Color3.fromRGB(30, 30, 42), panel2 = Color3.fromRGB(42, 42, 56),
        accent = Color3.fromRGB(180, 180, 220), accent2 = Color3.fromRGB(210, 210, 240),
        text = Color3.fromRGB(238, 238, 245), textDim = Color3.fromRGB(150, 150, 170),
        stroke = Color3.fromRGB(70, 70, 95),
        success = Color3.fromRGB(70, 220, 110),
        danger = Color3.fromRGB(255, 70, 70),
        warning = Color3.fromRGB(255, 200, 70),
    },
    Light = {
        bg = Color3.fromRGB(240, 240, 245), bg2 = Color3.fromRGB(230, 230, 238),
        panel = Color3.fromRGB(255, 255, 255), panel2 = Color3.fromRGB(245, 245, 250),
        accent = Color3.fromRGB(90, 120, 230), accent2 = Color3.fromRGB(130, 160, 250),
        text = Color3.fromRGB(30, 30, 40), textDim = Color3.fromRGB(110, 110, 130),
        stroke = Color3.fromRGB(200, 200, 215),
        success = Color3.fromRGB(60, 190, 100),
        danger = Color3.fromRGB(230, 60, 60),
        warning = Color3.fromRGB(230, 180, 50),
    },
}

local CurrentThemeName = "BloodRed"
local ThemeListeners = {}

local function GetTheme()
    return THEMES[CurrentThemeName] or THEMES.BloodRed
end

local function BroadcastTheme()
    local themeObj = GetTheme()
    for _, fn in ipairs(ThemeListeners) do
        pcall(fn, themeObj)
    end
end

local function RegisterThemeListener(fn)
    table.insert(ThemeListeners, fn)
end

-- ============================================================
-- HELPERS
-- ============================================================
local function Tween(obj, props, dur, style, dir)
    local tw = TweenService:Create(
        obj,
        TweenInfo.new(dur or 0.25, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out),
        props
    )
    tw:Play()
    return tw
end

local function Make(cls, props, parent)
    local o = Instance.new(cls)
    if props then
        for k, v in pairs(props) do
            if k ~= "Parent" then o[k] = v end
        end
    end
    if parent then o.Parent = parent end
    return o
end

local function Corner(o, r)
    return Make("UICorner", { CornerRadius = UDim.new(0, r or 8) }, o)
end

local function Stroke(o, c, t, tr)
    return Make("UIStroke", {
        Color = c or GetTheme().stroke,
        Thickness = t or 1,
        Transparency = tr or 0,
    }, o)
end

local function Padding(o, p)
    return Make("UIPadding", {
        PaddingTop = UDim.new(0, p or 8),
        PaddingBottom = UDim.new(0, p or 8),
        PaddingLeft = UDim.new(0, p or 8),
        PaddingRight = UDim.new(0, p or 8),
    }, o)
end

local function Gradient(o, c1, c2, rot)
    return Make("UIGradient", {
        Color = ColorSequence.new(c1, c2),
        Rotation = rot or 0,
    }, o)
end

local function Ripple(btn, x, y)
    local r = Make("Frame", {
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = 0.5,
        Position = UDim2.fromOffset(x - 5, y - 5),
        Size = UDim2.fromOffset(10, 10),
        ZIndex = btn.ZIndex + 5,
    }, btn)
    Corner(r, 999)
    local tw = Tween(r, {
        Size = UDim2.fromOffset(220, 220),
        Position = UDim2.fromOffset(x - 110, y - 110),
        BackgroundTransparency = 1,
    }, 0.6)
    tw.Completed:Connect(function() r:Destroy() end)
end

local function GetParentGui()
    if gethui then
        local ok, h = pcall(gethui)
        if ok and h then return h end
    end
    return CoreGui
end

-- ============================================================
-- STATE
-- ============================================================
local Screen         = nil
local BlurEffect     = nil
local NotifHolder    = nil
local FlagStore      = {}
local NotifyHistory  = {}
local Windows        = {}
local PARENT         = GetParentGui()
local Destroyed      = false

-- ============================================================
-- NOTIFY
-- ============================================================
local function Notify(opts)
    if type(opts) ~= "table" then return end
    if Destroyed then return end
    if not Screen or not Screen.Parent then return end

    local title = opts.Title or opts.title or "Thông báo"
    local content = opts.Content or opts.content or ""
    local duration = opts.Duration or opts.duration or 3

    table.insert(NotifyHistory, 1, { title = title, content = content, time = os.time() })
    if #NotifyHistory > 50 then
        table.remove(NotifyHistory, #NotifyHistory)
    end

    local n = Make("Frame", {
        Size = UDim2.new(1, 0, 0, 62),
        Position = UDim2.new(1, 340, 0, 0),
        BackgroundColor3 = GetTheme().panel,
        BorderSizePixel = 0,
        ZIndex = 1001,
    }, NotifHolder)
    Corner(n, 10)
    local nStroke = Stroke(n, GetTheme().accent, 1.5)

    local bar = Make("Frame", {
        Size = UDim2.new(0, 3, 1, 0),
        BackgroundColor3 = GetTheme().accent,
        BorderSizePixel = 0,
        ZIndex = 1002,
    }, n)

    local titleLbl = Make("TextLabel", {
        Size = UDim2.new(1, -20, 0, 20),
        Position = UDim2.fromOffset(14, 8),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = GetTheme().accent,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 1002,
    }, n)

    local contentLbl = Make("TextLabel", {
        Size = UDim2.new(1, -20, 0, 24),
        Position = UDim2.fromOffset(14, 28),
        BackgroundTransparency = 1,
        Text = content,
        TextColor3 = GetTheme().text,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        ZIndex = 1002,
    }, n)

    RegisterThemeListener(function(themeObj)
        if n and n.Parent then
            n.BackgroundColor3 = themeObj.panel
            nStroke.Color = themeObj.accent
            bar.BackgroundColor3 = themeObj.accent
            titleLbl.TextColor3 = themeObj.accent
            contentLbl.TextColor3 = themeObj.text
        end
    end)

    Tween(n, { Position = UDim2.new(0, 0, 0, 0) }, 0.4, Enum.EasingStyle.Back)

    local prog = Make("Frame", {
        Size = UDim2.new(0, 0, 0, 2),
        Position = UDim2.new(0, 0, 1, -2),
        BackgroundColor3 = GetTheme().accent,
        BorderSizePixel = 0,
        ZIndex = 1002,
    }, n)
    Corner(prog, 1)
    Tween(prog, { Size = UDim2.new(1, 0, 0, 2) }, duration, Enum.EasingStyle.Linear)

    task.delay(duration, function()
        local tw = Tween(n, {
            Position = UDim2.new(1, 340, 0, 0),
            BackgroundTransparency = 1,
        }, 0.35)
        tw.Completed:Connect(function() n:Destroy() end)
    end)
end

-- ============================================================
-- INIT SCREEN
-- ============================================================
local function InitScreen()
    if Screen and Screen.Parent then return end

    Screen = Make("ScreenGui", {
        Name = "KPCUI",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 9999,
    }, PARENT)

    pcall(function()
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("BlurEffect") and obj.Name == "KPC_Blur" then
                pcall(function() obj:Destroy() end)
            end
        end
    end)

    BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Name = "KPC_Blur"
    BlurEffect.Size = 0
    BlurEffect.Parent = Lighting

    NotifHolder = Make("Frame", {
        Size = UDim2.new(0, 320, 1, -20),
        Position = UDim2.new(1, -340, 0, 10),
        BackgroundTransparency = 1,
        ZIndex = 1000,
    }, Screen)
    Make("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
    }, NotifHolder)
end

-- ============================================================
-- WINDOW
-- ============================================================
local Window = {}
Window.__index = Window

local Tab = {}
Tab.__index = Tab

local function IsMobile()
    return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

local function BuildWindow(cfg)
    cfg = cfg or {}
    InitScreen()

    local self = setmetatable({}, Window)
    self._tabs = {}
    self._activeTab = nil
    self._screen = Screen
    self._cfg = cfg

    local isMobile = IsMobile()
    local MENU_W, MENU_H
    if isMobile then
        local vp = workspace.CurrentCamera.ViewportSize
        MENU_W = math.min(720, math.floor(vp.X * 0.92))
        MENU_H = math.min(480, math.floor(vp.Y * 0.75))
        if MENU_W < 300 then MENU_W = 300 end
        if MENU_H < 360 then MENU_H = 360 end
    else
        MENU_W = cfg.Width or 720
        MENU_H = cfg.Height or 480
    end

    self._menuW = MENU_W
    self._menuH = MENU_H

    local Main = Make("Frame", {
        Name = "Main",
        Size = UDim2.fromOffset(MENU_W, MENU_H),
        Position = UDim2.new(0.5, -MENU_W/2, 0.5, -MENU_H/2),
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = GetTheme().bg,
        BorderSizePixel = 0,
        Visible = false,
        ClipsDescendants = true,
        ZIndex = 2,
        Active = true,
    }, Screen)
    Corner(Main, 14)
    local mainStroke = Stroke(Main, GetTheme().accent, 1.5, 0.3)
    local mainGrad = Gradient(Main, GetTheme().bg, GetTheme().bg2, 45)

    local TitleBar = Make("Frame", {
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = GetTheme().bg2,
        BorderSizePixel = 0,
        ZIndex = 10,
    }, Main)
    Corner(TitleBar, 14)
    Make("Frame", {
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 1, -20),
        BackgroundColor3 = GetTheme().bg2,
        BorderSizePixel = 0,
        ZIndex = 10,
    }, TitleBar)

    local logoDot = Make("Frame", {
        Size = UDim2.fromOffset(10, 10),
        Position = UDim2.new(0, 16, 0.5, -5),
        BackgroundColor3 = GetTheme().accent,
        BorderSizePixel = 0,
        ZIndex = 11,
    }, TitleBar)
    Corner(logoDot, 999)
    task.spawn(function()
        while logoDot.Parent do
            Tween(logoDot, { BackgroundColor3 = GetTheme().accent2 }, 0.9, Enum.EasingStyle.Sine)
            task.wait(0.9)
            Tween(logoDot, { BackgroundColor3 = GetTheme().accent }, 0.9, Enum.EasingStyle.Sine)
            task.wait(0.9)
        end
    end)

    local titleText = Make("TextLabel", {
        Size = UDim2.new(1, -240, 1, 0),
        Position = UDim2.fromOffset(36, 0),
        BackgroundTransparency = 1,
        Text = cfg.LoadingTitle or cfg.Name or "KPCUI",
        TextColor3 = GetTheme().text,
        TextSize = 15,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 11,
    }, TitleBar)

    local subText = Make("TextLabel", {
        Size = UDim2.new(0, 200, 1, 0),
        Position = UDim2.new(0, 170, 0, 0),
        BackgroundTransparency = 1,
        Text = cfg.LoadingSubtitle and ("• " .. cfg.LoadingSubtitle) or "",
        TextColor3 = GetTheme().accent,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 11,
    }, TitleBar)

    local statText = Make("TextLabel", {
        Size = UDim2.new(0, 180, 1, 0),
        Position = UDim2.new(1, -260, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        TextColor3 = GetTheme().textDim,
        TextSize = 11,
        Font = Enum.Font.Code,
        TextXAlignment = Enum.TextXAlignment.Right,
        ZIndex = 11,
    }, TitleBar)

    self._statText = statText

    local function WinBtn(txt, xoff, hover, cb)
        local b = Make("TextButton", {
            Size = UDim2.fromOffset(28, 28),
            Position = UDim2.new(1, xoff, 0.5, -14),
            BackgroundColor3 = GetTheme().panel,
            Text = txt,
            TextColor3 = GetTheme().textDim,
            TextSize = 14,
            Font = Enum.Font.GothamBold,
            AutoButtonColor = false,
            BorderSizePixel = 0,
            ZIndex = 12,
        }, TitleBar)
        Corner(b, 6)
        b.MouseEnter:Connect(function()
            Tween(b, { BackgroundColor3 = hover, TextColor3 = Color3.new(1, 1, 1) }, 0.15)
        end)
        b.MouseLeave:Connect(function()
            Tween(b, { BackgroundColor3 = GetTheme().panel, TextColor3 = GetTheme().textDim }, 0.15)
        end)
        b.MouseButton1Click:Connect(cb)
        RegisterThemeListener(function(themeObj)
            if b and b.Parent then
                b.BackgroundColor3 = themeObj.panel
                b.TextColor3 = themeObj.textDim
            end
        end)
        return b
    end

    local function Collapse()
        Tween(Main, { Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1 }, 0.25)
        if BlurEffect and BlurEffect.Parent then
            Tween(BlurEffect, { Size = 0 }, 0.25)
        end
        task.delay(0.26, function() Main.Visible = false end)
        if self._onCollapse then pcall(self._onCollapse) end
    end

    local function Expand()
        Main.Visible = true
        Main.Size = UDim2.fromOffset(0, 0)
        Main.BackgroundTransparency = 1
        Tween(Main, {
            Size = UDim2.fromOffset(MENU_W, MENU_H),
            BackgroundTransparency = 0,
        }, 0.4, Enum.EasingStyle.Back)
        if BlurEffect and BlurEffect.Parent then
            Tween(BlurEffect, { Size = 10 }, 0.4)
        end
        if self._onExpand then pcall(self._onExpand) end
    end

    self._collapse = Collapse
    self._expand = Expand
    self._main = Main

    WinBtn("✕", -38, GetTheme().danger, Collapse)
    WinBtn("—", -74, GetTheme().accent, Collapse)

    -- Drag
    do
        local dragging = false
        local dragOffset = Vector2.new(0, 0)

        local function GetMouse()
            local m = UserInputService:GetMouseLocation()
            return Vector2.new(m.X, m.Y)
        end

        local function GetMainPixelPos()
            local vp = workspace.CurrentCamera.ViewportSize
            local p = Main.Position
            return Vector2.new(
                p.X.Scale * vp.X + p.X.Offset,
                p.Y.Scale * vp.Y + p.Y.Offset
            )
        end

        TitleBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                local pixelPos = GetMainPixelPos()
                Main.Position = UDim2.fromOffset(pixelPos.X, pixelPos.Y)
                local mouse = GetMouse()
                dragOffset = mouse - pixelPos
                dragging = true
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if not dragging then return end
            if input.UserInputType ~= Enum.UserInputType.MouseMovement
            and input.UserInputType ~= Enum.UserInputType.Touch then return end
            local mouse = GetMouse()
            local targetPos = mouse - dragOffset
            local vp = workspace.CurrentCamera.ViewportSize
            local fs = Main.AbsoluteSize
            local maxX = math.max(0, vp.X - fs.X)
            local maxY = math.max(0, vp.Y - fs.Y)
            Main.Position = UDim2.fromOffset(
                math.clamp(targetPos.X, 0, maxX),
                math.clamp(targetPos.Y, 0, maxY)
            )
        end)
    end

    -- Sidebar
    local SIDEBAR_W = isMobile and 130 or 160

    local Sidebar = Make("ScrollingFrame", {
        Size = UDim2.new(0, SIDEBAR_W, 1, -44),
        Position = UDim2.fromOffset(0, 44),
        BackgroundColor3 = GetTheme().bg2,
        BorderSizePixel = 0,
        ZIndex = 5,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = GetTheme().accent,
        ScrollBarImageTransparency = 0.7,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
    }, Main)
    Padding(Sidebar, 8)

    local searchBox = Make("TextBox", {
        Size = UDim2.new(1, 0, 0, 26),
        BackgroundColor3 = GetTheme().panel,
        Text = "",
        PlaceholderText = "🔍 Search...",
        PlaceholderColor3 = GetTheme().textDim,
        TextColor3 = GetTheme().text,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        BorderSizePixel = 0,
        ZIndex = 8,
    }, Sidebar)
    Corner(searchBox, 6)
    Padding(searchBox, 6)

    local indicator = Make("Frame", {
        Size = UDim2.new(0, 3, 0, 28),
        Position = UDim2.fromOffset(0, 34),
        BackgroundColor3 = GetTheme().accent,
        BorderSizePixel = 0,
        ZIndex = 8,
    }, Sidebar)
    Corner(indicator, 2)

    Make("UIListLayout", {
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, Sidebar)

    local Content = Make("Frame", {
        Size = UDim2.new(1, -SIDEBAR_W, 1, -44),
        Position = UDim2.fromOffset(SIDEBAR_W, 44),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 5,
        ClipsDescendants = true,
        Active = true,
    }, Main)

    self._sidebar = Sidebar
    self._content = Content
    self._indicator = indicator
    self._searchBox = searchBox

    RegisterThemeListener(function(themeObj)
        pcall(function()
            Tween(Main, { BackgroundColor3 = themeObj.bg }, 0.3)
            Tween(TitleBar, { BackgroundColor3 = themeObj.bg2 }, 0.3)
            Tween(Sidebar, { BackgroundColor3 = themeObj.bg2 }, 0.3)
            mainStroke.Color = themeObj.accent
            mainGrad.Color = ColorSequence.new(themeObj.bg, themeObj.bg2)
            titleText.TextColor3 = themeObj.text
            subText.TextColor3 = themeObj.accent
            statText.TextColor3 = themeObj.textDim
            logoDot.BackgroundColor3 = themeObj.accent
            searchBox.BackgroundColor3 = themeObj.panel
            searchBox.PlaceholderColor3 = themeObj.textDim
            searchBox.TextColor3 = themeObj.text
            indicator.BackgroundColor3 = themeObj.accent
            Sidebar.ScrollBarImageColor3 = themeObj.accent
        end)
    end)

    -- Toggle keybind
    local toggleKey = cfg.ToggleUIKeybind or Enum.KeyCode.RightShift
    self._toggleKey = toggleKey
    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == self._toggleKey then
            if Main.Visible then Collapse() else Expand() end
        end
    end)

    -- Search
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local q = searchBox.Text:lower()
        for _, t in ipairs(self._tabs) do
            if q == "" then
                t._btn.Visible = true
            else
                local name = t._name:lower()
                t._btn.Visible = (name:find(q, 1, true) ~= nil)
            end
        end
    end)

    Expand()
    table.insert(Windows, self)
    return self
end

-- ============================================================
-- WINDOW METHODS
-- ============================================================
function Window:CreateTab(name, icon)
    local self = self
    local tab = setmetatable({}, Tab)
    tab._name = name
    tab._icon = icon or ""
    tab._window = self
    tab._layoutCounter = 0

    local btn = Make("TextButton", {
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundColor3 = GetTheme().bg2,
        Text = "",
        AutoButtonColor = false,
        BorderSizePixel = 0,
        ZIndex = 7,
    }, self._sidebar)
    Corner(btn, 6)

    local iconLbl = Make("TextLabel", {
        Size = UDim2.fromOffset(24, 34),
        Position = UDim2.fromOffset(4, 0),
        BackgroundTransparency = 1,
        Text = (#icon > 0) and icon or "",
        TextColor3 = GetTheme().textDim,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = 9,
    }, btn)

    local lbl = Make("TextLabel", {
        Size = UDim2.new(1, -34, 1, 0),
        Position = UDim2.fromOffset(30, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = GetTheme().textDim,
        TextSize = 13,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 8,
    }, btn)

    tab._btn = btn
    tab._lbl = lbl
    tab._iconLbl = iconLbl

    local container = Make("ScrollingFrame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = GetTheme().accent,
        ScrollBarImageTransparency = 0.6,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
        ZIndex = 20,
    }, self._content)
    Padding(container, 14)
    Make("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, container)
    container.ClipsDescendants = false
    tab._container = container

    table.insert(self._tabs, tab)

    local function select()
        if self._activeTab == tab then return end
        for _, t in ipairs(self._tabs) do
            local active = (t == tab)
            Tween(t._btn, { BackgroundColor3 = active and GetTheme().panel or GetTheme().bg2 }, 0.2)
            Tween(t._lbl, { TextColor3 = active and GetTheme().text or GetTheme().textDim }, 0.2)
            if t._iconLbl then
                Tween(t._iconLbl, { TextColor3 = active and GetTheme().accent or GetTheme().textDim }, 0.2)
            end
            if active then
                t._container.Visible = true
                t._container.Position = UDim2.fromOffset(12, 0)
                Tween(t._container, { Position = UDim2.fromOffset(0, 0) }, 0.25)
                local btnY = t._btn.AbsolutePosition.Y - self._sidebar.AbsolutePosition.Y + 4
                Tween(self._indicator, {
                    Position = UDim2.fromOffset(0, btnY),
                    Size = UDim2.new(0, 3, 0, 28),
                }, 0.25)
            else
                t._container.Visible = false
            end
        end
        self._activeTab = tab
    end

    btn.MouseButton1Click:Connect(select)
    btn.MouseEnter:Connect(function()
        if self._activeTab ~= tab then
            Tween(btn, { BackgroundColor3 = GetTheme().panel }, 0.15)
        end
    end)
    btn.MouseLeave:Connect(function()
        if self._activeTab ~= tab then
            Tween(btn, { BackgroundColor3 = GetTheme().bg2 }, 0.15)
        end
    end)

    RegisterThemeListener(function(themeObj)
        if not btn or not btn.Parent then return end
        local isActive = (self._activeTab == tab)
        if not isActive then
            btn.BackgroundColor3 = themeObj.bg2
            lbl.TextColor3 = themeObj.textDim
            if iconLbl then iconLbl.TextColor3 = themeObj.textDim end
        end
        container.ScrollBarImageColor3 = themeObj.accent
    end)

    if not self._activeTab then task.defer(select) end
    return tab
end

function Window:SelectTab(name)
    for _, t in ipairs(self._tabs) do
        if t._name == name and t._select then
            t._select()
            return
        end
    end
end

function Window:UpdateStats(fps, ping)
    if self._statText and self._statText.Parent then
        self._statText.Text = string.format("FPS: %d | Ping: %d ms", fps or 0, ping or 0)
    end
end

function Window:Collapse() if self._collapse then self._collapse() end end
function Window:Expand()   if self._expand then self._expand() end end

function Window:SetTitle(text)
    local tb = self._main and self._main:FindFirstChild("TitleBar")
    if not tb then return end
    for _, c in ipairs(tb:GetChildren()) do
        if c:IsA("TextLabel") and c.TextSize == 15 then
            c.Text = text
        end
    end
end

-- ============================================================
-- TAB METHODS
-- ============================================================
local function NextOrder(tab)
    tab._layoutCounter = tab._layoutCounter + 1
    return tab._layoutCounter
end

function Tab:CreateSection(text)
    local frame = Make("Frame", {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        LayoutOrder = NextOrder(self),
        ZIndex = 7,
    }, self._container)
    local label = Make("TextLabel", {
        Size = UDim2.new(1, 0, 1, -4),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = GetTheme().accent,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 8,
    }, frame)
    local line = Make("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = GetTheme().stroke,
        BorderSizePixel = 0,
        ZIndex = 7,
    }, frame)
    local lineGrad = Gradient(line, GetTheme().accent, GetTheme().stroke, 0)
    lineGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1),
    })
    RegisterThemeListener(function(themeObj)
        if label and label.Parent then label.TextColor3 = themeObj.accent end
        if line and line.Parent then line.BackgroundColor3 = themeObj.stroke end
        if lineGrad and lineGrad.Parent then
            lineGrad.Color = ColorSequence.new(themeObj.accent, themeObj.stroke)
        end
    end)
    return frame
end

function Tab:CreateLabel(text)
    local frame = Make("Frame", {
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundTransparency = 1,
        LayoutOrder = NextOrder(self),
        ZIndex = 7,
    }, self._container)
    local lbl = Make("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = GetTheme().text,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        ZIndex = 8,
    }, frame)
    RegisterThemeListener(function(themeObj)
        if lbl and lbl.Parent then lbl.TextColor3 = themeObj.text end
    end)
    local obj = { _frame = frame, _label = lbl }
    function obj:Set(t) lbl.Text = t end
    function obj:Get() return lbl.Text end
    return obj
end

function Tab:CreateButton(cfg)
    cfg = cfg or {}
    local row = Make("TextButton", {
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundColor3 = GetTheme().panel,
        Text = cfg.Name or "Button",
        TextColor3 = GetTheme().text,
        TextSize = 13,
        Font = Enum.Font.GothamMedium,
        AutoButtonColor = false,
        BorderSizePixel = 0,
        LayoutOrder = NextOrder(self),
        ZIndex = 7,
    }, self._container)
    Corner(row, 8)
    local rowStroke = Stroke(row, GetTheme().stroke, 1)
    row.MouseEnter:Connect(function()
        Tween(row, { BackgroundColor3 = GetTheme().panel2 }, 0.15)
    end)
    row.MouseLeave:Connect(function()
        Tween(row, { BackgroundColor3 = GetTheme().panel }, 0.15)
    end)
    row.MouseButton1Click:Connect(function()
        local m = UserInputService:GetMouseLocation()
        Ripple(row, m.X - row.AbsolutePosition.X, m.Y - row.AbsolutePosition.Y)
        if cfg.Callback then
            task.spawn(function() pcall(cfg.Callback) end)
        end
    end)
    RegisterThemeListener(function(themeObj)
        if row and row.Parent then
            row.BackgroundColor3 = themeObj.panel
            row.TextColor3 = themeObj.text
            rowStroke.Color = themeObj.stroke
        end
    end)
    return row
end

function Tab:CreateToggle(cfg)
    cfg = cfg or {}
    local default = cfg.CurrentValue and true or false
    local flag = cfg.Flag
    local row = Make("Frame", {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = GetTheme().panel,
        BorderSizePixel = 0,
        LayoutOrder = NextOrder(self),
        ZIndex = 7,
    }, self._container)
    Corner(row, 8)
    local rowStroke = Stroke(row, GetTheme().stroke, 1)
    local rowLbl = Make("TextLabel", {
        Size = UDim2.new(1, -70, 1, 0),
        Position = UDim2.fromOffset(12, 0),
        BackgroundTransparency = 1,
        Text = cfg.Name or "Toggle",
        TextColor3 = GetTheme().text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        ZIndex = 8,
    }, row)
    local track = Make("Frame", {
        Size = UDim2.fromOffset(44, 22),
        Position = UDim2.new(1, -56, 0.5, -11),
        BackgroundColor3 = default and GetTheme().accent or GetTheme().panel2,
        BorderSizePixel = 0,
        ZIndex = 8,
    }, row)
    Corner(track, 999)
    local knob = Make("Frame", {
        Size = UDim2.fromOffset(16, 16),
        Position = default and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 3, 0.5, -8),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        ZIndex = 9,
    }, track)
    Corner(knob, 999)

    local state = default
    local function SetState(v, fire)
        state = v
        Tween(track, { BackgroundColor3 = v and GetTheme().accent or GetTheme().panel2 }, 0.2)
        Tween(knob, {
            Position = v and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 3, 0.5, -8),
        }, 0.25, Enum.EasingStyle.Back)
        if flag then FlagStore[flag] = v end
        if fire and cfg.Callback then
            task.spawn(function() pcall(cfg.Callback, v) end)
        end
    end

    local btn = Make("TextButton", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 10,
    }, row)
    btn.MouseButton1Click:Connect(function() SetState(not state, true) end)
    row.MouseEnter:Connect(function()
        Tween(row, { BackgroundColor3 = GetTheme().panel2 }, 0.15)
    end)
    row.MouseLeave:Connect(function()
        Tween(row, { BackgroundColor3 = GetTheme().panel }, 0.15)
    end)

    if flag then FlagStore[flag] = state end

    RegisterThemeListener(function(themeObj)
        if not row or not row.Parent then return end
        row.BackgroundColor3 = themeObj.panel
        rowLbl.TextColor3 = themeObj.text
        rowStroke.Color = themeObj.stroke
        track.BackgroundColor3 = state and themeObj.accent or themeObj.panel2
    end)

    local obj = { _row = row }
    function obj:Set(v) SetState(v, false) end
    function obj:Get() return state end
    return obj
end

function Tab:CreateSlider(cfg)
    cfg = cfg or {}
    local min = cfg.Range and cfg.Range[1] or 0
    local max = cfg.Range and cfg.Range[2] or 100
    local default = cfg.CurrentValue or min
    local suffix = cfg.Suffix or ""
    local flag = cfg.Flag
    local inc = cfg.Increment or 1

    local row = Make("Frame", {
        Size = UDim2.new(1, 0, 0, 52),
        BackgroundColor3 = GetTheme().panel,
        BorderSizePixel = 0,
        LayoutOrder = NextOrder(self),
        ZIndex = 7,
    }, self._container)
    Corner(row, 8)
    local rowStroke = Stroke(row, GetTheme().stroke, 1)
    local rowLbl = Make("TextLabel", {
        Size = UDim2.new(1, -100, 0, 20),
        Position = UDim2.fromOffset(12, 6),
        BackgroundTransparency = 1,
        Text = cfg.Name or "Slider",
        TextColor3 = GetTheme().text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        ZIndex = 8,
    }, row)
    local valLbl = Make("TextLabel", {
        Size = UDim2.new(0, 90, 0, 20),
        Position = UDim2.new(1, -102, 0, 6),
        BackgroundTransparency = 1,
        Text = tostring(default) .. suffix,
        TextColor3 = GetTheme().accent,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right,
        ZIndex = 8,
    }, row)
    local track = Make("Frame", {
        Size = UDim2.new(1, -24, 0, 6),
        Position = UDim2.fromOffset(12, 36),
        BackgroundColor3 = GetTheme().panel2,
        BorderSizePixel = 0,
        ZIndex = 8,
    }, row)
    Corner(track, 999)

    local initRel = math.clamp((default - min) / (max - min), 0, 1)
    local fill = Make("Frame", {
        Size = UDim2.new(initRel, 0, 1, 0),
        BackgroundColor3 = GetTheme().accent,
        BorderSizePixel = 0,
        ZIndex = 9,
    }, track)
    Corner(fill, 999)
    local knob = Make("Frame", {
        Size = UDim2.fromOffset(14, 14),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(initRel, 0, 0.5, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        ZIndex = 10,
    }, track)
    Corner(knob, 999)
    local knobStroke = Stroke(knob, GetTheme().accent, 2)

    local value = default
    local dragging = false

    local function Fmt(v)
        if inc >= 1 then
            return tostring(math.floor(v + 0.5))
        else
            return (string.format("%.2f", v):gsub("0+$", ""):gsub("%.$", ""))
        end
    end

    local function UpdateFromX(x)
        local rel = math.clamp((x - track.AbsolutePosition.X) / math.max(1, track.AbsoluteSize.X), 0, 1)
        value = min + (max - min) * rel
        value = math.floor(value / inc + 0.5) * inc
        value = math.clamp(value, min, max)
        local r2 = (value - min) / (max - min)
        fill.Size = UDim2.new(r2, 0, 1, 0)
        knob.Position = UDim2.new(r2, 0, 0.5, 0)
        valLbl.Text = Fmt(value) .. suffix
        if flag then FlagStore[flag] = value end
        if cfg.Callback then
            task.spawn(function() pcall(cfg.Callback, value) end)
        end
    end

    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            UpdateFromX(input.Position.X)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
            UpdateFromX(input.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    if flag then FlagStore[flag] = value end

    RegisterThemeListener(function(themeObj)
        if not row or not row.Parent then return end
        row.BackgroundColor3 = themeObj.panel
        rowLbl.TextColor3 = themeObj.text
        rowStroke.Color = themeObj.stroke
        valLbl.TextColor3 = themeObj.accent
        track.BackgroundColor3 = themeObj.panel2
        fill.BackgroundColor3 = themeObj.accent
        knobStroke.Color = themeObj.accent
    end)

    local obj = { _row = row }
    function obj:Set(v)
        v = math.clamp(tonumber(v) or min, min, max)
        value = v
        local r = (v - min) / (max - min)
        fill.Size = UDim2.new(r, 0, 1, 0)
        knob.Position = UDim2.new(r, 0, 0.5, 0)
        valLbl.Text = Fmt(v) .. suffix
        if flag then FlagStore[flag] = v end
    end
    function obj:Get() return value end
    return obj
end

function Tab:CreateInput(cfg)
    cfg = cfg or {}
    local row = Make("Frame", {
        Size = UDim2.new(1, 0, 0, 54),
        BackgroundColor3 = GetTheme().panel,
        BorderSizePixel = 0,
        LayoutOrder = NextOrder(self),
        ZIndex = 7,
    }, self._container)
    Corner(row, 8)
    local rowStroke = Stroke(row, GetTheme().stroke, 1)
    local rowLbl = Make("TextLabel", {
        Size = UDim2.new(1, -24, 0, 16),
        Position = UDim2.fromOffset(12, 6),
        BackgroundTransparency = 1,
        Text = cfg.Name or "Input",
        TextColor3 = GetTheme().textDim,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 8,
    }, row)
    local box = Make("TextBox", {
        Size = UDim2.new(1, -24, 0, 26),
        Position = UDim2.fromOffset(12, 24),
        BackgroundColor3 = GetTheme().panel2,
        Text = tostring(cfg.CurrentValue or ""),
        PlaceholderText = cfg.PlaceholderText or "",
        PlaceholderColor3 = GetTheme().textDim,
        TextColor3 = GetTheme().text,
        TextSize = 12,
        Font = Enum.Font.Code,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        BorderSizePixel = 0,
        ZIndex = 8,
    }, row)
    Corner(box, 6)
    Padding(box, 6)
    box:GetPropertyChangedSignal("Text"):Connect(function()
        if cfg.Callback then
            task.spawn(function() pcall(cfg.Callback, box.Text) end)
        end
    end)
    box.Focused:Connect(function()
        Tween(box, { BackgroundColor3 = GetTheme().panel }, 0.15)
    end)
    box.FocusLost:Connect(function()
        Tween(box, { BackgroundColor3 = GetTheme().panel2 }, 0.15)
    end)
    RegisterThemeListener(function(themeObj)
        if not row or not row.Parent then return end
        row.BackgroundColor3 = themeObj.panel
        rowLbl.TextColor3 = themeObj.textDim
        rowStroke.Color = themeObj.stroke
        box.BackgroundColor3 = themeObj.panel2
        box.TextColor3 = themeObj.text
        box.PlaceholderColor3 = themeObj.textDim
    end)
    local obj = { _row = row }
    function obj:Set(v) box.Text = tostring(v) end
    function obj:Get() return box.Text end
    return obj
end

function Tab:CreateDropdown(cfg)
    cfg = cfg or {}
    local options = cfg.Options or {}
    local default = (cfg.CurrentOption and cfg.CurrentOption[1]) or (options[1] or "")
    local flag = cfg.Flag

    local row = Make("Frame", {
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundColor3 = GetTheme().panel,
        BorderSizePixel = 0,
        LayoutOrder = NextOrder(self),
        ZIndex = 7,
    }, self._container)
    Corner(row, 8)
    local rowStroke = Stroke(row, GetTheme().stroke, 1)
    local rowLbl = Make("TextLabel", {
        Size = UDim2.new(0, 120, 1, 0),
        Position = UDim2.fromOffset(12, 0),
        BackgroundTransparency = 1,
        Text = cfg.Name or "Dropdown",
        TextColor3 = GetTheme().text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        ZIndex = 8,
    }, row)
    local valLbl = Make("TextLabel", {
        Size = UDim2.new(0, 150, 1, 0),
        Position = UDim2.new(1, -170, 0, 0),
        BackgroundTransparency = 1,
        Text = tostring(default) .. " ▾",
        TextColor3 = GetTheme().accent,
        TextSize = 12,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Right,
        ZIndex = 8,
    }, row)

    local parentFrame = self._container
    local content = Make("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = GetTheme().panel,
        BorderSizePixel = 0,
        ZIndex = 80,
        ClipsDescendants = true,
        Visible = false,
    }, parentFrame)
    Corner(content, 8)
    local contentStroke = Stroke(content, GetTheme().accent, 1, 0.5)
    Padding(content, 4)
    Make("UIListLayout", {
        Padding = UDim.new(0, 2),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, content)

    local open = false
    local current = default
    local optionButtons = {}

    local function Close()
        if not open then return end
        open = false
        Tween(content, { Size = UDim2.new(1, 0, 0, 0) }, 0.2)
        task.delay(0.22, function()
            if content and content.Parent then content.Visible = false end
        end)
    end

    local function OpenMenu()
        if open then return end
        open = true
        local rowAbs = row.AbsolutePosition
        local parentAbs = parentFrame.AbsolutePosition
        content.Position = UDim2.fromOffset(
            rowAbs.X - parentAbs.X,
            rowAbs.Y - parentAbs.Y + row.AbsoluteSize.Y + 2
        )
        content.Size = UDim2.new(1, 0, 0, 0)
        content.Visible = true
        local targetH = #options * 26 + 8
        Tween(content, { Size = UDim2.new(1, 0, 0, targetH) }, 0.22, Enum.EasingStyle.Quart)
    end

    local btn = Make("TextButton", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 9,
    }, row)
    btn.MouseButton1Click:Connect(function()
        if open then Close() else OpenMenu() end
    end)
    row.MouseEnter:Connect(function()
        if not open then Tween(row, { BackgroundColor3 = GetTheme().panel2 }, 0.15) end
    end)
    row.MouseLeave:Connect(function()
        if not open then Tween(row, { BackgroundColor3 = GetTheme().panel }, 0.15) end
    end)

    for i, opt in ipairs(options) do
        local o = Make("TextButton", {
            Size = UDim2.new(1, 0, 0, 24),
            BackgroundColor3 = GetTheme().panel2,
            Text = tostring(opt),
            TextColor3 = GetTheme().text,
            TextSize = 12,
            Font = Enum.Font.Gotham,
            AutoButtonColor = false,
            BorderSizePixel = 0,
            ZIndex = 61,
            LayoutOrder = i,
        }, content)
        Corner(o, 6)
        o.MouseEnter:Connect(function()
            Tween(o, { BackgroundColor3 = GetTheme().panel }, 0.15)
        end)
        o.MouseLeave:Connect(function()
            Tween(o, { BackgroundColor3 = GetTheme().panel2 }, 0.15)
        end)
        o.MouseButton1Click:Connect(function()
            current = opt
            valLbl.Text = tostring(opt) .. " ▾"
            Close()
            if flag then FlagStore[flag] = { current } end
            if cfg.Callback then
                task.spawn(function() pcall(cfg.Callback, { current }) end)
            end
        end)
        table.insert(optionButtons, o)
    end

    if flag then FlagStore[flag] = { current } end

    RegisterThemeListener(function(themeObj)
        if not row or not row.Parent then return end
        row.BackgroundColor3 = themeObj.panel
        rowLbl.TextColor3 = themeObj.text
        rowStroke.Color = themeObj.stroke
        valLbl.TextColor3 = themeObj.accent
        content.BackgroundColor3 = themeObj.panel
        contentStroke.Color = themeObj.accent
        for _, o in ipairs(optionButtons) do
            if o and o.Parent then
                o.BackgroundColor3 = themeObj.panel2
                o.TextColor3 = themeObj.text
            end
        end
    end)

    local obj = { _row = row }
    function obj:Set(v)
        current = v
        valLbl.Text = tostring(v) .. " ▾"
        if flag then FlagStore[flag] = { v } end
    end
    function obj:Get() return current end
    function obj:Refresh(newOptions, keepCurrent)
        options = newOptions or options
        for _, o in ipairs(optionButtons) do
            if o and o.Parent then o:Destroy() end
        end
        optionButtons = {}
        for i, opt in ipairs(options) do
            local o = Make("TextButton", {
                Size = UDim2.new(1, 0, 0, 24),
                BackgroundColor3 = GetTheme().panel2,
                Text = tostring(opt),
                TextColor3 = GetTheme().text,
                TextSize = 12,
                Font = Enum.Font.Gotham,
                AutoButtonColor = false,
                BorderSizePixel = 0,
                ZIndex = 61,
                LayoutOrder = i,
            }, content)
            Corner(o, 6)
            o.MouseEnter:Connect(function()
                Tween(o, { BackgroundColor3 = GetTheme().panel }, 0.15)
            end)
            o.MouseLeave:Connect(function()
                Tween(o, { BackgroundColor3 = GetTheme().panel2 }, 0.15)
            end)
            o.MouseButton1Click:Connect(function()
                current = opt
                valLbl.Text = tostring(opt) .. " ▾"
                Close()
                if flag then FlagStore[flag] = { current } end
                if cfg.Callback then
                    task.spawn(function() pcall(cfg.Callback, { current }) end)
                end
            end)
            table.insert(optionButtons, o)
        end
        if keepCurrent and current then
            obj:Set(current)
        end
    end
    return obj
end

function Tab:CreateColorPicker(cfg)
    cfg = cfg or {}
    local default = cfg.Color or Color3.new(1, 1, 1)
    local flag = cfg.Flag

    local row = Make("Frame", {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = GetTheme().panel,
        BorderSizePixel = 0,
        LayoutOrder = NextOrder(self),
        ZIndex = 7,
    }, self._container)
    Corner(row, 8)
    local rowStroke = Stroke(row, GetTheme().stroke, 1)
    local rowLbl = Make("TextLabel", {
        Size = UDim2.new(1, -70, 1, 0),
        Position = UDim2.fromOffset(12, 0),
        BackgroundTransparency = 1,
        Text = cfg.Name or "Color",
        TextColor3 = GetTheme().text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 8,
    }, row)
    local swatch = Make("Frame", {
        Size = UDim2.fromOffset(34, 22),
        Position = UDim2.new(1, -46, 0.5, -11),
        BackgroundColor3 = default,
        BorderSizePixel = 0,
        ZIndex = 8,
    }, row)
    Corner(swatch, 6)
    Stroke(swatch, Color3.new(1, 1, 1), 1)
    local btn = Make("TextButton", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 9,
    }, row)

    local popup = nil

    btn.MouseButton1Click:Connect(function()
        if popup then popup:Destroy(); popup = nil; return end

        popup = Make("Frame", {
            Size = UDim2.fromOffset(220, 140),
            Position = UDim2.new(1, -260, 1, 4),
            BackgroundColor3 = GetTheme().panel,
            BorderSizePixel = 0,
            ZIndex = 70,
        }, row)
        Corner(popup, 8)
        local popupStroke = Stroke(popup, GetTheme().accent, 1.5)
        Padding(popup, 8)

        local curColor = swatch.BackgroundColor3

        local function ApplyColor()
            swatch.BackgroundColor3 = curColor
            if flag then FlagStore[flag] = curColor end
            if cfg.Callback then
                task.spawn(function() pcall(cfg.Callback, curColor) end)
            end
        end

        for i, comp in ipairs({"R", "G", "B"}) do
            local yPos = (i - 1) * 36 + 6
            Make("TextLabel", {
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.fromOffset(0, yPos),
                BackgroundTransparency = 1,
                Text = comp,
                TextColor3 = GetTheme().text,
                TextSize = 12,
                Font = Enum.Font.GothamBold,
                ZIndex = 71,
            }, popup)

            local track = Make("Frame", {
                Size = UDim2.new(1, -30, 0, 12),
                Position = UDim2.fromOffset(22, yPos + 2),
                BackgroundColor3 = GetTheme().panel2,
                BorderSizePixel = 0,
                ZIndex = 71,
            }, popup)
            Corner(track, 999)

            local val = curColor[comp]
            local barColor = (comp == "R" and Color3.fromRGB(255, 80, 80))
                          or (comp == "G" and Color3.fromRGB(80, 255, 80))
                          or Color3.fromRGB(80, 80, 255)

            local fill = Make("Frame", {
                Size = UDim2.new(val, 0, 1, 0),
                BackgroundColor3 = barColor,
                BorderSizePixel = 0,
                ZIndex = 72,
            }, track)
            Corner(fill, 999)

            local dragging = false
            track.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local rel = math.clamp((input.Position.X - track.AbsolutePosition.X) / math.max(1, track.AbsoluteSize.X), 0, 1)
                    fill.Size = UDim2.new(rel, 0, 1, 0)
                    if comp == "R" then
                        curColor = Color3.new(rel, curColor.G, curColor.B)
                    elseif comp == "G" then
                        curColor = Color3.new(curColor.R, rel, curColor.B)
                    else
                        curColor = Color3.new(curColor.R, curColor.G, rel)
                    end
                    ApplyColor()
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
        end

        RegisterThemeListener(function(themeObj)
            if popup and popup.Parent then
                popup.BackgroundColor3 = themeObj.panel
                popupStroke.Color = themeObj.accent
            end
        end)
    end)

    if flag then FlagStore[flag] = default end

    RegisterThemeListener(function(themeObj)
        if not row or not row.Parent then return end
        row.BackgroundColor3 = themeObj.panel
        rowLbl.TextColor3 = themeObj.text
        rowStroke.Color = themeObj.stroke
    end)

    local obj = { _row = row }
    function obj:Set(c)
        swatch.BackgroundColor3 = c
        if flag then FlagStore[flag] = c end
    end
    function obj:Get() return swatch.BackgroundColor3 end
    return obj
end

-- ============================================================
-- PUBLIC API
-- ============================================================
function KPCUI:CreateWindow(cfg)
    return BuildWindow(cfg)
end

function KPCUI:Notify(opts)
    Notify(opts)
end

function KPCUI:SetFlag(flag, value)
    if not flag then return end
    FlagStore[flag] = value
    return FlagStore[flag]
end

function KPCUI:GetFlag(flag)
    return FlagStore[flag]
end

function KPCUI:SetToggleKeybind(kc)
    if not kc then return end
    for _, w in ipairs(Windows) do
        w._toggleKey = kc
    end
end

function KPCUI:SetKeybind(kc)
    self:SetToggleKeybind(kc)
end

function KPCUI:SetTheme(name)
    if THEMES[name] then
        CurrentThemeName = name
        BroadcastTheme()
        return true
    end
    return false
end

function KPCUI:GetTheme()
    return CurrentThemeName
end

function KPCUI:GetThemes()
    local list = {}
    for k in pairs(THEMES) do table.insert(list, k) end
    table.sort(list)
    return list
end

function KPCUI:GetHistory()
    return NotifyHistory
end

function KPCUI:ClearHistory()
    NotifyHistory = {}
end

function KPCUI:GetScreen()
    return Screen
end

function KPCUI:Destroy()
    Destroyed = true
    for _, w in ipairs(Windows) do
        pcall(function()
            if w._main then w._main:Destroy() end
        end)
    end
    Windows = {}
    if Screen then pcall(function() Screen:Destroy() end) end
    if BlurEffect then pcall(function() BlurEffect:Destroy() end) end
    pcall(function()
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("BlurEffect") and obj.Name == "KPC_Blur" then
                pcall(function() obj:Destroy() end)
            end
        end
    end)
    ThemeListeners = {}
    FlagStore = {}
end

-- ============================================================
-- INIT
-- ============================================================
InitScreen()

return KPCUI
