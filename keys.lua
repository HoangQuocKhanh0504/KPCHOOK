-- keys.lua
-- Định dạng: ["KEY_16_KÝ_TỰ"] = { duration = <giây>, type = "<loại>" }
-- duration: 3600 = 1hr, 7200 = 2hr, 86400 = 1day, 999999999 = limit
-- type: "1hr", "2hr", "1day", "limit"

return {
    -- ===== 1 HR (3600 giây) =====
    ["KPCH1HR000000001"] = { duration = 3600,      type = "1hr"   },
    ["KPCH1HR000000002"] = { duration = 3600,      type = "1hr"   },
    -- ... thêm 98 key nữa nếu muốn (test chỉ cần 1)

    -- ===== 2 HR (7200 giây) =====
    ["KPCH2HR000000001"] = { duration = 7200,      type = "2hr"   },
    ["KPCH2HR000000002"] = { duration = 7200,      type = "2hr"   },

    -- ===== 1 DAY (86400 giây) =====
    ["KPCH1DAY00000001"] = { duration = 86400,     type = "1day"  },
    ["KPCH1DAY00000002"] = { duration = 86400,     type = "1day"  },

    -- ===== LIMIT (vĩnh viễn) =====
    ["KPCHLIMIT0000001"] = { duration = 999999999, type = "limit" },
    ["KPCHLIMIT0000002"] = { duration = 999999999, type = "limit" },
}
