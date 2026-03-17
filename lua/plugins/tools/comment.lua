return {
  "numToStr/Comment.nvim",
  event = "BufReadPost",
  opts = {
    toggler = {
      line = "g/",   -- ノーマルモード: 現在行のコメント切替
    },
    opleader = {
      line = "g/",   -- ビジュアルモード: 選択範囲のコメント切替
    },
  },
}
