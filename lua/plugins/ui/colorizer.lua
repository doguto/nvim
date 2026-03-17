return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { ";c", "<cmd>ColorizerToggle<cr>", desc = "カラーコード表示トグル" },
  },
  config = function()
    require("colorizer").setup({
      -- ファイルタイプごとの設定
      "css",
      "scss",
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "lua",
      -- デフォルト設定（全ファイルタイプに適用）
      ["*"] = {
        RGB = true,      -- #RGB 形式
        RRGGBB = true,   -- #RRGGBB 形式
        names = true,    -- "red" などの色名
        RRGGBBAA = true, -- #RRGGBBAA 形式
        rgb_fn = true,   -- rgb() / rgba() 関数
        hsl_fn = true,   -- hsl() / hsla() 関数
        css = true,      -- CSS 全機能を有効化
        css_fn = true,   -- CSS 関数形式
      },
    })
  end,
}
